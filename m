Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19F6FC590B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:58:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65925.1772092719398166441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 23:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K1gcpEU7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772092719; x=1803628719;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6A9+GfZlDGaFLK/eA6TMoF6GMvTSXZ4xuEXigzSdEjk=;
  b=K1gcpEU7oTQgISrW4jSPOTjV/0hfSv0cXroDK+D0mjOaKshA4pEgpRcU
   xF534sFWQgKrrfSKM6B2/Qtzod7q6lfsZ7+5wmrBK0EpFvLNVGZr2MwtW
   sDIk5mENEX4Om7+aHoeBaIkE6McHKjNW65Py4VyZK5pbqSNAZJvzHE+M4
   68IPCykTmqJHc5oe07J5KfmUL31suQ6OZh5+38GsVSm2zAnZ4Sj/verJX
   4PKB5CDTqbjMPszE68BcBBp0c6T42netv/GcEaVeiIpEL8b+WzDf5HMgC
   N1qAp3cTxcCMaQtxMDFGFrrPvEgIcFanSTu/+PaXxIf9Lz6fTOGGjsnUK
   g==;
X-CSE-ConnectionGUID: Ch+f+WBbQYi1lIF7jOBEDA==
X-CSE-MsgGUID: 3AhIBOx2Qd2pkhLeggY5FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="219085343"
X-IronPort-AV: E=Sophos;i="6.21,311,1763391600"; 
   d="scan'208";a="219085343"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id B675F1C000A4
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:58:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 63EA61800BD1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:58:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.167.241])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8683B20000F7
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:58:34 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] bit7z: upgrade 4.0.9 -> 4.0.11
Date: Thu, 26 Feb 2026 15:58:31 +0800
Message-ID: <20260226075831.2968-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124666

1. Changelog:
  https://github.com/rikyoz/bit7z/releases/tag/v4.0.11

2. Drop following patches as they were merged upstream.
  0001-Fix-reinterpret-cast-compiler-errors.patch
  0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
  0001-Allow-running-tests-on-target-when-cross-compiling.patch
  0001-Allow-specifying-path-to-7z-library-in-tests.patch
  0001-Fix-tests-with-musl.patch

3. Adjust Ptest SRCREV to adopt to latest bit7z

  SRCREV_filesystem refer to bit7z-4.0.11/cmake/Dependencies.cmake
  SRCREV_catch2 refer to bit7z-4.0.11/tests/CMakeLists.txt
  SRCHASH_CPM and TAG_CPM refer to bit7z-4.0.11/cmake/Dependencies.cmake

4.cmake/Dependencies.cmake has redefined to check and download CPM_${CPM_DOWNLOAD_VERSION}.cmake file to
CPM_SOURCE_CACHE, so it will show error in do_configure as ./build/cpm_cache/cpm/CPM_0.42.0.cmake is empty

  | -- Downloading CPM.cmake to ...bit7z/4.0.11/build/cpm_cache/cpm/CPM_0.42.0.cmake
  | CMake Error at cmake/Dependencies.cmake:15 (file):
  |   file DOWNLOAD cannot compute hash on failed download
  |
  |     from url: "https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.42.0/CPM.cmake"
  |     status: [6;"Could not resolve hostname"]
  
  So change ${B}/cmake to ${B}/cpm_cache/cpm/ to fix this issue.
  ./build/cpm_cache/cpm/CPM_0.42.0.cmake

