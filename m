Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C9ED11701
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4290.1764669116803370847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HkCpGbsG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669116; x=1796205116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oA2vBcGX7HQGopnYcrrfqzH/QUkissovO4QxcHMjMv8=;
  b=HkCpGbsGZHTV4LzzKxCQ5SP+fH9MaZHFPVMm1dTXwOPEY5nKElOc43GN
   8w9GV+qGdzIdcXZBN5v4tkZQ5V6iQPp3Ig7IZ7yYYG6MCAi5mAns214oG
   EdFuQfSAJ3iF2wO7D3IvV/+KD/xKGsWNLGfh0DQze3CRykSVPYpqgsy2q
   mqsJMHny4Hg5tnslX5j2/MGL+YFNBjx0/gql5oNZNtVKCSjy5aWDBQ4Ap
   nhgHqZiWrQNN7LFcq/9YqPS1qC6Ln8d23IX+U+b8LUUKZb/oW1lx9XjSa
   KUjdhq1HjacNCzkcnh6NxrjSVi86aNDq6GhBZ++fS9CP3CRDpOTaNnmtu
   w==;
X-CSE-ConnectionGUID: gReBHOFjSTWBm5Y9xNt9Vw==
X-CSE-MsgGUID: YtauPwnWT1C2H71NHdsv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200027976"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200027976"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2975A8203C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D06C31400340
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 549B3101A42C;
	Tue,  2 Dec 2025 09:51:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/25] psqlodbc: upgrade 17.00.0006 -> 17.00.0007
Date: Tue,  2 Dec 2025 17:51:15 +0800
Message-ID: <20251202095132.652-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122241

From: Wang Mingyu <wangmy@fujitsu.com>

add-expected-output-file-for-descrec-test.patch
removed since it's included in 17.00.0007

