Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B543D3C903
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15672.1765373274942282038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYfC6rhV;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso10687450b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373274; x=1765978074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhB5IIOH9APW946+WPb1TWe3h2VGLmNfidpoS6VyESU=;
        b=GYfC6rhVUGl2Ot02kAX4BBS+hunkkXhz8v50g+gEoO/wvmpVCDJY+dG1vuMaMRgccF
         q7eBOrIo6xeY4c4cbv+cEZ1d+MEYMTD2I6CeUn3f8UkLMP8vcWRHc5QqzrKL5YZnkdl+
         dfc4CRc8GRd/fbRxIDFpTyDLBawF/v7bhzBd6McqheQzLpnzo1s6Ohd8htaL8zdsAJBB
         gqPE0MZTUhTFDrBAkdpnWFA8V9QsicTvPdoXyu3Er7+6sYdlBl23WjphdmzKyuM29NtU
         5jTv4jmUKHC0TeCswciAfO49OhV9ou2KiFHYzxxznxH/7Hz48EeACbAME1x3p7VeJxLa
         HjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373274; x=1765978074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhB5IIOH9APW946+WPb1TWe3h2VGLmNfidpoS6VyESU=;
        b=Jup7kHtC68cCFk79b8BweSeuqC9xhWfkm5uy7puaphU8pij6st/ZYW+/KQhRxx4xqA
         PbbyZYT0mXVIEk370MS+NknD6I7JOZ9ze4OU5hvCUh1pk04DoUzxFivZoW180zB13Fz7
         EUGKpGwWz8odDTBmgHAz5TodSnqGPdnxMW/bbNvw8bRaBri7wRUPKUVdKWoyBXTSyhK3
         h0G4O6+u9rqDI0uGCum0NdLmz0KOl1xyEyBgo+mjeDGwOgy0FxZ6IgTKb3tiOEBROHo3
         VuisfuqfHNrlRVDlqnPOMRGlPQKk2+8tF3r11+HRJMVjK6x+J/T0OkFh+d/U7HJk56KL
         RMbw==
X-Gm-Message-State: AOJu0YwC4BjEq74cMmznivzda505CjzzRP2sOR+YdQr80TIHjA1hJlYv
	hG31k2qhgC3KpIl5zhrT32nVPEgLQ8uK8WMPrznvr6TkZ+K225VGRhT1TYpNYA==
X-Gm-Gg: AY/fxX7suFOqx5Zcgo/vo0Qi9imWdaSo2aNqmsgPauw6+/BuJjkUOSQppZK2Ip0HXNf
	ibYtww9o25hrDgkOcaaFLmAWAoceY91mfBmRGoidX1KLQ3jiZYZLKkTw2+KZzSVDcWZ5zn02+Tk
	qf3DxOexr/fHSvrISXrWQOZh3KxQzx1cRbz2SOtWo+8C24opfvdMRweLfhN3Uv/J7qdtQaHNIkM
	TKuoiMaDWQQpcDZSLHQKCinIG0nqZGaFh0itHbIACUMz37oYCHg3bSfdXxx5q+JS7iRIF9VVl0K
	cHLUhLIBvdk98UZahd20g4kgocntij5CWJ4TgjLl7fu8HDkykcOCWOPCcwOuOc8OoTD39KoaIrj
	dMIovyj2T6x3ZOM/bYBM6ltXanRvclP6/0HiG758KGCLbBwxmqWP3Kip9oD4jrM5g1mtDAaHLW1
	h4Mftc/dT5wI3h/1bbMXdBYbI=
X-Google-Smtp-Source: AGHT+IF79h8CBr0YtgOjJkAaywfUxaXyws5DZolLlYFUNDKAo4UedHAuKYtXhYgyWAFFu6IKsV0Bng==
X-Received: by 2002:a05:6a00:114f:b0:7ab:71b7:d0af with SMTP id d2e1a72fcca58-7f229c6170cmr1997054b3a.0.1765373274019;
        Wed, 10 Dec 2025 05:27:54 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 37/43] psqlodbc: upgrade 17.00.0006 -> 17.00.0007
Date: Wed, 10 Dec 2025 18:57:38 +0530
Message-ID: <20251210132744.336180-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122541

From: Wang Mingyu <wangmy@fujitsu.com>

add-expected-output-file-for-descrec-test.patch
removed since it's included in 17.00.0007

psqlodbc-fix-for-ptest-support.patch
refreshed for 17.00.0007

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 967e5c9e0f358af97477da66f3f8547fa19764bb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

