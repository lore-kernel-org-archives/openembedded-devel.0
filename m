Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69618C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 07:33:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9823.1750836827033625851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 00:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8271b8b582=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P71luq030622
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:33:46 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2m3ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:33:42 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 25 Jun 2025 00:33:36 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 3/3] mariadb: fix CVE-2024-21096
Date: Wed, 25 Jun 2025 13:03:13 +0530
Message-ID: <20250625073313.1882580-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250625073313.1882580-1-yogita.urade@windriver.com>
References: <20250625073313.1882580-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1NSBTYWx0ZWRfXz3L2YUsZ6bB1 iok0Tl2vkUCizBCzkziva+j/YZOnOK/9XBesDKtwvdJM1b5VIZ7CeLED4OSo2aV/1wFKl05G+Ma PLZ+ChfDVkwIVXV3eQyPqWBhxrAJjDJi3Qgos5FNW9KwUt9LHVkIIZRGFaZXb2m5+aZMs3Z3FdE
 rnmpywo80GIlh3S1+8or5oz2OXvrzJPWmiXMYwp75eiVvvUqN3oefSvHakdMDiWEYqQlLz1XRrn bdjsbmDXKdRjF/B8h6euSDdMQnw4fP+2ghAzABmWBKkuDliKHgq+ypW3bWXuPDu4EBwOWP2FD0j s6PMGy2QLMUuw8XH6z4h1G1wQ6MinKgYhY1TWyd0OfB2bTyjsuibFFdLnuPLBUAWGGhhvfjRejc
 b1yfh0e09rWK4u6kK5f1SmFYay+8PNgDnxr9sYfLSfYqlGw+svLWC+bvpyS++3PIxCbc+oTd
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685ba657 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=jpp-Wi3FAAAA:8 a=RpdoSo-J77akpHkKQ-wA:9 a=8uPzgGwPDPOMRuCx:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22 a=3HWhRrkoiJongTt84g_J:22
X-Proofpoint-ORIG-GUID: H_IrNx0OB4fNJTdL43SnAbEcHsCn7OLy
X-Proofpoint-GUID: H_IrNx0OB4fNJTdL43SnAbEcHsCn7OLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250055
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55P71luq030622
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118105

From: Yogita Urade <yogita.urade@windriver.com>

Vulnerability in the MySQL Server product of Oracle MySQL (component:
Client: mysqldump). Supported versions that are affected are 8.0.36
and prior and 8.3.0 and prior. Difficult to exploit vulnerability
allows unauthenticated attacker with logon to the infrastructure
where MySQL Server executes to compromise MySQL Server. Successful
attacks of this vulnerability can result in unauthorized update,
insert or delete access to some of MySQL Server accessible data as
well as unauthorized read access to a subset of MySQL Server accessible
data and unauthorized ability to cause a partial denial of service
(partial DOS) of MySQL Server. CVSS 3.1 Base Score 4.9 (Confidentiality,
Integrity and Availability impacts).

CVE-2024-21096-0001, CVE-2024-21096-0002 are CVE fixes and rest are
regression fixes.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-21096
https://security-tracker.debian.org/tracker/CVE-2024-21096

Upstream patches:
https://github.com/MariaDB/server/commit/13663cb5c4558383e9dab96e501d72ce=
b7a0a158
https://github.com/MariaDB/server/commit/1c425a8d854061d1987ad4ea352c7270=
652e31c4
https://github.com/MariaDB/server/commit/77c4c0f256f3c268d3f72625b04240d2=
4a70513c
https://github.com/MariaDB/server/commit/d60f5c11ea9008fa57444327526e3d2c=
8633ba06
https://github.com/MariaDB/server/commit/d20518168aff435a4843eebb108e5b9d=
f24c19fb

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |    5 +
 .../mysql/mariadb/CVE-2024-21096-0001.patch   | 1392 +++
 .../mysql/mariadb/CVE-2024-21096-0002.patch   |   38 +
 .../mysql/mariadb/CVE-2024-21096-0003.patch   |  138 +
 .../mysql/mariadb/CVE-2024-21096-0004.patch   | 7729 +++++++++++++++++
 .../mysql/mariadb/CVE-2024-21096-0005.patch   | 1431 +++
 6 files changed, 10733 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0001=
.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0002=
.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0003=
.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0004=
.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0005=
.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 951d3a28e8..3980948859 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -28,6 +28,11 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/=
${BP}.tar.gz \
            file://CVE-2023-52969-CVE-20230-52970-0002.patch \
            file://CVE-2023-52969-CVE-20230-52970-0003.patch \
            file://CVE-2023-52969-CVE-20230-52970-0004.patch \
+           file://CVE-2024-21096-0001.patch \
+           file://CVE-2024-21096-0002.patch \
+           file://CVE-2024-21096-0003.patch \
+           file://CVE-2024-21096-0004.patch \
+           file://CVE-2024-21096-0005.patch \
           "
 SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0001.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0001.patch
