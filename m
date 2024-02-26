Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6EBC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:04:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16545.1708938273253579799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 01:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a7hf0ASb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27861fde02=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q4Yu6E003385
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 09:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=wjNvP
	dNN+1ZrPS2lBIclt/AiojSkvNI3hZ5F3SMIdUo=; b=a7hf0ASbQ4vU3HHKW61Cg
	7uuRVBCYvwIzQZWFU8L2BRRMTBVC8R1Z+7d/snhoJT2Humk4mrP0RILd0gj6rSWT
	LTE3m4K0SlesAjIPSFp+LiCGPdNe50wFV383Od4auzYsGOFwfcNREo1nNlpgoP3k
	j+MiWPO7rsoX5kTLYCOhppER9WnQQH/7qzDasa/G5VWWw8S4C/6lVMTIMgblYwK8
	YWeOWbykXOA88GDWnLN98rSBrplfouX6QKTAhLnkmb7niWVrPO0OgKUmQz/pbbs4
	ranfYUxfWRzJXKlt6hQNuFaQ3hPnYDinpM5GiW2/PRsOjrtknFCmPbw7j4wGVz7V
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e69nh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 09:04:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 01:04:30 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 01:04:30 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] mariadb: Upgrade to 10.11.7
Date: Mon, 26 Feb 2024 17:04:29 +0800
Message-ID: <20240226090429.167833-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nogGBfyRlEQ_EcmVYHFisGY58MlG6ixO
X-Proofpoint-ORIG-GUID: nogGBfyRlEQ_EcmVYHFisGY58MlG6ixO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_05,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402260067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 09:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109031

From: Mingli Yu <mingli.yu@windriver.com>

As the change [1] introduced in 10.11.7, there comes below configure failure:
 | -- Performing Test HAVE_SYSTEM_LIBFMT
 | CMake Error: try_run() invoked in cross-compiling mode, please set the following cache variables appropriately:
 |    HAVE_SYSTEM_LIBFMT_EXITCODE (advanced)
 | For details see /build/tmp-glibc/work/core2-64-wrs-linux/mariadb/10.11.7/build/TryRunResults.cmake
 | -- Performing Test HAVE_SYSTEM_LIBFMT - Failed
 [snip]

Considering [1] is mainly used to test fmt 10.0.0 failure and we use libfmt
10.2.1 now, so define "-DHAVE_SYSTEM_LIBFMT_EXITCODE=0" as workaround [2] to
fix the above configure error.

Remove the problematic assert lines to fix the below build failure on 32bit
arm as the next 10.11 release will bring the assert back in a way that works
on 32-bit arm [3].
 In file included from TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_test.c:38:
 TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_fw.c:1438:3: error: 'compile_time_assert' declared as an array with a negative size
  1438 |   compile_time_assert(sizeof(MYSQL) == 77*sizeof(void*)+656);
       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[1] https://github.com/MariaDB/server/commit/b5c367cd88e37091ab5f8dab0396c01c97d037e2
[2] https://jira.mariadb.org/browse/MDEV-30694
[3] https://jira.mariadb.org/browse/MDEV-33429

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e_10.11.6.bb => mariadb-native_10.11.7.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...Remove-the-compile_time_assert-lines.patch | 43 +++++++++++++++++++
 ...{mariadb_10.11.6.bb => mariadb_10.11.7.bb} |  0
 4 files changed, 46 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.6.bb => mariadb-native_10.11.7.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.6.bb => mariadb_10.11.7.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 25dc15b46..9e6d490cb 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,9 +23,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+           file://0001-Remove-the-compile_time_assert-lines.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "1c0163463e98d71f4780741611a40981eee2bc44d392601ca49bbf948d04dd67"
+SRC_URI[sha256sum] = "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076b6ffe258110e5157"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
@@ -96,6 +97,7 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DSTACK_DIRECTION=1 \
+                 -DHAVE_SYSTEM_LIBFMT_EXITCODE=0 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
new file mode 100644
index 000000000..9a6e28297
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
@@ -0,0 +1,43 @@
+From cc5f1d0759b367265a1a000287e2ec15c31eb518 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 26 Feb 2024 14:56:02 +0800
+Subject: [PATCH] Remove the compile_time_assert lines
+
+Remove the problematic compile_time_assert lines to fix the below build
+failure on 32-bit arm.
+ In file included from TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_test.c:38:
+ TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_fw.c:1438:3: error: 'compile_time_assert' declared as an array with a negative size
+  1438 |   compile_time_assert(sizeof(MYSQL) == 77*sizeof(void*)+656);
+       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [Upstream will bring the asset back
+                                in a new way [1]]
+[1] https://jira.mariadb.org/browse/MDEV-33429
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/mysql_client_fw.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/tests/mysql_client_fw.c b/tests/mysql_client_fw.c
+index c9e64678..5c0c7ce2 100644
+--- a/tests/mysql_client_fw.c
++++ b/tests/mysql_client_fw.c
+@@ -1430,14 +1430,6 @@ int main(int argc, char **argv)
+     tests_to_run[i]= NULL;
+   }
+ 
+-#ifdef _WIN32
+-  /* must be the same in C/C and embedded, 1208 on 64bit, 968 on 32bit */
+-  compile_time_assert(sizeof(MYSQL) == 60*sizeof(void*)+728);
+-#else
+-  /* must be the same in C/C and embedded, 1272 on 64bit, 964 on 32bit */
+-  compile_time_assert(sizeof(MYSQL) == 77*sizeof(void*)+656);
+-#endif
+-
+   if (mysql_server_init(embedded_server_arg_count,
+                         embedded_server_args,
+                         (char**) embedded_server_groups))
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
-- 
2.25.1


