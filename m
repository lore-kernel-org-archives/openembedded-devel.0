Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CDCC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:53:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.4995.1645602786438176817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BSLrnzWu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602784; i=@fujitsu.com;
	bh=us2P4zggPxWdzyRhxOT6syX381BeMKmDWXx0aDldHD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BSLrnzWuQ5LJu8sDe68iRMW4oSugqDFKZ11JYJfuhKJRN4oSLJQBh6wMT17+PydkV
	 CcDOidwHZ8414SpTdUassFSGb7DcRLw3ht218/gagh9j2WorBBP94iy2EBaWI9fjji
	 GqE1k6lTkIGMDS3kcCZaGfBVhJvP2JeMSbJmE7xywttJT37rBBDlv6QGHnNXbHEMqa
	 Ow2FztIo4tieimNgibiz/XQtA4JTm01eIYJ0at9lZGShlO9RbZiwyARwEO272P5s2U
	 fzvZWzlyrD3ppwR2W+jWyjEXYONC2fTUq+lvwl6zHhfCb/aDdNMbGR93hBWV2bi7G5
	 Etqv7bNVdi3zg==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 5E/39-12986-0E7E5126;
 Wed, 23 Feb 2022 07:53:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRovvguWi
  SwZTlQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aW1f/ZCnYqV9y8OJe5gfGBXBcjF4eQwEwm
  iaWPjrBDOCcYJRZ/3MPUxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfPUANHBzCAjYS+
  29agoRZBFQlfhzZzA5i8wo4SWzedAnMlhBQkJjy8D1YK6eAs0Tv8lVMIK1CQDVN20ogygUlTs
  58wgIxXULi4IsXzBCtihKzLzezQNgVErNmtTFNYOSfhaRlFpKWBYxMqxitkooy0zNKchMzc3Q
  NDQx0DQ1NdYGkqYleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgQKYUM8za
  wTir76feIUZJDiYlUd7CI6JJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4+54A5QSLUtNTK9Iyc
  4DRAZOW4OBREuEVAUnzFhck5hZnpkOkTjHqcmxac2MvsxBLXn5eqpQ47/d7QEUCIEUZpXlwI2
  CReolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/IM6ApPJl5JXCbXgEdwQR0xJQsIZAjShI
  RUlINTMxC6xsT63mVZ2h5WTloLxTbM313pKsBZ9ub16V9USxbT1ksy9levlC041jftZmtXiET
  fhofPWTIw9bpUunzbg9rhXfBKmejx4Ul1y8vvrB3Z7pGwcRbq93CTl267vkhRWfK35kBJ4UiF
  1V/VHpcKrbN4u6k1ZsuXn28Y3VyD29ns5XGZIu2rKkLi388yoja8GQn45ro+cXSBcFXzmxgWt
  VU8vtoVOFMu2fB612FfyortrK6t/iyC62rn6e3Yu/vSWo3ddyqlB7tylPucnKVvD9b+2N17Pm
  tDXeCHHyiHj9ffenk49CoF5PWrH9v0fTqp/LpE2obZdZU1x5a6DdXJ8Tn+ubFCxJz+qrNVswX
  bVFiKc5INNRiLipOBABrZ13OTwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1645602783!95029!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13176 invoked from network); 23 Feb 2022 07:53:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:53:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21N7qwWY017790
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:53:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:52:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] soci: upgrade 4.0.2 -> 4.0.3
Date: Wed, 23 Feb 2022 15:52:46 +0800
Message-ID: <1645602768-28412-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
References: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:53:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95472

0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
removed since it's included in 4.0.3

Version 4.0.3 differs from 4.0.2 in the following ways:
========================================================
Changes affecting all or multiple backends:
 - Fix opening sessions from pool (#891).
 - Fix default backend search path (#928).
 - Fix build with latest glibc versions where SIGSTKSZ is not constant (#886).
 - Document using SOCI as a CMake subdirectory (#925).
 - Document using SOCI with Conan (#877).

Backend-specific changes:
- MySQL
 - Implement get_table_names() for MySQL (#927).
 - Fix MySQL backend build with MySQL >= 8 (#884).
 - Fix mysql_library_end() in multithreaded environment (#909).
 - Make mysql_soci_error::get_error_category() more useful (#902).
- ODBC
 - Fix several bugs in vector into code (#888, #892).
 - Fix memory leaks in case of SQLNumResultCols() failure.
 - Export odbc_session_backend::get_database_product() from DLL.
- Oracle
 - Add support for detecting Oracle 20 and 21 to CMake (#896).
- PostgreSQL
 - Fix compilation when "free" is redefined somewhere else.
- SQLite3
 - Fix bulk operations with vectors of size 1 in SQLite3 backend (#908).
- Firebird
 - Suppress FB memory leaks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hen-SIGSTKSZ-is-no-longer-a-constant.patch | 42 -------------------
 .../soci/{soci_4.0.2.bb => soci_4.0.3.bb}     |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
 rename meta-oe/recipes-dbs/soci/{soci_4.0.2.bb => soci_4.0.3.bb} (90%)

diff --git a/meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch b/meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
deleted file mode 100644
index 8e32ebb0bf..0000000000
--- a/meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fae154eb209e068586e1adb589de5d273fcf4b4f Mon Sep 17 00:00:00 2001
-From: Denis Arnaud <denis.arnaud_fedora@m4x.org>
-Date: Tue, 18 May 2021 00:05:03 +0200
-Subject: [PATCH] Fix build when SIGSTKSZ is no longer a constant
-
-In the latest glibc versions SIGSTKSZ is not a constant any more, which
-broke building the tests with it.
-
-Work around this by hard-coding a typical value for it.
-
-closes #886.
-
-Upstream-Status: Backport.
----
- tests/catch.hpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/catch.hpp b/tests/catch.hpp
-index 014df2c5..85067813 100644
---- a/tests/catch.hpp
-+++ b/tests/catch.hpp
-@@ -6489,7 +6489,7 @@ namespace Catch {
-         static bool isSet;
-         static struct sigaction oldSigActions [sizeof(signalDefs)/sizeof(SignalDefs)];
-         static stack_t oldSigStack;
--        static char altStackMem[SIGSTKSZ];
-+        static char altStackMem[8192];
- 
-         static void handleSignal( int sig ) {
-             std::string name = "<unknown signal>";
-@@ -6540,7 +6540,7 @@ namespace Catch {
-     bool FatalConditionHandler::isSet = false;
-     struct sigaction FatalConditionHandler::oldSigActions[sizeof(signalDefs)/sizeof(SignalDefs)] = {};
-     stack_t FatalConditionHandler::oldSigStack = {};
--    char FatalConditionHandler::altStackMem[SIGSTKSZ] = {};
-+    char FatalConditionHandler::altStackMem[8192] = {};
- 
- } // namespace Catch
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/soci/soci_4.0.2.bb b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
similarity index 90%
rename from meta-oe/recipes-dbs/soci/soci_4.0.2.bb
rename to meta-oe/recipes-dbs/soci/soci_4.0.3.bb
index fb67e0c547..ff47e5033e 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.0.2.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SECTION = "libs"
 DEPENDS = "boost"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
-           file://0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch"
-SRC_URI[sha256sum] = "34da2d2320539463da8a5131253246fa2671e0438ab5fd1e5119edb428f558a5"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "615e5f7e4b52007f3a3b4050a99aadf6346b56b5098eb08b3a650836083c6a33"
 
 TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
               -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \
-- 
2.25.1


