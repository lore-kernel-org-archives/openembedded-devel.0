Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B85C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:32 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.52130.1744042648390401423
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JboZ27P8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202504071617269cbc16823ac7d86177-q_mbzi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202504071617269cbc16823ac7d86177
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 07 Apr 2025 18:17:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=i8hNvyEcUY9iCy02ssQjrCfZL5cj+CkOsPXWd6Yyaqw=;
 b=JboZ27P8jyeLNFsPxpeoojc0HO1uLu/f0PKyBT/oowqyhTY+s58a/vJC87CfsDUUTMozau
 f5rJiw3k2eICSv9MmmYIQrRLVDLs8uFvJbU2XZvpgfFjkeYxfbgRpcuDrmrdIaFhLHlfk2jo
 zZqZGkrWLx4cd4wvHla9UuZo064AaOlZg1AAzU9Xcp540WeTe1RkddVdinkvQkeySH/hI0rm
 3X1c/q4hLeqgge/XvDT35TDTDT23VWTMPV+Qat6wvT0DlOvOZ/36LnpEGSFu4KYgsLYhy7K+
 8e3kHW7sD604gbneDYhsyXeaTt6Dtkp18dwJ8x+6nEo3Ch5ESVS7k0qQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 3/3] bit7z: add ptest support
Date: Mon,  7 Apr 2025 18:16:26 +0200
Message-Id: <20250407161626.8501-3-peter.marko@siemens.com>
In-Reply-To: <20250407161626.8501-1-peter.marko@siemens.com>
References: <20250407161626.8501-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 16:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116674

From: Peter Marko <peter.marko@siemens.com>

Main problem with ptest for this component is that it uses cmake's
FetchContent and CPM to get dependencies.
This adds lot of ugly code to the recipe including conditional patch.

Second big problem is that tests need BIT7Z_DISABLE_USE_STD_FILESYSTEM
which uses test library. This means that when building with ptests, the
code is significantly different than when building without it.
But in production case we don't want to use testing library...
This is known at upstream and will be fixed eventually as github CI is
failing on this too when submitting unrelated patches upstream.

Other considerations:
* created patch for new cmake option to pass path to test data on target
* created patch for new cmake option to pass path to lib7zip on target
* skipped test which consumes too much RAM (it passes if machine has
  plenty of RAM)
* testdata contains files for other architectures, so INSANE_SKIP is
  needed for ptest package
* created patch for tests failing with musl

Tests usually take 9s on my build machine so added them to fast ptests.
However since the dependency 7zip recipe does not build on 64-bit
architectures, I could not add it to PTESTS_FAST_META_OE.
---
 ...tests-on-target-when-cross-compiling.patch | 45 +++++++++++++
 ...ecifying-path-to-7z-library-in-tests.patch | 48 ++++++++++++++
 .../7zip/bit7z/0001-Fix-tests-with-musl.patch | 51 +++++++++++++++
 meta-oe/recipes-extended/7zip/bit7z/run-ptest | 18 ++++++
 meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb  | 64 ++++++++++++++++++-
 5 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/run-ptest

diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch
new file mode 100644
index 0000000000..b6e24a9519
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch
@@ -0,0 +1,45 @@
+From 9f0eed91d32ec2f310bd5c23af187f888394fcb4 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Wed, 2 Apr 2025 09:33:03 +0200
+Subject: [PATCH] Allow running tests on target when cross-compiling
+
+When bit7z is Cross-compiled, target device does not contain
+source/build directory anymore and thus path to test data is different.
+Make it possible to pass the new path to cmake.
+
+Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/289]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/CMakeLists.txt | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 60da280..dbdff1f 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -49,6 +49,11 @@ add_executable( ${TESTS_TARGET_PUBLIC} ${SOURCE_FILES} ${PUBLIC_API_SOURCE_FILES
+ 
+ if( BIT7Z_TESTS_FILESYSTEM )
+     set( BIT7Z_TESTS_DATA_DIR ${CMAKE_CURRENT_BINARY_DIR}/data )
++    if( NOT BIT7Z_TESTS_DATA_DIR_TARGET )
++        set( BIT7Z_TESTS_DATA_DIR_TARGET ${BIT7Z_TESTS_DATA_DIR} )
++    else()
++        message( STATUS "Custom test data dir on target: ${BIT7Z_TESTS_DATA_DIR_TARGET}" )
++    endif()
+ 
+     include( FetchContent )
+     FetchContent_Declare( bit7z-test-data
+@@ -61,11 +66,11 @@ if( BIT7Z_TESTS_FILESYSTEM )
+     message( STATUS "Tests data directory: ${BIT7Z_TESTS_DATA_DIR}" )
+     target_compile_definitions( ${TESTS_TARGET} PRIVATE
+                                 BIT7Z_TESTS_FILESYSTEM
+-                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR}" )
++                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR_TARGET}" )
+     target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE
+                                 BIT7Z_TESTS_PUBLIC_API_ONLY
+                                 BIT7Z_TESTS_FILESYSTEM
+-                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR}" )
++                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR_TARGET}" )
+     if( NOT EXISTS ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
+         file( MAKE_DIRECTORY ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
+     endif()
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch
new file mode 100644
index 0000000000..adc0d67d97
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch
@@ -0,0 +1,48 @@
+From 60137ec132951f941f2fb98cd6353717b322cbf1 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Wed, 2 Apr 2025 10:17:38 +0200
+Subject: [PATCH] Allow specifying path to 7z library in tests
+
+For instance to override path to library on Linux when using real 7-zip
+instead of pzip: /usr/lib/lib7z.so
+
+Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/288]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/CMakeLists.txt           | 7 +++++++
+ tests/src/utils/shared_lib.hpp | 4 +++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 60da280d..1307366a 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -103,6 +103,13 @@ message( STATUS "Use system 7-zip for tests: ${BIT7Z_TESTS_USE_SYSTEM_7ZIP}" )
+ if( BIT7Z_TESTS_USE_SYSTEM_7ZIP )
+     target_compile_definitions( ${TESTS_TARGET} PRIVATE BIT7Z_TESTS_USE_SYSTEM_7ZIP )
+     target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE BIT7Z_TESTS_USE_SYSTEM_7ZIP )
++else()
++    set( BIT7Z_TESTS_7Z_LIBRARY_PATH "" CACHE STRING "The path of the 7-Zip library to be used for running the tests" )
++    if( NOT BIT7Z_TESTS_7Z_LIBRARY_PATH STREQUAL "" )
++        message( STATUS "Use custom 7-zip library for tests: ${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
++        target_compile_definitions( ${TESTS_TARGET} PRIVATE BIT7Z_TESTS_7Z_LIBRARY_PATH="${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
++        target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE BIT7Z_TESTS_7Z_LIBRARY_PATH="${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
++    endif()
+ endif()
+ 
+ # Avoiding linking unnecessary libraries.
+diff --git a/tests/src/utils/shared_lib.hpp b/tests/src/utils/shared_lib.hpp
+index 41435a9b..8bc02939 100644
+--- a/tests/src/utils/shared_lib.hpp
++++ b/tests/src/utils/shared_lib.hpp
+@@ -20,7 +20,9 @@ namespace bit7z {
+ namespace test {
+ 
+ inline auto sevenzip_lib_path() -> tstring {
+-#ifdef BIT7Z_TESTS_USE_SYSTEM_7ZIP
++#ifdef BIT7Z_TESTS_7Z_LIBRARY_PATH
++    static const tstring lib_path = BIT7Z_STRING( BIT7Z_TESTS_7Z_LIBRARY_PATH );
++#elif defined( BIT7Z_TESTS_USE_SYSTEM_7ZIP )
+ #ifdef _WIN64
+     static const tstring lib_path = BIT7Z_STRING( "C:\\Program Files\\7-Zip\\7z.dll" );
+ #elif defined( _WIN32 )
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
new file mode 100644
index 0000000000..b1f3d0f2ec
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
@@ -0,0 +1,51 @@
+From bc5f2e5af90854c8f84b5829493dd01facf9af84 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Mon, 7 Apr 2025 16:29:32 +0200
+Subject: [PATCH] Fix tests with musl
+
+Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/292]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/src/test_bitexception.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/tests/src/test_bitexception.cpp b/tests/src/test_bitexception.cpp
+index 7161fcc5..d85d430d 100644
+--- a/tests/src/test_bitexception.cpp
++++ b/tests/src/test_bitexception.cpp
+@@ -49,6 +49,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
+     { HRESULT_WIN32_TEST( ERROR_OPEN_FAILED ),
+ #ifdef _WIN32
+       "The system cannot open the device or file specified.",
++#elif defined( __linux__ ) && !defined ( __GLIBC__ )
++      "I/O error",
+ #else
+         "Input/output error",
+ #endif
+@@ -67,6 +69,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
+     { HRESULT_WIN32_TEST( ERROR_SEEK ),
+ #ifdef _WIN32
+       "The drive cannot locate a specific area or track on the disk.",
++#elif defined( __linux__ ) && !defined ( __GLIBC__ )
++      "I/O error",
+ #else
+         "Input/output error",
+ #endif
+@@ -74,6 +78,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
+     { HRESULT_WIN32_TEST( ERROR_READ_FAULT ),
+ #ifdef _WIN32
+       "The system cannot read from the specified device.",
++#elif defined( __linux__ ) && !defined ( __GLIBC__ )
++      "I/O error",
+ #else
+         "Input/output error",
+ #endif
+@@ -81,6 +87,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
+     { HRESULT_WIN32_TEST( ERROR_WRITE_FAULT ),
+ #ifdef _WIN32
+       "The system cannot write to the specified device.",
++#elif defined( __linux__ ) && !defined ( __GLIBC__ )
++      "I/O error",
+ #else
+         "Input/output error",
+ #endif
diff --git a/meta-oe/recipes-extended/7zip/bit7z/run-ptest b/meta-oe/recipes-extended/7zip/bit7z/run-ptest
new file mode 100644
index 0000000000..dd1776cab6
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+# Disabled tests:
+# "winapi: Allocating BSTR string from nullptr C strings"
+#   this test is memory hungry, it allocates 800MB chunks
+#   it succeeds when there is enough free RAM, but most machines don't have it
+
+if /usr/lib/bit7z/ptest/bit7z-tests ~"winapi: Allocating BSTR string from nullptr C strings"; then
+    echo "PASS: bit7z-tests"
+else
+    echo "FAIL: bit7z-tests"
+fi
+
+if /usr/lib/bit7z/ptest/bit7z-tests-public; then
+    echo "PASS: bit7z-tests-public"
+else
+    echo "FAIL: bit7z-tests-public"
+fi
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
index 2b9029d9e3..645ea1a2ae 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
@@ -5,21 +5,68 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48a3fe23ed1353e0995dadfda05ffdb6"
 
 SRC_URI = " \
     git://github.com/rikyoz/bit7z.git;protocol=https;branch=master \
-    file://0001-cmake-disable-dependency-inclusion.patch \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
     file://0001-Fix-reinterpret-cast-compiler-errors.patch \
     file://0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch \
+    file://0001-Allow-running-tests-on-target-when-cross-compiling.patch \
+    file://0001-Allow-specifying-path-to-7z-library-in-tests.patch \
+    file://0001-Fix-tests-with-musl.patch \
 "
 
 SRCREV = "386e00ad3286e7a10e5bb6d05a5b41b523fce623"
 
+# ptest dependencies and their revisions
+SRC_URI_PTEST = " \
+    git://github.com/rikyoz/filesystem.git;protocol=https;branch=glibcxx_wchar_streams_workaround;name=filesystem;destsuffix=filesystem \
+    git://github.com/rikyoz/bit7z-test-data.git;protocol=https;branch=main;name=testdata;destsuffix=testdata \
+    git://github.com/catchorg/Catch2.git;protocol=https;branch=v2.x;name=catch2;destsuffix=catch2;tag=${TAG_catch2} \
+    https://github.com/cpm-cmake/CPM.cmake/releases/download/v${TAG_CPM}/CPM.cmake;downloadfilename=CPM_${TAG_CPM}.cmake \
+    file://run-ptest \
+"
+SRCREV_FORMAT = "${@bb.utils.contains('PTEST_ENABLED', '1', 'default_filesystem_testdata_catch2', 'default', d)}"
+SRCREV_filesystem = "983650f374699e3979f9cdefe13ddff60bd4ac68"
+SRCREV_testdata = "077e407b1c07b7443626b5902eeb4819388bf656"
+SRCREV_catch2 = "182c910b4b63ff587a3440e08f84f70497e49a81"
+TAG_catch2 = "v2.13.10"
+SRCHASH_CPM = "c8cdc32c03816538ce22781ed72964dc864b2a34a310d3b7104812a5ca2d835d"
+TAG_CPM = "0.40.2"
+SRC_URI[sha256sum] = "${SRCHASH_CPM}"
+
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
 DEPENDS = "7zip"
 
 EXTRA_OECMAKE += "-DBIT7Z_CUSTOM_7ZIP_PATH=${STAGING_INCDIR}/7zip"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[tests] = " \
+    -DBIT7Z_BUILD_TESTS=ON -DBIT7Z_DISABLE_USE_STD_FILESYSTEM=ON \
+    -DBIT7Z_TESTS_USE_SYSTEM_7ZIP=OFF -DBIT7Z_TESTS_7Z_LIBRARY_PATH=${libdir}/lib7z.so \
+    -DBIT7Z_TESTS_DATA_DIR_TARGET=${PTEST_PATH}/data \
+    -DCPM_SOURCE_CACHE=${B}/cpm_cache -DFETCHCONTENT_SOURCE_DIR_BIT7Z-TEST-DATA=${UNPACKDIR}/testdata -DFETCHCONTENT_SOURCE_DIR_CATCH2=${B}/catch2 \
+"
+
+do_configure:prepend() {
+    # verify that all dependencies have correct version
+    grep -q ${SRCREV_filesystem} ${S}/cmake/Dependencies.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_filesystem'!"
+    grep -q ${SRCREV_testdata} ${S}/tests/CMakeLists.txt || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_testdata'!"
+    grep -q ${TAG_catch2} ${S}/tests/cmake/Catch2.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_catch2'!"
+    grep -q ${SRCHASH_CPM} ${S}/cmake/Dependencies.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCHASH_CPM'!"
+
+    if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
+        # use cache instead of download for CPM (CMake's missing package manager)
+        mkdir -p ${B}/cmake
+        cp ${UNPACKDIR}/CPM_${TAG_CPM}.cmake ${B}/cmake
+        mkdir -p ${B}/cpm_cache/ghc_filesystem
+        cp -r ${UNPACKDIR}/filesystem ${B}/cpm_cache/ghc_filesystem/fbcc9a9e94e6365273cf51294173f21ff5efdb4f
+        # avoid buildpaths issue as unpackdir is not in prefix maps
+        cp -r ${UNPACKDIR}/catch2 ${B}
+    fi
+}
+do_configure[cleandirs] += "${B}"
+
 do_install() {
     install -d ${D}${libdir}
     install -m 0644 ${S}/lib/*/*.a ${D}${libdir}
@@ -27,3 +74,16 @@ do_install() {
     install -d ${D}${includedir}/${BPN}
     install -m 0644 ${S}/include/${BPN}/*.hpp ${D}${includedir}/${BPN}
 }
+
+do_install_ptest() {
+    install -m 0755 ${S}/bin/*/* ${D}${PTEST_PATH}
+    install -d ${D}${PTEST_PATH}/data
+    cp -r ${UNPACKDIR}/testdata/test_archives ${UNPACKDIR}/testdata/test_filesystem ${B}/tests/data/test_filesystem ${D}${PTEST_PATH}/data
+}
+
+# this package contains static library so main package is empty, but ptest package rdepends on it
+ALLOW_EMPTY:${PN} = "1"
+# these are loaded via dlopen, so need explicit rdepends
+RDEPENDS:${PN}-ptest += "libstdc++ 7zip"
+# test data contains various file types with different architectures
+INSANE_SKIP:${PN}-ptest += "arch"

