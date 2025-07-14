Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB30C83F2C
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.75972.1752492418516993250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=iamDVUuM;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492418; x=1784028418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z4qFZ15hWThnDwl0ODbdfWmKgDiS12aKqLjYljdutVo=;
  b=iamDVUuMh4m2StDn0YcgTjykUM1TjCtR1incrnYellgc05LdF6BleTN4
   ARKISqsy/Mdwk3EHqtEVi7JY/eU49mWwt8/r2uPEzWR3pXdFSvJy5fB3h
   h0u9KXdmfsFE9ln9weNwJBTld7y8WA89jSOzPiVowBbdIQIsaR7hwBY+Z
   g=;
X-CSE-ConnectionGUID: gj274+JGTn+sgn6u4vllqw==
X-CSE-MsgGUID: 2AcfvXkIR9Sv+k/yklo/Pg==
Received: from 160.46.252.38.spf.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw2.muc with
 ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb6.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:55 +0200
X-CSE-ConnectionGUID: ibJrw1rkQ7eqne78vsVPAA==
X-CSE-MsgGUID: ET4sp4BdSquLZ97SKVPNow==
X-CSE-ConnectionGUID: Szr2hrKxTRqraTeF8nZyqg==
X-CSE-MsgGUID: jdjNvqs/Rr6L7Fz/6YSgZA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 03/10] soci: upgrade 4.0.3 -> 4.1.2
Date: Mon, 14 Jul 2025 13:26:28 +0200
Message-ID: <20250714112642.121146-3-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118522

New version includes support to build against CMake 4+.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...Do-not-use-std-shuffle-with-clang-15.patch | 32 -------------------
 .../soci/{soci_4.0.3.bb => soci_4.1.2.bb}     |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch
 rename meta-oe/recipes-dbs/soci/{soci_4.0.3.bb => soci_4.1.2.bb} (90%)

diff --git a/meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch b/meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch
deleted file mode 100644
index eb29627c6d..0000000000
--- a/meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e5f72c656829402c6f70e7416039bc18f0c26485 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 30 Aug 2022 22:17:14 -0700
-Subject: [PATCH] Do not use std::shuffle with clang 15
-
-This fails to compile although its preferred approach for c++11 and
-newer
-
-See
-https://github.com/SOCI/soci/issues/984
-
-Upstream-Status: Inappropriate [Workaround]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cmake/SociConfig.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cmake/SociConfig.cmake b/cmake/SociConfig.cmake
-index 492e1837..f24fd9a6 100644
---- a/cmake/SociConfig.cmake
-+++ b/cmake/SociConfig.cmake
-@@ -94,6 +94,7 @@ else()
-     set(SOCI_CXX11 ON)
-     set(SOCI_CXX_VERSION_FLAGS "-std=c++11")
-     add_definitions(-DCATCH_CONFIG_CPP11_NO_IS_ENUM)
-+    add_definitions(-DCATCH_CONFIG_CPP11_NO_SHUFFLE)
- 
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SOCI_GCC_CLANG_COMMON_FLAGS} ${SOCI_CXX_VERSION_FLAGS}")
- 
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb b/meta-oe/recipes-dbs/soci/soci_4.1.2.bb
similarity index 90%
rename from meta-oe/recipes-dbs/soci/soci_4.0.3.bb
rename to meta-oe/recipes-dbs/soci/soci_4.1.2.bb
index 315f5d515e..d199f5350c 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.1.2.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SECTION = "libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
-           file://0001-Do-not-use-std-shuffle-with-clang-15.patch \
            "
-SRC_URI[sha256sum] = "615e5f7e4b52007f3a3b4050a99aadf6346b56b5098eb08b3a650836083c6a33"
+SRC_URI[sha256sum] = "b79afe73db241f762ddb611fe11184cbf6da44ba99f90721515daa2f978ff38e"
 
 TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
               -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \
@@ -44,5 +43,5 @@ FILES:${PN}-odbc = "${libdir}/lib${BPN}_odbc.so.*"
 FILES:${PN}-oracle = "${libdir}/lib${BPN}_oracle.so.*"
 
 do_install:append() {
-    sed -i 's|${RECIPE_SYSROOT}${prefix}|${_IMPORT_PREFIX}|g' ${D}${libdir}/cmake/SOCI/SOCITargets*.cmake
+    sed -i 's|${RECIPE_SYSROOT}${prefix}|${_IMPORT_PREFIX}|g' ${D}${libdir}/cmake/${BPN}-${PV}/SOCI*Targets.cmake
 }

