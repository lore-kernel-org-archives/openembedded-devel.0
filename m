Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6115BC77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 07:33:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9979.1750836817603794056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 00:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8271b8b582=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5VN6d026800
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:33:36 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2m3en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:33:36 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 25 Jun 2025 00:33:31 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/3] mariadb: fix CVE-2023-52968
Date: Wed, 25 Jun 2025 13:03:11 +0530
Message-ID: <20250625073313.1882580-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1NSBTYWx0ZWRfX4ZAIfvuw6I+5 y+WsMxtgEaXzuP1Uv6EVw2Hn9mYnvcvmPPVfvmtYhtWZpWtZkSR4FRyXpIlBsTSyDsNzVudb3Wa L0JmDaNNZzG3Nhzbmk5p/5oUa0kgughcH+ie14luHaWNrTEDRXNo1XpqTjeXdVeKCtsBuZGHWTA
 Cxzv9iFUdiuA240Rs9INs7jVGwrBLTfBGchZuQ4WeYS541lP7pDSz55rIyXVhdv1NC2SjQ5og1o uYe+33rlst+BjOO+PFk9lL+x1pcoaqrRslyo6XJO1WMZ/FXmK+sJNPnTELwEjDQM/M12N6L+xwC rc0p+hCI240/sCEDAS1Sg3neamhe6xAXx1KtW3HMqN5p2Rl4ohiS7JQm9TJ9RoqnRHn/aSBqtr5
 KTGS8VzyXQL2Z9teur3jc+iwnewa1RFetep6MBsAW8tVgBeGs1vQ/Vm2drXMhZKSE1nhSJT9
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685ba650 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=2axcuBc2iGKZsjvi9gkA:9 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HyKByQ0odkLs_3xc5HdOQ6IYXgR7mrmn
X-Proofpoint-GUID: HyKByQ0odkLs_3xc5HdOQ6IYXgR7mrmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118103

From: Yogita Urade <yogita.urade@windriver.com>

MariaDB Server 10.4 before 10.4.33, 10.5 before 10.5.24, 10.6
before 10.6.17, 10.7 through 10.11 before 10.11.7, 11.0 before
11.0.5, and 11.1 before 11.1.4 calls fix_fields_if_needed under
mysql_derived_prepare when derived is not yet prepared, leading
to a find_field_in_table crash.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-52968

Upstream patch:
https://github.com/MariaDB/server/commit/74883f5e2f4c0e09f4f4e9e272a8e5bfd91a9489

Fix indent issue in mariadb.inc file.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
 .../mysql/mariadb/CVE-2023-52968.patch        | 106 ++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52968.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7c4b0a467f..6a8ff05039 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,7 +22,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch \
