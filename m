Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 103C679EBA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 15:17:04 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z16-v6so9957248wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Nov 2018 07:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nCPMAApnKhm65IMjq3PJ/HAufCGSZy1qgZqmMXSX5Uo=;
	b=X4dHPuSt6YV3sSzT4rKGcFZhAW8T7MBRSJjTDFx9zDH4Ev3j3hdF8zAcrva9tmQ3gU
	cx78NtBoBuB+PBdCDU3GqiltS438s6JA+bcNWLYQSv3b0Ubrr5syfXeNqJi8JTM5XCBk
	gAmXTGLuDGqoO/EMrmbsf7QmF7nIdB2HJz2xAJWkusOUEk8QLbGvCGbRD6eg2WtqpXZo
	+icly/ajeInMmMXxT7gK5c5nL0b1GmWSeJA/fpWFz9iCbZ3W2xmv+g/8M7IE6p0TqMHu
	piJu82xDEthUWnkXJjYzuSN084jVHtpfCMzmfmEI8a5uvSD/6JkPp+J8fu+0zg+iG9eJ
	Hfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nCPMAApnKhm65IMjq3PJ/HAufCGSZy1qgZqmMXSX5Uo=;
	b=lCS1z42ffK/9MdGLrDrXNQmkhClEv2juIItn6q1pOtALeJ48+QOBBECt/f4/HjzsUY
	+ssOj/Nkl4YA0tGxB+fAgXZCimWRnIvTyOCQkBOVDz5RzCc/bIpozjx/7Wy83y3ZK8w4
	GNVQUsgl/lImeEndXbQpmlazalSpijjw9MKQigS4nwzzhnojSO4fHCp6yEZUlrHYeeJP
	w0TT3BV/gmqXqY+zGe5sKMT2OzzrlBHk1swdKQWDXxMyOf+tNLsWWBfk0ZSlyuEfdzNV
	VmNyqDytR/s9leAvT6idNomWaKmi73JR0WkLoZ6XJJ7pHz9aNgywJf7+nggI4Zf+YMS5
	agrQ==
X-Gm-Message-State: AGRZ1gKdQSyYYrXUrEwCMSMNTEjy481Bjw3LJgqmV171CTekvOKQWwOu
	Ld2uolS+Whn35FN+jA+ifI7g8qQM
X-Google-Smtp-Source: AJdET5fNjp/g0GJDVwmVHysHo5nkkit+9G2Q4peUXbXidk9PkD1DgdUr7bkTQjdM4YV2DtXmLgvsdQ==
X-Received: by 2002:a5d:40cc:: with SMTP id
	b12-v6mr21192937wrq.133.1541431025052; 
	Mon, 05 Nov 2018 07:17:05 -0800 (PST)
Received: from localhost.localdomain ([109.112.13.138])
	by smtp.gmail.com with ESMTPSA id
	w18-v6sm10945406wrn.66.2018.11.05.07.17.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 07:17:04 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Nov 2018 16:16:53 +0100
Message-Id: <20181105151653.16248-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181105151653.16248-1-costamagnagianfranco@yahoo.it>
References: <20181105151653.16248-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] cpprest: upgrade to version 2.10.7 and add support for brotli library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2018 15:17:05 -0000

