Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DE8C83F2F
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web11.75861.1752492417871191399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=kZWrlmC6;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492418; x=1784028418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BR4HdBl2yxPV+Fyr3msxH5EGp5MvvI6ogldoOTpQkVM=;
  b=kZWrlmC6wq5JzRn8gwCo+QjJReqaUdKT4v8Fx4e9igH34m14Gc+QBYjV
   DccrNJzvs8T0OleIKCz474+NtFwoh2OsOXynkVKdzkOfJQkyNx4pfEHDW
   Gd4HKumI5MA2dwMMNQ2FF9o/4HC+j2uPm555GOPqXOznctq74hXvdcQA7
   E=;
X-CSE-ConnectionGUID: eSQumiq5Qp6sN64FPQnEAQ==
X-CSE-MsgGUID: ErEfKFasShSYDZ89KBDTEA==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:55 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw4.muc with
 ESMTP/TLS; 14 Jul 2025 13:26:55 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:55 +0200
X-CSE-ConnectionGUID: lh95BHS3SxmbzL2lFFJisQ==
X-CSE-MsgGUID: UMfOjBgxToiAb2sGIKBxzQ==
X-CSE-ConnectionGUID: mQAq58tSR2O2piAeCp6JNw==
X-CSE-MsgGUID: S64hfyH9QnWyuMiwEg2c3Q==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 01/10] leveldb: Disable ptests to allow to build with CMake 4+
Date: Mon, 14 Jul 2025 13:26:26 +0200
Message-ID: <20250714112642.121146-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118519

The component itself builds just fine with CMake 4, but the tests don't as they
rely on a bundled version of GTest that is six years old. Since upstream is
inactive, the simplest course of action is to not build the tests and disable
ptest support.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...s.txt-fix-googletest-related-options.patch | 55 -------------------
 meta-oe/recipes-dbs/leveldb/leveldb/run-ptest | 10 ----
 meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb   | 10 +---
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch
 delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/run-ptest

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch
deleted file mode 100644
index b0bfb8bf16..0000000000
--- a/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 77da477840f89da7ced29da315de77571e8f190e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Fri, 20 Oct 2023 22:57:48 +0200
-Subject: [PATCH] CMakeLists.txt: fix googletest related options
-
-* https://cmake.org/cmake/help/book/mastering-cmake/chapter/Writing%20CMakeLists%20Files.html
-  says that CMake options are case-sensitive and I don't see lower-case version in
-  currently used googletest submodules and gtest is indeed installed with leveldb
-
-* install_gmock option I don't see at all, so I've kept it as is, INSTALL_GTEST, BUILD_GMOCK
-  do exist as upper-case
-
-$ grep -Ri install_.*mock .
-./CMakeLists.txt:  set(install_gmock OFF)
-./third_party/googletest/googlemock/CMakeLists.txt:install_project(gmock gmock_main)
-$ grep -Ri build_gmock .
-./CMakeLists.txt:  set(BUILD_GMOCK ON)
-./third_party/googletest/googletest/README.md:cmake .. -DBUILD_GMOCK=OFF
-./third_party/googletest/CMakeLists.txt:option(BUILD_GMOCK "Builds the googlemock subproject" ON)
-./third_party/googletest/CMakeLists.txt:if(BUILD_GMOCK)
-$ grep -Ri install_gtest .
-./CMakeLists.txt:  set(INSTALL_GTEST OFF)
-./third_party/googletest/googletest/cmake/internal_utils.cmake:  if(INSTALL_GTEST)
-./third_party/googletest/googletest/CMakeLists.txt:if (INSTALL_GTEST)
-./third_party/googletest/CMakeLists.txt:option(INSTALL_GTEST "Enable installation of googletest. (Projects embedding googletest may want to turn this OFF.)" ON)
-
-* also use CACHE and FORCE as sugested in:
-  https://cmake.org/cmake/help/latest/command/set.html
-  https://stackoverflow.com/questions/20239334/cmake-set-subdirectory-options
-  for the value to correctly propagate into third_party/googletest subdirectory
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/google/leveldb/pull/1152]
-
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fda9e01..f8a2629 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -295,9 +295,9 @@ if(LEVELDB_BUILD_TESTS)
- 
-   # Prevent overriding the parent project's compiler/linker settings on Windows.
-   set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
--  set(install_gtest OFF)
--  set(install_gmock OFF)
--  set(build_gmock ON)
-+  set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
-+  set(install_gmock OFF CACHE BOOL "" FORCE)
-+  set(BUILD_GMOCK ON CACHE BOOL "" FORCE)
- 
-   # This project is tested using GoogleTest.
-   add_subdirectory("third_party/googletest")
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest b/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
deleted file mode 100644
index 9ae70c1284..0000000000
--- a/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-for test in *_test; do
-    if ./${test}; then
-        echo "PASS: ${test}"
-    else
-        echo "FAIL: ${test}"
-    fi
-done
-
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
index 9cefc528ae..0ee0c8c075 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
@@ -5,30 +5,24 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 
 SRC_URI = "gitsm://github.com/google/${BPN}.git;branch=main;protocol=https \
-    file://0001-CMakeLists.txt-fix-googletest-related-options.patch \
     file://0001-Fix-printing-64-bit-integer-types.patch \
-    file://run-ptest \
 "
 
 SRCREV = "068d5ee1a3ac40dabd00d211d5013af44be55bea"
 
-inherit cmake ptest
+inherit cmake
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[benchmarks] = "-DLEVELDB_BUILD_BENCHMARKS=ON,-DLEVELDB_BUILD_BENCHMARKS=OFF,sqlite"
 PACKAGECONFIG[snappy] = ",,snappy"
 PACKAGECONFIG[tcmalloc] = ",,gperftools"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON \
-                 -DLEVELDB_BUILD_TESTS=${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'ON', 'OFF', d)}"
+                 -DLEVELDB_BUILD_TESTS=OFF"
 
 do_install:append() {
     install -D -m 0755 ${B}/leveldbutil ${D}${bindir}/leveldbutil
 }
 
-do_install_ptest() {
-    install -m 0755 ${B}/*_test ${D}${PTEST_PATH}
-}
-
 # Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb.
 #
 COMPATIBLE_HOST:mipsarcho32:pn-lib32-leveldb = "null"