new file mode 100644
index 0000000000..6cea512788
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0001.patch
@@ -0,0 +1,1392 @@
+From 13663cb5c4558383e9dab96e501d72ceb7a0a158 Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Sun, 5 May 2024 17:37:37 +0200
+Subject: [PATCH] MDEV-33727 mariadb-dump trusts the server and does not=20
+ validate the data
+
+safety first - tell mariadb client not to execute dangerous
+cli commands, they cannot be present in the dump anyway.
+
+wrapping the command in /*!999999 ..... */ guarantees that
+if a non-mariadb-cli client loads the dump and sends it to the
+server - the server will ignore the command it doesn't understand
+
+CVE: CVE-2024-21096
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/1366=
3cb5c4558383e9dab96e501d72ceb7a0a158]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ client/mysqldump.c                            |  87 ++++++-------
+ mysql-test/main/ddl_i18n_koi8r.result         |   5 +
+ mysql-test/main/ddl_i18n_utf8.result          |   6 +
+ mysql-test/main/lock_view.result              |   2 +
+ mysql-test/main/mysql.result                  |   2 +
+ mysql-test/main/mysqldump-compat-102.result   |   1 +
+ mysql-test/main/mysqldump-max.result          |   2 +
+ mysql-test/main/mysqldump-nl.result           |   2 +
+ mysql-test/main/mysqldump-no-binlog.result    |   1 +
+ mysql-test/main/mysqldump-system.result       |   3 +
+ mysql-test/main/mysqldump-timing.result       |   2 +
+ mysql-test/main/mysqldump-utf8mb4.result      |   1 +
+ mysql-test/main/mysqldump.result              | 114 +++++++++++++++++-
+ mysql-test/main/mysqldump.test                |  21 ++++
+ mysql-test/main/openssl_1.result              |   5 +-
+ mysql-test/main/plugin_auth.result            |   1 +
+ mysql-test/main/rpl_mysqldump_slave.result    |   9 ++
+ mysql-test/main/trigger_wl3253.result         |   2 +
+ .../suite/archive/archive_bitfield.result     |   1 +
+ .../oracle/r/sp-package-mysqldump.result      |   1 +
+ mysql-test/suite/federated/federatedx.result  |   1 +
+ mysql-test/suite/roles/definer.result         |   1 +
+ .../suite/sql_sequence/mysqldump.result       |   5 +
+ .../connect/mysql-test/connect/r/mysql.result |   1 +
+ 24 files changed, 232 insertions(+), 44 deletions(-)
+
+diff --git a/client/mysqldump.c b/client/mysqldump.c
+index d9c7df16..51a5af15 100644
+--- a/client/mysqldump.c
++++ b/client/mysqldump.c
+@@ -762,56 +762,59 @@ static void write_header(FILE *sql_file, const cha=
r *db_name)
+     fputs(">\n", sql_file);
+     check_io(sql_file);
+   }
+-  else if (!opt_compact)
++  else
+   {
+-    print_comment(sql_file, 0,
+-                  "-- MariaDB dump %s  Distrib %s, for %s (%s)\n--\n",
+-                  DUMP_VERSION, MYSQL_SERVER_VERSION, SYSTEM_TYPE,
+-                  MACHINE_TYPE);
+-    print_comment(sql_file, 0, "-- Host: %s    ",
+-                  fix_for_comment(current_host ? current_host : "localh=
ost"));
+-    print_comment(sql_file, 0, "Database: %s\n",
+-                  fix_for_comment(db_name ? db_name : ""));
+-    print_comment(sql_file, 0,
+-                  "-- -------------------------------------------------=
-----\n"
+-                 );
+-    print_comment(sql_file, 0, "-- Server version\t%s\n",
+-                  mysql_get_server_info(&mysql_connection));
+-
+-    if (!opt_logging)
+-      fprintf(sql_file,
+-"\n/*M!100101 SET LOCAL SQL_LOG_OFF=3D0, LOCAL SLOW_QUERY_LOG=3D0 */;")=
;
++    fprintf(sql_file, "/*!999999\\- enable the sandbox mode */ \n");
++     if (!opt_compact)
++     {
++       print_comment(sql_file, 0,
++                     "-- MariaDB dump %s  Distrib %s, for %s (%s)\n--\n=
",
++                     DUMP_VERSION, MYSQL_SERVER_VERSION, SYSTEM_TYPE,
++                     MACHINE_TYPE);
++       print_comment(sql_file, 0, "-- Host: %s    ",
++                     fix_for_comment(current_host ? current_host : "loc=
alhost"));
++       print_comment(sql_file, 0, "Database: %s\n",
++                     fix_for_comment(db_name ? db_name : ""));
++       print_comment(sql_file, 0,
++                     "-- ----------------------------------------------=
--------\n"
++                    );
++       print_comment(sql_file, 0, "-- Server version\t%s\n",
++                     mysql_get_server_info(&mysql_connection));
++
++      if (!opt_logging)
++        fprintf(sql_file,
++          "\n/*M!100101 SET LOCAL SQL_LOG_OFF=3D0, LOCAL SLOW_QUERY_LOG=
=3D0 */;");
+=20
+-    if (opt_set_charset)
+-      fprintf(sql_file,
+-"\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;"
+-"\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */=
;"
+-"\n/*!40101 SET @OLD_COLLATION_CONNECTION=3D@@COLLATION_CONNECTION */;"
+-"\n/*!40101 SET NAMES %s */;\n",default_charset);
++      if (opt_set_charset)
++        fprintf(sql_file,
++          "\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_C=
LIENT */;"
++          "\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_=
RESULTS */;"
++          "\n/*!40101 SET @OLD_COLLATION_CONNECTION=3D@@COLLATION_CONNE=
CTION */;"
++          "\n/*!40101 SET NAMES %s */;\n",default_charset);
+=20
+-    if (opt_tz_utc)
+-    {
+-      fprintf(sql_file, "/*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;\=
n");
+-      fprintf(sql_file, "/*!40103 SET TIME_ZONE=3D'+00:00' */;\n");
+-    }
++      if (opt_tz_utc)
++      {
++        fprintf(sql_file, "/*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */=
;\n");
++        fprintf(sql_file, "/*!40103 SET TIME_ZONE=3D'+00:00' */;\n");
++      }
+=20
+-    if (!path)
+-    {
+-      if (!opt_no_create_info)
++      if (!path)
+       {
+-        /* We don't need unique checks as the table is created just bef=
ore */
++        if (!opt_no_create_info)
++        {
++          /* We don't need unique checks as the table is created just b=
efore */
++          fprintf(md_result_file,"\
++            /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_C=
HECKS=3D0 */;\n");
++        }
+         fprintf(md_result_file,"\
+-/*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;\n");
++          /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=3D@@FOREIGN_KEY_CHECKS, =
FOREIGN_KEY_CHECKS=3D0 */;\n");
+       }
+-      fprintf(md_result_file,"\
+-/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=3D@@FOREIGN_KEY_CHECKS, FOREIGN_KE=
Y_CHECKS=3D0 */;\n\
+-");
++      fprintf(sql_file,
++              "/*!40101 SET @OLD_SQL_MODE=3D@@SQL_MODE, SQL_MODE=3D'%s%=
s%s' */;\n"
++              "/*!40111 SET @OLD_SQL_NOTES=3D@@SQL_NOTES, SQL_NOTES=3D0=
 */;\n",
++              path?"":"NO_AUTO_VALUE_ON_ZERO",compatible_mode_normal_st=
r[0]=3D=3D0?"":",",
++              compatible_mode_normal_str);
+     }
+-    fprintf(sql_file,
+-            "/*!40101 SET @OLD_SQL_MODE=3D@@SQL_MODE, SQL_MODE=3D'%s%s%=
s' */;\n"
+-            "/*!40111 SET @OLD_SQL_NOTES=3D@@SQL_NOTES, SQL_NOTES=3D0 *=
/;\n",
+-            path?"":"NO_AUTO_VALUE_ON_ZERO",compatible_mode_normal_str[=
0]=3D=3D0?"":",",
+-            compatible_mode_normal_str);
+     check_io(sql_file);
+   }
+ } /* write_header */
+diff --git a/mysql-test/main/ddl_i18n_koi8r.result b/mysql-test/main/ddl=
_i18n_koi8r.result
+index f588374a..39bc4d4a 100644
+--- a/mysql-test/main/ddl_i18n_koi8r.result
++++ b/mysql-test/main/ddl_i18n_koi8r.result
+@@ -719,6 +719,7 @@ ca	cb
+ utf8mb3_general_ci	utf8mb3_general_ci
+=20
+ ---> Dump of mysqltest1
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -795,6 +796,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 COLL=
ATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_koi8r.sp.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
++/*!999999\- enable the sandbox mode */=20
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1723,6 +1725,7 @@ koi8r_general_ci	utf8mb3_general_ci	koi8r_general_=
ci	koi8r_general_ci	utf8mb3_ge
+ DELETE FROM mysqltest2.log|
+=20
+ ---> Dump of mysqltest1
++/*!999999\- enable the sandbox mode */=20
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1805,6 +1808,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 CO=
LLATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_koi8r.triggers.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -2491,6 +2495,7 @@ COLLATION( '
+ END	ONE TIME	1970-01-02 00:00:00	NULL	NULL		NULL	NULL	DISABLED	PRESERVE=
	CREATED	LAST_ALTERED	NULL		1	koi8r	koi8r_general_ci	utf8mb3_unicode_ci
+=20
+ ---> Dump of mysqltest1
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+diff --git a/mysql-test/main/ddl_i18n_utf8.result b/mysql-test/main/ddl_=
i18n_utf8.result
+index cb57bc5e..33ec6e6e 100644
+--- a/mysql-test/main/ddl_i18n_utf8.result
++++ b/mysql-test/main/ddl_i18n_utf8.result
+@@ -719,6 +719,7 @@ ca	cb
+ utf8mb3_general_ci	utf8mb3_general_ci
+=20
+ ---> Dump of mysqltest1
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -795,6 +796,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 COLL=
ATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_utf8sp.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1723,6 +1725,7 @@ utf8mb3_general_ci	utf8mb3_general_ci	koi8r_genera=
l_ci	utf8mb3_general_ci	utf8mb
+ DELETE FROM mysqltest2.log|
+=20
+ ---> Dump of mysqltest1
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1805,6 +1808,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 CO=
LLATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_utf8triggers.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -2491,6 +2495,7 @@ COLLATION(    '=D1=82=D0=B5=D0=BA=D1=81=D1=82') AS=
 c4,
+ END	ONE TIME	1970-01-02 00:00:00	NULL	NULL		NULL	NULL	DISABLED	PRESERVE=
	CREATED	LAST_ALTERED	NULL		1	utf8mb3	utf8mb3_general_ci	utf8mb3_unicode_=
ci
+=20
+ ---> Dump of mysqltest1
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -2558,6 +2563,7 @@ DELIMITER ;
+ ---> Dumping mysqltest1 to ddl_i18n_utf8events.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+diff --git a/mysql-test/main/lock_view.result b/mysql-test/main/lock_vie=
w.result
+index 47a7e58e..04462ce7 100644
+--- a/mysql-test/main/lock_view.result
++++ b/mysql-test/main/lock_view.result
+@@ -16,6 +16,7 @@ create definer=3Ddefiner@localhost view mysqltest3.v3i=
s as select schema_name from
+ create definer=3Ddefiner@localhost view mysqltest3.v3ps as select user =
from performance_schema.users where current_connections>0 order by user;
+ create definer=3Ddefiner@localhost view mysqltest3.v3nt as select 1;
+ create definer=3Ddefiner@localhost sql security invoker view mysqltest3=
.v3i as select * from mysqltest1.t1;
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
+=20
+@@ -235,6 +236,7 @@ create view v1 as select * from (select * from t1) d=
t;
+ lock table v1 read;
+ disconnect con1;
+ connection default;
++/*!999999\- enable the sandbox mode */
+ SET @saved_cs_client     =3D @@character_set_client;
+ SET character_set_client =3D utf8;
+ /*!50001 CREATE VIEW `v1` AS SELECT
+diff --git a/mysql-test/main/mysql.result b/mysql-test/main/mysql.result
+index 0b91b513..c2e42fda 100644
+--- a/mysql-test/main/mysql.result
++++ b/mysql-test/main/mysql.result
+@@ -552,6 +552,7 @@ Table	Create Table
+ a1\`b1	CREATE TABLE `a1\``b1` (
+   `a` int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `a1\``b1` (
+@@ -583,6 +584,7 @@ Table	Create Table
+ a1\"b1	CREATE TABLE "a1\""b1" (
+   "a" int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE "a1\""b1" (
+diff --git a/mysql-test/main/mysqldump-compat-102.result b/mysql-test/ma=
in/mysqldump-compat-102.result
+index 86a2ebc4..35a06d20 100644
+--- a/mysql-test/main/mysqldump-compat-102.result
++++ b/mysql-test/main/mysqldump-compat-102.result
+@@ -58,6 +58,7 @@ BEGIN
+ log(0, 'Session ' || connection_id() || ' ' || current_user || ' starte=
d');
+ END;
+ $$
++/*!999999\- enable the sandbox mode */
+ -- MariaDB dump DUMPVERSION  Distrib DISTVERSION, for OS
+ --
+ -- Host: localhost    Database: db1_mdev17429
+diff --git a/mysql-test/main/mysqldump-max.result b/mysql-test/main/mysq=
ldump-max.result
+index 7dd1030e..86e8eb07 100644
+--- a/mysql-test/main/mysqldump-max.result
++++ b/mysql-test/main/mysqldump-max.result
+@@ -77,6 +77,7 @@ id	name
+ 3	first value
+ 4	first value
+ 5	first value
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -204,6 +205,7 @@ INSERT  IGNORE INTO `t6` VALUES
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump-nl.result b/mysql-test/main/mysql=
dump-nl.result
+index 66902492..1cbc23f9 100644
+--- a/mysql-test/main/mysqldump-nl.result
++++ b/mysql-test/main/mysqldump-nl.result
+@@ -12,6 +12,7 @@ create procedure sp() select * from `v1
+ 1v`;
+ flush tables;
+ use test;
++/*!999999\- enable the sandbox mode */
+=20
+ --
+ -- Current Database: `mysqltest1
+@@ -134,6 +135,7 @@ test\`
+ \! ls
+ #
+ test`
++/*!999999\- enable the sandbox mode */
+=20
+ --
+ -- Current Database: `test```
+diff --git a/mysql-test/main/mysqldump-no-binlog.result b/mysql-test/mai=
n/mysqldump-no-binlog.result
+index 223034d8..b9dfb223 100644
+--- a/mysql-test/main/mysqldump-no-binlog.result
++++ b/mysql-test/main/mysqldump-no-binlog.result
+@@ -1 +1,2 @@
+ mariadb-dump: Error: Binlogging on server not active
++/*!999999\- enable the sandbox mode */
+diff --git a/mysql-test/main/mysqldump-system.result b/mysql-test/main/m=
ysqldump-system.result
+index bf2d60c6..0b6fe995 100644
+--- a/mysql-test/main/mysqldump-system.result
++++ b/mysql-test/main/mysqldump-system.result
+@@ -39,6 +39,7 @@ CREATE FUNCTION metaphon RETURNS STRING SONAME "UDF_EX=
AMPLE_LIB";
+ #
+ # mysqldump of system tables with --system=3Dall
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -630,6 +631,7 @@ UNLOCK TABLES;
+ #
+ # mysqldump of system tables with --system=3Dall --replace
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1244,6 +1246,7 @@ UNLOCK TABLES;
+ #
+ # mysqldump of system tables with --system=3Dall --insert-ignore
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump-timing.result b/mysql-test/main/m=
ysqldump-timing.result
+index 7fa11893..8ae621e5 100644
+--- a/mysql-test/main/mysqldump-timing.result
++++ b/mysql-test/main/mysqldump-timing.result
+@@ -7,6 +7,7 @@ CREATE TABLE t1 (i INT);
+ INSERT INTO t1 VALUES (0);
+ LOCK TABLE t1 WRITE;
+ timeout without t1 contents expected
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -30,6 +31,7 @@ SET @save_max_statement_time=3D@@max_statement_time;
+ SET GLOBAL max_statement_time=3D0.1;
+ UNLOCK TABLES;;
+ This would be a race condition otherwise, but default max_statement_tim=
e=3D0 makes it succeed
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump-utf8mb4.result b/mysql-test/main/=
mysqldump-utf8mb4.result
+index 90477130..e38c8a47 100644
+--- a/mysql-test/main/mysqldump-utf8mb4.result
++++ b/mysql-test/main/mysqldump-utf8mb4.result
+@@ -32,6 +32,7 @@ Testing XML format output
+ ----
+ Testing text format output
+ ----
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump.result b/mysql-test/main/mysqldum=
p.result
+index 0a84b89b..2f888ddd 100644
+--- a/mysql-test/main/mysqldump.result
++++ b/mysql-test/main/mysqldump.result
+@@ -31,6 +31,7 @@ DROP TABLE t1;
+ CREATE TABLE t1 (a decimal(64, 20));
+ INSERT INTO t1 VALUES ("1234567890123456789012345678901234567890"),
+ ("0987654321098765432109876543210987654321");
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -48,6 +49,7 @@ CREATE TABLE t1 (a double);
+ INSERT IGNORE INTO t1 VALUES ('-9e999999');
+ Warnings:
+ Warning	1264	Out of range value for column 'a' at row 1
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -70,6 +72,7 @@ INSERT INTO t1 VALUES ('1.2345', 2.3456);
+ INSERT INTO t1 VALUES ("1.2345", 2.3456);
+ ERROR 42S22: Unknown column '1.2345' in 'field list'
+ SET SQL_MODE=3D@OLD_SQL_MODE;
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -83,6 +86,7 @@ INSERT INTO `t1` VALUES
+ (1.23450,2.3456),
+ (1.23450,2.3456),
+ (1.23450,2.3456);
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -96,6 +100,7 @@ INSERT INTO `t1` VALUES
+ (1.23450,2.3456),
+ (1.23450,2.3456),
+ (1.23450,2.3456);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -136,6 +141,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -217,6 +223,7 @@ DROP TABLE t1;
+ #
+ CREATE TABLE t1 (a  VARCHAR(255)) DEFAULT CHARSET koi8r;
+ INSERT INTO t1  VALUES (_koi8r x'C1C2C3C4C5'), (NULL);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -258,6 +265,7 @@ DROP TABLE t1;
+ #
+ CREATE TABLE t1 (a int) ENGINE=3DMYISAM;
+ INSERT INTO t1 VALUES (1), (2);
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -283,6 +291,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -313,6 +322,7 @@ DROP TABLE t1;
+ # Bug#2592 mysqldump doesn't quote "tricky" names correctly
+ #
+ create table ```a` (i int);
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE ```a` (
+@@ -324,6 +334,7 @@ drop table ```a`;
+ # Bug#2591 mysqldump quotes names inconsistently
+ #
+ create table t1(a int);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -357,6 +368,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -383,6 +395,7 @@ UNLOCK TABLES;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+ set global sql_mode=3D'ANSI_QUOTES';
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -416,6 +429,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -448,6 +462,7 @@ drop table t1;
+ #
+ create table t1(a int);
+ insert into t1 values (1),(2),(3);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -480,6 +495,7 @@ drop table t1;
+ #
+ # Bug#6101 create database problem
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -506,6 +522,7 @@ USE `test`;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+ create database mysqldump_test_db character set latin2 collate latin2_b=
in;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -540,6 +557,7 @@ drop database mysqldump_test_db;
+ # if it is explicitly set.
+ CREATE TABLE t1 (a  CHAR(10));
+ INSERT INTO t1  VALUES (_latin1 '=C4=D6=DC=DF');
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -582,6 +600,7 @@ UNLOCK TABLES;
+ # If the future we can move this command into a separate test with
+ # checking that "mysqldump" is compiled with "latin1"
+ #
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -606,6 +625,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -630,6 +650,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -662,6 +683,7 @@ CREATE TABLE t1 (a int);
+ CREATE TABLE t2 (a int);
+ INSERT INTO t1 VALUES (1),(2),(3);
+ INSERT INTO t2 VALUES (4),(5),(6);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -706,6 +728,7 @@ DROP TABLE t2;
+ #
+ CREATE TABLE t1 (`b` blob);
+ INSERT INTO `t1` VALUES (0x602010000280100005E71A);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -747,6 +770,7 @@ DROP TABLE t1;
+ CREATE TABLE t1 (a INT) ENGINE=3DMyISAM;
+ INSERT INTO t1 VALUES (1),(2),(3);
+ INSERT INTO t1 VALUES (4),(5),(6);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -787,6 +811,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1162,6 +1187,7 @@ F_cd00692c3bfe59267d5ecfac5310286c int,
+ F_6faa8040da20ef399b63a72d0e4ab575 int,
+ F_fe73f687e5bc5280214e0486b273a5f9 int);
+ insert into t1 (F_8d3bba7425e7c98c50f52ca1b52d3735) values (1);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1531,6 +1557,7 @@ drop table t1;
+ #
+ CREATE TABLE t1 (a int);
+ INSERT INTO t1 VALUES (1),(2),(3);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1584,6 +1611,7 @@ CREATE TABLE t1 ( a INT );
+ CREATE TABLE t2 ( a INT );
+ INSERT INTO t1 VALUES (1), (2);
+ INSERT INTO t2 VALUES (1), (2);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1619,6 +1647,7 @@ CREATE TABLE `t2` (
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1691,21 +1720,35 @@ create table t3(a varchar(30) primary key, b int=
 not null);
+ test_sequence
+ ------ Testing with illegal table names ------
+ mariadb-dump: Couldn't find table: "\d-2-1.sql"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "\t1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "\t1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "\\t1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "t\1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "t\1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "t/1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T_1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T%1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T'1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T_1"
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T_"
++/*!999999\- enable the sandbox mode */
+ test_sequence
+ ------ Testing with illegal database names ------
+ mariadb-dump: Got error: 1049: "Unknown database 'mysqldump_test_d'" wh=
en selecting the database
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Got error: 1049: "Unknown database 'mysqld\ump_test_db'" =
when selecting the database
++/*!999999\- enable the sandbox mode */
+ drop table t1, t2, t3;
+ drop database mysqldump_test_db;
+ use test;
+@@ -1767,6 +1810,7 @@ insert into t2 (a, b) values (NULL, NULL),(10, NUL=
L),(NULL, "twenty"),(30, "thir
+ 	</table_data>
+ </database>
+ </mysqldump>
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1805,6 +1849,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1930,6 +1975,7 @@ create table t1(a int);
+ create table t2(a int);
+ create table t3(a int);
+ mariadb-dump: Couldn't find table: "non_existing"
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1979,6 +2025,7 @@ drop table t1, t2, t3;
+ create table t1 (a int);
+ mariadb-dump: Couldn't execute 'SELECT /*!40001 SQL_NO_CACHE */ `a` FRO=
M `t1` WHERE xx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx': You have=
 an error in your SQL syntax; check the manual that corresponds to your M=
ariaDB server version for the right syntax to use near 'xxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxx' at line 1 (1064)
+ mariadb-dump: Got error: 1064: "You have an error in your SQL syntax; c=
heck the manual that corresponds to your MariaDB server version for the r=
ight syntax to use near 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' =
at line 1" when retrieving data from server
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2020,6 +2067,7 @@ CREATE TABLE `t1` (
+ PRIMARY KEY (`a b`, `c"d`, `e``f`)
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1;
+ insert into t1 values (0815, 4711, 2006);
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -2050,6 +2098,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2105,6 +2154,7 @@ INSERT INTO t2 VALUES ('bingo');
+ INSERT INTO t2 VALUES ('waffle');
+ INSERT INTO t2 VALUES ('lemon');
+ create view v2 as select * from t2 where a like 'a%' with check option;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2204,6 +2254,7 @@ drop database db1;
+ use test;
+ create table t1(a int);
+ create view v1 as select * from t1;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2274,6 +2325,7 @@ INSERT INTO t2 VALUES ('bingo');
+ INSERT INTO t2 VALUES ('waffle');
+ INSERT INTO t2 VALUES ('lemon');
+ create view v2 as select * from t2 where a like 'a%' with check option;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2344,6 +2396,7 @@ use test;
+ #
+ CREATE TABLE t1 (a char(10));
+ INSERT INTO t1 VALUES ('\'');
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2391,6 +2444,7 @@ create  view v1 as
+ select * from v3 where b in (1, 2, 3, 4, 5, 6, 7);
+ create  view v2 as
+ select v3.a from v3, v1 where v1.a=3Dv3.a and v3.b=3D3 limit 1;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2543,6 +2597,7 @@ end if;
+ end	AFTER	0000-00-00 00:00:00	STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_=
ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_=
CREATE_USER,NO_ENGINE_SUBSTITUTION	root@localhost	latin1	latin1_swedish_c=
i	latin1_swedish_ci
+ INSERT INTO t1 (a) VALUES (1),(2),(3),(22);
+ update t1 set a =3D 4 where a=3D3;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2676,6 +2731,7 @@ DELIMITER ;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2827,6 +2883,7 @@ Warning	1287	'<select expression> INTO <destinatio=
n>;' is deprecated and will be
+ set sql_mode=3D'ansi';
+ create procedure `a'b` () select 1;
+ set sql_mode=3D'';
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2983,6 +3040,7 @@ d
+ 2003-10-26 02:00:00
+ 2003-10-26 02:00:00
+ set global time_zone=3D'Europe/Moscow';
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3024,6 +3082,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3086,6 +3145,7 @@ a2
+ 1
+ 2
+ 3
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -3166,6 +3226,7 @@ a	b	c
+ 1	first value	xxxx
+ 2	second value	tttt
+ 3	third value	vvv vvv
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3294,6 +3355,7 @@ BEGIN
+ SET new.a =3D 0;
+ END|
+ SET SQL_MODE =3D @old_sql_mode;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3357,6 +3419,7 @@ DROP TABLE t1;
+ #
+ create table t1 (a binary(1), b blob);
+ insert into t1 values ('','');
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3392,6 +3455,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3492,6 +3556,7 @@ insert into t values(5, 51);
+ create view v1 as select qty, price, qty*price as value from t;
+ create view v2 as select qty from v1;
+ mysqldump {
++/*!999999\- enable the sandbox mode */
+ /*!50001 DROP VIEW IF EXISTS `v1`*/;
+ /*!50001 SET @saved_cs_client          =3D @@character_set_client */;
+ /*!50001 SET @saved_cs_results         =3D @@character_set_results */;
+@@ -3507,6 +3572,7 @@ mysqldump {
+ /*!50001 SET collation_connection      =3D @saved_col_connection */;
+=20
+ } mysqldump {
++/*!999999\- enable the sandbox mode */
+ /*!50001 DROP VIEW IF EXISTS `v2`*/;
+ /*!50001 SET @saved_cs_client          =3D @@character_set_client */;
+ /*!50001 SET @saved_cs_results         =3D @@character_set_results */;
+@@ -3552,6 +3618,7 @@ drop table t1;
+ mysqldump {
+ mariadb-dump: Got error: 1356: "View 'test.v1' references invalid table=
(s) or column(s) or function(s) or definer/invoker of view lack rights to=
 use them" when using LOCK TABLES
+ mariadb-dump: Couldn't execute 'SHOW FIELDS FROM `v1`': View 'test.v1' =
references invalid table(s) or column(s) or function(s) or definer/invoke=
r of view lack rights to use them (1356)
++/*!999999\- enable the sandbox mode */
+=20
+ -- failed on view `v1`: CREATE ALGORITHM=3DUNDEFINED DEFINER=3D`root`@`=
localhost` SQL SECURITY DEFINER VIEW `v1` AS select `test`.`t1`.`id` AS `=
id` from `t1`
+=20
+@@ -3568,6 +3635,7 @@ insert into t1 values (1232131);
+ insert into t1 values (4711);
+ insert into t1 values (3231);
+ insert into t1 values (0815);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3646,6 +3714,7 @@ create table basetable ( id serial, tag varchar(64=
) );
+ create database mysqldump_views;
+ use mysqldump_views;
+ create view nasishnasifu as select mysqldump_tables.basetable.id from m=
ysqldump_tables.basetable;
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqldump_tables` /*!40100 DE=
FAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
+=20
+@@ -3730,10 +3799,14 @@ create user mysqltest_1@localhost;
+ create table t1(a int, b varchar(34));
+ reset master;
+ mariadb-dump: Couldn't execute 'FLUSH /*!40101 LOCAL */ TABLES': Access=
 denied; you need (at least one of) the RELOAD privilege(s) for this oper=
ation (1227)
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't execute 'FLUSH /*!40101 LOCAL */ TABLES': Access=
 denied; you need (at least one of) the RELOAD privilege(s) for this oper=
ation (1227)
++/*!999999\- enable the sandbox mode */
+ grant RELOAD on *.* to mysqltest_1@localhost;
+ mariadb-dump: Couldn't execute 'SHOW MASTER STATUS': Access denied; you=
 need (at least one of) the SUPER, BINLOG MONITOR privilege(s) for this o=
peration (1227)
++/*!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't execute 'SHOW MASTER STATUS': Access denied; you=
 need (at least one of) the SUPER, BINLOG MONITOR privilege(s) for this o=
peration (1227)
++/*!999999\- enable the sandbox mode */
+ grant REPLICATION CLIENT on *.* to mysqltest_1@localhost;
+ drop table t1;
+ drop user mysqltest_1@localhost;
+@@ -3792,6 +3865,7 @@ use test;
+ #
+ # Bug #33762: mysqldump can not dump INFORMATION_SCHEMA
+ #
++/*!999999\- enable the sandbox mode */
+ DROP TABLE IF EXISTS `TABLES`;
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+@@ -3856,6 +3930,7 @@ DROP TABLE t1;
+ CREATE TABLE t2 (a INT) ENGINE=3DMyISAM;
+ CREATE TABLE t3 (a INT) ENGINE=3DMyISAM;
+ CREATE TABLE t1 (a INT) ENGINE=3Dmerge UNION=3D(t2, t3);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3946,10 +4021,12 @@ connect  user27293,localhost,user1,,mysqldump_te=
st_db,$MASTER_MYPORT,$MASTER_MYS
+ connection user27293;
+ create procedure mysqldump_test_db.sp1() select 'hello';
+ mariadb-dump: user2 has insufficient privileges to SHOW CREATE PROCEDUR=
E `sp1`!
++/*!999999\- enable the sandbox mode */
+=20
+ -- insufficient privileges to SHOW CREATE PROCEDURE `sp1`
+ -- does user2 have permissions on mysql.proc?
+=20
++/*!999999\- enable the sandbox mode */
+ /*!50003 SET @saved_sql_mode       =3D @@sql_mode */ ;
+ /*!50003 SET sql_mode              =3D 'STRICT_TRANS_TABLES,ERROR_FOR_D=
IVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
+ /*!50003 SET @saved_cs_client      =3D @@character_set_client */ ;
+@@ -3977,6 +4054,7 @@ drop database mysqldump_test_db;
+ #
+ CREATE TABLE t1 (c1 INT, c2 LONGBLOB);
+ INSERT INTO t1 SET c1=3D11, c2=3DREPEAT('q',509);
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -4050,6 +4128,7 @@ use db42635;
+ create table t1 (id int);
+ create view db42635.v1 (c) as select * from db42635.t1;
+ create view db42635.v2 (c) as select * from db42635.t1;
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4110,6 +4189,7 @@ drop database db42635;
+ #
+ SET NAMES utf8;
+ CREATE TABLE `stra=C3=9Fe` ( f1 INT );
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4132,6 +4212,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */=20
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4156,6 +4237,7 @@ UNLOCK TABLES;
+=20
+ DROP TABLE `stra=C3=9Fe`;
+ CREATE TABLE `=D7=9B=D7=93=D7=A9=D7=92=D7=9B=D7=97=D7=9A=D7=9C=D7=93=D7=
=92=D7=9B=D7=97=D7=A9=D7=9A=D7=93=D7=92=D7=97=D7=9B=D7=9A=D7=9C=D7=93=D7=92=
=D7=9B` ( f1 INT );
++/*!999999\- enable the sandbox mode */=20
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4179,6 +4261,7 @@ UNLOCK TABLES;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+ mariadb-dump: Got error: 1146: "Table 'test.???????????????????????' do=
esn't exist" when using LOCK TABLES
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4195,6 +4278,7 @@ CREATE TABLE t1(a int, b int);
+ INSERT INTO t1 VALUES (1,1);
+ INSERT INTO t1 VALUES (2,3);
+ INSERT INTO t1 VALUES (3,4), (4,5);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4469,6 +4553,7 @@ insert into t1 values (1232131);
+ insert into t1 values (4711);
+ insert into t1 values (3231);
+ insert into t1 values (0815);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4601,6 +4686,7 @@ CREATE DATABASE test;
+ create database `test-database`;
+ use `test-database`;
+ create table test (a int);
++/*!999999\- enable the sandbox mode */
+ DROP TABLE IF EXISTS `test`;
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+@@ -4823,6 +4909,7 @@ CREATE TRIGGER `trig` BEFORE INSERT ON `test` FOR =
EACH ROW BEGIN
+ END |
+ ALTER DATABASE `test-database` CHARACTER SET latin1 COLLATE latin1_swed=
ish_ci;
+ ALTER DATABASE `test-database` CHARACTER SET utf8 COLLATE utf8_unicode_=
ci ;
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `test` (
+@@ -5306,6 +5393,7 @@ USE test;
+ # Also verify that a prefix of the mode's name is enough.
+ #
+ CREATE TABLE t1 (a INT);
++/*!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -5538,6 +5626,7 @@ CREATE DATABASE `a\"'``b`;
+ USE `a\"'``b`;
+ CREATE PROCEDURE p1() BEGIN END;
+ ALTER DATABASE `a\"'``b` COLLATE utf8_general_ci;
++/*!999999\- enable the sandbox mode */
+ /*!50003 SET @saved_sql_mode       =3D @@sql_mode */ ;
+ /*!50003 SET sql_mode              =3D '' */ ;
+ ALTER DATABASE `a\"'``b` CHARACTER SET latin1 COLLATE latin1_swedish_ci=
 ;
+@@ -5586,6 +5675,7 @@ CREATE VIEW nonunique_table_view_name AS SELECT 1;
+=20
+ ##################################################
+ # --compact --databases db1 db2
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db1` /*!40100 DEFAULT CHARACT=
ER SET utf8mb3 COLLATE utf8mb3_general_ci */;
+=20
+@@ -5654,6 +5744,7 @@ USE `db2`;
+ ##################################################
+ # --compact db2
+=20
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `nonunique_table_name` (
+@@ -5676,6 +5767,7 @@ INSERT INTO `nonunique_table_view_name` VALUES
+=20
+ ##################################################
+ # --compact --delayed-insert --no-data-med=3D0 --databases db2 db1
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db2` /*!40100 DEFAULT CHARACT=
ER SET utf8mb3 COLLATE utf8mb3_general_ci */;
+=20
+@@ -5807,6 +5899,7 @@ CREATE TABLE t1 (a int, b int);
+ CREATE TRIGGER tt1_t1 BEFORE INSERT ON t1 FOR EACH ROW=20
+ SET NEW.b=3DNEW.a + 10;
+ INSERT INTO t1 (a) VALUES (1),(2),(3);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -5855,6 +5948,7 @@ DROP TABLE t1;
+ #
+ # Without --replace and --insert-ignore
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -5950,6 +6044,7 @@ CREATE TABLE IF NOT EXISTS `transaction_registry` =
(
+ #
+ # With --replace
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -6055,6 +6150,7 @@ CREATE TABLE IF NOT EXISTS `transaction_registry` =
(
+ #
+ # With --insert-ignore
+ #
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -6179,6 +6275,7 @@ insert into t3 values(2);
+ insert into t3(`invisible`,  `a  b c & $!@#$%^&*( )`, `ds=3D~!@ \# $% ^=
 & * ( ) _ - =3D +` ) values(1,2,3);
+ CREATE TABLE t4(=C3=8B=C3=8F=C3=8C=C3=8F=C3=8E=C3=8B=C3=811 INT);
+ insert into t4 values(1);
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -6219,6 +6316,7 @@ CREATE TABLE `t4` (
+ INSERT INTO `t4` VALUES
+ (1);
+ #Check side effect on --complete insert
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -6464,7 +6562,7 @@ j integer
+ INSERT INTO t VALUES (1,1),(2,2),(3,3),(4,4);
+ # Dump database 1
+ # Restore from database 1 to database 2
+-ERROR 1100 (HY000) at line 45: Table 'seq_t_i' was not locked with LOCK=
 TABLES
++ERROR 1100 (HY000) at line 46: Table 'seq_t_i' was not locked with LOCK=
 TABLES
+ SETVAL(`seq_t_i`, 1, 0)
+ 1
+ DROP DATABASE IF EXISTS test1;
+@@ -6585,3 +6683,17 @@ SET GLOBAL LOG_OUTPUT=3DDEFAULT, GLOBAL GENERAL_L=
OG=3D@save_general_log;
+ TRUNCATE TABLE mysql.general_log;
+ DROP DATABASE test1;
+ # End of 10.3 tests
++# MDEV-33727 mariadb-dump trusts the server and does not validate the d=
ata
++#
++create table t1 (a int);
++/*!999999\- enable the sandbox mode */=20
++DROP TABLE IF EXISTS `t1`;
++/*!40101 SET @saved_cs_client     =3D @@character_set_client */;
++/*!40101 SET character_set_client =3D utf8 */;
++CREATE TABLE `t1` (
++`a` int(11) DEFAULT NULL
++) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci;
++/*!40101 SET character_set_client =3D @saved_cs_client */;
++ERROR at line 9: Not allowed in the sandbox mode
++drop table t1;
++# End of 10.5 tests
+diff --git a/mysql-test/main/mysqldump.test b/mysql-test/main/mysqldump.=
test
+index 7dc3cfe8..9248f2ac 100644
+--- a/mysql-test/main/mysqldump.test
++++ b/mysql-test/main/mysqldump.test
+@@ -2983,3 +2983,24 @@ DROP DATABASE test1;
+ --remove_file $MYSQLTEST_VARDIR/tmp/dumptest1.sql
+=20
+ --echo # End of 10.3 tests
++
++--echo #
++--echo # MDEV-33727 mariadb-dump trusts the server and does not validat=
e the data
++--echo #
++
++create table t1 (a int);
++--exec $MYSQL_DUMP --compact --add-drop-table test > $MYSQLTEST_VARDIR/=
tmp/mdev33727.sql
++
++# first let's verify it can be loaded not only by mariadb client
++--source $MYSQLTEST_VARDIR/tmp/mdev33727.sql
++
++# and now test the mariadb client sandbox protection
++--append_file $MYSQLTEST_VARDIR/tmp/mdev33727.sql
++\! echo foo
++EOF
++--error 1
++--exec $MYSQL test < $MYSQLTEST_VARDIR/tmp/mdev33727.sql 2>&1
++--remove_file $MYSQLTEST_VARDIR/tmp/mdev33727.sql
++drop table t1;
++
++--echo # End of 10.5 tests
+diff --git a/mysql-test/main/openssl_1.result b/mysql-test/main/openssl_=
1.result
+index a5ac8956..18294d16 100644
+--- a/mysql-test/main/openssl_1.result
++++ b/mysql-test/main/openssl_1.result
+@@ -77,6 +77,7 @@ DROP TABLE thread_status;
+ SET GLOBAL event_scheduler=3D0;
+ CREATE TABLE t1(a int);
+ INSERT INTO t1 VALUES (1), (2);
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -113,6 +114,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -149,6 +151,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -202,4 +205,4 @@ End of 5.1 tests
+ /*!40019 SET @@session.max_insert_delayed_threads=3D0*/;
+ /*!50003 SET @OLD_COMPLETION_TYPE=3D@@COMPLETION_TYPE,COMPLETION_TYPE=3D=
0*/;
+ DELIMITER /*!*/;
+-ERROR: Failed on connect: TLS/SSL error
+\ No newline at end of file
++ERROR: Failed on connect: TLS/SSL error
+diff --git a/mysql-test/main/plugin_auth.result b/mysql-test/main/plugin=
_auth.result
+index ac10bd06..f8128355 100644
+--- a/mysql-test/main/plugin_auth.result
++++ b/mysql-test/main/plugin_auth.result
+@@ -338,6 +338,7 @@ FLUSH PRIVILEGES;
+ # Executing 'mysqladmin'
+ mysqld is alive
+ # Executing 'mysqldump'
++/*!999999\- enable the sandbox mode */=20
+ # Executing 'mysql_upgrade'
+ #
+ # Bug #59657: Move the client authentication_pam plugin into the=20
+diff --git a/mysql-test/main/rpl_mysqldump_slave.result b/mysql-test/mai=
n/rpl_mysqldump_slave.result
+index 903b6711..6c28862b 100644
+--- a/mysql-test/main/rpl_mysqldump_slave.result
++++ b/mysql-test/main/rpl_mysqldump_slave.result
+@@ -7,12 +7,15 @@ connection slave;
+ connection master;
+ use test;
+ connection slave;
++/*!999999\- enable the sandbox mode */
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_P=
OS=3DBINLOG_START;
++/*!999999\- enable the sandbox mode */
+ STOP ALL SLAVES;
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_P=
OS=3DBINLOG_START;
+ START ALL SLAVES;
++/*!999999\- enable the sandbox mode */
+ STOP ALL SLAVES;
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_HOST=3D'127.0.0.1', MASTER_PORT=3DMASTER_MYP=
ORT, MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_POS=3DBINLOG_START=
;
+@@ -20,6 +23,7 @@ START ALL SLAVES;
+ start slave;
+ Warnings:
+ Note	1254	Slave is already running
++/*!999999\- enable the sandbox mode */
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_P=
OS=3DBINLOG_START;
+ start slave;
+@@ -37,12 +41,14 @@ DROP TABLE t2;
+=20
+ 1. --dump-slave=3D1
+=20
++/*!999999\- enable the sandbox mode */
+ SET GLOBAL gtid_slave_pos=3D'0-1-1001';
+ CHANGE MASTER '' TO MASTER_USE_GTID=3Dslave_pos;
+ -- CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LO=
G_POS=3DBINLOG_START;
+=20
+ 2. --dump-slave=3D2
+=20
++/*!999999\- enable the sandbox mode */
+ -- SET GLOBAL gtid_slave_pos=3D'0-1-1001';
+ -- CHANGE MASTER '' TO MASTER_USE_GTID=3Dslave_pos;
+ -- CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LO=
G_POS=3DBINLOG_START;
+@@ -50,18 +56,21 @@ CHANGE MASTER '' TO MASTER_USE_GTID=3Dslave_pos;
+=20
+ 1. --master-data=3D1
+=20
++/*!999999\- enable the sandbox mode */
+ -- CHANGE MASTER TO MASTER_LOG_FILE=3D'slave-bin.000001', MASTER_LOG_PO=
S=3DBINLOG_START;
+ CHANGE MASTER TO MASTER_USE_GTID=3Dslave_pos;
+ SET GLOBAL gtid_slave_pos=3D'0-2-1003';
+=20
+ 2. --master-data=3D2
+=20
++/*!999999\- enable the sandbox mode */
+ -- CHANGE MASTER TO MASTER_LOG_FILE=3D'slave-bin.000001', MASTER_LOG_PO=
S=3DBINLOG_START;
+ -- CHANGE MASTER TO MASTER_USE_GTID=3Dslave_pos;
+ -- SET GLOBAL gtid_slave_pos=3D'0-2-1003';
+=20
+ 3. --master-data --single-transaction
+=20
++/*!999999\- enable the sandbox mode */
+ -- CHANGE MASTER TO MASTER_LOG_FILE=3D'slave-bin.000001', MASTER_LOG_PO=
S=3DBINLOG_START;
+ CHANGE MASTER TO MASTER_USE_GTID=3Dslave_pos;
+ SET GLOBAL gtid_slave_pos=3D'0-2-1003';
+diff --git a/mysql-test/main/trigger_wl3253.result b/mysql-test/main/tri=
gger_wl3253.result
+index ed08b336..6d77ed5e 100644
+--- a/mysql-test/main/trigger_wl3253.result
++++ b/mysql-test/main/trigger_wl3253.result
+@@ -310,6 +310,7 @@ CREATE TABLE t1 (a INT);
+ CREATE TRIGGER tr1_bi BEFORE INSERT ON t1 FOR EACH ROW SET @a:=3D1;
+ CREATE TRIGGER tr2_bi BEFORE INSERT ON t1 FOR EACH ROW SET @a:=3D2;
+ CREATE TRIGGER tr1_bu BEFORE UPDATE ON t1 FOR EACH ROW SET @a:=3D3;
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -372,6 +373,7 @@ CREATE TRIGGER tr2_bi BEFORE INSERT ON t1 FOR EACH R=
OW SET @a:=3D2;
+ CREATE TRIGGER tr0_bi BEFORE INSERT ON t1 FOR EACH ROW PRECEDES tr1_bi =
SET @a:=3D0;
+ CREATE TRIGGER tr1_1_bi BEFORE INSERT ON t1 FOR EACH ROW FOLLOWS tr1_bi=
 SET @a:=3D0;
+ # Expected order of triggers in the dump is: tr0_bi, tr1_bi, tr1_1_bi, =
tr2_i.
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+diff --git a/mysql-test/suite/archive/archive_bitfield.result b/mysql-te=
st/suite/archive/archive_bitfield.result
+index 8c30a5f8..5cda525e 100644
+--- a/mysql-test/suite/archive/archive_bitfield.result
++++ b/mysql-test/suite/archive/archive_bitfield.result
+@@ -180,6 +180,7 @@ INSERT INTO `t1` VALUES
+ (NULL,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,b'100000',b'010010',b'0=
11111',4,5,5,5,5,5,5,5,5,5,3,2,1),
+ (NULL,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,b'000000',b'001100',b'1=
11111',4,5,5,5,5,5,5,5,5,5,3,2,1),
+ (NULL,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,b'111111',b'000000',b'0=
00000',4,5,5,5,5,5,5,5,5,5,3,2,1);
++/*!999999\- enable the sandbox mode */
+ INSERT INTO `t1` VALUES (1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x=
01,0x3F,0x3E,4,5,5,5,5,5,5,5,5,5,3,2,1);
+ INSERT INTO `t1` VALUES (2,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x=
02,0x00,0x3D,4,5,5,5,5,5,5,5,5,5,3,2,1);
+ INSERT INTO `t1` VALUES (3,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x=
04,0x0F,0x3B,4,5,5,5,5,5,5,5,5,5,3,2,1);
+diff --git a/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.resul=
t b/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.result
+index 24211c63..8084bd44 100644
+--- a/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.result
++++ b/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.result
+@@ -34,6 +34,7 @@ PROCEDURE p1;
+ FUNCTION f1 RETURN INT;
+ END;
+ $$
++/*!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/suite/federated/federatedx.result b/mysql-test/s=
uite/federated/federatedx.result
+index 49deff81..333b3ca8 100644
+--- a/mysql-test/suite/federated/federatedx.result
++++ b/mysql-test/suite/federated/federatedx.result
+@@ -2243,6 +2243,7 @@ connection master;
+ CREATE TABLE t1(id VARCHAR(20) NOT NULL, PRIMARY KEY(id)) ENGINE=3DFEDE=
RATED=20
+ CONNECTION=3D'mysql://root@127.0.0.1:SLAVE_PORT/test/t1';
+ # Dump table t1 using mysqldump tool
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+diff --git a/mysql-test/suite/roles/definer.result b/mysql-test/suite/ro=
les/definer.result
+index 8b5e36d8..a321ad9a 100644
+--- a/mysql-test/suite/roles/definer.result
++++ b/mysql-test/suite/roles/definer.result
+@@ -274,6 +274,7 @@ a	b	c
+ 111	4	0
+ 2	20	200
+ delete from t1 where a=3D111;
++/*!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARAC=
TER SET latin1 COLLATE latin1_swedish_ci */;
+=20
+diff --git a/mysql-test/suite/sql_sequence/mysqldump.result b/mysql-test=
/suite/sql_sequence/mysqldump.result
+index 0199bb71..c2f8dea9 100644
+--- a/mysql-test/suite/sql_sequence/mysqldump.result
++++ b/mysql-test/suite/sql_sequence/mysqldump.result
+@@ -3,6 +3,7 @@ CREATE TABLE t1(a INT, KEY (a)) KEY_BLOCK_SIZE=3D1024;
+ insert into t1 values (1),(2);
+ CREATE SEQUENCE x1 engine=3Dinnodb;
+ # dump whole database
++/*!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+@@ -18,6 +19,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables order 1
++/*!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+@@ -33,6 +35,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables order 2
++/*!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+@@ -48,6 +51,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables only tables
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -59,6 +63,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables only sequences
++/*!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+diff --git a/storage/connect/mysql-test/connect/r/mysql.result b/storage=
/connect/mysql-test/connect/r/mysql.result
+index d3c244b2..e91d17f7 100644
+--- a/storage/connect/mysql-test/connect/r/mysql.result
++++ b/storage/connect/mysql-test/connect/r/mysql.result
+@@ -229,6 +229,7 @@ a
+ 20
+ 30
+ # Start of mysqldump ------
++/*!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t2` (
+--=20
+2.40.0
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0002.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0002.patch
new file mode 100644
index 0000000000..58815b9db9
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0002.patch
@@ -0,0 +1,38 @@
+From 1c425a8d854061d1987ad4ea352c7270652e31c4 Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Wed, 8 May 2024 10:31:28 +0200
+Subject: [PATCH] MDEV-33727 update test results
+
+followup for 13663cb5c455
+
+CVE: CVE-2024-21096
+Upstream-status: Backport [https://github.com/MariaDB/server/commit/1c42=
5a8d854061d1987ad4ea352c7270652e31c4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ mysql-test/suite/s3/mysqldump.result | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mysql-test/suite/s3/mysqldump.result b/mysql-test/suite/s3/=
mysqldump.result
+index 3f4c2081..e0c0caf6 100644
+--- a/mysql-test/suite/s3/mysqldump.result
++++ b/mysql-test/suite/s3/mysqldump.result
+@@ -4,6 +4,7 @@ alter table t1 engine=3DS3;
+ #####
+ # mysqldump with --copy-s3-tables=3D0 (by default)
+ ###
++/*!999999\- enable the sandbox mode */=20
+ #####
+ # mysqldump with --copy-s3-tables=3D0 (by default) XML
+ ###
+@@ -15,6 +16,7 @@ alter table t1 engine=3DS3;
+ #####
+ # mysqldump with --copy-s3-tables=3D1
+ ###
++/*!999999\- enable the sandbox mode */=20
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+--=20
+2.40.0
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0003.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0003.patch
new file mode 100644
index 0000000000..5573ccfdb9
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0003.patch
@@ -0,0 +1,138 @@
+From 77c4c0f256f3c268d3f72625b04240d24a70513c Mon Sep 17 00:00:00 2001
+From: Oleksandr Byelkin <sanja@mariadb.com>
+Date: Fri, 7 Jun 2024 12:13:21 +0200
+Subject: [PATCH] MDEV-34203 Sandbox mode \- is not compatible with=20
+ --binary-mode
+
+"Process" sandbox short command put by masqldump to avoid an error.
+
+CVE: CVE-2024-21096
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/77c4=
c0f256f3c268d3f72625b04240d24a70513c]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ client/mysql.cc              | 30 +++++++++++++++++++++++++-----
+ mysql-test/main/mysql.result | 11 +++++++++++
+ mysql-test/main/mysql.test   | 16 ++++++++++++++++
+ 3 files changed, 52 insertions(+), 5 deletions(-)
+
+diff --git a/client/mysql.cc b/client/mysql.cc
+index 10f25966..0bb56510 100644
+--- a/client/mysql.cc
++++ b/client/mysql.cc
+@@ -1112,6 +1112,8 @@ inline int get_command_index(char cmd_char)
+=20
+ static int delimiter_index=3D -1;
+ static int charset_index=3D -1;
++static int sandbox_index=3D -1;
++
+ static bool real_binary_mode=3D FALSE;
+=20
+=20
+@@ -1122,7 +1124,8 @@ int main(int argc,char *argv[])
+   MY_INIT(argv[0]);
+   DBUG_ENTER("main");
+   DBUG_PROCESS(argv[0]);
+- =20
++
++  sandbox_index=3D get_command_index('-');
+   charset_index=3D get_command_index('C');
+   delimiter_index=3D get_command_index('d');
+   delimiter_str=3D delimiter;
+@@ -2237,8 +2240,9 @@ static int read_and_execute(bool interactive)
+=20
+ /**
+    It checks if the input is a short form command. It returns the comma=
nd's
+-   pointer if a command is found, else return NULL. Note that if binary=
-mode
+-   is set, then only \C is searched for.
++   pointer if a command is found, else return NULL.
++
++   Note that if binary-mode is set, then only \C and \- are searched fo=
r.
+=20
+    @param cmd_char    A character of one byte.
+=20
+@@ -2253,13 +2257,23 @@ static COMMANDS *find_command(char cmd_char)
+   int index=3D -1;
+=20
+   /*
+-    In binary-mode, we disallow all mysql commands except '\C'
+-    and DELIMITER.
++    In binary-mode, we disallow all client commands except '\C'
++    DELIMITER (see long comand finding find_command(char *))
++    and  '\-' (sandbox, see following comment).
+   */
+   if (real_binary_mode)
+   {
+     if (cmd_char =3D=3D 'C')
+       index=3D charset_index;
++    /*
++       binary-mode enforces stricter controls compared to sandbox mode.
++       Whether sandbox mode is enabled or not is irrelevant when
++       binary-mode is active.
++       The only purpose of processing sandbox mode here is to avoid err=
or
++       messages on files made by mysqldump.
++    */
++    else if (cmd_char =3D=3D '-')
++      index=3D sandbox_index;
+   }
+   else
+     index=3D get_command_index(cmd_char);
+@@ -2315,6 +2329,12 @@ static COMMANDS *find_command(char *name)
+     len=3D (uint) strlen(name);
+=20
+   int index=3D -1;
++  /*
++    In binary-mode, we disallow all client commands except DELIMITER
++    and short commands '\C' and  '\-' (see short command finding
++    find_command(char)).
++  */
++
+   if (real_binary_mode)
+   {
+     if (is_delimiter_command(name, len))
+diff --git a/mysql-test/main/mysql.result b/mysql-test/main/mysql.result
+index c2e42fda..b983f009 100644
+--- a/mysql-test/main/mysql.result
++++ b/mysql-test/main/mysql.result
+@@ -639,3 +639,14 @@ drop table t1;
+ WARNING: option '--enable-cleartext-plugin' is obsolete.
+ 1
+ 1
++#
++# MDEV-34203: Sandbox mode \- is not compatible with --binary-mode
++#
++create table t1 (a int);
++drop table t1;
++show create table t1;
++Table	Create Table
++t1	CREATE TABLE `t1` (
++  `a` int(11) DEFAULT NULL
++) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
++drop table t1;
+diff --git a/mysql-test/main/mysql.test b/mysql-test/main/mysql.test
+index 0f41add8..553398fd 100644
+--- a/mysql-test/main/mysql.test
++++ b/mysql-test/main/mysql.test
+@@ -716,3 +716,19 @@ drop table t1;
+ #
+ --echo
+ --exec $MYSQL test --enable-cleartext-plugin -e "select 1"
++
++--echo #
++--echo # MDEV-34203: Sandbox mode \- is not compatible with --binary-mo=
de
++--echo #
++
++create table t1 (a int);
++
++--exec $MYSQL_DUMP test t1 > $MYSQLTEST_VARDIR/tmp/MDEV-34203.sql
++
++drop table t1;
++
++--exec $MYSQL --binary-mode test 2>&1 < $MYSQLTEST_VARDIR/tmp/MDEV-3420=
3.sql
++
++show create table t1;
++drop table t1;
++--remove_file $MYSQLTEST_VARDIR/tmp/MDEV-34203.sql
+--=20
+2.40.0
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0004.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0004.patch
new file mode 100644
index 0000000000..5444c39802
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0004.patch
@@ -0,0 +1,7729 @@
+From d60f5c11ea9008fa57444327526e3d2c8633ba06 Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Fri, 14 Jun 2024 17:32:52 +0200
+Subject: [PATCH] MDEV-34318 mariadb-dump SQL syntax error with=20
+ MAX_STATEMENT_TIME against Percona MySQL server
+
+protect MariaDB conditional comments from a bug
+in Percona MySQL comment parser
+
+CVE: CVE-2024-21096
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/d60f=
5c11ea9008fa57444327526e3d2c8633ba06]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ client/mysqldump.c                            |   4 +-
+ mysql-test/main/column_compression.result     | 288 ++++----
+ .../main/column_compression_parts.result      |  14 +-
+ .../main/mysqlbinlog_row_compressed.result    |  26 +-
+ .../main/mysqlbinlog_row_minimal.result       |  34 +-
+ .../main/mysqlbinlog_stmt_compressed.result   |  26 +-
+ .../binlog/r/binlog_mysqlbinlog_row.result    | 666 +++++++++---------
+ .../r/binlog_mysqlbinlog_row_innodb.result    |  76 +-
+ .../r/binlog_mysqlbinlog_row_myisam.result    |  76 +-
+ .../r/binlog_mysqlbinlog_row_trans.result     |  38 +-
+ .../suite/binlog/r/binlog_row_annotate.result | 144 ++--
+ .../binlog/r/binlog_row_ctype_ucs.result      |  22 +-
+ .../r/binlog_row_mysqlbinlog_options.result   |  52 +-
+ .../binlog/r/binlog_stm_ctype_ucs.result      |  22 +-
+ mysql-test/suite/binlog/r/flashback.result    |  18 +-
+ .../binlog_row_annotate.result                |  72 +-
+ .../compat/oracle/r/column_compression.result | 250 +++----
+ .../rpl/r/rpl_blackhole_row_annotate.result   |  44 +-
+ sql/field.h                                   |   4 +-
+ sql/log_event_client.cc                       |   8 +-
+ 20 files changed, 942 insertions(+), 942 deletions(-)
+
+diff --git a/client/mysqldump.c b/client/mysqldump.c
+index 51a5af15..9502227a 100644
+--- a/client/mysqldump.c
++++ b/client/mysqldump.c
+@@ -7039,11 +7039,11 @@ int main(int argc, char **argv)
+     write_header(md_result_file, *argv);
+=20
+   /* Set MAX_STATEMENT_TIME to 0 unless set in client */
+-  my_snprintf(query, sizeof(query), "/*!100100 SET @@MAX_STATEMENT_TIME=
=3D%f */", opt_max_statement_time);
++  my_snprintf(query, sizeof(query), "/*M!100100 SET @@MAX_STATEMENT_TIM=
E=3D%f */", opt_max_statement_time);
+   mysql_query(mysql, query);
+=20
+   /* Set server side timeout between client commands to server compiled=
-in default */
+-  mysql_query(mysql, "/*!100100 SET WAIT_TIMEOUT=3DDEFAULT */");
++  mysql_query(mysql, "/*M!100100 SET WAIT_TIMEOUT=3DDEFAULT */");
+=20
+   /* Check if the server support multi source */
+   if (mysql_get_server_version(mysql) >=3D 100000)
+diff --git a/mysql-test/main/column_compression.result b/mysql-test/main=
/column_compression.result
+index 6e9722a6..bc9256f1 100644
+--- a/mysql-test/main/column_compression.result
++++ b/mysql-test/main/column_compression.result
+@@ -8,7 +8,7 @@ ERROR HY000: Compressed column 'a' can't be used in key =
specification
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ # Make sure column was actually compressed
+ INSERT INTO t1 VALUES(REPEAT('a', 1000));
+@@ -44,7 +44,7 @@ ALTER TABLE t1 MODIFY COLUMN a BLOB COMPRESSED;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -61,7 +61,7 @@ CREATE TABLE t2 LIKE t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t2;
+ # Make sure implicit CREATE TABLE ... SELECT inherits compression
+@@ -69,7 +69,7 @@ CREATE TABLE t2 SELECT * FROM t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t2;
+ LEFT(a, 10)	LENGTH(a)
+@@ -105,7 +105,7 @@ ALTER TABLE t1 ENGINE=3DInnoDB;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -223,7 +223,7 @@ ERROR HY000: Compressed column 'a' can't be used in =
key specification
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ # Make sure column was actually compressed
+ INSERT INTO t1 VALUES(REPEAT('a', 1000));
+@@ -259,7 +259,7 @@ ALTER TABLE t1 MODIFY COLUMN a TEXT COMPRESSED;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -276,7 +276,7 @@ CREATE TABLE t2 LIKE t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t2;
+ # Make sure implicit CREATE TABLE ... SELECT inherits compression
+@@ -284,7 +284,7 @@ CREATE TABLE t2 SELECT * FROM t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t2;
+ LEFT(a, 10)	LENGTH(a)
+@@ -320,7 +320,7 @@ ALTER TABLE t1 ENGINE=3DInnoDB;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -438,7 +438,7 @@ ERROR HY000: Compressed column 'a' can't be used in =
key specification
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varbinary(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ # Make sure column was actually compressed
+ INSERT INTO t1 VALUES(REPEAT('a', 1000));
+@@ -474,7 +474,7 @@ ALTER TABLE t1 MODIFY COLUMN a VARBINARY(10000) COMP=
RESSED;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varbinary(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -491,7 +491,7 @@ CREATE TABLE t2 LIKE t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` varbinary(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t2;
+ # Make sure implicit CREATE TABLE ... SELECT inherits compression
+@@ -499,7 +499,7 @@ CREATE TABLE t2 SELECT * FROM t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` varbinary(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t2;
+ LEFT(a, 10)	LENGTH(a)
+@@ -535,7 +535,7 @@ ALTER TABLE t1 ENGINE=3DInnoDB;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varbinary(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -653,7 +653,7 @@ ERROR HY000: Compressed column 'a' can't be used in =
key specification
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ # Make sure column was actually compressed
+ INSERT INTO t1 VALUES(REPEAT('a', 1000));
+@@ -689,7 +689,7 @@ ALTER TABLE t1 MODIFY COLUMN a VARCHAR(10000) COMPRE=
SSED;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -706,7 +706,7 @@ CREATE TABLE t2 LIKE t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` varchar(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t2;
+ # Make sure implicit CREATE TABLE ... SELECT inherits compression
+@@ -714,7 +714,7 @@ CREATE TABLE t2 SELECT * FROM t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` varchar(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t2;
+ LEFT(a, 10)	LENGTH(a)
+@@ -750,7 +750,7 @@ ALTER TABLE t1 ENGINE=3DInnoDB;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10000) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10000) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -868,7 +868,7 @@ ERROR HY000: Compressed column 'a' can't be used in =
key specification
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ # Make sure column was actually compressed
+ INSERT INTO t1 VALUES(REPEAT('a', 1000));
+@@ -904,7 +904,7 @@ ALTER TABLE t1 MODIFY COLUMN a TEXT COMPRESSED CHARS=
ET ucs2;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -921,7 +921,7 @@ CREATE TABLE t2 LIKE t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t2;
+ # Make sure implicit CREATE TABLE ... SELECT inherits compression
+@@ -929,7 +929,7 @@ CREATE TABLE t2 SELECT * FROM t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t2;
+ LEFT(a, 10)	LENGTH(a)
+@@ -965,7 +965,7 @@ ALTER TABLE t1 ENGINE=3DInnoDB;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -1084,7 +1084,7 @@ ERROR HY000: Compressed column 'a' can't be used i=
n key specification
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ # Make sure column was actually compressed
+ INSERT INTO t1 VALUES(REPEAT('a', 1000));
+@@ -1120,7 +1120,7 @@ ALTER TABLE t1 MODIFY COLUMN a BLOB COMPRESSED;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -1137,7 +1137,7 @@ CREATE TABLE t2 LIKE t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t2;
+ # Make sure implicit CREATE TABLE ... SELECT inherits compression
+@@ -1145,7 +1145,7 @@ CREATE TABLE t2 SELECT * FROM t1;
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t2;
+ LEFT(a, 10)	LENGTH(a)
+@@ -1181,7 +1181,7 @@ ALTER TABLE t1 ENGINE=3DInnoDB;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT LEFT(a, 10), LENGTH(a) FROM t1;
+ LEFT(a, 10)	LENGTH(a)
+@@ -1323,7 +1323,7 @@ LENGTH(a)
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ NOT NULL DEFAULT ''
++  `a` blob /*M!100301 COMPRESSED*/ NOT NULL DEFAULT ''
+ ) ENGINE=3DCSV DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
+ DROP TABLE t1;
+@@ -1373,7 +1373,7 @@ CREATE TABLE t1(a VARCHAR(255) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(255) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(255) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SET column_compression_threshold=3D300;
+ INSERT INTO t1 VALUES(REPEAT('a', 255));
+@@ -1483,12 +1483,12 @@ CREATE OR REPLACE TABLE t1 (a VARCHAR(1000) COMP=
RESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(1000) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLAT=
E utf8mb3_general_ci DEFAULT NULL
++  `a` varchar(1000) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLA=
TE utf8mb3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ SELECT COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS
+ WHERE TABLE_SCHEMA=3D'test' AND TABLE_NAME=3D't1';
+ COLUMN_TYPE
+-varchar(1000) /*!100301 COMPRESSED*/
++varchar(1000) /*M!100301 COMPRESSED*/
+ DROP TABLE t1;
+ #
+ # MDEV-17363 - Compressed columns cannot be restored from dump
+@@ -1507,10 +1507,10 @@ d TINYTEXT COMPRESSED BINARY
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb4 COLLATE utf=
8mb4_bin DEFAULT NULL CHECK (json_valid(`a`)),
+-  `b` varchar(1000) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE=
 latin1_bin DEFAULT NULL,
+-  `c` varchar(1000) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLAT=
E utf8mb3_bin DEFAULT NULL,
+-  `d` tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb4 COLLATE ut=
f8mb4_bin DEFAULT NULL CHECK (json_valid(`a`)),
++  `b` varchar(1000) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLAT=
E latin1_bin DEFAULT NULL,
++  `c` varchar(1000) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLA=
TE utf8mb3_bin DEFAULT NULL,
++  `d` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1524,49 +1524,49 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varbinary(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs=
2_general_ci DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE uc=
s2_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1577,35 +1577,35 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BYTE D=
EFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varbinary(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT ''
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED CHARACTER SET utf8 DEFAULT ''=
);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT ''
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED CHARACTER SET utf8 GENERATED =
ALWAYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1617,7 +1617,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) ASCII COMPRESSED);
+@@ -1626,7 +1626,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) BYTE COMPRESSED);
+@@ -1635,7 +1635,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varbinary(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1675,49 +1675,49 @@ CREATE TABLE t1 (a TINYTEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_g=
eneral_ci DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_=
general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1728,35 +1728,35 @@ CREATE TABLE t1 (a TINYTEXT COMPRESSED BYTE DEFA=
ULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT ''
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` tinytext /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED CHARACTER SET utf8 DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT ''
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED CHARACTER SET utf8 GENERATED ALW=
AYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1768,7 +1768,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT ASCII COMPRESSED);
+@@ -1777,7 +1777,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinytext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinytext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT BYTE COMPRESSED);
+@@ -1786,7 +1786,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1826,49 +1826,49 @@ CREATE TABLE t1 (a TEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb3=
_general_ci DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb=
3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1879,35 +1879,35 @@ CREATE TABLE t1 (a TEXT COMPRESSED BYTE DEFAULT =
'');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT ''
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED CHARACTER SET utf8 DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb3=
_general_ci DEFAULT ''
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb=
3_general_ci DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED CHARACTER SET utf8 GENERATED ALWAYS =
AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb3=
_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb=
3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1919,7 +1919,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT ASCII COMPRESSED);
+@@ -1928,7 +1928,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` text /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT BYTE COMPRESSED);
+@@ -1937,7 +1937,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -1977,49 +1977,49 @@ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2=
_general_ci DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs=
2_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE u=
tf8mb3_general_ci DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2030,35 +2030,35 @@ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BYTE DE=
FAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT ''
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` mediumtext /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED CHARACTER SET utf8 DEFAULT '')=
;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE u=
tf8mb3_general_ci DEFAULT ''
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED CHARACTER SET utf8 GENERATED A=
LWAYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE u=
tf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2070,7 +2070,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT ASCII COMPRESSED);
+@@ -2079,7 +2079,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT BYTE COMPRESSED);
+@@ -2088,7 +2088,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2128,49 +2128,49 @@ CREATE TABLE t1 (a LONGTEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_g=
eneral_ci DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_=
general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2181,35 +2181,35 @@ CREATE TABLE t1 (a LONGTEXT COMPRESSED BYTE DEFA=
ULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT ''
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` longtext /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED CHARACTER SET utf8 DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT ''
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED CHARACTER SET utf8 GENERATED ALW=
AYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2221,7 +2221,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT ASCII COMPRESSED);
+@@ -2230,7 +2230,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT BYTE COMPRESSED);
+@@ -2239,7 +2239,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2281,7 +2281,7 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2292,21 +2292,21 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED DEFAUL=
T '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED GENERATED ALWAYS AS (REPEAT('=
a',10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a=
',10)) VIRTUAL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('=
a',10)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2318,7 +2318,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) NULL COMPRESSED);
+@@ -2327,7 +2327,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2356,7 +2356,7 @@ CREATE TABLE t1 (a TINYBLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2367,21 +2367,21 @@ CREATE TABLE t1 (a TINYBLOB COMPRESSED DEFAULT '=
');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYBLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYBLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a',=
10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',1=
0)) VIRTUAL
++  `a` tinyblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',=
10)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2393,7 +2393,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYBLOB NULL COMPRESSED);
+@@ -2402,7 +2402,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2431,7 +2431,7 @@ CREATE TABLE t1 (a BLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2442,21 +2442,21 @@ CREATE TABLE t1 (a BLOB COMPRESSED DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a BLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a BLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a',10))=
);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',10)) =
VIRTUAL
++  `a` blob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',10))=
 VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2468,7 +2468,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a BLOB NULL COMPRESSED);
+@@ -2477,7 +2477,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2506,7 +2506,7 @@ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2517,21 +2517,21 @@ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED DEFAULT=
 '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a=
',10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a'=
,10)) VIRTUAL
++  `a` mediumblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a=
',10)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2543,7 +2543,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMBLOB NULL COMPRESSED);
+@@ -2552,7 +2552,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2581,7 +2581,7 @@ CREATE TABLE t1 (a LONGBLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2592,21 +2592,21 @@ CREATE TABLE t1 (a LONGBLOB COMPRESSED DEFAULT '=
');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGBLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGBLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a',=
10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',1=
0)) VIRTUAL
++  `a` longblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',=
10)) VIRTUAL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2618,7 +2618,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGBLOB NULL COMPRESSED);
+@@ -2627,7 +2627,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ #
+@@ -2656,7 +2656,7 @@ CREATE TABLE t1 (a NVARCHAR(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
++  `a` varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ DROP TABLE t1;
+ CREATE TABLE t1 (a NVARCHAR(10) COMPRESSED BINARY COMPRESSED);
+diff --git a/mysql-test/main/column_compression_parts.result b/mysql-tes=
t/main/column_compression_parts.result
+index fa12217c..a119ada1 100644
+--- a/mysql-test/main/column_compression_parts.result
++++ b/mysql-test/main/column_compression_parts.result
+@@ -65,7 +65,7 @@ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+   `i` int(11) DEFAULT NULL,
+-  `a` varchar(1000) /*!100301 COMPRESSED*/ DEFAULT 'AAA'
++  `a` varchar(1000) /*M!100301 COMPRESSED*/ DEFAULT 'AAA'
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+  PARTITION BY RANGE  COLUMNS(`a`)
+ (PARTITION `p1` VALUES LESS THAN ('m') ENGINE =3D MyISAM,
+@@ -133,7 +133,7 @@ ALTER TABLE t1 MODIFY COLUMN a VARCHAR(1000) COMPRES=
SED;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(1000) /*!100301 COMPRESSED*/ DEFAULT NULL,
++  `a` varchar(1000) /*M!100301 COMPRESSED*/ DEFAULT NULL,
+   `id` int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+  PARTITION BY RANGE  COLUMNS(`id`,`a`)
+@@ -166,7 +166,7 @@ ALTER TABLE t1 PARTITION BY KEY(a) PARTITIONS 6;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(1000) /*!100301 COMPRESSED*/ DEFAULT '10-12-2010'
++  `a` varchar(1000) /*M!100301 COMPRESSED*/ DEFAULT '10-12-2010'
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+  PARTITION BY KEY (`a`)
+ PARTITIONS 6
+@@ -231,7 +231,7 @@ ALTER TABLE t2  REMOVE PARTITIONING;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(200) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(200) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+  PARTITION BY KEY (`a`)
+ (PARTITION `p0` ENGINE =3D MyISAM,
+@@ -248,7 +248,7 @@ t1	CREATE TABLE `t1` (
+ SHOW CREATE TABLE t2;
+ Table	Create Table
+ t2	CREATE TABLE `t2` (
+-  `a` varchar(200) /*!100301 COMPRESSED*/ DEFAULT NULL
++  `a` varchar(200) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ ALTER TABLE t1 EXCHANGE PARTITION pm WITH TABLE t2;
+ DROP TABLE t1,t2;
+@@ -266,7 +266,7 @@ ERROR HY000: Only RANGE PARTITIONING can use VALUES =
LESS THAN in partition defin
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` blob /*!100301 COMPRESSED*/ DEFAULT 5,
++  `a` blob /*M!100301 COMPRESSED*/ DEFAULT 5,
+   `i` int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+  PARTITION BY HASH (`i`)
+@@ -283,7 +283,7 @@ ALTER TABLE t1 REORGANIZE PARTITION p2 INTO (PARTITI=
ON p22 VALUES LESS THAN (MAX
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE `t1` (
+-  `a` varchar(500) /*!100301 COMPRESSED*/ DEFAULT '5',
++  `a` varchar(500) /*M!100301 COMPRESSED*/ DEFAULT '5',
+   `i` int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+  PARTITION BY RANGE  COLUMNS(`i`)
+diff --git a/mysql-test/main/mysqlbinlog_row_compressed.result b/mysql-t=
est/main/mysqlbinlog_row_compressed.result
+index a6846f24..e3533e4a 100644
+--- a/mysql-test/main/mysqlbinlog_row_compressed.result
++++ b/mysql-test/main/mysqlbinlog_row_compressed.result
+@@ -24,10 +24,10 @@ ROLLBACK/*!*/;
+ #<date> server id 1  end_log_pos 329 CRC32 XXX 	Binlog checkpoint maste=
r-bin.000001
+ # at 329
+ #<date> server id 1  end_log_pos 371 CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at 371
+ #<date> server id 1  end_log_pos 542 CRC32 XXX 	Query_compressed	thread=
_id=3D5	exec_time=3Dx	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -44,7 +44,7 @@ CREATE TABLE t1 (pk INT PRIMARY KEY, f1 INT, f2 INT, f=
3 TINYINT, f4 MEDIUMINT, f
+ /*!*/;
+ # at 542
+ #<date> server id 1  end_log_pos 584 CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at 584
+ #<date> server id 1  end_log_pos 745 CRC32 XXX 	Query_compressed	thread=
_id=3D5	exec_time=3Dx	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3DX/*!*/;
+@@ -52,7 +52,7 @@ CREATE TABLE t2 (pk INT PRIMARY KEY, f1 INT, f2 INT, f=
3 INT, f4 INT, f5 MEDIUMIN
+ /*!*/;
+ # at 745
+ #<date> server id 1  end_log_pos 787 CRC32 XXX 	GTID 0-1-3
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 787
+@@ -81,7 +81,7 @@ COMMIT
+ /*!*/;
+ # at 1058
+ #<date> server id 1  end_log_pos 1100 CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1100
+@@ -110,7 +110,7 @@ COMMIT
+ /*!*/;
+ # at 1372
+ #<date> server id 1  end_log_pos 1414 CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1414
+@@ -139,7 +139,7 @@ COMMIT
+ /*!*/;
+ # at 1687
+ #<date> server id 1  end_log_pos 1729 CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1729
+@@ -168,7 +168,7 @@ COMMIT
+ /*!*/;
+ # at 2000
+ #<date> server id 1  end_log_pos 2042 CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2042
+@@ -230,7 +230,7 @@ COMMIT
+ /*!*/;
+ # at 2316
+ #<date> server id 1  end_log_pos 2358 CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2358
+@@ -311,7 +311,7 @@ COMMIT
+ /*!*/;
+ # at 2652
+ #<date> server id 1  end_log_pos 2694 CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2694
+@@ -373,7 +373,7 @@ COMMIT
+ /*!*/;
+ # at 2952
+ #<date> server id 1  end_log_pos 2994 CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2994
+diff --git a/mysql-test/main/mysqlbinlog_row_minimal.result b/mysql-test=
/main/mysqlbinlog_row_minimal.result
+index 99d5757b..81f37f40 100644
+--- a/mysql-test/main/mysqlbinlog_row_minimal.result
++++ b/mysql-test/main/mysqlbinlog_row_minimal.result
+@@ -22,10 +22,10 @@ ROLLBACK/*!*/;
+ #<date> server id 1  end_log_pos 329 CRC32 XXX 	Binlog checkpoint maste=
r-bin.000001
+ # at 329
+ #<date> server id 1  end_log_pos 371 CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at 371
+ #<date> server id 1  end_log_pos 564 CRC32 XXX 	Query	thread_id=3D5	exe=
c_time=3Dx	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -42,7 +42,7 @@ CREATE TABLE t1 (pk INT PRIMARY KEY, f1 INT, f2 INT, f=
3 TINYINT, f4 MEDIUMINT, f
+ /*!*/;
+ # at 564
+ #<date> server id 1  end_log_pos 606 CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at 606
+ #<date> server id 1  end_log_pos 792 CRC32 XXX 	Query	thread_id=3D5	exe=
c_time=3Dx	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3DX/*!*/;
+@@ -50,7 +50,7 @@ CREATE TABLE t2 (pk INT PRIMARY KEY, f1 INT, f2 INT, f=
3 INT, f4 INT, f5 MEDIUMIN
+ /*!*/;
+ # at 792
+ #<date> server id 1  end_log_pos 834 CRC32 XXX 	GTID 0-1-3
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 834
+@@ -79,7 +79,7 @@ COMMIT
+ /*!*/;
+ # at 1106
+ #<date> server id 1  end_log_pos 1148 CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1148
+@@ -108,7 +108,7 @@ COMMIT
+ /*!*/;
+ # at 1421
+ #<date> server id 1  end_log_pos 1463 CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1463
+@@ -137,7 +137,7 @@ COMMIT
+ /*!*/;
+ # at 1737
+ #<date> server id 1  end_log_pos 1779 CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1779
+@@ -166,7 +166,7 @@ COMMIT
+ /*!*/;
+ # at 2053
+ #<date> server id 1  end_log_pos 2095 CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2095
+@@ -228,7 +228,7 @@ COMMIT
+ /*!*/;
+ # at 2445
+ #<date> server id 1  end_log_pos 2487 CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2487
+@@ -261,7 +261,7 @@ COMMIT
+ /*!*/;
+ # at 2748
+ #<date> server id 1  end_log_pos 2790 CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2790
+@@ -291,7 +291,7 @@ COMMIT
+ /*!*/;
+ # at 3010
+ #<date> server id 1  end_log_pos 3052 CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 3052
+@@ -371,10 +371,10 @@ FLUSH BINARY LOGS;
+ DELIMITER /*!*/;
+ # at POS
+ #<date> server id 1  end_log_pos END_LOG_POS CRC32 XXX 	GTID D-S-N
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D21*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D21*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at POS
+diff --git a/mysql-test/main/mysqlbinlog_stmt_compressed.result b/mysql-=
test/main/mysqlbinlog_stmt_compressed.result
+index 7e709eee..b18cceb7 100644
+--- a/mysql-test/main/mysqlbinlog_stmt_compressed.result
++++ b/mysql-test/main/mysqlbinlog_stmt_compressed.result
+@@ -24,10 +24,10 @@ ROLLBACK/*!*/;
+ #<date> server id 1  end_log_pos 329 CRC32 XXX 	Binlog checkpoint maste=
r-bin.000001
+ # at 329
+ #<date> server id 1  end_log_pos 371 CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at 371
+ #<date> server id 1  end_log_pos 542 CRC32 XXX 	Query_compressed	thread=
_id=3D5	exec_time=3Dx	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -44,7 +44,7 @@ CREATE TABLE t1 (pk INT PRIMARY KEY, f1 INT, f2 INT, f=
3 TINYINT, f4 MEDIUMINT, f
+ /*!*/;
+ # at 542
+ #<date> server id 1  end_log_pos 584 CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at 584
+ #<date> server id 1  end_log_pos 745 CRC32 XXX 	Query_compressed	thread=
_id=3D5	exec_time=3Dx	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3DX/*!*/;
+@@ -52,7 +52,7 @@ CREATE TABLE t2 (pk INT PRIMARY KEY, f1 INT, f2 INT, f=
3 INT, f4 INT, f5 MEDIUMIN
+ /*!*/;
+ # at 745
+ #<date> server id 1  end_log_pos 787 CRC32 XXX 	GTID 0-1-3
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 787
+@@ -67,7 +67,7 @@ COMMIT
+ /*!*/;
+ # at 988
+ #<date> server id 1  end_log_pos 1030 CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1030
+@@ -82,7 +82,7 @@ COMMIT
+ /*!*/;
+ # at 1231
+ #<date> server id 1  end_log_pos 1273 CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1273
+@@ -97,7 +97,7 @@ COMMIT
+ /*!*/;
+ # at 1476
+ #<date> server id 1  end_log_pos 1518 CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1518
+@@ -112,7 +112,7 @@ COMMIT
+ /*!*/;
+ # at 1718
+ #<date> server id 1  end_log_pos 1760 CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1760
+@@ -127,7 +127,7 @@ COMMIT
+ /*!*/;
+ # at 1941
+ #<date> server id 1  end_log_pos 1983 CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 1983
+@@ -142,7 +142,7 @@ COMMIT
+ /*!*/;
+ # at 2173
+ #<date> server id 1  end_log_pos 2215 CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2215
+@@ -157,7 +157,7 @@ COMMIT
+ /*!*/;
+ # at 2379
+ #<date> server id 1  end_log_pos 2421 CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at 2421
+diff --git a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row.result b/m=
ysql-test/suite/binlog/r/binlog_mysqlbinlog_row.result
+index 9195f9fd..7e02d3e0 100644
+--- a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row.result
++++ b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row.result
+@@ -367,10 +367,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -387,7 +387,7 @@ CREATE TABLE t1 (c01 BIT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -408,7 +408,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -429,7 +429,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -437,7 +437,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -445,7 +445,7 @@ CREATE TABLE t1 (c01 BIT(7))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -466,7 +466,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -487,7 +487,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -508,7 +508,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -529,7 +529,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -550,7 +550,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-11
+-/*!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -571,7 +571,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-12
+-/*!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -592,7 +592,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-13
+-/*!100001 SET @@session.gtid_seq_no=3D13*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D13*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -613,7 +613,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-14
+-/*!100001 SET @@session.gtid_seq_no=3D14*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D14*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -634,7 +634,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-15
+-/*!100001 SET @@session.gtid_seq_no=3D15*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D15*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -657,7 +657,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-16 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D16*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D16*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -665,7 +665,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-17 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D17*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D17*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -673,7 +673,7 @@ CREATE TABLE t1 (a BIT(20), b CHAR(2))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-18
+-/*!100001 SET @@session.gtid_seq_no=3D18*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D18*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -695,7 +695,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-19 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D19*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D19*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -703,7 +703,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-20 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D20*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D20*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -711,7 +711,7 @@ CREATE TABLE t1 (c02 BIT(64))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-21
+-/*!100001 SET @@session.gtid_seq_no=3D21*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D21*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -732,7 +732,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-22
+-/*!100001 SET @@session.gtid_seq_no=3D22*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D22*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -753,7 +753,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-23
+-/*!100001 SET @@session.gtid_seq_no=3D23*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D23*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -774,7 +774,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-24
+-/*!100001 SET @@session.gtid_seq_no=3D24*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D24*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -795,7 +795,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-25 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D25*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D25*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -803,7 +803,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-26 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D26*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D26*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -811,7 +811,7 @@ CREATE TABLE t1 (c03 TINYINT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-27
+-/*!100001 SET @@session.gtid_seq_no=3D27*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D27*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -838,7 +838,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-28
+-/*!100001 SET @@session.gtid_seq_no=3D28*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D28*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -859,7 +859,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-29
+-/*!100001 SET @@session.gtid_seq_no=3D29*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D29*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -882,7 +882,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-30
+-/*!100001 SET @@session.gtid_seq_no=3D30*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D30*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -903,7 +903,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-31 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D31*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D31*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -911,7 +911,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-32 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D32*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D32*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -919,7 +919,7 @@ CREATE TABLE t1 (c04 TINYINT UNSIGNED)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-33
+-/*!100001 SET @@session.gtid_seq_no=3D33*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D33*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -943,7 +943,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-34
+-/*!100001 SET @@session.gtid_seq_no=3D34*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D34*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -964,7 +964,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-35 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D35*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D35*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -972,7 +972,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-36 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D36*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D36*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -980,7 +980,7 @@ CREATE TABLE t1 (c06 BOOL)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-37
+-/*!100001 SET @@session.gtid_seq_no=3D37*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D37*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1001,7 +1001,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-38
+-/*!100001 SET @@session.gtid_seq_no=3D38*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D38*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1022,7 +1022,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-39 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D39*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D39*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1030,7 +1030,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-40 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D40*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D40*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1038,7 +1038,7 @@ CREATE TABLE t1 (c07 SMALLINT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-41
+-/*!100001 SET @@session.gtid_seq_no=3D41*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D41*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1059,7 +1059,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-42
+-/*!100001 SET @@session.gtid_seq_no=3D42*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D42*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1080,7 +1080,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-43 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D43*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D43*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1088,7 +1088,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-44 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D44*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D44*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1096,7 +1096,7 @@ CREATE TABLE t1 (c08 SMALLINT UNSIGNED)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-45
+-/*!100001 SET @@session.gtid_seq_no=3D45*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D45*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1120,7 +1120,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-46
+-/*!100001 SET @@session.gtid_seq_no=3D46*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D46*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1143,7 +1143,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-47
+-/*!100001 SET @@session.gtid_seq_no=3D47*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D47*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1164,7 +1164,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-48 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D48*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D48*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1172,7 +1172,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-49 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D49*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D49*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1180,7 +1180,7 @@ CREATE TABLE t1 (c10 MEDIUMINT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-50
+-/*!100001 SET @@session.gtid_seq_no=3D50*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D50*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1201,7 +1201,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-51
+-/*!100001 SET @@session.gtid_seq_no=3D51*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D51*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1222,7 +1222,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-52 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D52*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D52*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1230,7 +1230,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-53 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D53*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D53*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1238,7 +1238,7 @@ CREATE TABLE t1 (c11 MEDIUMINT UNSIGNED)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-54
+-/*!100001 SET @@session.gtid_seq_no=3D54*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D54*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1262,7 +1262,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-55
+-/*!100001 SET @@session.gtid_seq_no=3D55*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D55*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1285,7 +1285,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-56
+-/*!100001 SET @@session.gtid_seq_no=3D56*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D56*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1306,7 +1306,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-57 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D57*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D57*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1314,7 +1314,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-58 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D58*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D58*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1322,7 +1322,7 @@ CREATE TABLE t1 (c13 INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-59
+-/*!100001 SET @@session.gtid_seq_no=3D59*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D59*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1343,7 +1343,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-60
+-/*!100001 SET @@session.gtid_seq_no=3D60*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D60*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1364,7 +1364,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-61 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D61*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D61*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1372,7 +1372,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-62 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D62*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D62*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1380,7 +1380,7 @@ CREATE TABLE t1 (c14 INT UNSIGNED)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-63
+-/*!100001 SET @@session.gtid_seq_no=3D63*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D63*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1404,7 +1404,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-64
+-/*!100001 SET @@session.gtid_seq_no=3D64*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D64*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1427,7 +1427,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-65
+-/*!100001 SET @@session.gtid_seq_no=3D65*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D65*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1448,7 +1448,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-66 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D66*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D66*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1456,7 +1456,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-67 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D67*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D67*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1464,7 +1464,7 @@ CREATE TABLE t1 (c16 BIGINT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-68
+-/*!100001 SET @@session.gtid_seq_no=3D68*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D68*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1485,7 +1485,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-69
+-/*!100001 SET @@session.gtid_seq_no=3D69*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D69*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1506,7 +1506,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-70 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D70*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D70*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1514,7 +1514,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-71 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D71*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D71*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1522,7 +1522,7 @@ CREATE TABLE t1 (c17 BIGINT UNSIGNED)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-72
+-/*!100001 SET @@session.gtid_seq_no=3D72*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D72*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1546,7 +1546,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-73
+-/*!100001 SET @@session.gtid_seq_no=3D73*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D73*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1569,7 +1569,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-74
+-/*!100001 SET @@session.gtid_seq_no=3D74*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D74*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1590,7 +1590,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-75 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D75*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D75*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1598,7 +1598,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-76 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D76*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D76*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1606,7 +1606,7 @@ CREATE TABLE t1 (c19 FLOAT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-77
+-/*!100001 SET @@session.gtid_seq_no=3D77*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D77*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1627,7 +1627,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-78
+-/*!100001 SET @@session.gtid_seq_no=3D78*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D78*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1648,7 +1648,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-79 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D79*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D79*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1656,7 +1656,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-80 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D80*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D80*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1664,7 +1664,7 @@ CREATE TABLE t1 (c22 DOUBLE)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-81
+-/*!100001 SET @@session.gtid_seq_no=3D81*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D81*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1685,7 +1685,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-82
+-/*!100001 SET @@session.gtid_seq_no=3D82*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D82*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1706,7 +1706,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-83 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D83*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D83*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1714,7 +1714,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-84 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D84*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D84*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1722,7 +1722,7 @@ CREATE TABLE t1 (c25 DECIMAL(10,5))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-85
+-/*!100001 SET @@session.gtid_seq_no=3D85*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D85*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1743,7 +1743,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-86
+-/*!100001 SET @@session.gtid_seq_no=3D86*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D86*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1764,7 +1764,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-87
+-/*!100001 SET @@session.gtid_seq_no=3D87*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D87*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1785,7 +1785,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-88 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D88*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D88*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1793,7 +1793,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-89 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D89*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D89*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1801,7 +1801,7 @@ CREATE TABLE t1 (c28 DATE)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-90
+-/*!100001 SET @@session.gtid_seq_no=3D90*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D90*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1822,7 +1822,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-91
+-/*!100001 SET @@session.gtid_seq_no=3D91*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D91*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1843,7 +1843,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-92 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D92*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D92*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1851,7 +1851,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-93 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D93*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D93*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1859,7 +1859,7 @@ CREATE TABLE t1 (c29 DATETIME)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-94
+-/*!100001 SET @@session.gtid_seq_no=3D94*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D94*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1880,7 +1880,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-95
+-/*!100001 SET @@session.gtid_seq_no=3D95*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D95*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1901,7 +1901,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-96 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D96*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D96*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1909,7 +1909,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-97 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D97*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D97*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1917,7 +1917,7 @@ CREATE TABLE t1 (c30 TIMESTAMP NOT NULL DEFAULT CU=
RRENT_TIMESTAMP ON UPDATE CURR
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-98
+-/*!100001 SET @@session.gtid_seq_no=3D98*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D98*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1939,7 +1939,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-99
+-/*!100001 SET @@session.gtid_seq_no=3D99*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D99*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1960,7 +1960,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-100 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D100*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D100*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1968,7 +1968,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-101 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D101*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D101*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1976,7 +1976,7 @@ CREATE TABLE t1 (c31 TIME)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-102
+-/*!100001 SET @@session.gtid_seq_no=3D102*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D102*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1997,7 +1997,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-103
+-/*!100001 SET @@session.gtid_seq_no=3D103*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D103*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2018,7 +2018,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-104 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D104*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D104*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2026,7 +2026,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-105 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D105*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D105*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2034,7 +2034,7 @@ CREATE TABLE t1 (c32 YEAR)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-106
+-/*!100001 SET @@session.gtid_seq_no=3D106*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D106*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2055,7 +2055,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-107
+-/*!100001 SET @@session.gtid_seq_no=3D107*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D107*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2076,7 +2076,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-108 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D108*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D108*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2084,7 +2084,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-109 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D109*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D109*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2092,7 +2092,7 @@ CREATE TABLE t1 (c33 CHAR)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-110
+-/*!100001 SET @@session.gtid_seq_no=3D110*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D110*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2113,7 +2113,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-111
+-/*!100001 SET @@session.gtid_seq_no=3D111*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D111*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2134,7 +2134,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-112 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D112*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D112*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2142,7 +2142,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-113 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D113*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D113*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2150,7 +2150,7 @@ CREATE TABLE t1 (c34 CHAR(0))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-114
+-/*!100001 SET @@session.gtid_seq_no=3D114*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D114*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2171,7 +2171,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-115
+-/*!100001 SET @@session.gtid_seq_no=3D115*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D115*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2192,7 +2192,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-116 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D116*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D116*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2200,7 +2200,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-117 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D117*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D117*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2208,7 +2208,7 @@ CREATE TABLE t1 (c35 CHAR(1))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-118
+-/*!100001 SET @@session.gtid_seq_no=3D118*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D118*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2229,7 +2229,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-119
+-/*!100001 SET @@session.gtid_seq_no=3D119*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D119*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2250,7 +2250,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-120 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D120*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D120*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2258,7 +2258,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-121 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D121*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D121*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2266,7 +2266,7 @@ CREATE TABLE t1 (c36 CHAR(255))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-122
+-/*!100001 SET @@session.gtid_seq_no=3D122*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D122*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2287,7 +2287,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-123
+-/*!100001 SET @@session.gtid_seq_no=3D123*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D123*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2308,7 +2308,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-124 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D124*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D124*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2316,7 +2316,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-125 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D125*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D125*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2324,7 +2324,7 @@ CREATE TABLE t1 (c37 NATIONAL CHAR)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-126
+-/*!100001 SET @@session.gtid_seq_no=3D126*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D126*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2345,7 +2345,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-127
+-/*!100001 SET @@session.gtid_seq_no=3D127*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D127*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2366,7 +2366,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-128 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D128*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D128*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2374,7 +2374,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-129 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D129*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D129*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2382,7 +2382,7 @@ CREATE TABLE t1 (c38 NATIONAL CHAR(0))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-130
+-/*!100001 SET @@session.gtid_seq_no=3D130*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D130*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2403,7 +2403,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-131
+-/*!100001 SET @@session.gtid_seq_no=3D131*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D131*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2424,7 +2424,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-132 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D132*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D132*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2432,7 +2432,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-133 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D133*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D133*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2440,7 +2440,7 @@ CREATE TABLE t1 (c39 NATIONAL CHAR(1))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-134
+-/*!100001 SET @@session.gtid_seq_no=3D134*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D134*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2461,7 +2461,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-135
+-/*!100001 SET @@session.gtid_seq_no=3D135*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D135*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2482,7 +2482,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-136 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D136*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D136*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2490,7 +2490,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-137 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D137*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D137*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2498,7 +2498,7 @@ CREATE TABLE t1 (c40 NATIONAL CHAR(255))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-138
+-/*!100001 SET @@session.gtid_seq_no=3D138*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D138*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2519,7 +2519,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-139
+-/*!100001 SET @@session.gtid_seq_no=3D139*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D139*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2540,7 +2540,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-140
+-/*!100001 SET @@session.gtid_seq_no=3D140*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D140*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2564,7 +2564,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-141 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D141*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D141*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2572,7 +2572,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-142 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D142*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D142*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2580,7 +2580,7 @@ CREATE TABLE t1 (c41 CHAR CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-143
+-/*!100001 SET @@session.gtid_seq_no=3D143*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D143*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2601,7 +2601,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-144
+-/*!100001 SET @@session.gtid_seq_no=3D144*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D144*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2622,7 +2622,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-145 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D145*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D145*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2630,7 +2630,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-146 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D146*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D146*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2638,7 +2638,7 @@ CREATE TABLE t1 (c42 CHAR(0) CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-147
+-/*!100001 SET @@session.gtid_seq_no=3D147*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D147*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2659,7 +2659,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-148
+-/*!100001 SET @@session.gtid_seq_no=3D148*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D148*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2680,7 +2680,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-149 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D149*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D149*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2688,7 +2688,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-150 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D150*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D150*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2696,7 +2696,7 @@ CREATE TABLE t1 (c43 CHAR(1) CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-151
+-/*!100001 SET @@session.gtid_seq_no=3D151*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D151*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2717,7 +2717,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-152
+-/*!100001 SET @@session.gtid_seq_no=3D152*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D152*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2738,7 +2738,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-153 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D153*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D153*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2746,7 +2746,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-154 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D154*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D154*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2754,7 +2754,7 @@ CREATE TABLE t1 (c44 CHAR(255) CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-155
+-/*!100001 SET @@session.gtid_seq_no=3D155*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D155*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2775,7 +2775,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-156
+-/*!100001 SET @@session.gtid_seq_no=3D156*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D156*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2796,7 +2796,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-157
+-/*!100001 SET @@session.gtid_seq_no=3D157*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D157*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2820,7 +2820,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-158 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D158*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D158*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2828,7 +2828,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-159 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D159*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D159*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2836,7 +2836,7 @@ CREATE TABLE t1 (c45 VARCHAR(0))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-160
+-/*!100001 SET @@session.gtid_seq_no=3D160*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D160*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2857,7 +2857,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-161
+-/*!100001 SET @@session.gtid_seq_no=3D161*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D161*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2878,7 +2878,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-162 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D162*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D162*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2886,7 +2886,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-163 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D163*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D163*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2894,7 +2894,7 @@ CREATE TABLE t1 (c46 VARCHAR(1))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-164
+-/*!100001 SET @@session.gtid_seq_no=3D164*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D164*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2915,7 +2915,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-165
+-/*!100001 SET @@session.gtid_seq_no=3D165*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D165*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2936,7 +2936,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-166 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D166*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D166*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2944,7 +2944,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-167 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D167*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D167*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -2952,7 +2952,7 @@ CREATE TABLE t1 (c47 VARCHAR(255))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-168
+-/*!100001 SET @@session.gtid_seq_no=3D168*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D168*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2973,7 +2973,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-169
+-/*!100001 SET @@session.gtid_seq_no=3D169*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D169*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2994,7 +2994,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-170 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D170*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D170*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3002,7 +3002,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-171 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D171*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D171*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3010,7 +3010,7 @@ CREATE TABLE t1 (c48 VARCHAR(261))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-172
+-/*!100001 SET @@session.gtid_seq_no=3D172*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D172*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3031,7 +3031,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-173
+-/*!100001 SET @@session.gtid_seq_no=3D173*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D173*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3052,7 +3052,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-174 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D174*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D174*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3060,7 +3060,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-175 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D175*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D175*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3068,7 +3068,7 @@ CREATE TABLE t1 (c49 NATIONAL VARCHAR(0))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-176
+-/*!100001 SET @@session.gtid_seq_no=3D176*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D176*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3089,7 +3089,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-177
+-/*!100001 SET @@session.gtid_seq_no=3D177*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D177*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3110,7 +3110,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-178 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D178*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D178*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3118,7 +3118,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-179 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D179*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D179*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3126,7 +3126,7 @@ CREATE TABLE t1 (c50 NATIONAL VARCHAR(1))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-180
+-/*!100001 SET @@session.gtid_seq_no=3D180*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D180*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3147,7 +3147,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-181
+-/*!100001 SET @@session.gtid_seq_no=3D181*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D181*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3168,7 +3168,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-182 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D182*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D182*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3176,7 +3176,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-183 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D183*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D183*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3184,7 +3184,7 @@ CREATE TABLE t1 (c51 NATIONAL VARCHAR(255))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-184
+-/*!100001 SET @@session.gtid_seq_no=3D184*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D184*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3205,7 +3205,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-185
+-/*!100001 SET @@session.gtid_seq_no=3D185*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D185*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3226,7 +3226,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-186
+-/*!100001 SET @@session.gtid_seq_no=3D186*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D186*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3250,7 +3250,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-187 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D187*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D187*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3258,7 +3258,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-188 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D188*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D188*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3266,7 +3266,7 @@ CREATE TABLE t1 (c52 NATIONAL VARCHAR(261))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-189
+-/*!100001 SET @@session.gtid_seq_no=3D189*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D189*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3287,7 +3287,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-190
+-/*!100001 SET @@session.gtid_seq_no=3D190*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D190*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3308,7 +3308,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-191
+-/*!100001 SET @@session.gtid_seq_no=3D191*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D191*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3332,7 +3332,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-192 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D192*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D192*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3340,7 +3340,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-193 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D193*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D193*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3348,7 +3348,7 @@ CREATE TABLE t1 (c53 VARCHAR(0) CHARACTER SET ucs2=
)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-194
+-/*!100001 SET @@session.gtid_seq_no=3D194*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D194*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3369,7 +3369,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-195
+-/*!100001 SET @@session.gtid_seq_no=3D195*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D195*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3390,7 +3390,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-196 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D196*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D196*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3398,7 +3398,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-197 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D197*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D197*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3406,7 +3406,7 @@ CREATE TABLE t1 (c54 VARCHAR(1) CHARACTER SET ucs2=
)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-198
+-/*!100001 SET @@session.gtid_seq_no=3D198*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D198*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3427,7 +3427,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-199
+-/*!100001 SET @@session.gtid_seq_no=3D199*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D199*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3448,7 +3448,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-200 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D200*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D200*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3456,7 +3456,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-201 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D201*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D201*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3464,7 +3464,7 @@ CREATE TABLE t1 (c55 VARCHAR(255) CHARACTER SET uc=
s2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-202
+-/*!100001 SET @@session.gtid_seq_no=3D202*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D202*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3485,7 +3485,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-203
+-/*!100001 SET @@session.gtid_seq_no=3D203*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D203*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3506,7 +3506,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-204 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D204*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D204*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3514,7 +3514,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-205 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D205*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D205*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3522,7 +3522,7 @@ CREATE TABLE t1 (c56 VARCHAR(261) CHARACTER SET uc=
s2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-206
+-/*!100001 SET @@session.gtid_seq_no=3D206*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D206*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3543,7 +3543,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-207
+-/*!100001 SET @@session.gtid_seq_no=3D207*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D207*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3564,7 +3564,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-208 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D208*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D208*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3572,7 +3572,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-209 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D209*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D209*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3580,7 +3580,7 @@ CREATE TABLE t1 (c57 BINARY)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-210
+-/*!100001 SET @@session.gtid_seq_no=3D210*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D210*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3601,7 +3601,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-211
+-/*!100001 SET @@session.gtid_seq_no=3D211*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D211*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3622,7 +3622,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-212
+-/*!100001 SET @@session.gtid_seq_no=3D212*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D212*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3643,7 +3643,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-213
+-/*!100001 SET @@session.gtid_seq_no=3D213*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D213*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3664,7 +3664,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-214 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D214*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D214*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3672,7 +3672,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-215 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D215*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D215*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3680,7 +3680,7 @@ CREATE TABLE t1 (c58 BINARY(0))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-216
+-/*!100001 SET @@session.gtid_seq_no=3D216*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D216*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3701,7 +3701,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-217
+-/*!100001 SET @@session.gtid_seq_no=3D217*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D217*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3722,7 +3722,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-218 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D218*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D218*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3730,7 +3730,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-219 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D219*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D219*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3738,7 +3738,7 @@ CREATE TABLE t1 (c59 BINARY(1))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-220
+-/*!100001 SET @@session.gtid_seq_no=3D220*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D220*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3759,7 +3759,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-221
+-/*!100001 SET @@session.gtid_seq_no=3D221*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D221*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3780,7 +3780,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-222
+-/*!100001 SET @@session.gtid_seq_no=3D222*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D222*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3801,7 +3801,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-223
+-/*!100001 SET @@session.gtid_seq_no=3D223*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D223*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3822,7 +3822,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-224 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D224*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D224*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3830,7 +3830,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-225 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D225*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D225*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3838,7 +3838,7 @@ CREATE TABLE t1 (c60 BINARY(255))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-226
+-/*!100001 SET @@session.gtid_seq_no=3D226*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D226*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3859,7 +3859,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-227
+-/*!100001 SET @@session.gtid_seq_no=3D227*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D227*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3880,7 +3880,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-228
+-/*!100001 SET @@session.gtid_seq_no=3D228*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D228*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3901,7 +3901,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-229
+-/*!100001 SET @@session.gtid_seq_no=3D229*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D229*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3922,7 +3922,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-230 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D230*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D230*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3930,7 +3930,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-231 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D231*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D231*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3938,7 +3938,7 @@ CREATE TABLE t1 (c61 VARBINARY(0))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-232
+-/*!100001 SET @@session.gtid_seq_no=3D232*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D232*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3959,7 +3959,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-233
+-/*!100001 SET @@session.gtid_seq_no=3D233*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D233*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3980,7 +3980,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-234 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D234*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D234*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3988,7 +3988,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-235 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D235*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D235*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -3996,7 +3996,7 @@ CREATE TABLE t1 (c62 VARBINARY(1))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-236
+-/*!100001 SET @@session.gtid_seq_no=3D236*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D236*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4017,7 +4017,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-237
+-/*!100001 SET @@session.gtid_seq_no=3D237*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D237*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4038,7 +4038,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-238
+-/*!100001 SET @@session.gtid_seq_no=3D238*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D238*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4059,7 +4059,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-239
+-/*!100001 SET @@session.gtid_seq_no=3D239*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D239*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4080,7 +4080,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-240 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D240*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D240*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4088,7 +4088,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-241 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D241*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D241*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4096,7 +4096,7 @@ CREATE TABLE t1 (c63 VARBINARY(255))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-242
+-/*!100001 SET @@session.gtid_seq_no=3D242*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D242*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4117,7 +4117,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-243
+-/*!100001 SET @@session.gtid_seq_no=3D243*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D243*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4138,7 +4138,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-244
+-/*!100001 SET @@session.gtid_seq_no=3D244*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D244*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4159,7 +4159,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-245
+-/*!100001 SET @@session.gtid_seq_no=3D245*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D245*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4180,7 +4180,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-246 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D246*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D246*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4188,7 +4188,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-247 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D247*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D247*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4196,7 +4196,7 @@ CREATE TABLE t1 (c65 TINYBLOB)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-248
+-/*!100001 SET @@session.gtid_seq_no=3D248*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D248*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4217,7 +4217,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-249
+-/*!100001 SET @@session.gtid_seq_no=3D249*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D249*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4238,7 +4238,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-250 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D250*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D250*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4246,7 +4246,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-251 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D251*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D251*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4254,7 +4254,7 @@ CREATE TABLE t1 (c68 BLOB)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-252
+-/*!100001 SET @@session.gtid_seq_no=3D252*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D252*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4275,7 +4275,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-253
+-/*!100001 SET @@session.gtid_seq_no=3D253*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D253*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4296,7 +4296,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-254 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D254*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D254*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4304,7 +4304,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-255 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D255*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D255*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4312,7 +4312,7 @@ CREATE TABLE t1 (c71 MEDIUMBLOB)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-256
+-/*!100001 SET @@session.gtid_seq_no=3D256*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D256*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4333,7 +4333,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-257
+-/*!100001 SET @@session.gtid_seq_no=3D257*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D257*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4354,7 +4354,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-258 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D258*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D258*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4362,7 +4362,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-259 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D259*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D259*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4370,7 +4370,7 @@ CREATE TABLE t1 (c74 LONGBLOB)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-260
+-/*!100001 SET @@session.gtid_seq_no=3D260*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D260*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4391,7 +4391,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-261
+-/*!100001 SET @@session.gtid_seq_no=3D261*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D261*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4412,7 +4412,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-262 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D262*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D262*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4420,7 +4420,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-263 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D263*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D263*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4428,7 +4428,7 @@ CREATE TABLE t1 (c66 TINYTEXT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-264
+-/*!100001 SET @@session.gtid_seq_no=3D264*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D264*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4449,7 +4449,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-265
+-/*!100001 SET @@session.gtid_seq_no=3D265*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D265*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4470,7 +4470,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-266 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D266*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D266*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4478,7 +4478,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-267 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D267*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D267*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4486,7 +4486,7 @@ CREATE TABLE t1 (c69 TEXT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-268
+-/*!100001 SET @@session.gtid_seq_no=3D268*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D268*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4507,7 +4507,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-269
+-/*!100001 SET @@session.gtid_seq_no=3D269*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D269*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4528,7 +4528,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-270 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D270*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D270*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4536,7 +4536,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-271 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D271*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D271*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4544,7 +4544,7 @@ CREATE TABLE t1 (c72 MEDIUMTEXT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-272
+-/*!100001 SET @@session.gtid_seq_no=3D272*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D272*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4565,7 +4565,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-273
+-/*!100001 SET @@session.gtid_seq_no=3D273*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D273*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4586,7 +4586,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-274 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D274*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D274*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4594,7 +4594,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-275 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D275*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D275*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4602,7 +4602,7 @@ CREATE TABLE t1 (c75 LONGTEXT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-276
+-/*!100001 SET @@session.gtid_seq_no=3D276*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D276*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4623,7 +4623,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-277
+-/*!100001 SET @@session.gtid_seq_no=3D277*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D277*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4644,7 +4644,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-278 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D278*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D278*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4652,7 +4652,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-279 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D279*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D279*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4660,7 +4660,7 @@ CREATE TABLE t1 (c67 TINYTEXT CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-280
+-/*!100001 SET @@session.gtid_seq_no=3D280*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D280*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4681,7 +4681,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-281
+-/*!100001 SET @@session.gtid_seq_no=3D281*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D281*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4702,7 +4702,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-282 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D282*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D282*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4710,7 +4710,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-283 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D283*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D283*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4718,7 +4718,7 @@ CREATE TABLE t1 (c70 TEXT CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-284
+-/*!100001 SET @@session.gtid_seq_no=3D284*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D284*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4739,7 +4739,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-285
+-/*!100001 SET @@session.gtid_seq_no=3D285*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D285*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4760,7 +4760,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-286 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D286*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D286*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4768,7 +4768,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-287 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D287*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D287*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4776,7 +4776,7 @@ CREATE TABLE t1 (c73 MEDIUMTEXT CHARACTER SET UCS2=
)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-288
+-/*!100001 SET @@session.gtid_seq_no=3D288*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D288*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4797,7 +4797,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-289
+-/*!100001 SET @@session.gtid_seq_no=3D289*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D289*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4818,7 +4818,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-290 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D290*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D290*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4826,7 +4826,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-291 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D291*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D291*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4834,7 +4834,7 @@ CREATE TABLE t1 (c76 LONGTEXT CHARACTER SET UCS2)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-292
+-/*!100001 SET @@session.gtid_seq_no=3D292*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D292*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4855,7 +4855,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-293
+-/*!100001 SET @@session.gtid_seq_no=3D293*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D293*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4876,7 +4876,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-294 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D294*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D294*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4884,7 +4884,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-295 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D295*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D295*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4892,7 +4892,7 @@ CREATE TABLE t1 (c77 ENUM('a','b','c'))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-296
+-/*!100001 SET @@session.gtid_seq_no=3D296*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D296*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4913,7 +4913,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-297
+-/*!100001 SET @@session.gtid_seq_no=3D297*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D297*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4934,7 +4934,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-298 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D298*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D298*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4942,7 +4942,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-299 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D299*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D299*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -4950,7 +4950,7 @@ CREATE TABLE t1 (c78 SET('a','b','c','d','e','f'))
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-300
+-/*!100001 SET @@session.gtid_seq_no=3D300*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D300*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4971,7 +4971,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-301
+-/*!100001 SET @@session.gtid_seq_no=3D301*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D301*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4992,7 +4992,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-302
+-/*!100001 SET @@session.gtid_seq_no=3D302*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D302*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5013,7 +5013,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-303
+-/*!100001 SET @@session.gtid_seq_no=3D303*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D303*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5034,7 +5034,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-304
+-/*!100001 SET @@session.gtid_seq_no=3D304*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D304*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5055,7 +5055,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-305
+-/*!100001 SET @@session.gtid_seq_no=3D305*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D305*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5076,7 +5076,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-306
+-/*!100001 SET @@session.gtid_seq_no=3D306*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D306*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5097,7 +5097,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-307
+-/*!100001 SET @@session.gtid_seq_no=3D307*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D307*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5118,7 +5118,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-308 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D308*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D308*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5126,7 +5126,7 @@ DROP TABLE `t1` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-309 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D309*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D309*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5134,7 +5134,7 @@ CREATE TABLE t1 (a int NOT NULL DEFAULT 0, b int N=
OT NULL DEFAULT 0)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-310 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D310*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D310*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5142,7 +5142,7 @@ CREATE TABLE t2 (a int NOT NULL DEFAULT 0, b int N=
OT NULL DEFAULT 0)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-311
+-/*!100001 SET @@session.gtid_seq_no=3D311*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D311*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5164,7 +5164,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-312
+-/*!100001 SET @@session.gtid_seq_no=3D312*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D312*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5186,7 +5186,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-313
+-/*!100001 SET @@session.gtid_seq_no=3D313*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D313*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5208,7 +5208,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-314
+-/*!100001 SET @@session.gtid_seq_no=3D314*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D314*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5230,7 +5230,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-315
+-/*!100001 SET @@session.gtid_seq_no=3D315*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D315*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5280,7 +5280,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-316 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D316*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D316*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5288,7 +5288,7 @@ DROP TABLE `t1`,`t2` /* generated by server */
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-317 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D317*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D317*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5298,7 +5298,7 @@ c_text_utf8 blob )
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-318
+-/*!100001 SET @@session.gtid_seq_no=3D318*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D318*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5321,7 +5321,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-319 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D319*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D319*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5348,10 +5348,10 @@ DELIMITER /*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000002
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-320
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D320*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D320*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5377,10 +5377,10 @@ DELIMITER /*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000003
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-324 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D324*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D324*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -5397,7 +5397,7 @@ CREATE TABLE t1 (a GEOMETRY DEFAULT NULL)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-325
+-/*!100001 SET @@session.gtid_seq_no=3D325*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D325*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5418,7 +5418,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-326
+-/*!100001 SET @@session.gtid_seq_no=3D326*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D326*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5439,7 +5439,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-327 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D327*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D327*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+diff --git a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_innodb.res=
ult b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_innodb.result
+index 96059d00..ae6577c4 100644
+--- a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_innodb.result
++++ b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_innodb.result
+@@ -2261,10 +2261,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -2369,7 +2369,7 @@ crn INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 trans
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2551,7 +2551,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3 trans
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2733,7 +2733,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4 trans
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3081,7 +3081,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5 trans
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3421,7 +3421,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6 trans
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3766,7 +3766,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-7 trans
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4109,7 +4109,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-8 trans
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4455,7 +4455,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-9 trans
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4635,7 +4635,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-10 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4812,7 +4812,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-11 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4992,7 +4992,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-12 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5270,10 +5270,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -5294,7 +5294,7 @@ crn INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 trans
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5364,7 +5364,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3 trans
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5443,7 +5443,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4 trans
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5670,10 +5670,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -5694,7 +5694,7 @@ c_1_n INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5706,7 +5706,7 @@ c_2_n INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5718,7 +5718,7 @@ c_3_n INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4 trans
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5788,7 +5788,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5 trans
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5858,7 +5858,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6 trans
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5928,7 +5928,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-7 trans
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -6118,7 +6118,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-8 trans
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -6308,10 +6308,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -6332,7 +6332,7 @@ c3 VARCHAR(60)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 trans
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+diff --git a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_myisam.res=
ult b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_myisam.result
+index 630a9f1d..76c60182 100644
+--- a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_myisam.result
++++ b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_myisam.result
+@@ -2259,10 +2259,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -2367,7 +2367,7 @@ crn INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2552,7 +2552,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -2736,7 +2736,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3086,7 +3086,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3428,7 +3428,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -3775,7 +3775,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4120,7 +4120,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4468,7 +4468,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4650,7 +4650,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -4829,7 +4829,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-11
+-/*!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5011,7 +5011,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-12
+-/*!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5291,10 +5291,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -5315,7 +5315,7 @@ crn INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5387,7 +5387,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5468,7 +5468,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5697,10 +5697,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -5721,7 +5721,7 @@ c_1_n INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5733,7 +5733,7 @@ c_2_n INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -5745,7 +5745,7 @@ c_3_n INT -- row number
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5817,7 +5817,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5889,7 +5889,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -5961,7 +5961,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -6153,7 +6153,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -6345,10 +6345,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -6369,7 +6369,7 @@ c3 VARCHAR(60)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+diff --git a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_trans.resu=
lt b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_trans.result
+index 748b92df..9e47124b 100644
+--- a/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_trans.result
++++ b/mysql-test/suite/binlog/r/binlog_mysqlbinlog_row_trans.result
+@@ -137,10 +137,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -160,7 +160,7 @@ c2 VARCHAR(20)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -171,7 +171,7 @@ c2 VARCHAR(20)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3 trans
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -240,7 +240,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -248,7 +248,7 @@ TRUNCATE TABLE t1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -256,7 +256,7 @@ TRUNCATE TABLE t1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -286,7 +286,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -325,7 +325,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -347,7 +347,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-9 trans
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -416,7 +416,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-10 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -424,7 +424,7 @@ TRUNCATE TABLE t1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-11 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -432,7 +432,7 @@ TRUNCATE TABLE t2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-12
+-/*!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -462,7 +462,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-13
+-/*!100001 SET @@session.gtid_seq_no=3D13*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D13*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -501,7 +501,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-14
+-/*!100001 SET @@session.gtid_seq_no=3D14*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D14*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -523,7 +523,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-15 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D15*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D15*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -531,7 +531,7 @@ TRUNCATE TABLE t1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-16 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D16*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D16*//*!*/;
+ # at #
+ #010909  4:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+diff --git a/mysql-test/suite/binlog/r/binlog_row_annotate.result b/mysq=
l-test/suite/binlog/r/binlog_row_annotate.result
+index ffdb31cd..65db6e9d 100644
+--- a/mysql-test/suite/binlog/r/binlog_row_annotate.result
++++ b/mysql-test/suite/binlog/r/binlog_row_annotate.result
+@@ -108,10 +108,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -127,7 +127,7 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -135,7 +135,7 @@ CREATE DATABASE test2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -143,7 +143,7 @@ CREATE DATABASE test3
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -170,7 +170,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -197,7 +197,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -224,7 +224,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -266,7 +266,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -293,7 +293,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -346,10 +346,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -365,15 +365,15 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -400,7 +400,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -413,7 +413,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -426,7 +426,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -456,7 +456,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -469,7 +469,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -505,10 +505,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -524,7 +524,7 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -532,7 +532,7 @@ CREATE DATABASE test2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -540,7 +540,7 @@ CREATE DATABASE test3
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -565,7 +565,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -590,7 +590,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -615,7 +615,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -653,7 +653,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -678,7 +678,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -731,10 +731,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -750,7 +750,7 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -758,7 +758,7 @@ CREATE DATABASE test2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -766,7 +766,7 @@ CREATE DATABASE test3
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -793,7 +793,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -820,7 +820,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -847,7 +847,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -889,7 +889,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -916,7 +916,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -969,10 +969,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -988,15 +988,15 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1023,7 +1023,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1036,7 +1036,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1049,7 +1049,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1079,7 +1079,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1092,7 +1092,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1128,10 +1128,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1147,7 +1147,7 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1155,7 +1155,7 @@ CREATE DATABASE test2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -1163,7 +1163,7 @@ CREATE DATABASE test3
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1187,7 +1187,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1211,7 +1211,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1235,7 +1235,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1272,7 +1272,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -1296,7 +1296,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+diff --git a/mysql-test/suite/binlog/r/binlog_row_ctype_ucs.result b/mys=
ql-test/suite/binlog/r/binlog_row_ctype_ucs.result
+index 74aef814..856972e3 100644
+--- a/mysql-test/suite/binlog/r/binlog_row_ctype_ucs.result
++++ b/mysql-test/suite/binlog/r/binlog_row_ctype_ucs.result
+@@ -83,10 +83,10 @@ DELIMITER /*!*/;
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000003
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-# ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D#*//*!*/;
+-/*!100001 SET @@session.server_id=3D#*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D#*//*!*/;
++/*M!100001 SET @@session.server_id=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -103,7 +103,7 @@ CREATE TABLE t1 (a VARCHAR(10) CHARACTER SET utf8)
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -124,7 +124,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -145,7 +145,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -166,7 +166,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -187,7 +187,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -208,7 +208,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -229,7 +229,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-# ddl
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3DXXX/*!*/;
+diff --git a/mysql-test/suite/binlog/r/binlog_row_mysqlbinlog_options.re=
sult b/mysql-test/suite/binlog/r/binlog_row_mysqlbinlog_options.result
+index dc7750b9..aa539369 100644
+--- a/mysql-test/suite/binlog/r/binlog_row_mysqlbinlog_options.result
++++ b/mysql-test/suite/binlog/r/binlog_row_mysqlbinlog_options.result
+@@ -41,10 +41,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ use `new_test1`/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+@@ -61,7 +61,7 @@ CREATE TABLE t1 (a INT, b INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-2
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -87,7 +87,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test2`/*!*/;
+@@ -96,7 +96,7 @@ CREATE TABLE t2 (a INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -120,7 +120,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -142,7 +142,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-6 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ # at #
+ use `new_test3`/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+@@ -151,7 +151,7 @@ CREATE TABLE t3 (a INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -175,7 +175,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -197,7 +197,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -236,7 +236,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -282,10 +282,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ use `new_test1`/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+@@ -302,7 +302,7 @@ CREATE TABLE t1 (a INT, b INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-2
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -328,7 +328,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test2`/*!*/;
+@@ -337,7 +337,7 @@ CREATE TABLE t2 (a INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -361,7 +361,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -383,7 +383,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-6 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ # at #
+ use `new_test3`/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+@@ -392,7 +392,7 @@ CREATE TABLE t3 (a INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -416,7 +416,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -438,7 +438,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -477,7 +477,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-10
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+diff --git a/mysql-test/suite/binlog/r/binlog_stm_ctype_ucs.result b/mys=
ql-test/suite/binlog/r/binlog_stm_ctype_ucs.result
+index e449025e..2a7236e7 100644
+--- a/mysql-test/suite/binlog/r/binlog_stm_ctype_ucs.result
++++ b/mysql-test/suite/binlog/r/binlog_stm_ctype_ucs.result
+@@ -85,10 +85,10 @@ DELIMITER /*!*/;
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000003
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-# ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D#*//*!*/;
+-/*!100001 SET @@session.server_id=3D#*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D#*//*!*/;
++/*M!100001 SET @@session.server_id=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -105,7 +105,7 @@ CREATE TABLE t1 (a VARCHAR(10) CHARACTER SET utf8)
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -120,7 +120,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -135,7 +135,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -150,7 +150,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -165,7 +165,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -180,7 +180,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-#
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -195,7 +195,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	GTID #-#-# ddl
+-/*!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D#*//*!*/;
+ # at #
+ #YYMMDD HH:MM:SS server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3DXXX/*!*/;
+diff --git a/mysql-test/suite/binlog/r/flashback.result b/mysql-test/sui=
te/binlog/r/flashback.result
+index 7d65a8ec..dcedd08e 100644
+--- a/mysql-test/suite/binlog/r/flashback.result
++++ b/mysql-test/suite/binlog/r/flashback.result
+@@ -51,10 +51,10 @@ ROLLBACK/*!*/;
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t master-bin.000001
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -80,7 +80,7 @@ c08 TEXT
+ /*!*/;
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-2 trans
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -106,7 +106,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-3 trans
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -132,7 +132,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-4 trans
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -158,7 +158,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-5 trans
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -212,7 +212,7 @@ START TRANSACTION
+ COMMIT/*!*/;
+ # at #
+ #010909  9:46:40 server id 1  end_log_pos # CRC32 XXX 	GTID 0-1-6 trans
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+diff --git a/mysql-test/suite/binlog_encryption/binlog_row_annotate.resu=
lt b/mysql-test/suite/binlog_encryption/binlog_row_annotate.result
+index 80b9c5d4..9516f230 100644
+--- a/mysql-test/suite/binlog_encryption/binlog_row_annotate.result
++++ b/mysql-test/suite/binlog_encryption/binlog_row_annotate.result
+@@ -112,10 +112,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -131,7 +131,7 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -139,7 +139,7 @@ CREATE DATABASE test2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -147,7 +147,7 @@ CREATE DATABASE test3
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -174,7 +174,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -201,7 +201,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -228,7 +228,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -270,7 +270,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -297,7 +297,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -353,10 +353,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -372,15 +372,15 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -407,7 +407,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -420,7 +420,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -433,7 +433,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -463,7 +463,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -476,7 +476,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -515,10 +515,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # 	Binlog checkpoint master-b=
in.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -534,7 +534,7 @@ CREATE DATABASE test1
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -542,7 +542,7 @@ CREATE DATABASE test2
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-3 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	Query	thread_id=3D#	exec_t=
ime=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -550,7 +550,7 @@ CREATE DATABASE test3
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-4
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -574,7 +574,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-5
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -598,7 +598,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-6
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -622,7 +622,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-7
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -659,7 +659,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-8
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -683,7 +683,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # 	GTID 0-1-9
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+diff --git a/mysql-test/suite/compat/oracle/r/column_compression.result =
b/mysql-test/suite/compat/oracle/r/column_compression.result
+index 2709fe04..ab11e364 100644
+--- a/mysql-test/suite/compat/oracle/r/column_compression.result
++++ b/mysql-test/suite/compat/oracle/r/column_compression.result
+@@ -24,10 +24,10 @@ d TINYTEXT COMPRESSED BINARY
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb4 COLLATE utf=
8mb4_bin DEFAULT NULL CHECK (json_valid("a")),
+-  "b" varchar(1000) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE=
 latin1_bin DEFAULT NULL,
+-  "c" varchar(1000) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLAT=
E utf8mb3_bin DEFAULT NULL,
+-  "d" tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb4 COLLATE ut=
f8mb4_bin DEFAULT NULL CHECK (json_valid("a")),
++  "b" varchar(1000) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLAT=
E latin1_bin DEFAULT NULL,
++  "c" varchar(1000) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLA=
TE utf8mb3_bin DEFAULT NULL,
++  "d" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -41,49 +41,49 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varbinary(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs=
2_general_ci DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE uc=
s2_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -94,35 +94,35 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BYTE DEFAU=
LT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varbinary(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED CHARACTER SET utf8 DEFAULT ''=
);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED CHARACTER SET utf8 GENERATED =
ALWAYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -134,7 +134,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) ASCII COMPRESSED);
+@@ -143,7 +143,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) BYTE COMPRESSED);
+@@ -152,7 +152,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varbinary(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -192,49 +192,49 @@ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varbinary(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs=
2_general_ci DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE uc=
s2_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -245,35 +245,35 @@ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED BYTE DE=
FAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varbinary(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED CHARACTER SET utf8 DEFAULT '=
');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) COMPRESSED CHARACTER SET utf8 GENERATED=
 ALWAYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -285,7 +285,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE =
latin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) ASCII COMPRESSED);
+@@ -294,7 +294,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR2(10) BYTE COMPRESSED);
+@@ -303,7 +303,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varbinary(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varbinary(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -343,49 +343,49 @@ CREATE TABLE t1 (a TINYTEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_g=
eneral_ci DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_=
general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -396,35 +396,35 @@ CREATE TABLE t1 (a TINYTEXT COMPRESSED BYTE DEFAUL=
T '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT ''
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" tinytext /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED CHARACTER SET utf8 DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT ''
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT COMPRESSED CHARACTER SET utf8 GENERATED ALW=
AYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -436,7 +436,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT ASCII COMPRESSED);
+@@ -445,7 +445,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinytext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinytext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYTEXT BYTE COMPRESSED);
+@@ -454,7 +454,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -494,49 +494,49 @@ CREATE TABLE t1 (a TEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" blob(65535) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" blob(65535) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gener=
al_ci DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_gene=
ral_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb3=
_general_ci DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb=
3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -547,35 +547,35 @@ CREATE TABLE t1 (a TEXT COMPRESSED BYTE DEFAULT ''=
);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" blob(65535) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" blob(65535) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT ''
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" text /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED CHARACTER SET utf8 DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb3=
_general_ci DEFAULT ''
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb=
3_general_ci DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT COMPRESSED CHARACTER SET utf8 GENERATED ALWAYS =
AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb3=
_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf8mb=
3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -587,7 +587,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_b=
in DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE latin1_=
bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT ASCII COMPRESSED);
+@@ -596,7 +596,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" text /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" text /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TEXT BYTE COMPRESSED);
+@@ -605,7 +605,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" blob(65535) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" blob(65535) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -645,49 +645,49 @@ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2=
_general_ci DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs=
2_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE u=
tf8mb3_general_ci DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -698,35 +698,35 @@ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BYTE DEFA=
ULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT ''
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" mediumtext /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED CHARACTER SET utf8 DEFAULT '')=
;
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE u=
tf8mb3_general_ci DEFAULT ''
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT COMPRESSED CHARACTER SET utf8 GENERATED A=
LWAYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE u=
tf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -738,7 +738,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE la=
tin1_bin DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE l=
atin1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT ASCII COMPRESSED);
+@@ -747,7 +747,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMTEXT BYTE COMPRESSED);
+@@ -756,7 +756,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -796,49 +796,49 @@ CREATE TABLE t1 (a LONGTEXT COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BINARY);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BINARY ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BYTE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED ASCII);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED UNICODE);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_g=
eneral_ci DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET ucs2 COLLATE ucs2_=
general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED CHARACTER SET utf8);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -849,35 +849,35 @@ CREATE TABLE t1 (a LONGTEXT COMPRESSED BYTE DEFAUL=
T '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED BINARY DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT ''
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED ASCII DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" longtext /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED CHARACTER SET utf8 DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci DEFAULT ''
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT COMPRESSED CHARACTER SET utf8 GENERATED ALW=
AYS AS (REPEAT('a',100)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE utf=
8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE ut=
f8mb3_general_ci GENERATED ALWAYS AS (repeat('a',100)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -889,7 +889,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lati=
n1_bin DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ CHARACTER SET latin1 COLLATE lat=
in1_bin DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT ASCII COMPRESSED);
+@@ -898,7 +898,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longtext /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longtext /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGTEXT BYTE COMPRESSED);
+@@ -907,7 +907,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -949,7 +949,7 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -960,21 +960,21 @@ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED DEFAULT =
'');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) COMPRESSED GENERATED ALWAYS AS (REPEAT('=
a',10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a=
',10)) VIRTUAL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('=
a',10)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -986,7 +986,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a VARCHAR(10) NULL COMPRESSED);
+@@ -995,7 +995,7 @@ Warning	1287	'<data type> <character set clause> ...=
 COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1024,7 +1024,7 @@ CREATE TABLE t1 (a TINYBLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1035,21 +1035,21 @@ CREATE TABLE t1 (a TINYBLOB COMPRESSED DEFAULT '=
');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYBLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYBLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a',=
10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',1=
0)) VIRTUAL
++  "a" tinyblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',=
10)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -1061,7 +1061,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a TINYBLOB NULL COMPRESSED);
+@@ -1070,7 +1070,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" tinyblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" tinyblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1099,7 +1099,7 @@ CREATE TABLE t1 (a BLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1110,21 +1110,21 @@ CREATE TABLE t1 (a BLOB COMPRESSED DEFAULT '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a BLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a BLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a',10))=
);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',1=
0)) VIRTUAL
++  "a" longblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',=
10)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -1136,7 +1136,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a BLOB NULL COMPRESSED);
+@@ -1145,7 +1145,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1174,7 +1174,7 @@ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1185,21 +1185,21 @@ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED DEFAULT=
 '');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMBLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a=
',10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a'=
,10)) VIRTUAL
++  "a" mediumblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a=
',10)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -1211,7 +1211,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a MEDIUMBLOB NULL COMPRESSED);
+@@ -1220,7 +1220,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" mediumblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" mediumblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1249,7 +1249,7 @@ CREATE TABLE t1 (a LONGBLOB COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1260,21 +1260,21 @@ CREATE TABLE t1 (a LONGBLOB COMPRESSED DEFAULT '=
');
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGBLOB COMPRESSED NULL);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGBLOB COMPRESSED GENERATED ALWAYS AS (REPEAT('a',=
10)));
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',1=
0)) VIRTUAL
++  "a" longblob /*M!100301 COMPRESSED*/ GENERATED ALWAYS AS (repeat('a',=
10)) VIRTUAL
+ )
+ DROP TABLE t1;
+ #
+@@ -1286,7 +1286,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT ''
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT ''
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a LONGBLOB NULL COMPRESSED);
+@@ -1295,7 +1295,7 @@ Warning	1287	'<data type> <character set clause> .=
.. COMPRESSED...' is deprecate
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" longblob /*!100301 COMPRESSED*/ DEFAULT NULL
++  "a" longblob /*M!100301 COMPRESSED*/ DEFAULT NULL
+ )
+ DROP TABLE t1;
+ #
+@@ -1324,7 +1324,7 @@ CREATE TABLE t1 (a NVARCHAR(10) COMPRESSED);
+ SHOW CREATE TABLE t1;
+ Table	Create Table
+ t1	CREATE TABLE "t1" (
+-  "a" varchar(10) /*!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE =
utf8mb3_general_ci DEFAULT NULL
++  "a" varchar(10) /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb3 COLLATE=
 utf8mb3_general_ci DEFAULT NULL
+ )
+ DROP TABLE t1;
+ CREATE TABLE t1 (a NVARCHAR(10) COMPRESSED BINARY COMPRESSED);
+diff --git a/mysql-test/suite/rpl/r/rpl_blackhole_row_annotate.result b/=
mysql-test/suite/rpl/r/rpl_blackhole_row_annotate.result
+index 53420891..61626138 100644
+--- a/mysql-test/suite/rpl/r/rpl_blackhole_row_annotate.result
++++ b/mysql-test/suite/rpl/r/rpl_blackhole_row_annotate.result
+@@ -191,10 +191,10 @@ ROLLBACK/*!*/;
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Binlog checkpoin=
t slave-bin.000001
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-1 ddl
+-/*!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
+-/*!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
++/*M!100101 SET @@session.skip_parallel_replication=3D0*//*!*/;
++/*M!100001 SET @@session.gtid_domain_id=3D0*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D1*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ use `test`/*!*/;
+@@ -211,7 +211,7 @@ CREATE TABLE t1 (a INT, b INT, c INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-2 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D2*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -219,8 +219,8 @@ CREATE TABLE t2 (a INT, b INT, c INT)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-2-3 ddl
+-/*!100001 SET @@session.server_id=3D2*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.server_id=3D2*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -228,8 +228,8 @@ ALTER TABLE t1 ENGINE=3DBLACKHOLE
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-3 trans
+-/*!100001 SET @@session.server_id=3D1*//*!*/;
+-/*!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
++/*M!100001 SET @@session.server_id=3D1*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D3*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -247,7 +247,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-4 trans
+-/*!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D4*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -265,7 +265,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-5 trans
+-/*!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D5*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -283,7 +283,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-6 trans
+-/*!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D6*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -301,7 +301,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-7 trans
+-/*!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D7*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -319,7 +319,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-8 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D8*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -327,7 +327,7 @@ ALTER TABLE t1 ADD PRIMARY KEY pk_t1 (a,b)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-9 trans
+-/*!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D9*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -345,7 +345,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-10 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D10*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -363,7 +363,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-11 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D11*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -381,7 +381,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-12 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D12*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+@@ -389,7 +389,7 @@ ALTER TABLE t1 DROP PRIMARY KEY, ADD KEY key_t1 (a)
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-13 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D13*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D13*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -407,7 +407,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-14 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D14*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D14*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -425,7 +425,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-15 tran=
s
+-/*!100001 SET @@session.gtid_seq_no=3D15*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D15*//*!*/;
+ START TRANSACTION
+ /*!*/;
+ # at #
+@@ -443,7 +443,7 @@ COMMIT
+ /*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	GTID 0-1-16 ddl
+-/*!100001 SET @@session.gtid_seq_no=3D16*//*!*/;
++/*M!100001 SET @@session.gtid_seq_no=3D16*//*!*/;
+ # at #
+ #010909  4:46:40 server id #  end_log_pos # CRC32 XXX 	Query	thread_id=3D=
#	exec_time=3D#	error_code=3D0	xid=3D<xid>
+ SET TIMESTAMP=3D1000000000/*!*/;
+diff --git a/sql/field.h b/sql/field.h
+index a311f8f9..508e677e 100644
+--- a/sql/field.h
++++ b/sql/field.h
+@@ -4261,7 +4261,7 @@ class Field_varstring_compressed final :public Fie=
ld_varstring {
+   void sql_type(String &str) const override
+   {
+     Field_varstring::sql_type(str);
+-    str.append(STRING_WITH_LEN(" /*!100301 COMPRESSED*/"));
++    str.append(STRING_WITH_LEN(" /*M!100301 COMPRESSED*/"));
+   }
+   uint32 max_display_length() const override { return field_length - 1;=
 }
+   uint32 character_octet_length() const override { return field_length =
- 1; }
+@@ -4697,7 +4697,7 @@ class Field_blob_compressed final :public Field_bl=
ob {
+   void sql_type(String &str) const override
+   {
+     Field_blob::sql_type(str);
+-    str.append(STRING_WITH_LEN(" /*!100301 COMPRESSED*/"));
++    str.append(STRING_WITH_LEN(" /*M!100301 COMPRESSED*/"));
+   }
+=20
+   /*
+diff --git a/sql/log_event_client.cc b/sql/log_event_client.cc
+index 89a5387d..cf40aae0 100644
+--- a/sql/log_event_client.cc
++++ b/sql/log_event_client.cc
+@@ -3871,7 +3871,7 @@ Gtid_log_event::print(FILE *file, PRINT_EVENT_INFO=
 *print_event_info)
+         print_event_info->allow_parallel !=3D !!(flags2 & FL_ALLOW_PARA=
LLEL))
+     {
+       if (my_b_printf(&cache,
+-                  "/*!100101 SET @@session.skip_parallel_replication=3D=
%u*/%s\n",
++                  "/*M!100101 SET @@session.skip_parallel_replication=3D=
%u*/%s\n",
+                       !(flags2 & FL_ALLOW_PARALLEL),
+                       print_event_info->delimiter))
+         goto err;
+@@ -3883,7 +3883,7 @@ Gtid_log_event::print(FILE *file, PRINT_EVENT_INFO=
 *print_event_info)
+         print_event_info->domain_id !=3D domain_id)
+     {
+       if (my_b_printf(&cache,
+-                      "/*!100001 SET @@session.gtid_domain_id=3D%u*/%s\=
n",
++                      "/*M!100001 SET @@session.gtid_domain_id=3D%u*/%s=
\n",
+                       domain_id, print_event_info->delimiter))
+         goto err;
+       print_event_info->domain_id=3D domain_id;
+@@ -3893,7 +3893,7 @@ Gtid_log_event::print(FILE *file, PRINT_EVENT_INFO=
 *print_event_info)
+     if (!print_event_info->server_id_printed ||
+         print_event_info->server_id !=3D server_id)
+     {
+-      if (my_b_printf(&cache, "/*!100001 SET @@session.server_id=3D%u*/=
%s\n",
++      if (my_b_printf(&cache, "/*M!100001 SET @@session.server_id=3D%u*=
/%s\n",
+                       server_id, print_event_info->delimiter))
+         goto err;
+       print_event_info->server_id=3D server_id;
+@@ -3901,7 +3901,7 @@ Gtid_log_event::print(FILE *file, PRINT_EVENT_INFO=
 *print_event_info)
+     }
+=20
+     if (!is_flashback)
+-      if (my_b_printf(&cache, "/*!100001 SET @@session.gtid_seq_no=3D%s=
*/%s\n",
++      if (my_b_printf(&cache, "/*M!100001 SET @@session.gtid_seq_no=3D%=
s*/%s\n",
+                       buf, print_event_info->delimiter))
+         goto err;
+   }
+--=20
+2.40.0
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0005.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0005.patch
new file mode 100644
index 0000000000..91b84acb16
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0005.patch
@@ -0,0 +1,1431 @@
+From d20518168aff435a4843eebb108e5b9df24c19fb Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Mon, 17 Jun 2024 15:54:30 +0200
+Subject: [PATCH] also protect the /*!999999 sandbox comment
+
+CVE: CVE-2024-21096
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/d205=
18168aff435a4843eebb108e5b9df24c19fb]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ client/mysqldump.c                            |   2 +-
+ mysql-test/main/ddl_i18n_koi8r.result         |  10 +-
+ mysql-test/main/ddl_i18n_utf8.result          |  12 +-
+ mysql-test/main/lock_view.result              |   4 +-
+ mysql-test/main/mysql.result                  |   4 +-
+ mysql-test/main/mysqldump-compat-102.result   |   2 +-
+ mysql-test/main/mysqldump-max.result          |   4 +-
+ mysql-test/main/mysqldump-nl.result           |   4 +-
+ mysql-test/main/mysqldump-no-binlog.result    |   2 +-
+ mysql-test/main/mysqldump-system.result       |   6 +-
+ mysql-test/main/mysqldump-timing.result       |   4 +-
+ mysql-test/main/mysqldump-utf8mb4.result      |   2 +-
+ mysql-test/main/mysqldump.result              | 201 +++++++++---------
+ mysql-test/main/openssl_1.result              |   6 +-
+ mysql-test/main/plugin_auth.result            |   2 +-
+ mysql-test/main/rpl_mysqldump_slave.result    |  18 +-
+ mysql-test/main/trigger_wl3253.result         |   4 +-
+ .../suite/archive/archive_bitfield.result     |   2 +-
+ .../oracle/r/sp-package-mysqldump.result      |   2 +-
+ mysql-test/suite/federated/federatedx.result  |   2 +-
+ mysql-test/suite/roles/definer.result         |   2 +-
+ mysql-test/suite/s3/mysqldump.result          |   4 +-
+ .../suite/sql_sequence/mysqldump.result       |  10 +-
+ .../connect/mysql-test/connect/r/mysql.result |   2 +-
+ 24 files changed, 157 insertions(+), 154 deletions(-)
+
+diff --git a/client/mysqldump.c b/client/mysqldump.c
+index 9502227a..767413b1 100644
+--- a/client/mysqldump.c
++++ b/client/mysqldump.c
+@@ -764,7 +764,7 @@ static void write_header(FILE *sql_file, const char =
*db_name)
+   }
+   else
+   {
+-    fprintf(sql_file, "/*!999999\\- enable the sandbox mode */ \n");
++    fprintf(sql_file, "/*M!999999\\- enable the sandbox mode */ \n");
+      if (!opt_compact)
+      {
+        print_comment(sql_file, 0,
+diff --git a/mysql-test/main/ddl_i18n_koi8r.result b/mysql-test/main/ddl=
_i18n_koi8r.result
+index 39bc4d4a..3b31fba7 100644
+--- a/mysql-test/main/ddl_i18n_koi8r.result
++++ b/mysql-test/main/ddl_i18n_koi8r.result
+@@ -719,7 +719,7 @@ ca	cb
+ utf8mb3_general_ci	utf8mb3_general_ci
+=20
+ ---> Dump of mysqltest1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -796,7 +796,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 COLL=
ATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_koi8r.sp.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1725,7 +1725,7 @@ koi8r_general_ci	utf8mb3_general_ci	koi8r_general_=
ci	koi8r_general_ci	utf8mb3_ge
+ DELETE FROM mysqltest2.log|
+=20
+ ---> Dump of mysqltest1
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1808,7 +1808,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 CO=
LLATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_koi8r.triggers.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -2495,7 +2495,7 @@ COLLATION( '
+ END	ONE TIME	1970-01-02 00:00:00	NULL	NULL		NULL	NULL	DISABLED	PRESERVE=
	CREATED	LAST_ALTERED	NULL		1	koi8r	koi8r_general_ci	utf8mb3_unicode_ci
+=20
+ ---> Dump of mysqltest1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+diff --git a/mysql-test/main/ddl_i18n_utf8.result b/mysql-test/main/ddl_=
i18n_utf8.result
+index 33ec6e6e..c2bc4980 100644
+--- a/mysql-test/main/ddl_i18n_utf8.result
++++ b/mysql-test/main/ddl_i18n_utf8.result
+@@ -719,7 +719,7 @@ ca	cb
+ utf8mb3_general_ci	utf8mb3_general_ci
+=20
+ ---> Dump of mysqltest1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -796,7 +796,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 COLL=
ATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_utf8sp.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1725,7 +1725,7 @@ utf8mb3_general_ci	utf8mb3_general_ci	koi8r_genera=
l_ci	utf8mb3_general_ci	utf8mb
+ DELETE FROM mysqltest2.log|
+=20
+ ---> Dump of mysqltest1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -1808,7 +1808,7 @@ ALTER DATABASE `mysqltest1` CHARACTER SET cp866 CO=
LLATE cp866_general_ci ;
+ ---> Dumping mysqltest1 to ddl_i18n_utf8triggers.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -2495,7 +2495,7 @@ COLLATION(    '=D1=82=D0=B5=D0=BA=D1=81=D1=82') AS=
 c4,
+ END	ONE TIME	1970-01-02 00:00:00	NULL	NULL		NULL	NULL	DISABLED	PRESERVE=
	CREATED	LAST_ALTERED	NULL		1	utf8mb3	utf8mb3_general_ci	utf8mb3_unicode_=
ci
+=20
+ ---> Dump of mysqltest1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+@@ -2563,7 +2563,7 @@ DELIMITER ;
+ ---> Dumping mysqltest1 to ddl_i18n_utf8events.mysqltest1.sql
+=20
+ ---> Dump of mysqltest2
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest2` /*!40100 DEFAULT =
CHARACTER SET cp866 COLLATE cp866_general_ci */;
+=20
+diff --git a/mysql-test/main/lock_view.result b/mysql-test/main/lock_vie=
w.result
+index 04462ce7..8182205e 100644
+--- a/mysql-test/main/lock_view.result
++++ b/mysql-test/main/lock_view.result
+@@ -16,7 +16,7 @@ create definer=3Ddefiner@localhost view mysqltest3.v3i=
s as select schema_name from
+ create definer=3Ddefiner@localhost view mysqltest3.v3ps as select user =
from performance_schema.users where current_connections>0 order by user;
+ create definer=3Ddefiner@localhost view mysqltest3.v3nt as select 1;
+ create definer=3Ddefiner@localhost sql security invoker view mysqltest3=
.v3i as select * from mysqltest1.t1;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest1` /*!40100 DEFAULT =
CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
+=20
+@@ -236,7 +236,7 @@ create view v1 as select * from (select * from t1) d=
t;
+ lock table v1 read;
+ disconnect con1;
+ connection default;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ SET @saved_cs_client     =3D @@character_set_client;
+ SET character_set_client =3D utf8;
+ /*!50001 CREATE VIEW `v1` AS SELECT
+diff --git a/mysql-test/main/mysql.result b/mysql-test/main/mysql.result
+index b983f009..cf0805ef 100644
+--- a/mysql-test/main/mysql.result
++++ b/mysql-test/main/mysql.result
+@@ -552,7 +552,7 @@ Table	Create Table
+ a1\`b1	CREATE TABLE `a1\``b1` (
+   `a` int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `a1\``b1` (
+@@ -584,7 +584,7 @@ Table	Create Table
+ a1\"b1	CREATE TABLE "a1\""b1" (
+   "a" int(11) DEFAULT NULL
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE "a1\""b1" (
+diff --git a/mysql-test/main/mysqldump-compat-102.result b/mysql-test/ma=
in/mysqldump-compat-102.result
+index 35a06d20..656f506f 100644
+--- a/mysql-test/main/mysqldump-compat-102.result
++++ b/mysql-test/main/mysqldump-compat-102.result
+@@ -58,7 +58,7 @@ BEGIN
+ log(0, 'Session ' || connection_id() || ' ' || current_user || ' starte=
d');
+ END;
+ $$
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- MariaDB dump DUMPVERSION  Distrib DISTVERSION, for OS
+ --
+ -- Host: localhost    Database: db1_mdev17429
+diff --git a/mysql-test/main/mysqldump-max.result b/mysql-test/main/mysq=
ldump-max.result
+index 86e8eb07..a006b805 100644
+--- a/mysql-test/main/mysqldump-max.result
++++ b/mysql-test/main/mysqldump-max.result
+@@ -77,7 +77,7 @@ id	name
+ 3	first value
+ 4	first value
+ 5	first value
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -205,7 +205,7 @@ INSERT  IGNORE INTO `t6` VALUES
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump-nl.result b/mysql-test/main/mysql=
dump-nl.result
+index 1cbc23f9..20a68f6a 100644
+--- a/mysql-test/main/mysqldump-nl.result
++++ b/mysql-test/main/mysqldump-nl.result
+@@ -12,7 +12,7 @@ create procedure sp() select * from `v1
+ 1v`;
+ flush tables;
+ use test;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ --
+ -- Current Database: `mysqltest1
+@@ -135,7 +135,7 @@ test\`
+ \! ls
+ #
+ test`
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ --
+ -- Current Database: `test```
+diff --git a/mysql-test/main/mysqldump-no-binlog.result b/mysql-test/mai=
n/mysqldump-no-binlog.result
+index b9dfb223..4ca25f7c 100644
+--- a/mysql-test/main/mysqldump-no-binlog.result
++++ b/mysql-test/main/mysqldump-no-binlog.result
+@@ -1,2 +1,2 @@
+ mariadb-dump: Error: Binlogging on server not active
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+diff --git a/mysql-test/main/mysqldump-system.result b/mysql-test/main/m=
ysqldump-system.result
+index 0b6fe995..5619ec70 100644
+--- a/mysql-test/main/mysqldump-system.result
++++ b/mysql-test/main/mysqldump-system.result
+@@ -39,7 +39,7 @@ CREATE FUNCTION metaphon RETURNS STRING SONAME "UDF_EX=
AMPLE_LIB";
+ #
+ # mysqldump of system tables with --system=3Dall
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -631,7 +631,7 @@ UNLOCK TABLES;
+ #
+ # mysqldump of system tables with --system=3Dall --replace
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1246,7 +1246,7 @@ UNLOCK TABLES;
+ #
+ # mysqldump of system tables with --system=3Dall --insert-ignore
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump-timing.result b/mysql-test/main/m=
ysqldump-timing.result
+index 8ae621e5..3f1840a7 100644
+--- a/mysql-test/main/mysqldump-timing.result
++++ b/mysql-test/main/mysqldump-timing.result
+@@ -7,7 +7,7 @@ CREATE TABLE t1 (i INT);
+ INSERT INTO t1 VALUES (0);
+ LOCK TABLE t1 WRITE;
+ timeout without t1 contents expected
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -31,7 +31,7 @@ SET @save_max_statement_time=3D@@max_statement_time;
+ SET GLOBAL max_statement_time=3D0.1;
+ UNLOCK TABLES;;
+ This would be a race condition otherwise, but default max_statement_tim=
e=3D0 makes it succeed
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump-utf8mb4.result b/mysql-test/main/=
mysqldump-utf8mb4.result
+index e38c8a47..5d07eb06 100644
+--- a/mysql-test/main/mysqldump-utf8mb4.result
++++ b/mysql-test/main/mysqldump-utf8mb4.result
+@@ -32,7 +32,7 @@ Testing XML format output
+ ----
+ Testing text format output
+ ----
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/mysqldump.result b/mysql-test/main/mysqldum=
p.result
+index 2f888ddd..ca9260f1 100644
+--- a/mysql-test/main/mysqldump.result
++++ b/mysql-test/main/mysqldump.result
+@@ -31,7 +31,7 @@ DROP TABLE t1;
+ CREATE TABLE t1 (a decimal(64, 20));
+ INSERT INTO t1 VALUES ("1234567890123456789012345678901234567890"),
+ ("0987654321098765432109876543210987654321");
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -49,7 +49,7 @@ CREATE TABLE t1 (a double);
+ INSERT IGNORE INTO t1 VALUES ('-9e999999');
+ Warnings:
+ Warning	1264	Out of range value for column 'a' at row 1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -72,7 +72,7 @@ INSERT INTO t1 VALUES ('1.2345', 2.3456);
+ INSERT INTO t1 VALUES ("1.2345", 2.3456);
+ ERROR 42S22: Unknown column '1.2345' in 'field list'
+ SET SQL_MODE=3D@OLD_SQL_MODE;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -86,7 +86,7 @@ INSERT INTO `t1` VALUES
+ (1.23450,2.3456),
+ (1.23450,2.3456),
+ (1.23450,2.3456);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -100,7 +100,7 @@ INSERT INTO `t1` VALUES
+ (1.23450,2.3456),
+ (1.23450,2.3456),
+ (1.23450,2.3456);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -141,7 +141,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -223,7 +223,7 @@ DROP TABLE t1;
+ #
+ CREATE TABLE t1 (a  VARCHAR(255)) DEFAULT CHARSET koi8r;
+ INSERT INTO t1  VALUES (_koi8r x'C1C2C3C4C5'), (NULL);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -265,7 +265,7 @@ DROP TABLE t1;
+ #
+ CREATE TABLE t1 (a int) ENGINE=3DMYISAM;
+ INSERT INTO t1 VALUES (1), (2);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -291,7 +291,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -322,7 +322,7 @@ DROP TABLE t1;
+ # Bug#2592 mysqldump doesn't quote "tricky" names correctly
+ #
+ create table ```a` (i int);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE ```a` (
+@@ -334,7 +334,7 @@ drop table ```a`;
+ # Bug#2591 mysqldump quotes names inconsistently
+ #
+ create table t1(a int);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -368,7 +368,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -395,7 +395,7 @@ UNLOCK TABLES;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+ set global sql_mode=3D'ANSI_QUOTES';
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -429,7 +429,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -462,7 +462,7 @@ drop table t1;
+ #
+ create table t1(a int);
+ insert into t1 values (1),(2),(3);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -495,7 +495,7 @@ drop table t1;
+ #
+ # Bug#6101 create database problem
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -522,7 +522,7 @@ USE `test`;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+ create database mysqldump_test_db character set latin2 collate latin2_b=
in;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -557,7 +557,7 @@ drop database mysqldump_test_db;
+ # if it is explicitly set.
+ CREATE TABLE t1 (a  CHAR(10));
+ INSERT INTO t1  VALUES (_latin1 '=C4=D6=DC=DF');
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -600,7 +600,7 @@ UNLOCK TABLES;
+ # If the future we can move this command into a separate test with
+ # checking that "mysqldump" is compiled with "latin1"
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -625,7 +625,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -650,7 +650,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -683,7 +683,7 @@ CREATE TABLE t1 (a int);
+ CREATE TABLE t2 (a int);
+ INSERT INTO t1 VALUES (1),(2),(3);
+ INSERT INTO t2 VALUES (4),(5),(6);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -728,7 +728,7 @@ DROP TABLE t2;
+ #
+ CREATE TABLE t1 (`b` blob);
+ INSERT INTO `t1` VALUES (0x602010000280100005E71A);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -770,7 +770,7 @@ DROP TABLE t1;
+ CREATE TABLE t1 (a INT) ENGINE=3DMyISAM;
+ INSERT INTO t1 VALUES (1),(2),(3);
+ INSERT INTO t1 VALUES (4),(5),(6);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -811,7 +811,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1187,7 +1187,7 @@ F_cd00692c3bfe59267d5ecfac5310286c int,
+ F_6faa8040da20ef399b63a72d0e4ab575 int,
+ F_fe73f687e5bc5280214e0486b273a5f9 int);
+ insert into t1 (F_8d3bba7425e7c98c50f52ca1b52d3735) values (1);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1557,7 +1557,7 @@ drop table t1;
+ #
+ CREATE TABLE t1 (a int);
+ INSERT INTO t1 VALUES (1),(2),(3);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1611,7 +1611,7 @@ CREATE TABLE t1 ( a INT );
+ CREATE TABLE t2 ( a INT );
+ INSERT INTO t1 VALUES (1), (2);
+ INSERT INTO t2 VALUES (1), (2);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1647,7 +1647,7 @@ CREATE TABLE `t2` (
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1720,35 +1720,35 @@ create table t3(a varchar(30) primary key, b int=
 not null);
+ test_sequence
+ ------ Testing with illegal table names ------
+ mariadb-dump: Couldn't find table: "\d-2-1.sql"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "\t1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "\t1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "\\t1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "t\1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "t\1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "t/1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T_1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T%1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T'1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T_1"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't find table: "T_"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ test_sequence
+ ------ Testing with illegal database names ------
+ mariadb-dump: Got error: 1049: "Unknown database 'mysqldump_test_d'" wh=
en selecting the database
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Got error: 1049: "Unknown database 'mysqld\ump_test_db'" =
when selecting the database
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ drop table t1, t2, t3;
+ drop database mysqldump_test_db;
+ use test;
+@@ -1810,7 +1810,7 @@ insert into t2 (a, b) values (NULL, NULL),(10, NUL=
L),(NULL, "twenty"),(30, "thir
+ 	</table_data>
+ </database>
+ </mysqldump>
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1849,7 +1849,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -1975,7 +1975,7 @@ create table t1(a int);
+ create table t2(a int);
+ create table t3(a int);
+ mariadb-dump: Couldn't find table: "non_existing"
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2025,7 +2025,7 @@ drop table t1, t2, t3;
+ create table t1 (a int);
+ mariadb-dump: Couldn't execute 'SELECT /*!40001 SQL_NO_CACHE */ `a` FRO=
M `t1` WHERE xx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx': You have=
 an error in your SQL syntax; check the manual that corresponds to your M=
ariaDB server version for the right syntax to use near 'xxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxx' at line 1 (1064)
+ mariadb-dump: Got error: 1064: "You have an error in your SQL syntax; c=
heck the manual that corresponds to your MariaDB server version for the r=
ight syntax to use near 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' =
at line 1" when retrieving data from server
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2067,7 +2067,7 @@ CREATE TABLE `t1` (
+ PRIMARY KEY (`a b`, `c"d`, `e``f`)
+ ) ENGINE=3DMyISAM DEFAULT CHARSET=3Dlatin1;
+ insert into t1 values (0815, 4711, 2006);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -2098,7 +2098,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2154,7 +2154,7 @@ INSERT INTO t2 VALUES ('bingo');
+ INSERT INTO t2 VALUES ('waffle');
+ INSERT INTO t2 VALUES ('lemon');
+ create view v2 as select * from t2 where a like 'a%' with check option;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2254,7 +2254,7 @@ drop database db1;
+ use test;
+ create table t1(a int);
+ create view v1 as select * from t1;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2325,7 +2325,7 @@ INSERT INTO t2 VALUES ('bingo');
+ INSERT INTO t2 VALUES ('waffle');
+ INSERT INTO t2 VALUES ('lemon');
+ create view v2 as select * from t2 where a like 'a%' with check option;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2396,7 +2396,7 @@ use test;
+ #
+ CREATE TABLE t1 (a char(10));
+ INSERT INTO t1 VALUES ('\'');
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2444,7 +2444,7 @@ create  view v1 as
+ select * from v3 where b in (1, 2, 3, 4, 5, 6, 7);
+ create  view v2 as
+ select v3.a from v3, v1 where v1.a=3Dv3.a and v3.b=3D3 limit 1;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2597,7 +2597,7 @@ end if;
+ end	AFTER	0000-00-00 00:00:00	STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_=
ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_=
CREATE_USER,NO_ENGINE_SUBSTITUTION	root@localhost	latin1	latin1_swedish_c=
i	latin1_swedish_ci
+ INSERT INTO t1 (a) VALUES (1),(2),(3),(22);
+ update t1 set a =3D 4 where a=3D3;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2731,7 +2731,7 @@ DELIMITER ;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -2883,7 +2883,7 @@ Warning	1287	'<select expression> INTO <destinatio=
n>;' is deprecated and will be
+ set sql_mode=3D'ansi';
+ create procedure `a'b` () select 1;
+ set sql_mode=3D'';
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3040,7 +3040,7 @@ d
+ 2003-10-26 02:00:00
+ 2003-10-26 02:00:00
+ set global time_zone=3D'Europe/Moscow';
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3082,7 +3082,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3145,7 +3145,7 @@ a2
+ 1
+ 2
+ 3
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -3226,7 +3226,7 @@ a	b	c
+ 1	first value	xxxx
+ 2	second value	tttt
+ 3	third value	vvv vvv
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3355,7 +3355,7 @@ BEGIN
+ SET new.a =3D 0;
+ END|
+ SET SQL_MODE =3D @old_sql_mode;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3419,7 +3419,7 @@ DROP TABLE t1;
+ #
+ create table t1 (a binary(1), b blob);
+ insert into t1 values ('','');
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3455,7 +3455,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3556,7 +3556,7 @@ insert into t values(5, 51);
+ create view v1 as select qty, price, qty*price as value from t;
+ create view v2 as select qty from v1;
+ mysqldump {
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!50001 DROP VIEW IF EXISTS `v1`*/;
+ /*!50001 SET @saved_cs_client          =3D @@character_set_client */;
+ /*!50001 SET @saved_cs_results         =3D @@character_set_results */;
+@@ -3572,7 +3572,7 @@ mysqldump {
+ /*!50001 SET collation_connection      =3D @saved_col_connection */;
+=20
+ } mysqldump {
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!50001 DROP VIEW IF EXISTS `v2`*/;
+ /*!50001 SET @saved_cs_client          =3D @@character_set_client */;
+ /*!50001 SET @saved_cs_results         =3D @@character_set_results */;
+@@ -3618,7 +3618,7 @@ drop table t1;
+ mysqldump {
+ mariadb-dump: Got error: 1356: "View 'test.v1' references invalid table=
(s) or column(s) or function(s) or definer/invoker of view lack rights to=
 use them" when using LOCK TABLES
+ mariadb-dump: Couldn't execute 'SHOW FIELDS FROM `v1`': View 'test.v1' =
references invalid table(s) or column(s) or function(s) or definer/invoke=
r of view lack rights to use them (1356)
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ -- failed on view `v1`: CREATE ALGORITHM=3DUNDEFINED DEFINER=3D`root`@`=
localhost` SQL SECURITY DEFINER VIEW `v1` AS select `test`.`t1`.`id` AS `=
id` from `t1`
+=20
+@@ -3635,7 +3635,7 @@ insert into t1 values (1232131);
+ insert into t1 values (4711);
+ insert into t1 values (3231);
+ insert into t1 values (0815);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -3714,7 +3714,7 @@ create table basetable ( id serial, tag varchar(64=
) );
+ create database mysqldump_views;
+ use mysqldump_views;
+ create view nasishnasifu as select mysqldump_tables.basetable.id from m=
ysqldump_tables.basetable;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqldump_tables` /*!40100 DE=
FAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
+=20
+@@ -3799,14 +3799,14 @@ create user mysqltest_1@localhost;
+ create table t1(a int, b varchar(34));
+ reset master;
+ mariadb-dump: Couldn't execute 'FLUSH /*!40101 LOCAL */ TABLES': Access=
 denied; you need (at least one of) the RELOAD privilege(s) for this oper=
ation (1227)
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't execute 'FLUSH /*!40101 LOCAL */ TABLES': Access=
 denied; you need (at least one of) the RELOAD privilege(s) for this oper=
ation (1227)
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ grant RELOAD on *.* to mysqltest_1@localhost;
+ mariadb-dump: Couldn't execute 'SHOW MASTER STATUS': Access denied; you=
 need (at least one of) the SUPER, BINLOG MONITOR privilege(s) for this o=
peration (1227)
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ mariadb-dump: Couldn't execute 'SHOW MASTER STATUS': Access denied; you=
 need (at least one of) the SUPER, BINLOG MONITOR privilege(s) for this o=
peration (1227)
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ grant REPLICATION CLIENT on *.* to mysqltest_1@localhost;
+ drop table t1;
+ drop user mysqltest_1@localhost;
+@@ -3865,7 +3865,7 @@ use test;
+ #
+ # Bug #33762: mysqldump can not dump INFORMATION_SCHEMA
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ DROP TABLE IF EXISTS `TABLES`;
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+@@ -3930,7 +3930,7 @@ DROP TABLE t1;
+ CREATE TABLE t2 (a INT) ENGINE=3DMyISAM;
+ CREATE TABLE t3 (a INT) ENGINE=3DMyISAM;
+ CREATE TABLE t1 (a INT) ENGINE=3Dmerge UNION=3D(t2, t3);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4021,12 +4021,12 @@ connect  user27293,localhost,user1,,mysqldump_te=
st_db,$MASTER_MYPORT,$MASTER_MYS
+ connection user27293;
+ create procedure mysqldump_test_db.sp1() select 'hello';
+ mariadb-dump: user2 has insufficient privileges to SHOW CREATE PROCEDUR=
E `sp1`!
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ -- insufficient privileges to SHOW CREATE PROCEDURE `sp1`
+ -- does user2 have permissions on mysql.proc?
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!50003 SET @saved_sql_mode       =3D @@sql_mode */ ;
+ /*!50003 SET sql_mode              =3D 'STRICT_TRANS_TABLES,ERROR_FOR_D=
IVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
+ /*!50003 SET @saved_cs_client      =3D @@character_set_client */ ;
+@@ -4054,7 +4054,7 @@ drop database mysqldump_test_db;
+ #
+ CREATE TABLE t1 (c1 INT, c2 LONGBLOB);
+ INSERT INTO t1 SET c1=3D11, c2=3DREPEAT('q',509);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -4102,18 +4102,21 @@ DROP TABLE t1,t2;
+ #           "Dump completed on"
+ #
+ # --skip-dump-date:
++/*M!999999\- enable the sandbox mode */
+ --
+=20
+=20
+=20
+ -- Dump completed
+ # --dump-date:
++/*M!999999\- enable the sandbox mode */
+ --
+=20
+=20
+=20
+ -- Dump completed on DATE
+ # --dump-date (default):
++/*M!999999\- enable the sandbox mode */
+ --
+=20
+=20
+@@ -4128,7 +4131,7 @@ use db42635;
+ create table t1 (id int);
+ create view db42635.v1 (c) as select * from db42635.t1;
+ create view db42635.v2 (c) as select * from db42635.t1;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4189,7 +4192,7 @@ drop database db42635;
+ #
+ SET NAMES utf8;
+ CREATE TABLE `stra=C3=9Fe` ( f1 INT );
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4212,7 +4215,7 @@ UNLOCK TABLES;
+ /*!40014 SET UNIQUE_CHECKS=3D@OLD_UNIQUE_CHECKS */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4237,7 +4240,7 @@ UNLOCK TABLES;
+=20
+ DROP TABLE `stra=C3=9Fe`;
+ CREATE TABLE `=D7=9B=D7=93=D7=A9=D7=92=D7=9B=D7=97=D7=9A=D7=9C=D7=93=D7=
=92=D7=9B=D7=97=D7=A9=D7=9A=D7=93=D7=92=D7=97=D7=9B=D7=9A=D7=9C=D7=93=D7=92=
=D7=9B` ( f1 INT );
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4261,7 +4264,7 @@ UNLOCK TABLES;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+ mariadb-dump: Got error: 1146: "Table 'test.???????????????????????' do=
esn't exist" when using LOCK TABLES
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -4278,7 +4281,7 @@ CREATE TABLE t1(a int, b int);
+ INSERT INTO t1 VALUES (1,1);
+ INSERT INTO t1 VALUES (2,3);
+ INSERT INTO t1 VALUES (3,4), (4,5);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4553,7 +4556,7 @@ insert into t1 values (1232131);
+ insert into t1 values (4711);
+ insert into t1 values (3231);
+ insert into t1 values (0815);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -4686,7 +4689,7 @@ CREATE DATABASE test;
+ create database `test-database`;
+ use `test-database`;
+ create table test (a int);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ DROP TABLE IF EXISTS `test`;
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+@@ -4909,7 +4912,7 @@ CREATE TRIGGER `trig` BEFORE INSERT ON `test` FOR =
EACH ROW BEGIN
+ END |
+ ALTER DATABASE `test-database` CHARACTER SET latin1 COLLATE latin1_swed=
ish_ci;
+ ALTER DATABASE `test-database` CHARACTER SET utf8 COLLATE utf8_unicode_=
ci ;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `test` (
+@@ -5393,7 +5396,7 @@ USE test;
+ # Also verify that a prefix of the mode's name is enough.
+ #
+ CREATE TABLE t1 (a INT);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40103 SET @OLD_TIME_ZONE=3D@@TIME_ZONE */;
+ /*!40103 SET TIME_ZONE=3D'+00:00' */;
+ /*!40014 SET @OLD_UNIQUE_CHECKS=3D@@UNIQUE_CHECKS, UNIQUE_CHECKS=3D0 */=
;
+@@ -5626,7 +5629,7 @@ CREATE DATABASE `a\"'``b`;
+ USE `a\"'``b`;
+ CREATE PROCEDURE p1() BEGIN END;
+ ALTER DATABASE `a\"'``b` COLLATE utf8_general_ci;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!50003 SET @saved_sql_mode       =3D @@sql_mode */ ;
+ /*!50003 SET sql_mode              =3D '' */ ;
+ ALTER DATABASE `a\"'``b` CHARACTER SET latin1 COLLATE latin1_swedish_ci=
 ;
+@@ -5675,7 +5678,7 @@ CREATE VIEW nonunique_table_view_name AS SELECT 1;
+=20
+ ##################################################
+ # --compact --databases db1 db2
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db1` /*!40100 DEFAULT CHARACT=
ER SET utf8mb3 COLLATE utf8mb3_general_ci */;
+=20
+@@ -5744,7 +5747,7 @@ USE `db2`;
+ ##################################################
+ # --compact db2
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `nonunique_table_name` (
+@@ -5767,7 +5770,7 @@ INSERT INTO `nonunique_table_view_name` VALUES
+=20
+ ##################################################
+ # --compact --delayed-insert --no-data-med=3D0 --databases db2 db1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db2` /*!40100 DEFAULT CHARACT=
ER SET utf8mb3 COLLATE utf8mb3_general_ci */;
+=20
+@@ -5899,7 +5902,7 @@ CREATE TABLE t1 (a int, b int);
+ CREATE TRIGGER tt1_t1 BEFORE INSERT ON t1 FOR EACH ROW=20
+ SET NEW.b=3DNEW.a + 10;
+ INSERT INTO t1 (a) VALUES (1),(2),(3);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -5948,7 +5951,7 @@ DROP TABLE t1;
+ #
+ # Without --replace and --insert-ignore
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -6044,7 +6047,7 @@ CREATE TABLE IF NOT EXISTS `transaction_registry` =
(
+ #
+ # With --replace
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -6150,7 +6153,7 @@ CREATE TABLE IF NOT EXISTS `transaction_registry` =
(
+ #
+ # With --insert-ignore
+ #
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -6275,7 +6278,7 @@ insert into t3 values(2);
+ insert into t3(`invisible`,  `a  b c & $!@#$%^&*( )`, `ds=3D~!@ \# $% ^=
 & * ( ) _ - =3D +` ) values(1,2,3);
+ CREATE TABLE t4(=C3=8B=C3=8F=C3=8C=C3=8F=C3=8E=C3=8B=C3=811 INT);
+ insert into t4 values(1);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -6316,7 +6319,7 @@ CREATE TABLE `t4` (
+ INSERT INTO `t4` VALUES
+ (1);
+ #Check side effect on --complete insert
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -6686,7 +6689,7 @@ DROP DATABASE test1;
+ # MDEV-33727 mariadb-dump trusts the server and does not validate the d=
ata
+ #
+ create table t1 (a int);
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+ DROP TABLE IF EXISTS `t1`;
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+diff --git a/mysql-test/main/openssl_1.result b/mysql-test/main/openssl_=
1.result
+index 18294d16..48f2a082 100644
+--- a/mysql-test/main/openssl_1.result
++++ b/mysql-test/main/openssl_1.result
+@@ -77,7 +77,7 @@ DROP TABLE thread_status;
+ SET GLOBAL event_scheduler=3D0;
+ CREATE TABLE t1(a int);
+ INSERT INTO t1 VALUES (1), (2);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -114,7 +114,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+@@ -151,7 +151,7 @@ UNLOCK TABLES;
+ /*!40101 SET COLLATION_CONNECTION=3D@OLD_COLLATION_CONNECTION */;
+ /*!40111 SET SQL_NOTES=3D@OLD_SQL_NOTES */;
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/main/plugin_auth.result b/mysql-test/main/plugin=
_auth.result
+index f8128355..44e49018 100644
+--- a/mysql-test/main/plugin_auth.result
++++ b/mysql-test/main/plugin_auth.result
+@@ -338,7 +338,7 @@ FLUSH PRIVILEGES;
+ # Executing 'mysqladmin'
+ mysqld is alive
+ # Executing 'mysqldump'
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+ # Executing 'mysql_upgrade'
+ #
+ # Bug #59657: Move the client authentication_pam plugin into the=20
+diff --git a/mysql-test/main/rpl_mysqldump_slave.result b/mysql-test/mai=
n/rpl_mysqldump_slave.result
+index 6c28862b..edf811b0 100644
+--- a/mysql-test/main/rpl_mysqldump_slave.result
++++ b/mysql-test/main/rpl_mysqldump_slave.result
+@@ -7,15 +7,15 @@ connection slave;
+ connection master;
+ use test;
+ connection slave;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_P=
OS=3DBINLOG_START;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ STOP ALL SLAVES;
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_P=
OS=3DBINLOG_START;
+ START ALL SLAVES;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ STOP ALL SLAVES;
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_HOST=3D'127.0.0.1', MASTER_PORT=3DMASTER_MYP=
ORT, MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_POS=3DBINLOG_START=
;
+@@ -23,7 +23,7 @@ START ALL SLAVES;
+ start slave;
+ Warnings:
+ Note	1254	Slave is already running
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- SET GLOBAL gtid_slave_pos=3D'';
+ CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LOG_P=
OS=3DBINLOG_START;
+ start slave;
+@@ -41,14 +41,14 @@ DROP TABLE t2;
+=20
+ 1. --dump-slave=3D1
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ SET GLOBAL gtid_slave_pos=3D'0-1-1001';
+ CHANGE MASTER '' TO MASTER_USE_GTID=3Dslave_pos;
+ -- CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LO=
G_POS=3DBINLOG_START;
+=20
+ 2. --dump-slave=3D2
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- SET GLOBAL gtid_slave_pos=3D'0-1-1001';
+ -- CHANGE MASTER '' TO MASTER_USE_GTID=3Dslave_pos;
+ -- CHANGE MASTER '' TO MASTER_LOG_FILE=3D'master-bin.000001', MASTER_LO=
G_POS=3DBINLOG_START;
+@@ -56,21 +56,21 @@ CHANGE MASTER '' TO MASTER_USE_GTID=3Dslave_pos;
+=20
+ 1. --master-data=3D1
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- CHANGE MASTER TO MASTER_LOG_FILE=3D'slave-bin.000001', MASTER_LOG_PO=
S=3DBINLOG_START;
+ CHANGE MASTER TO MASTER_USE_GTID=3Dslave_pos;
+ SET GLOBAL gtid_slave_pos=3D'0-2-1003';
+=20
+ 2. --master-data=3D2
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- CHANGE MASTER TO MASTER_LOG_FILE=3D'slave-bin.000001', MASTER_LOG_PO=
S=3DBINLOG_START;
+ -- CHANGE MASTER TO MASTER_USE_GTID=3Dslave_pos;
+ -- SET GLOBAL gtid_slave_pos=3D'0-2-1003';
+=20
+ 3. --master-data --single-transaction
+=20
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ -- CHANGE MASTER TO MASTER_LOG_FILE=3D'slave-bin.000001', MASTER_LOG_PO=
S=3DBINLOG_START;
+ CHANGE MASTER TO MASTER_USE_GTID=3Dslave_pos;
+ SET GLOBAL gtid_slave_pos=3D'0-2-1003';
+diff --git a/mysql-test/main/trigger_wl3253.result b/mysql-test/main/tri=
gger_wl3253.result
+index 6d77ed5e..a6e3881a 100644
+--- a/mysql-test/main/trigger_wl3253.result
++++ b/mysql-test/main/trigger_wl3253.result
+@@ -310,7 +310,7 @@ CREATE TABLE t1 (a INT);
+ CREATE TRIGGER tr1_bi BEFORE INSERT ON t1 FOR EACH ROW SET @a:=3D1;
+ CREATE TRIGGER tr2_bi BEFORE INSERT ON t1 FOR EACH ROW SET @a:=3D2;
+ CREATE TRIGGER tr1_bu BEFORE UPDATE ON t1 FOR EACH ROW SET @a:=3D3;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -373,7 +373,7 @@ CREATE TRIGGER tr2_bi BEFORE INSERT ON t1 FOR EACH R=
OW SET @a:=3D2;
+ CREATE TRIGGER tr0_bi BEFORE INSERT ON t1 FOR EACH ROW PRECEDES tr1_bi =
SET @a:=3D0;
+ CREATE TRIGGER tr1_1_bi BEFORE INSERT ON t1 FOR EACH ROW FOLLOWS tr1_bi=
 SET @a:=3D0;
+ # Expected order of triggers in the dump is: tr0_bi, tr1_bi, tr1_1_bi, =
tr2_i.
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+diff --git a/mysql-test/suite/archive/archive_bitfield.result b/mysql-te=
st/suite/archive/archive_bitfield.result
+index 5cda525e..a42f4c68 100644
+--- a/mysql-test/suite/archive/archive_bitfield.result
++++ b/mysql-test/suite/archive/archive_bitfield.result
+@@ -180,7 +180,7 @@ INSERT INTO `t1` VALUES
+ (NULL,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,b'100000',b'010010',b'0=
11111',4,5,5,5,5,5,5,5,5,5,3,2,1),
+ (NULL,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,b'000000',b'001100',b'1=
11111',4,5,5,5,5,5,5,5,5,5,3,2,1),
+ (NULL,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,b'111111',b'000000',b'0=
00000',4,5,5,5,5,5,5,5,5,5,3,2,1);
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ INSERT INTO `t1` VALUES (1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x=
01,0x3F,0x3E,4,5,5,5,5,5,5,5,5,5,3,2,1);
+ INSERT INTO `t1` VALUES (2,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x=
02,0x00,0x3D,4,5,5,5,5,5,5,5,5,5,3,2,1);
+ INSERT INTO `t1` VALUES (3,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x=
04,0x0F,0x3B,4,5,5,5,5,5,5,5,5,5,3,2,1);
+diff --git a/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.resul=
t b/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.result
+index 8084bd44..d5e0c942 100644
+--- a/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.result
++++ b/mysql-test/suite/compat/oracle/r/sp-package-mysqldump.result
+@@ -34,7 +34,7 @@ PROCEDURE p1;
+ FUNCTION f1 RETURN INT;
+ END;
+ $$
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ /*!40101 SET @OLD_CHARACTER_SET_CLIENT=3D@@CHARACTER_SET_CLIENT */;
+ /*!40101 SET @OLD_CHARACTER_SET_RESULTS=3D@@CHARACTER_SET_RESULTS */;
+diff --git a/mysql-test/suite/federated/federatedx.result b/mysql-test/s=
uite/federated/federatedx.result
+index 333b3ca8..f5f480b5 100644
+--- a/mysql-test/suite/federated/federatedx.result
++++ b/mysql-test/suite/federated/federatedx.result
+@@ -2243,7 +2243,7 @@ connection master;
+ CREATE TABLE t1(id VARCHAR(20) NOT NULL, PRIMARY KEY(id)) ENGINE=3DFEDE=
RATED=20
+ CONNECTION=3D'mysql://root@127.0.0.1:SLAVE_PORT/test/t1';
+ # Dump table t1 using mysqldump tool
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+diff --git a/mysql-test/suite/roles/definer.result b/mysql-test/suite/ro=
les/definer.result
+index a321ad9a..32607533 100644
+--- a/mysql-test/suite/roles/definer.result
++++ b/mysql-test/suite/roles/definer.result
+@@ -274,7 +274,7 @@ a	b	c
+ 111	4	0
+ 2	20	200
+ delete from t1 where a=3D111;
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+=20
+ CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARAC=
TER SET latin1 COLLATE latin1_swedish_ci */;
+=20
+diff --git a/mysql-test/suite/s3/mysqldump.result b/mysql-test/suite/s3/=
mysqldump.result
+index e0c0caf6..3d7b3b37 100644
+--- a/mysql-test/suite/s3/mysqldump.result
++++ b/mysql-test/suite/s3/mysqldump.result
+@@ -4,7 +4,7 @@ alter table t1 engine=3DS3;
+ #####
+ # mysqldump with --copy-s3-tables=3D0 (by default)
+ ###
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+ #####
+ # mysqldump with --copy-s3-tables=3D0 (by default) XML
+ ###
+@@ -16,7 +16,7 @@ alter table t1 engine=3DS3;
+ #####
+ # mysqldump with --copy-s3-tables=3D1
+ ###
+-/*!999999\- enable the sandbox mode */=20
++/*M!999999\- enable the sandbox mode */=20
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+diff --git a/mysql-test/suite/sql_sequence/mysqldump.result b/mysql-test=
/suite/sql_sequence/mysqldump.result
+index c2f8dea9..2568c8ef 100644
+--- a/mysql-test/suite/sql_sequence/mysqldump.result
++++ b/mysql-test/suite/sql_sequence/mysqldump.result
+@@ -3,7 +3,7 @@ CREATE TABLE t1(a INT, KEY (a)) KEY_BLOCK_SIZE=3D1024;
+ insert into t1 values (1),(2);
+ CREATE SEQUENCE x1 engine=3Dinnodb;
+ # dump whole database
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+@@ -19,7 +19,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables order 1
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+@@ -35,7 +35,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables order 2
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+@@ -51,7 +51,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables only tables
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t1` (
+@@ -63,7 +63,7 @@ INSERT INTO `t1` VALUES
+ (1),
+ (2);
+ # dump by tables only sequences
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ CREATE SEQUENCE `a1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DAria;
+ SELECT SETVAL(`a1`, 1, 0);
+ CREATE SEQUENCE `x1` start with 1 minvalue 1 maxvalue 92233720368547758=
06 increment by 1 cache 1000 nocycle ENGINE=3DInnoDB;
+diff --git a/storage/connect/mysql-test/connect/r/mysql.result b/storage=
/connect/mysql-test/connect/r/mysql.result
+index e91d17f7..379fc8ec 100644
+--- a/storage/connect/mysql-test/connect/r/mysql.result
++++ b/storage/connect/mysql-test/connect/r/mysql.result
+@@ -229,7 +229,7 @@ a
+ 20
+ 30
+ # Start of mysqldump ------
+-/*!999999\- enable the sandbox mode */
++/*M!999999\- enable the sandbox mode */
+ /*!40101 SET @saved_cs_client     =3D @@character_set_client */;
+ /*!40101 SET character_set_client =3D utf8 */;
+ CREATE TABLE `t2` (
+--=20
+2.40.0
+
--=20
2.40.0


