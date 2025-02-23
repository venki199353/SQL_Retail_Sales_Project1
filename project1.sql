--- Retail Sales Analysis SQL Project ---

CREATE DATABASE project1;

--- Create Table ---

DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
           (
                 transactions_id INT PRIMARY KEY,
				 sale_date DATE,
				 sale_time TIME,
				 customer_id INT,
				 gender VARCHAR(15),
				 age INT,
				 category VARCHAR(15),
				 quantiy  INT,
				 price_per_unit  FLOAT,  
				 cogs FLOAT,
				 total_sale  FLOAT
             );

SELECT * FROM retail_sales;

SELECT * FROM retail_sales
LIMIT 10;


SELECT COUNT(*) FROM retail_sales;   /* 2000 Records */


--- *** Data Cleaning  *** ---

1) Check Null Values:

SELECT * FROM retail_sales
WHERE transactions_id IS NULL;   /* No Null Values  */


SELECT * FROM retail_sales
WHERE sale_date IS NULL;       /* No Null Values  */

SELECT * FROM retail_sales
WHERE sale_time IS NULL;    /* No Null Values  */

SELECT * FROM retail_sales
WHERE customer_id IS NULL;   /* No Null Values  */

SELECT * FROM retail_sales
WHERE gender IS NULL;        /* No Null Values  */

SELECT * FROM retail_sales
WHERE age IS NULL; 

SELECT * FROM retail_sales
WHERE category IS NULL;      /* No Null Values  */

SELECT * FROM retail_sales
WHERE quantiy IS NULL;       /* Null values present  */

/* This one way of checking.Means individual column checking.  */


SELECT * FROM retail_sales
WHERE  
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR    
    category IS NULL
    OR 
    Quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

/* This is another way.Here age not incuded. */
 --- Except age column total 3 rows have null values so delete all null valuye records ---

 DELETE FROM retail_sales
 WHERE 
     transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR    
    category IS NULL
    OR 
    Quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;    /* 3 records deleted  */


SELECT COUNT(*) FROM retail_sales;  /* 1997 records */

--- *** Data Exploration *** ----

SELECT * FROM retail_sales;

1)Total sales?

SELECT COUNT(*) as Total_sales FROM retail_sales;

2)Category type?

SELECT DISTINCT category FROM retail_sales;

3)Distinct customer_id?

SELECT DISTINCT customer_id FROM retail_sales;

SELECT COUNT(DISTINCT customer_id) FROM retail_sales;  /* 155 unique customer id's */


---- ****  Data Analysis ***---

1.Write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * FROM retail_sales;

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
the quantity sold is more than 4 in the month of Nov-2022.

SELECT * FROM retail_sales;

SELECT * 
FROM retail_sales
WHERE category = 'Clothing' AND quantiy >= 4 AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';


3.Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT * FROM retail_sales;

SELECT category, SUM(total_sale) AS Total_sales, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
 
4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT * FROM retail_sales;

SELECT round(avg(age),2)  as AVG_age
FROM  retail_sales
WHERE category = 'Beauty'
GROUP BY Age;


5.Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM retail_sales;

SELECT * 
FROM retail_sales
WHERE total_sale > 1000;

6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT * FROM retail_sales;

SELECT DISTINCT(category),gender,COUNT(transactions_id) AS Total_no_of_Transactions
FROM retail_sales
GROUP BY category,gender;


7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT * FROM retail_sales;





8.Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT * FROM retail_sales;

SELECT customer_id AS Top_5, sum(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


9.Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT * FROM retail_sales;

SELECT category, COUNT(DISTINCT(customer_id)) AS No_of_Unique_cust
FROM retail_sales
GROUP BY category;

10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

SELECT * FROM retail_sales;