-	   file://CVE-2023-22084.patch \
+           file://CVE-2023-22084.patch \
+           file://CVE-2023-52968.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52968.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52968.patch
new file mode 100644
index 0000000000..bea473e4a3
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52968.patch
@@ -0,0 +1,106 @@
+From 74883f5e2f4c0e09f4f4e9e272a8e5bfd91a9489 Mon Sep 17 00:00:00 2001
+From: Aleksey Midenkov <midenok@gmail.com>
+Date: Thu, 9 Nov 2023 16:26:11 +0300
+Subject: [PATCH] MDEV-32082 Server crash in find_field_in_table
+
+Attempt to resolve FOR SYSTEM_TIME expression as field for derived
+table is done before derived table is fully prepared, so we fail on
+assertion that table_list->table is missing.
+
+Actually Vers_history_point::resolve_unit() is done under the call of
+mysql_derived_prepare() itself (sql_derived.cc:824) and the table is
+assigned later at 867.
+
+The fix disables unit resolution for field type in FOR SYSTEM_TIME
+expression as it does a little sense in any case: making historical
+queries based on variable field values produces the result of multiple
+time points.
+
+fix_fields_if_needed() in resolve_units() was introduced by 46be31982a4
+
+CVE: CVE-2023-52968
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/74883f5e2f4c0e09f4f4e9e272a8e5bfd91a9489]
+
+Changes:
+-Use old my_error API instead of new bad_expression_data_type_error API.
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ mysql-test/suite/versioning/r/select.result | 11 ++++++++++-
+ mysql-test/suite/versioning/t/select.test   | 12 +++++++++++-
+ sql/table.cc                                |  6 ++++++
+ 3 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/mysql-test/suite/versioning/r/select.result b/mysql-test/suite/versioning/r/select.result
+index 90c99d1b..714455b6 100644
+--- a/mysql-test/suite/versioning/r/select.result
++++ b/mysql-test/suite/versioning/r/select.result
+@@ -443,7 +443,7 @@ create or replace table t1 (x int) with system versioning;
+ select * from t1 for system_time as of current_timestamp;
+ x
+ select * from t1 for system_time as of now;
+-ERROR 42S22: Unknown column 'now' in 'FOR SYSTEM_TIME'
++ERROR HY000: Illegal parameter data type now for operation 'FOR SYSTEM_TIME'
+ ### Issue #405, NATURAL JOIN failure
+ create or replace table t1 (a int) with system versioning;
+ create or replace table t2 (b int);
+@@ -708,3 +708,12 @@ No	A	B	C	D
+ 33	1	1	1	1
+ 34	1	1	1	1
+ SET GLOBAL innodb_stats_persistent = @saved_stats_persistent;
++#
++# MDEV-32082 Server crash in find_field_in_table
++#
++create table t0 (c0 int) with system versioning;
++select x0 from (
++select c0 x0 from t0
++) for system_time as of nowasdf deriv;
++ERROR HY000: Illegal parameter data type nowasdf for operation 'FOR SYSTEM_TIME'
++drop table t0;
+diff --git a/mysql-test/suite/versioning/t/select.test b/mysql-test/suite/versioning/t/select.test
+index 9142a8fa..5603d1a3 100644
+--- a/mysql-test/suite/versioning/t/select.test
++++ b/mysql-test/suite/versioning/t/select.test
+@@ -314,7 +314,7 @@ select * from t1 where (a, 2) in ((1, 1), (2, 2)) and b = 1;
+ --echo ### Issue #398, NOW is now non-magic
+ create or replace table t1 (x int) with system versioning;
+ select * from t1 for system_time as of current_timestamp;
+---error ER_BAD_FIELD_ERROR
++--error ER_ILLEGAL_PARAMETER_DATA_TYPE_FOR_OPERATION
+ select * from t1 for system_time as of now;
+
+ --echo ### Issue #405, NATURAL JOIN failure
+@@ -487,4 +487,14 @@ call verify_trt_dummy(34);
+
+ SET GLOBAL innodb_stats_persistent = @saved_stats_persistent;
+
++--echo #
++--echo # MDEV-32082 Server crash in find_field_in_table
++--echo #
++create table t0 (c0 int) with system versioning;
++--error ER_ILLEGAL_PARAMETER_DATA_TYPE_FOR_OPERATION
++select x0 from (
++  select c0 x0 from t0
++) for system_time as of nowasdf deriv;
++drop table t0;
++
+ -- source suite/versioning/common_finish.inc
+diff --git a/sql/table.cc b/sql/table.cc
+index e0e06702..81a5674a 100644
+--- a/sql/table.cc
++++ b/sql/table.cc
+@@ -10326,6 +10326,12 @@ bool Vers_history_point::check_unit(THD *thd)
+ {
+   if (!item)
+     return false;
++  if (item->real_type() == Item::FIELD_ITEM)
++  {
++    my_error(ER_ILLEGAL_PARAMETER_DATA_TYPE_FOR_OPERATION, MYF(0),
++             item->full_name(), "FOR SYSTEM_TIME");
++    return true;
++  }
+   if (item->fix_fields_if_needed(thd, &item))
+     return true;
+   const Type_handler *t= item->this_item()->real_type_handler();
+--
+2.40.0
-- 
2.40.0


