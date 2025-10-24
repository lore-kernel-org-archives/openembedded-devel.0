Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6684CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 12:27:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9430.1761308813484219119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 05:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pc1FFHBF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2392d52613=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O9fi0M1818243
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 05:26:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CWrsxwjjXtWrf1KxTyPVYKImxL1/UMLu8x/xn4kgGic=; b=pc1FFHBFnrMr
	R64hq0XByQOZitKpKHVAy4UvDs1S7WpN4Q08SV62MizCetpEYGnb1CZt4EF6CyBr
	E5hVqgaXzrtHU7IbiRUjwssnd4dOUWXqtV49R36yG/qH3wFCVvx4HKgSDQ6BQPRR
	AckXMwtI4uRY6hfLe1VGi9hcYuG+YgJ5jAvxojvTpeD1Qsp6o+mTcCQN9NUaF1HY
	EZsBX2dDUiSkXIlzK/+5I6BgRdUpYA6KZxRJvChCNk5OmEB930INwtZzQLUHIV6/
	LU+WqMTMt0OSISPWzPjBDQRZZdtFddRuWzAPwBqDFsDRrJM+4XmUa9XGMAQv5n4Z
	2S7b+RWepg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00gu4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 05:26:53 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 05:26:51 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 3/3] mariadb: fix CVE-2025-30722
Date: Fri, 24 Oct 2025 17:56:24 +0530
Message-ID: <20251024122624.1325594-3-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251024122624.1325594-1-divya.chellam@windriver.com>
References: <20251024122624.1325594-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExMCBTYWx0ZWRfXwPNlV7ZSpMGM
 eg6wNGBrlOY5SmjPlpFXK6WnejtAY6TFzRHtQc5rKP4Q70UwRwC0MYgsjoAcwVq8jimpMSU5hM4
 9ff1m+q/NV+lqDXuiCux0NPNexucbbjISALDicCa+lhe7lk5fqgY+/tsVMUqqdG1jNHZbmeDoBU
 oprlNQY3LLGCVOaV0+eYizcgqjb+HODxMv+Fm+8ZW7kpZs9Lq+wGzeh+4oesezxigX3h3n/HRAR
 h0TNVcccxmkUfWtMx6s063U1plL7F7TtExaxqMFpFqNO9qF7VrzktW7G3bOP9pmDY/VkqxBw1OV
 Px3fhTI0QpFIBbk4xnO+YjIH8Sw8IhzpEDlUZTHH7Hu68bCrrCS85JaM3W6/HAy7vHTowBoE9JK
 /orunQYQJgZua/Tuo4YrZEYCNikXtQ==
X-Proofpoint-ORIG-GUID: snNbvef_t71qNclbYuiOBp11A8VHsI95
X-Proofpoint-GUID: snNbvef_t71qNclbYuiOBp11A8VHsI95
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fb708d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8
 a=agYDggu22eVc5DO3ySQA:9 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510240110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 12:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120957

From: Divya Chellam <divya.chellam@windriver.com>

Vulnerability in the MySQL Client product of Oracle MySQL (component:
Client: mysqldump). Supported versions that are affected are 8.0.0-8.0.41,
8.4.0-8.4.4 and 9.0.0-9.2.0. Difficult to exploit vulnerability allows low
privileged attacker with network access via multiple protocols to compromise
MySQL Client. Successful attacks of this vulnerability can result in
unauthorized access to critical data or complete access to all MySQL Client
accessible data as well as unauthorized update, insert or delete access to
some of MySQL Client accessible data. CVSS 3.1 Base Score 5.9 (Confidentiality
and Integrity impacts). CVSS Vector: (CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:L/A:N).

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-30722

Upstream-patch:
https://github.com/MariaDB/server/commit/6aa860be27480db134a3c71065b9b47d15b72674

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 .../mysql/mariadb/CVE-2025-30722.patch        | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 27b5c46fa1..048e43d962 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://CVE-2024-21096-0004.patch \
            file://CVE-2024-21096-0005.patch \
 	   file://CVE-2025-21490.patch \