5. Add 0001-cmake-disable-filesystem-gitclone.patch to fix filesystem git clone error

  Fix error log as following:
  | fatal: unable to access 'https://github.com/rikyoz/filesystem.git/': Could not resolve host: github.com
  | Had to git clone more than once: 3 times.
  | CMake Error at bit7z/4.0.11/build/_deps/ghc_filesystem-subbuild/ghc_filesystem-populate-prefix/tmp/ghc_filesystem-populate-gitclone.cmake:50 (message):
  |   Failed to clone repository: 'https://github.com/rikyoz/filesystem.git'

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...tests-on-target-when-cross-compiling.patch | 45 ----------------
 ...ecifying-path-to-7z-library-in-tests.patch | 48 -----------------
 ...ge-in-BitPropVariant-on-Arm-architec.patch | 41 ---------------
 ...Fix-reinterpret-cast-compiler-errors.patch | 52 -------------------
 .../7zip/bit7z/0001-Fix-tests-with-musl.patch | 51 ------------------
 ...01-cmake-disable-filesystem-gitclone.patch | 37 +++++++++++++
 .../7zip/{bit7z_4.0.9.bb => bit7z_4.0.11.bb}  | 28 ++++------
 7 files changed, 48 insertions(+), 254 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch
 delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch
 delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
 delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch
 delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch
 rename meta-oe/recipes-extended/7zip/{bit7z_4.0.9.bb => bit7z_4.0.11.bb} (76%)

diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch
deleted file mode 100644
index b6e24a9519..0000000000
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-target-when-cross-compiling.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9f0eed91d32ec2f310bd5c23af187f888394fcb4 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Wed, 2 Apr 2025 09:33:03 +0200
-Subject: [PATCH] Allow running tests on target when cross-compiling
-
-When bit7z is Cross-compiled, target device does not contain
-source/build directory anymore and thus path to test data is different.
-Make it possible to pass the new path to cmake.
-
-Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/289]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- tests/CMakeLists.txt | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 60da280..dbdff1f 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -49,6 +49,11 @@ add_executable( ${TESTS_TARGET_PUBLIC} ${SOURCE_FILES} ${PUBLIC_API_SOURCE_FILES
- 
- if( BIT7Z_TESTS_FILESYSTEM )
-     set( BIT7Z_TESTS_DATA_DIR ${CMAKE_CURRENT_BINARY_DIR}/data )
-+    if( NOT BIT7Z_TESTS_DATA_DIR_TARGET )
-+        set( BIT7Z_TESTS_DATA_DIR_TARGET ${BIT7Z_TESTS_DATA_DIR} )
-+    else()
-+        message( STATUS "Custom test data dir on target: ${BIT7Z_TESTS_DATA_DIR_TARGET}" )
-+    endif()
- 
-     include( FetchContent )
-     FetchContent_Declare( bit7z-test-data
-@@ -61,11 +66,11 @@ if( BIT7Z_TESTS_FILESYSTEM )
-     message( STATUS "Tests data directory: ${BIT7Z_TESTS_DATA_DIR}" )
-     target_compile_definitions( ${TESTS_TARGET} PRIVATE
-                                 BIT7Z_TESTS_FILESYSTEM
--                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR}" )
-+                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR_TARGET}" )
-     target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE
-                                 BIT7Z_TESTS_PUBLIC_API_ONLY
-                                 BIT7Z_TESTS_FILESYSTEM
--                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR}" )
-+                                BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR_TARGET}" )
-     if( NOT EXISTS ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
-         file( MAKE_DIRECTORY ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
-     endif()
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch
deleted file mode 100644
index adc0d67d97..0000000000
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7z-library-in-tests.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 60137ec132951f941f2fb98cd6353717b322cbf1 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Wed, 2 Apr 2025 10:17:38 +0200
-Subject: [PATCH] Allow specifying path to 7z library in tests
-
-For instance to override path to library on Linux when using real 7-zip
-instead of pzip: /usr/lib/lib7z.so
-
-Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/288]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- tests/CMakeLists.txt           | 7 +++++++
- tests/src/utils/shared_lib.hpp | 4 +++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 60da280d..1307366a 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -103,6 +103,13 @@ message( STATUS "Use system 7-zip for tests: ${BIT7Z_TESTS_USE_SYSTEM_7ZIP}" )
- if( BIT7Z_TESTS_USE_SYSTEM_7ZIP )
-     target_compile_definitions( ${TESTS_TARGET} PRIVATE BIT7Z_TESTS_USE_SYSTEM_7ZIP )
-     target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE BIT7Z_TESTS_USE_SYSTEM_7ZIP )
-+else()
-+    set( BIT7Z_TESTS_7Z_LIBRARY_PATH "" CACHE STRING "The path of the 7-Zip library to be used for running the tests" )
-+    if( NOT BIT7Z_TESTS_7Z_LIBRARY_PATH STREQUAL "" )
-+        message( STATUS "Use custom 7-zip library for tests: ${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
-+        target_compile_definitions( ${TESTS_TARGET} PRIVATE BIT7Z_TESTS_7Z_LIBRARY_PATH="${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
-+        target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE BIT7Z_TESTS_7Z_LIBRARY_PATH="${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
-+    endif()
- endif()
- 
- # Avoiding linking unnecessary libraries.
-diff --git a/tests/src/utils/shared_lib.hpp b/tests/src/utils/shared_lib.hpp
-index 41435a9b..8bc02939 100644
---- a/tests/src/utils/shared_lib.hpp
-+++ b/tests/src/utils/shared_lib.hpp
-@@ -20,7 +20,9 @@ namespace bit7z {
- namespace test {
- 
- inline auto sevenzip_lib_path() -> tstring {
--#ifdef BIT7Z_TESTS_USE_SYSTEM_7ZIP
-+#ifdef BIT7Z_TESTS_7Z_LIBRARY_PATH
-+    static const tstring lib_path = BIT7Z_STRING( BIT7Z_TESTS_7Z_LIBRARY_PATH );
-+#elif defined( BIT7Z_TESTS_USE_SYSTEM_7ZIP )
- #ifdef _WIN64
-     static const tstring lib_path = BIT7Z_STRING( "C:\\Program Files\\7-Zip\\7z.dll" );
- #elif defined( _WIN32 )
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
deleted file mode 100644
index b1bf6923f2..0000000000
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d504abaf2b0a514193f52df42098bc16de4718b2 Mon Sep 17 00:00:00 2001
-From: Oz <rik20@live.it>
-Date: Fri, 17 Jan 2025 21:23:59 +0100
-Subject: [PATCH] Fix int8_t storage in BitPropVariant on Arm architectures
-
-Upstream-Status: Backport [https://github.com/rikyoz/bit7z/commit/d504abaf2b0a514193f52df42098bc16de4718b2]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- include/bit7z/bitwindows.hpp | 4 ++++
- src/bitpropvariant.cpp       | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/include/bit7z/bitwindows.hpp b/include/bit7z/bitwindows.hpp
-index 5849b956..2f29a989 100644
---- a/include/bit7z/bitwindows.hpp
-+++ b/include/bit7z/bitwindows.hpp
-@@ -126,7 +126,11 @@ struct PROPVARIANT {
-     WORD wReserved2;
-     WORD wReserved3;
-     union {
-+#if defined( __arm__ ) || defined( __aarch64__ )
-+        signed char cVal;
-+#else
-         char cVal;
-+#endif
-         unsigned char bVal;
-         short iVal;
-         unsigned short uiVal;
-diff --git a/src/bitpropvariant.cpp b/src/bitpropvariant.cpp
-index 1e7f094f..642e1268 100644
---- a/src/bitpropvariant.cpp
-+++ b/src/bitpropvariant.cpp
-@@ -157,7 +157,7 @@ BitPropVariant::BitPropVariant( uint64_t value ) noexcept: PROPVARIANT() {
- BitPropVariant::BitPropVariant( int8_t value ) noexcept: PROPVARIANT() {
-     vt = VT_I1;
-     wReserved1 = 0;
--    cVal = static_cast< char >( value );
-+    cVal = static_cast< decltype(cVal) >( value );
- }
- 
- BitPropVariant::BitPropVariant( int16_t value ) noexcept: PROPVARIANT() {
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch
deleted file mode 100644
index 08b64f4999..0000000000
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From bedeec4d57d29be7de91697277ace00ba87d3e75 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Tue, 1 Apr 2025 15:23:51 +0200
-Subject: [PATCH] Fix reinterpret-cast compiler errors
-
-Building on 32-bit arm, following warning/error occurs:
-
-src/internal/windows.cpp: In function 'bit7z::OLECHAR* AllocStringBuffer(LPCSTR, uint32_t)':
-src/internal/windows.cpp:79:6: error: cast from 'unsigned char*' to 'bstr_prefix_t*' {aka 'unsigned int*'} increases required alignment of target type [-Werror=cast-align]
-   79 |     *reinterpret_cast< bstr_prefix_t* >( bstrBuffer ) = byteLength;
-      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-git/src/internal/windows.cpp:83:19: error: cast from 'unsigned char*' to 'bit7z::BSTR' {aka 'wchar_t*'} increases required alignment of target type [-Werror=cast-align]
-   83 |     BSTR result = reinterpret_cast< BSTR >( bstrBuffer + sizeof( bstr_prefix_t ) );
-      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-cc1plus: all warnings being treated as errors
-
-Fix it by using the desired variable size right away and thus avoid
-casting to an array with different alignment.
-
-Upstream-Status: Backport [https://github.com/rikyoz/bit7z/commit/b2789ea9b0fbb2a74dbf6764ddb72d60659a3bce]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/internal/windows.cpp | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/src/internal/windows.cpp b/src/internal/windows.cpp
-index 9304aed7..7bee5959 100644
---- a/src/internal/windows.cpp
-+++ b/src/internal/windows.cpp
-@@ -68,19 +68,18 @@ auto AllocStringBuffer( LPCSTR str, uint32_t byteLength ) -> BSTR {
- 
-     // Allocating memory for storing the BSTR as a byte array.
-     // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, cppcoreguidelines-owning-memory)
--    auto* bstrBuffer = static_cast< byte_t* >( std::calloc( bufferSize, sizeof( byte_t ) ) );
-+    auto* bstrBuffer = static_cast< bstr_prefix_t* >( std::calloc( bufferSize, sizeof( byte_t ) ) );
- 
-     if ( bstrBuffer == nullptr ) { // Failed to allocate memory for the BSTR buffer.
-         return nullptr;
-     }
- 
-     // Storing the number of bytes of the BSTR as a prefix of it.
--    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-reinterpret-cast)
--    *reinterpret_cast< bstr_prefix_t* >( bstrBuffer ) = byteLength;
-+    *bstrBuffer = byteLength;
- 
-     // The actual BSTR must point after the byteLength prefix.
-     // NOLINTNEXTLINE(cppcoreguidelines-pro-bounds-pointer-arithmetic, cppcoreguidelines-pro-type-reinterpret-cast)
--    BSTR result = reinterpret_cast< BSTR >( bstrBuffer + sizeof( bstr_prefix_t ) );
-+    BSTR result = reinterpret_cast< BSTR >( bstrBuffer + 1 );
-     if ( str != nullptr ) {
-         // Copying byte-by-byte the input string to the BSTR.
-         // Note: flawfinder warns about not checking for buffer overflows; this is a false alarm,
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
deleted file mode 100644
index b1f3d0f2ec..0000000000
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From bc5f2e5af90854c8f84b5829493dd01facf9af84 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Mon, 7 Apr 2025 16:29:32 +0200
-Subject: [PATCH] Fix tests with musl
-
-Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/292]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- tests/src/test_bitexception.cpp | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/tests/src/test_bitexception.cpp b/tests/src/test_bitexception.cpp
-index 7161fcc5..d85d430d 100644
---- a/tests/src/test_bitexception.cpp
-+++ b/tests/src/test_bitexception.cpp
-@@ -49,6 +49,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
-     { HRESULT_WIN32_TEST( ERROR_OPEN_FAILED ),
- #ifdef _WIN32
-       "The system cannot open the device or file specified.",
-+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
-+      "I/O error",
- #else
-         "Input/output error",
- #endif
-@@ -67,6 +69,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
-     { HRESULT_WIN32_TEST( ERROR_SEEK ),
- #ifdef _WIN32
-       "The drive cannot locate a specific area or track on the disk.",
-+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
-+      "I/O error",
- #else
-         "Input/output error",
- #endif
-@@ -74,6 +78,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
-     { HRESULT_WIN32_TEST( ERROR_READ_FAULT ),
- #ifdef _WIN32
-       "The system cannot read from the specified device.",
-+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
-+      "I/O error",
- #else
-         "Input/output error",
- #endif
-@@ -81,6 +87,8 @@ constexpr PortableErrorTest hresult_tests[] = { // NOLINT(*-avoid-c-arrays)
-     { HRESULT_WIN32_TEST( ERROR_WRITE_FAULT ),
- #ifdef _WIN32
-       "The system cannot write to the specified device.",
-+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
-+      "I/O error",
- #else
-         "Input/output error",
- #endif
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch
new file mode 100644
index 0000000000..917b70f58e
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch
@@ -0,0 +1,37 @@
+Subject: [PATCH] cmake: disable filesystem gitclone
+
+In Yocto we don't download filesystem, it is satisfied from source dir.
+This Dependencies.cmake file would try to download filesystem even if it is satisfied.
+
+Fix error log as following:
+| fatal: unable to access 'https://github.com/rikyoz/filesystem.git/': Could not resolve host: github.com
+| Had to git clone more than once: 3 times.
+| CMake Error at bit7z/4.0.11/build/_deps/ghc_filesystem-subbuild/ghc_filesystem-populate-prefix/tmp/ghc_filesystem-populate-gitclone.cmake:50 (message):
+|   Failed to clone repository: 'https://github.com/rikyoz/filesystem.git'
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ cmake/Dependencies.cmake | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/cmake/Dependencies.cmake b/cmake/Dependencies.cmake
+index 110d9c2b..dc1dead8 100644
+--- a/cmake/Dependencies.cmake
++++ b/cmake/Dependencies.cmake
+@@ -39,10 +39,9 @@ if( NOT USE_STANDARD_FILESYSTEM OR NOT STANDARD_FILESYSTEM_COMPILES OR BIT7Z_BUI
+     CPMAddPackage( NAME ghc_filesystem
+                    GITHUB_REPOSITORY rikyoz/filesystem
+                    GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5
+-                   DOWNLOAD_ONLY YES )
++                   SOURCE_DIR "${CPM_SOURCE_CACHE}/ghc_filesystem" )
+     if( ghc_filesystem_ADDED )
+         message( STATUS "ghc::filesystem source code available at ${ghc_filesystem_SOURCE_DIR}" )
+-        add_library( ghc_filesystem INTERFACE IMPORTED )
+         target_include_directories( ghc_filesystem SYSTEM INTERFACE ${ghc_filesystem_SOURCE_DIR}/include )
+     endif()
+ endif()
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
similarity index 76%
rename from meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
rename to meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
index 033461d614..4e9a958422 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
@@ -6,30 +6,25 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48a3fe23ed1353e0995dadfda05ffdb6"
 SRC_URI = " \
     git://github.com/rikyoz/bit7z.git;protocol=https;branch=master \
     ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
-    file://0001-Fix-reinterpret-cast-compiler-errors.patch \
-    file://0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch \
-    file://0001-Allow-running-tests-on-target-when-cross-compiling.patch \
-    file://0001-Allow-specifying-path-to-7z-library-in-tests.patch \
-    file://0001-Fix-tests-with-musl.patch \
 "
 
-SRCREV = "386e00ad3286e7a10e5bb6d05a5b41b523fce623"
+SRCREV = "82f359371fda5c16c037ac0659b969334816a9c4"
 
 # ptest dependencies and their revisions
 SRC_URI_PTEST = " \
     git://github.com/rikyoz/filesystem.git;protocol=https;branch=glibcxx_wchar_streams_workaround;name=filesystem;destsuffix=filesystem \
     git://github.com/rikyoz/bit7z-test-data.git;protocol=https;branch=main;name=testdata;destsuffix=testdata \
-    git://github.com/catchorg/Catch2.git;protocol=https;branch=v2.x;name=catch2;destsuffix=catch2;tag=${TAG_catch2} \
+    git://github.com/rikyoz/Catch2.git;protocol=https;branch=single-header-v2.x;name=catch2;destsuffix=catch2 \
     https://github.com/cpm-cmake/CPM.cmake/releases/download/v${TAG_CPM}/CPM.cmake;downloadfilename=CPM_${TAG_CPM}.cmake \
     file://run-ptest \
+    file://0001-cmake-disable-filesystem-gitclone.patch \
 "
 SRCREV_FORMAT = "${@bb.utils.contains('PTEST_ENABLED', '1', 'default_filesystem_testdata_catch2', 'default', d)}"
-SRCREV_filesystem = "983650f374699e3979f9cdefe13ddff60bd4ac68"
+SRCREV_filesystem = "b99c2aebd5ddd6fb2f190731ba80b949fc3842b5"
 SRCREV_testdata = "077e407b1c07b7443626b5902eeb4819388bf656"
-SRCREV_catch2 = "182c910b4b63ff587a3440e08f84f70497e49a81"
-TAG_catch2 = "v2.13.10"
-SRCHASH_CPM = "c8cdc32c03816538ce22781ed72964dc864b2a34a310d3b7104812a5ca2d835d"
-TAG_CPM = "0.40.2"
+SRCREV_catch2 = "27d8db1770dd5cd3688656095f242474431584a1"
+SRCHASH_CPM = "2020b4fc42dba44817983e06342e682ecfc3d2f484a581f11cc5731fbe4dce8a"
+TAG_CPM = "0.42.0"
 SRC_URI[sha256sum] = "${SRCHASH_CPM}"
 
 
@@ -51,15 +46,14 @@ do_configure:prepend() {
     # verify that all dependencies have correct version
     grep -q ${SRCREV_filesystem} ${S}/cmake/Dependencies.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_filesystem'!"
     grep -q ${SRCREV_testdata} ${S}/tests/CMakeLists.txt || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_testdata'!"
-    grep -q ${TAG_catch2} ${S}/tests/cmake/Catch2.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_catch2'!"
+    grep -q ${SRCREV_catch2} ${S}/tests/CMakeLists.txt || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_catch2'!"
     grep -q ${SRCHASH_CPM} ${S}/cmake/Dependencies.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCHASH_CPM'!"
 
     if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
         # use cache instead of download for CPM (CMake's missing package manager)
-        mkdir -p ${B}/cmake
-        cp ${UNPACKDIR}/CPM_${TAG_CPM}.cmake ${B}/cmake
-        mkdir -p ${B}/cpm_cache/ghc_filesystem
-        cp -r ${UNPACKDIR}/filesystem ${B}/cpm_cache/ghc_filesystem/fbcc9a9e94e6365273cf51294173f21ff5efdb4f
+        mkdir -p ${B}/cpm_cache/cpm/
+        cp ${UNPACKDIR}/CPM_${TAG_CPM}.cmake ${B}/cpm_cache/cpm/
+        cp -r ${UNPACKDIR}/filesystem ${B}/cpm_cache/ghc_filesystem
         # avoid buildpaths issue as unpackdir is not in prefix maps
         cp -r ${UNPACKDIR}/catch2 ${B}
     fi
-- 
2.43.0


