Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD15CC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 03:15:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.64021.1679541306708110324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 20:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2446faf85f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N31fui024620
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 03:15:05 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsms97n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 03:15:05 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 22 Mar 2023 20:15:04 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 22 Mar 2023 20:15:03 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][PATCH] mariadb: Fix CVE-2022-47015
Date: Thu, 23 Mar 2023 11:15:02 +0800
Message-ID: <20230323031502.2748517-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: haGx7nRf-A_rB894vHRet1HDikSK4Aty
X-Proofpoint-GUID: haGx7nRf-A_rB894vHRet1HDikSK4Aty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 03:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101641

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2022-47015 [2].

[1] https://github.com/MariaDB/server/commit/b98375f9df0
[2] https://jira.mariadb.org/browse/MDEV-29644

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 ...ential-bug-of-null-pointer-dereferen.patch | 320 ++++++++++++++++++
 2 files changed, 321 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 097766e79..ead950f46 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
+           file://0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch
new file mode 100644
index 000000000..2fe768d75
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch
@@ -0,0 +1,320 @@
+From b98375f9df0b024857c03c03bc3e73e8ced8d772 Mon Sep 17 00:00:00 2001
+From: Nayuta Yanagisawa <nayuta.yanagisawa@hey.com>
+Date: Tue, 27 Sep 2022 15:22:57 +0900
+Subject: [PATCH] MDEV-29644 a potential bug of null pointer dereference in
+ spider_db_mbase::print_warnings()
+
+The function spider_db_mbase::print_warnings() can potentially result
+in a null pointer dereference.
+
+Remove the null pointer dereference by cleaning up the function.
+
+Some small changes to the original commit
+422fb63a9bbee35c50b6c7be19d199afe0bc98fa.
+
+CVE: CVE-2022-47015
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/b98375f9df0]
+
+Co-Authored-By: Yuchen Pei <yuchen.pei@mariadb.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ .../spider/bugfix/r/mdev_29644.result         |  41 ++++++
+ .../mysql-test/spider/bugfix/t/mdev_29644.cnf |   3 +
+ .../spider/bugfix/t/mdev_29644.test           |  56 ++++++++
+ storage/spider/spd_db_mysql.cc                | 124 ++++++++----------
+ storage/spider/spd_db_mysql.h                 |   2 +-
+ 5 files changed, 154 insertions(+), 72 deletions(-)
+ create mode 100644 storage/spider/mysql-test/spider/bugfix/r/mdev_29644.result
+ create mode 100644 storage/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf
+ create mode 100644 storage/spider/mysql-test/spider/bugfix/t/mdev_29644.test
+
+diff --git a/storage/spider/mysql-test/spider/bugfix/r/mdev_29644.result b/storage/spider/mysql-test/spider/bugfix/r/mdev_29644.result
+new file mode 100644
+index 00000000000..b52cecc5bb7
+--- /dev/null
++++ b/storage/spider/mysql-test/spider/bugfix/r/mdev_29644.result
+@@ -0,0 +1,41 @@
++#
++# MDEV-29644 a potential bug of null pointer dereference in spider_db_mbase::print_warnings()
++#
++for master_1
++for child2
++child2_1
++child2_2
++child2_3
++for child3
++connection child2_1;
++CREATE DATABASE auto_test_remote;
++USE auto_test_remote;
++CREATE TABLE tbl_a (
++a CHAR(5)
++) ENGINE=InnoDB DEFAULT CHARSET=utf8;
++SET GLOBAL sql_mode='';
++connection master_1;
++CREATE DATABASE auto_test_local;
++USE auto_test_local;
++CREATE TABLE tbl_a (
++a CHAR(255)
++) ENGINE=Spider DEFAULT CHARSET=utf8 COMMENT='table "tbl_a", srv "s_2_1"';
++SET sql_mode='';
++INSERT INTO tbl_a VALUES ("this will be truncated");
++NOT FOUND /\[WARN SPIDER RESULT\].* Warning 1265 Data truncated for column 'a' at row 1.*/ in mysqld.1.1.err
++SET GLOBAL spider_log_result_errors=4;
++INSERT INTO tbl_a VALUES ("this will be truncated");
++FOUND 1 /\[WARN SPIDER RESULT\].* Warning 1265 Data truncated for column 'a' at row 1.*/ in mysqld.1.1.err
++connection master_1;
++SET GLOBAL spider_log_result_errors=DEFAULT;
++SET sql_mode=DEFAULT;
++DROP DATABASE IF EXISTS auto_test_local;
++connection child2_1;
++SET GLOBAL sql_mode=DEFAULT;
++DROP DATABASE IF EXISTS auto_test_remote;
++for master_1
++for child2
++child2_1
++child2_2
++child2_3
++for child3
+diff --git a/storage/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf b/storage/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf
+new file mode 100644
+index 00000000000..05dfd8a0bce
+--- /dev/null
++++ b/storage/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf
+@@ -0,0 +1,3 @@
++!include include/default_mysqld.cnf
++!include ../my_1_1.cnf
++!include ../my_2_1.cnf
+diff --git a/storage/spider/mysql-test/spider/bugfix/t/mdev_29644.test b/storage/spider/mysql-test/spider/bugfix/t/mdev_29644.test
+new file mode 100644
+index 00000000000..3a8fbb251e1
+--- /dev/null
++++ b/storage/spider/mysql-test/spider/bugfix/t/mdev_29644.test
+@@ -0,0 +1,56 @@
++--echo #
++--echo # MDEV-29644 a potential bug of null pointer dereference in spider_db_mbase::print_warnings()
++--echo #
++
++# The test case below does not cause the potential null pointer dereference.
++# It is just for checking spider_db_mbase::fetch_and_print_warnings() works.
++
++--disable_query_log
++--disable_result_log
++--source ../../t/test_init.inc
++--enable_result_log
++--enable_query_log
++
++--connection child2_1
++CREATE DATABASE auto_test_remote;
++USE auto_test_remote;
++eval CREATE TABLE tbl_a (
++    a CHAR(5)
++) $CHILD2_1_ENGINE $CHILD2_1_CHARSET;
++
++SET GLOBAL sql_mode='';
++
++--connection master_1
++CREATE DATABASE auto_test_local;
++USE auto_test_local;
++eval CREATE TABLE tbl_a (
++    a CHAR(255)
++) $MASTER_1_ENGINE $MASTER_1_CHARSET COMMENT='table "tbl_a", srv "s_2_1"';
++
++SET sql_mode='';
++
++let SEARCH_FILE= $MYSQLTEST_VARDIR/log/mysqld.1.1.err;
++let SEARCH_PATTERN= \[WARN SPIDER RESULT\].* Warning 1265 Data truncated for column 'a' at row 1.*;
++
++INSERT INTO tbl_a VALUES ("this will be truncated");
++--source include/search_pattern_in_file.inc # should not find
++
++SET GLOBAL spider_log_result_errors=4;
++
++INSERT INTO tbl_a VALUES ("this will be truncated");
++--source include/search_pattern_in_file.inc # should find
++
++--connection master_1
++SET GLOBAL spider_log_result_errors=DEFAULT;
++SET sql_mode=DEFAULT;
++DROP DATABASE IF EXISTS auto_test_local;
++
++--connection child2_1
++SET GLOBAL sql_mode=DEFAULT;
++DROP DATABASE IF EXISTS auto_test_remote;
++
++--disable_query_log
++--disable_result_log
++--source ../t/test_deinit.inc
++--enable_query_log
++--enable_result_log
+diff --git a/storage/spider/spd_db_mysql.cc b/storage/spider/spd_db_mysql.cc
+index d377d2bd807..bc8383017f7 100644
+--- a/storage/spider/spd_db_mysql.cc
++++ b/storage/spider/spd_db_mysql.cc
+@@ -2207,7 +2207,7 @@ int spider_db_mbase::exec_query(
+         db_conn->affected_rows, db_conn->insert_id,
+         db_conn->server_status, db_conn->warning_count);
+       if (spider_param_log_result_errors() >= 3)
+-        print_warnings(l_time);
++        fetch_and_print_warnings(l_time);
+     } else if (log_result_errors >= 4)
+     {
+       time_t cur_time = (time_t) time((time_t*) 0);
+@@ -2289,81 +2289,63 @@ bool spider_db_mbase::is_xa_nota_error(
+   DBUG_RETURN(xa_nota);
+ }
+ 
+-int spider_db_mbase::print_warnings(
+-  struct tm *l_time
+-) {
++int spider_db_mbase::fetch_and_print_warnings(struct tm *l_time)
++{
+   int error_num = 0;
+-  DBUG_ENTER("spider_db_mbase::print_warnings");
++  DBUG_ENTER("spider_db_mbase::fetch_and_print_warnings");
+   DBUG_PRINT("info",("spider this=%p", this));
+-  if (db_conn->status == MYSQL_STATUS_READY)
++
++  if (spider_param_dry_access() || db_conn->status != MYSQL_STATUS_READY ||
++      db_conn->server_status & SERVER_MORE_RESULTS_EXISTS ||
++      !db_conn->warning_count)
++    DBUG_RETURN(0);
++
++  if (mysql_real_query(db_conn, SPIDER_SQL_SHOW_WARNINGS_STR,
++                       SPIDER_SQL_SHOW_WARNINGS_LEN))
++    DBUG_RETURN(0);
++
++  MYSQL_RES *res= mysql_store_result(db_conn);
++  if (!res)
++    DBUG_RETURN(0);
++
++  uint num_fields= mysql_num_fields(res);
++  if (num_fields != 3)
+   {
+-    if (
+-#if MYSQL_VERSION_ID < 50500
+-      !(db_conn->last_used_con->server_status & SERVER_MORE_RESULTS_EXISTS) &&
+-      db_conn->last_used_con->warning_count
+-#else
+-      !(db_conn->server_status & SERVER_MORE_RESULTS_EXISTS) &&
+-      db_conn->warning_count
+-#endif
+-    ) {
+-      if (
+-        spider_param_dry_access() ||
+-        !mysql_real_query(db_conn, SPIDER_SQL_SHOW_WARNINGS_STR,
+-          SPIDER_SQL_SHOW_WARNINGS_LEN)
+-      ) {
+-        MYSQL_RES *res = NULL;
+-        MYSQL_ROW row = NULL;
+-        uint num_fields;
+-        if (
+-          spider_param_dry_access() ||
+-          !(res = mysql_store_result(db_conn)) ||
+-          !(row = mysql_fetch_row(res))
+-        ) {
+-          if (mysql_errno(db_conn))
+-          {
+-            if (res)
+-              mysql_free_result(res);
+-            DBUG_RETURN(0);
+-          }
+-          /* no record is ok */
+-        }
+-        num_fields = mysql_num_fields(res);
+-        if (num_fields != 3)
+-        {
+-          mysql_free_result(res);
+-          DBUG_RETURN(0);
+-        }
+-        if (l_time)
+-        {
+-          while (row)
+-          {
+-            fprintf(stderr, "%04d%02d%02d %02d:%02d:%02d [WARN SPIDER RESULT] "
+-              "from [%s] %ld to %ld: %s %s %s\n",
++    mysql_free_result(res);
++    DBUG_RETURN(0);
++  }
++
++  MYSQL_ROW row= mysql_fetch_row(res);
++  if (l_time)
++  {
++    while (row)
++    {
++      fprintf(stderr,
++              "%04d%02d%02d %02d:%02d:%02d [WARN SPIDER RESULT] from [%s] %ld "
++              "to %ld: %s %s %s\n",
+               l_time->tm_year + 1900, l_time->tm_mon + 1, l_time->tm_mday,
+-              l_time->tm_hour, l_time->tm_min, l_time->tm_sec,
+-              conn->tgt_host, (ulong) db_conn->thread_id,
+-              (ulong) current_thd->thread_id, row[0], row[1], row[2]);
+-            row = mysql_fetch_row(res);
+-          }
+-        } else {
+-          while (row)
+-          {
+-            DBUG_PRINT("info",("spider row[0]=%s", row[0]));
+-            DBUG_PRINT("info",("spider row[1]=%s", row[1]));
+-            DBUG_PRINT("info",("spider row[2]=%s", row[2]));
+-            longlong res_num =
+-              (longlong) my_strtoll10(row[1], (char**) NULL, &error_num);
+-            DBUG_PRINT("info",("spider res_num=%lld", res_num));
+-            my_printf_error((int) res_num, row[2], MYF(0));
+-            error_num = (int) res_num;
+-            row = mysql_fetch_row(res);
+-          }
+-        }
+-        if (res)
+-          mysql_free_result(res);
+-      }
++              l_time->tm_hour, l_time->tm_min, l_time->tm_sec, conn->tgt_host,
++              (ulong) db_conn->thread_id, (ulong) current_thd->thread_id, row[0],
++              row[1], row[2]);
++      row= mysql_fetch_row(res);
++    }
++  } else {
++    while (row)
++    {
++      DBUG_PRINT("info",("spider row[0]=%s", row[0]));
++      DBUG_PRINT("info",("spider row[1]=%s", row[1]));
++      DBUG_PRINT("info",("spider row[2]=%s", row[2]));
++      longlong res_num =
++        (longlong) my_strtoll10(row[1], (char**) NULL, &error_num);
++      DBUG_PRINT("info",("spider res_num=%lld", res_num));
++      my_printf_error((int) res_num, row[2], MYF(0));
++      error_num = (int) res_num;
++      row = mysql_fetch_row(res);
+     }
+   }
++    
++  mysql_free_result(res);
++
+   DBUG_RETURN(error_num);
+ }
+ 
+@@ -14668,7 +14650,7 @@ int spider_mbase_handler::show_table_status(
+       DBUG_RETURN(error_num);
+     }
+   }
+-  if ((error_num = ((spider_db_mbase *) conn->db_conn)->print_warnings(NULL)))
++  if ((error_num = ((spider_db_mbase *) conn->db_conn)->fetch_and_print_warnings(NULL)))
+   {
+     DBUG_RETURN(error_num);
+   }
+diff --git a/storage/spider/spd_db_mysql.h b/storage/spider/spd_db_mysql.h
+index e90461ea278..a2012352f21 100644
+--- a/storage/spider/spd_db_mysql.h
++++ b/storage/spider/spd_db_mysql.h
+@@ -442,7 +442,7 @@ class spider_db_mbase: public spider_db_conn
+   bool is_xa_nota_error(
+     int error_num
+   );
+-  int print_warnings(
++  int fetch_and_print_warnings(
+     struct tm *l_time
+   );
+   spider_db_result *store_result(
+-- 
+2.25.1
+
-- 
2.25.1