+	   file://CVE-2025-30722.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patch
new file mode 100644
index 0000000000..d7e74d66f0
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patch
@@ -0,0 +1,176 @@
+From 6aa860be27480db134a3c71065b9b47d15b72674 Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Tue, 11 Mar 2025 11:22:00 +0100
+Subject: [PATCH] MDEV-36268 mariadb-dump used wrong quoting character
+
+use ' not " and use quote_for_equal()
+
+Backported according to mariadb 10.11.12
+
+CVE: CVE-2025-30722
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/6aa860be27480db134a3c71065b9b47d15b72674]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ client/mysqldump.c                      | 15 +++++++----
+ mysql-test/main/mysqldump-system.result |  6 ++---
+ mysql-test/main/mysqldump.result        | 33 +++++++++++++++++++++++++
+ mysql-test/main/mysqldump.test          |  9 +++++++
+ 4 files changed, 55 insertions(+), 8 deletions(-)
+
+diff --git a/client/mysqldump.c b/client/mysqldump.c
+index 767413b1..9c0921c0 100644
+--- a/client/mysqldump.c
++++ b/client/mysqldump.c
+@@ -2175,7 +2175,7 @@ static char *quote_for_equal(const char *name, char *buff)
+       *to++='\\';
+     }
+     if (*name == '\'')
+-      *to++= '\\';
++      *to++= '\'';
+     *to++= *name++;
+   }
+   to[0]= '\'';
+@@ -3707,7 +3707,7 @@ static void dump_trigger_old(FILE *sql_file, MYSQL_RES *show_triggers_rs,
+ 
+   fprintf(sql_file,
+           "DELIMITER ;;\n"
+-          "/*!50003 SET SESSION SQL_MODE=\"%s\" */;;\n"
++          "/*!50003 SET SESSION SQL_MODE='%s' */;;\n"
+           "/*!50003 CREATE */ ",
+           (*show_trigger_row)[6]);
+ 
+@@ -4686,17 +4686,19 @@ static int dump_all_users_roles_and_grants()
+     return 1;
+   while ((row= mysql_fetch_row(tableres)))
+   {
++    char buf[200];
+     if (opt_replace_into)
+       /* Protection against removing the current import user */
+       /* MySQL-8.0 export capability */
+       fprintf(md_result_file,
+         "DELIMITER |\n"
+-        "/*M!100101 IF current_user()=\"%s\" THEN\n"
++        "/*M!100101 IF current_user()=%s THEN\n"
+         "  SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001,"
+         " MESSAGE_TEXT=\"Don't remove current user %s'\";\n"
+         "END IF */|\n"
+         "DELIMITER ;\n"
+-        "/*!50701 DROP USER IF EXISTS %s */;\n", row[0], row[0], row[0]);
++        "/*!50701 DROP USER IF EXISTS %s */;\n",
++        quote_for_equal(row[0],buf), row[0], row[0]);
+     if (dump_create_user(row[0]))
+       result= 1;
+     /* if roles exist, defer dumping grants until after roles created */
+@@ -6770,6 +6772,7 @@ static my_bool get_view_structure(char *table, char* db)
+   char       *result_table, *opt_quoted_table;
+   char       table_buff[NAME_LEN*2+3];
+   char       table_buff2[NAME_LEN*2+3];
++  char       temp_buff[NAME_LEN*2 + 3], temp_buff2[NAME_LEN*2 + 3];
+   char       query[QUERY_LENGTH];
+   FILE       *sql_file= md_result_file;
+   DBUG_ENTER("get_view_structure");
+@@ -6830,7 +6833,9 @@ static my_bool get_view_structure(char *table, char* db)
+               "SELECT CHECK_OPTION, DEFINER, SECURITY_TYPE, "
+               "       CHARACTER_SET_CLIENT, COLLATION_CONNECTION "
+               "FROM information_schema.views "
+-              "WHERE table_name=\"%s\" AND table_schema=\"%s\"", table, db);
++              "WHERE table_name=%s AND table_schema=%s",
++              quote_for_equal(table, temp_buff2),
++              quote_for_equal(db, temp_buff));
+ 
+   if (mysql_query(mysql, query))
+   {
+diff --git a/mysql-test/main/mysqldump-system.result b/mysql-test/main/mysqldump-system.result
+index 5619ec70..b502bd8d 100644
+--- a/mysql-test/main/mysqldump-system.result
++++ b/mysql-test/main/mysqldump-system.result
+@@ -648,21 +648,21 @@ INSTALL PLUGIN test_plugin_server  SONAME 'AUTH_TEST_PLUGIN_LIB';
+ /*M!100401 UNINSTALL PLUGIN IF EXIST cleartext_plugin_server */;
+ INSTALL PLUGIN cleartext_plugin_server  SONAME 'AUTH_TEST_PLUGIN_LIB';
+ DELIMITER |
+-/*M!100101 IF current_user()="'mariadb.sys'@'localhost'" THEN
++/*M!100101 IF current_user()='''mariadb.sys''@''localhost''' THEN
+   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT="Don't remove current user 'mariadb.sys'@'localhost''";
+ END IF */|
+ DELIMITER ;
+ /*!50701 DROP USER IF EXISTS 'mariadb.sys'@'localhost' */;
+ CREATE /*M!100103 OR REPLACE */ USER `mariadb.sys`@`localhost` PASSWORD EXPIRE;
+ DELIMITER |
+-/*M!100101 IF current_user()="'root'@'localhost'" THEN
++/*M!100101 IF current_user()='''root''@''localhost''' THEN
+   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT="Don't remove current user 'root'@'localhost''";
+ END IF */|
+ DELIMITER ;
+ /*!50701 DROP USER IF EXISTS 'root'@'localhost' */;
+ CREATE /*M!100103 OR REPLACE */ USER `root`@`localhost`;
+ DELIMITER |
+-/*M!100101 IF current_user()="'foobar'@'%'" THEN
++/*M!100101 IF current_user()='''foobar'@'%''' THEN
+   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT="Don't remove current user 'foobar'@'%''";
+ END IF */|
+ DELIMITER ;
+diff --git a/mysql-test/main/mysqldump.result b/mysql-test/main/mysqldump.result
+index ca9260f1..c55e5e49 100644
+--- a/mysql-test/main/mysqldump.result
++++ b/mysql-test/main/mysqldump.result
+@@ -6699,4 +6699,37 @@ CREATE TABLE `t1` (
+ /*!40101 SET character_set_client = @saved_cs_client */;
+ ERROR at line 9: Not allowed in the sandbox mode
+ drop table t1;
++#
++# MDEV-36268 mariadb-dump used wrong quoting character
++#
++create table t1 (a int);
++create view `v'1"2` as select * from t1 with check option;
++/*M!999999\- enable the sandbox mode */ 
++/*!40101 SET @saved_cs_client     = @@character_set_client */;
++/*!40101 SET character_set_client = utf8mb4 */;
++CREATE TABLE `t1` (
++  `a` int(11) DEFAULT NULL
++) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
++/*!40101 SET character_set_client = @saved_cs_client */;
++SET @saved_cs_client     = @@character_set_client;
++SET character_set_client = utf8mb4;
++/*!50001 CREATE VIEW `v'1"2` AS SELECT
++ 1 AS `a` */;
++SET character_set_client = @saved_cs_client;
++/*!50001 DROP VIEW IF EXISTS `v'1"2`*/;
++/*!50001 SET @saved_cs_client          = @@character_set_client */;
++/*!50001 SET @saved_cs_results         = @@character_set_results */;
++/*!50001 SET @saved_col_connection     = @@collation_connection */;
++/*!50001 SET character_set_client      = utf8 */;
++/*!50001 SET character_set_results     = utf8 */;
++/*!50001 SET collation_connection      = utf8_general_ci */;
++/*!50001 CREATE ALGORITHM=UNDEFINED */
++/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
++/*!50001 VIEW `v'1"2` AS select `t1`.`a` AS `a` from `t1` */
++/*!50002 WITH CASCADED CHECK OPTION */;
++/*!50001 SET character_set_client      = @saved_cs_client */;
++/*!50001 SET character_set_results     = @saved_cs_results */;
++/*!50001 SET collation_connection      = @saved_col_connection */;
++drop view `v'1"2`;
++drop table t1;
+ # End of 10.5 tests
+diff --git a/mysql-test/main/mysqldump.test b/mysql-test/main/mysqldump.test
+index 9248f2ac..64d73ad3 100644
+--- a/mysql-test/main/mysqldump.test
++++ b/mysql-test/main/mysqldump.test
+@@ -3003,4 +3003,13 @@ EOF
+ --remove_file $MYSQLTEST_VARDIR/tmp/mdev33727.sql
+ drop table t1;
+ 
++--echo #
++--echo # MDEV-36268 mariadb-dump used wrong quoting character
++--echo #
++create table t1 (a int);
++create view `v'1"2` as select * from t1 with check option; # "'
++--exec $MYSQL_DUMP --compact test
++drop view `v'1"2`; # "'
++drop table t1;
++
+ --echo # End of 10.5 tests
+-- 
+2.40.0
+
-- 
2.40.0