psqlodbc-fix-for-ptest-support.patch
refreshed for 17.00.0007

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpected-output-file-for-descrec-test.patch | 72 -------------------
 .../psqlodbc-fix-for-ptest-support.patch      | 17 +++--
 ...c_17.00.0006.bb => psqlodbc_17.00.0007.bb} | 13 ++--
 3 files changed, 17 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_17.00.0006.bb => psqlodbc_17.00.0007.bb} (87%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch b/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
deleted file mode 100644
index af25b207c8..0000000000
--- a/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 453a8bdcaafde9fcd108a195ffea3ccb5c4d0a21 Mon Sep 17 00:00:00 2001
-From: Christoph Berg <myon@debian.org>
-Date: Mon, 16 Jun 2025 20:25:26 +0200
-Subject: [PATCH] Add expected output file for descrec test in C locale (#131)
-
-When running with LC_ALL=C, SQL_DESC_OCTET_LENGTH matches the character
-length. Add "10" as accepted value.
-
-The net diff to the existing descrec.out file is this:
-
- test/expected/descrec.out	2025-06-13 19:02:36.460302799 +0200
- test/expected/descrec_2.out	2025-06-16 14:34:44.270543393 +0200
- @@ -19,7 +19,7 @@
-  -- Column 3 --
-  SQL_DESC_NAME: col3
-  SQL_DESC_TYPE: 12
- -SQL_DESC_OCTET_LENGTH: 40
- +SQL_DESC_OCTET_LENGTH: 10
-  SQL_DESC_PRECISION: 0
-  SQL_DESC_SCALE: 0
-  SQL_DESC_NULLABLE: 0
-
-Fixes #51.
-
-Upstream-Status: Backport [https://github.com/postgresql-interfaces/psqlodbc/commit/453a8bdcaafde9fcd108a195ffea3ccb5c4d0a21]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
----
- test/expected/descrec_2.out | 34 ++++++++++++++++++++++++++++++++++
- 1 file changed, 34 insertions(+)
- create mode 100644 test/expected/descrec_2.out
-
-diff --git a/test/expected/descrec_2.out b/test/expected/descrec_2.out
-new file mode 100644
-index 0000000..6f61c49
---- /dev/null
-+++ b/test/expected/descrec_2.out
-@@ -0,0 +1,34 @@
-+connected
-+
-+-- Column 1 --
-+SQL_DESC_NAME: col1
-+SQL_DESC_TYPE: 4
-+SQL_DESC_OCTET_LENGTH: 0
-+SQL_DESC_PRECISION: 0
-+SQL_DESC_SCALE: 0
-+SQL_DESC_NULLABLE: 0
-+
-+-- Column 2 --
-+SQL_DESC_NAME: col2
-+SQL_DESC_TYPE: 2
-+SQL_DESC_OCTET_LENGTH: 6
-+SQL_DESC_PRECISION: 4
-+SQL_DESC_SCALE: 2
-+SQL_DESC_NULLABLE: 1
-+
-+-- Column 3 --
-+SQL_DESC_NAME: col3
-+SQL_DESC_TYPE: 12
-+SQL_DESC_OCTET_LENGTH: 10
-+SQL_DESC_PRECISION: 0
-+SQL_DESC_SCALE: 0
-+SQL_DESC_NULLABLE: 0
-+
-+-- Column 4 --
-+SQL_DESC_NAME: col4
-+SQL_DESC_TYPE: -5
-+SQL_DESC_OCTET_LENGTH: 8
-+SQL_DESC_PRECISION: 0
-+SQL_DESC_SCALE: 0
-+SQL_DESC_NULLABLE: 0
-+disconnecting
diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
index 081c6d0fd0..a1f60b2692 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
@@ -1,4 +1,4 @@
-From 96896b88776d0080609ec830cf9538d2babe665a Mon Sep 17 00:00:00 2001
+From b0175d6124ae0460fbeaf34c964aff587fa978c2 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 5 Sep 2017 10:24:10 +0800
 Subject: [PATCH] psqlodbc: fixes for ptest support
@@ -12,13 +12,14 @@ Subject: [PATCH] psqlodbc: fixes for ptest support
 Upstream-Status: Inappropriate [OE ptest specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  test/Makefile.in    |  2 +-
- test/odbcini-gen.sh |  8 ++++----
+ test/odbcini-gen.sh | 10 +++++-----
  test/runsuite.c     | 20 ++++++++++----------
- 3 files changed, 15 insertions(+), 15 deletions(-)
+ 3 files changed, 16 insertions(+), 16 deletions(-)
 
+diff --git a/test/Makefile.in b/test/Makefile.in
+index 3f9a9af..09406ae 100644
 --- a/test/Makefile.in
 +++ b/test/Makefile.in
 @@ -19,7 +19,7 @@ CPPFLAGS = @CPPFLAGS@ -I..	# config.h
@@ -30,6 +31,8 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  
  all: $(TESTBINS) runsuite reset-db
  
+diff --git a/test/odbcini-gen.sh b/test/odbcini-gen.sh
+index 2eaba35..d7c03ba 100755
 --- a/test/odbcini-gen.sh
 +++ b/test/odbcini-gen.sh
 @@ -6,7 +6,7 @@
@@ -64,6 +67,8 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  ReadOnly                = No
  RowVersioning           = No
  ShowSystemTables                = No
+diff --git a/test/runsuite.c b/test/runsuite.c
+index 6ac3709..023ac1d 100644
 --- a/test/runsuite.c
 +++ b/test/runsuite.c
 @@ -55,7 +55,7 @@ bailout(const char *fmt, ...)
@@ -75,7 +80,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  {
  	const char *basename;
  #ifdef WIN32
-@@ -69,7 +69,7 @@ parse_argument(const char *in, char *tes
+@@ -69,7 +69,7 @@ parse_argument(const char *in, char *testname, char *binname)
  	if (strchr(in, DIR_SEP) == NULL)
  	{
  		strcpy(testname, in);
@@ -93,7 +98,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  		if (runtest(binname, testname, i, inputdir) != 0)
  			failures++;
  	}
-@@ -161,29 +161,29 @@ runtest(const char *binname, const char
+@@ -161,29 +161,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
  #ifndef WIN32
  	snprintf(cmdline, sizeof(cmdline),
  			 "ODBCSYSINI=. ODBCINSTINI=./odbcinst.ini ODBCINI=./odbc.ini "
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
similarity index 87%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
index 183f810216..92ee2594f9 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
@@ -20,14 +20,13 @@ LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
 
 SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;branch=main;tag=REL-${PV_WITH_USCORE} \
-    file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
-    file://psqlodbc-donot-use-the-hardcode-libdir.patch \
-    file://psqlodbc-fix-for-ptest-support.patch \
-    file://add-expected-output-file-for-descrec-test.patch \
-    file://run-ptest \
-"
+           file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
+           file://psqlodbc-donot-use-the-hardcode-libdir.patch \
+           file://psqlodbc-fix-for-ptest-support.patch \
+           file://run-ptest \
+           "
 
-SRCREV = "251c8e8200c7a030fa46e59429d3fec7a73de4ec"
+SRCREV = "8038cee43d6dff468320008ea928f3eaa1186726"
 PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
 
 DEPENDS += "postgresql unixodbc"
-- 
2.43.0