---
 .../recipes-support/cpprest/cpprest/845.patch | 42 -------------------
 .../cpprest/cpprest/950-fix.patch             | 26 ++++++++++++
 .../cpprest/disable-outside-tests.patch       |  6 +--
 .../cpprest/cpprest/system-brotli.patch       | 38 +++++++++++++++++
 .../{cpprest_2.10.6.bb => cpprest_2.10.7.bb}  | 11 +++--
 5 files changed, 74 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/845.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.6.bb => cpprest_2.10.7.bb} (69%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/845.patch b/meta-oe/recipes-support/cpprest/cpprest/845.patch
deleted file mode 100644
index 8a349aef7..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/845.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c4a09f3d29a57022e03e2849f04c111a57a6a388 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Sat, 18 Aug 2018 14:59:38 +0200
-Subject: [PATCH] Fix default installation path
-
----
- Release/CMakeLists.txt     | 2 +-
- Release/src/CMakeLists.txt | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
-index c93d3cc49..d20b4b070 100644
---- a/Release/CMakeLists.txt
-+++ b/Release/CMakeLists.txt
-@@ -18,7 +18,7 @@ enable_testing()
- set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
- set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
- set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
--set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
-+set(CPPREST_EXPORT_DIR cmake CACHE STRING "Directory to install CMake config files.")
- set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
- set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
- 
-diff --git a/Release/src/CMakeLists.txt b/Release/src/CMakeLists.txt
-index a34605bda..050ff71fc 100644
---- a/Release/src/CMakeLists.txt
-+++ b/Release/src/CMakeLists.txt
-@@ -262,12 +262,12 @@ if(CPPREST_INSTALL)
- 
-   install(
-     FILES "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake"
--    DESTINATION ${CPPREST_EXPORT_DIR}
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CPPREST_EXPORT_DIR}
-   )
-   install(
-     EXPORT cpprestsdk-targets
-     FILE cpprestsdk-targets.cmake
-     NAMESPACE cpprestsdk::
--    DESTINATION ${CPPREST_EXPORT_DIR}
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CPPREST_EXPORT_DIR}
-   )
- endif()
diff --git a/meta-oe/recipes-support/cpprest/cpprest/950-fix.patch b/meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
new file mode 100644
index 000000000..3ae46a115
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
@@ -0,0 +1,26 @@
+Origin: upstream
+Bug: https://github.com/Microsoft/cpprestsdk/issues/950
+Last-Update: 2018-11-04
+
+Index: cpprest/Release/src/utilities/asyncrt_utils.cpp
+===================================================================
+--- cpprest.orig/Release/src/utilities/asyncrt_utils.cpp
++++ cpprest/Release/src/utilities/asyncrt_utils.cpp
+@@ -356,7 +356,7 @@
+ inline size_t count_utf8_to_utf16(const std::string& s)
+ {
+     const size_t sSize = s.size();
+-    auto sData = reinterpret_cast<const UtilCharInternal_t* const>(s.data());
++    auto const sData = reinterpret_cast<const UtilCharInternal_t*>(s.data());
+     size_t result{ sSize };
+ 
+     for (size_t index = 0; index < sSize;)
+@@ -441,7 +441,7 @@
+ {
+     // Save repeated heap allocations, use the length of resulting sequence.
+     const size_t srcSize = s.size();
+-    auto srcData = reinterpret_cast<const UtilCharInternal_t* const>(s.data());
++    auto const srcData = reinterpret_cast<const UtilCharInternal_t*>(s.data());
+     utf16string dest(count_utf8_to_utf16(s), L'\0');
+     utf16string::value_type* const destData = &dest[0];
+     size_t destIndex = 0;
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
index b9b3591c3..2dff0d97c 100644
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
@@ -1,16 +1,16 @@
 Description: Debian forbids calls to external websites.
 
-Author: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Author: Gianfranco Costamagna <locutus@debian.org>
 Origin: Debian
 Forwarded: not-needed
-Reviewed-By: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Reviewed-By: Gianfranco Costamagna <locutusofborg@debian.org>
 Last-Update: 2015-11-25
 
 Index: casablanca/Release/tests/functional/http/client/CMakeLists.txt
 ===================================================================
 --- casablanca.orig/Release/tests/functional/http/client/CMakeLists.txt
 +++ casablanca/Release/tests/functional/http/client/CMakeLists.txt
-@@ -9,7 +9,6 @@
+@@ -12,7 +12,6 @@
    multiple_requests.cpp
    oauth1_tests.cpp
    oauth2_tests.cpp
diff --git a/meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch b/meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
new file mode 100644
index 000000000..e6f64772d
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
@@ -0,0 +1,38 @@
+Description: Find system brotli
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Forwarded: https://github.com/Microsoft/cpprestsdk/pull/952
+Last-Update: 2018-11-05
+
+--- cpprest-2.10.7.orig/Release/cmake/cpprest_find_brotli.cmake
++++ cpprest-2.10.7/Release/cmake/cpprest_find_brotli.cmake
+@@ -3,8 +3,17 @@ function(cpprest_find_brotli)
+     return()
+   endif()
+ 
+-  find_package(unofficial-brotli REQUIRED)
+ 
+-  add_library(cpprestsdk_brotli_internal INTERFACE)
+-  target_link_libraries(cpprestsdk_brotli_internal INTERFACE unofficial::brotli::brotlienc unofficial::brotli::brotlidec unofficial::brotli::brotlicommon)
++  find_package(PkgConfig)
++  pkg_check_modules(BROTLIENC libbrotlienc)
++  pkg_check_modules(BROTLIDEC libbrotlidec)
++  if(BROTLIDEC_FOUND AND BROTLIENC_FOUND)
++	  target_link_libraries(cpprest PRIVATE ${BROTLIDEC_LDFLAGS} ${BROTLIENC_LDFLAGS})
++  else(BROTLIDEC_FOUND AND BROTLIENC_FOUND)
++    find_package(unofficial-brotli REQUIRED)
++    add_library(cpprestsdk_brotli_internal INTERFACE)
++    target_link_libraries(cpprestsdk_brotli_internal INTERFACE unofficial::brotli::brotlienc unofficial::brotli::brotlidec unofficial::brotli::brotlicommon)
++    target_link_libraries(cpprest PRIVATE cpprestsdk_brotli_internal)
++  endif(BROTLIDEC_FOUND AND BROTLIENC_FOUND)
++
+ endfunction()
+--- cpprest-2.10.7.orig/Release/src/CMakeLists.txt
++++ cpprest-2.10.7/Release/src/CMakeLists.txt
+@@ -84,7 +84,6 @@ else()
+     target_compile_definitions(cpprest PRIVATE -DCPPREST_EXCLUDE_BROTLI=1)
+   else()
+     cpprest_find_brotli()
+-    target_link_libraries(cpprest PRIVATE cpprestsdk_brotli_internal)
+   endif()
+ endif()
+ 
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.6.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.7.bb
similarity index 69%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.6.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.7.bb
index a3162bb43..5cc6385df 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.6.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.7.bb
@@ -3,17 +3,20 @@ SECTION = "libs/network"
 HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost"
+DEPENDS = "openssl websocketpp zlib boost brotli"
+
+EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            file://disable-outside-tests.patch \
            file://disable-test-timeouts.patch \
            file://disable-float-tests.patch \
-           file://845.patch \
+           file://950-fix.patch \
+           file://system-brotli.patch \
            "
 
-# tag 2.10.6
-SRCREV= "66e50f02dde92f802bbd3a8d79c6352954665b9b"
+# tag 2.10.7
+SRCREV= "c4cef129e880a3f9c23a480e8c983793963173bb"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


