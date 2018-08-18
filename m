Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 19AE67911D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 13:27:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a108-v6so6637066wrc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xtJaArWry1ewjAKrNvoe7t3i6UWddTZClE5M3h1iIes=;
	b=IEdYhBLbTOffEHfJfIpdbjq9vdqxMnhZ0FK0XB9zSaDt+K9VmLtYzhUJMKHi6BCwx8
	F/tprISkiS6BtAAoT/frNrjHklQ8+JHYrn4HNFthYtUMPVx6BhMvIz6kpDC+vZ83auRH
	ZTv3xlEYtwOzuCKOAr/Ers9ISm1RnLocE+651N6uDJSWtQZQicB5jXUqxvTISA8/58AD
	70QZtdLBXQVI38CI26cybxd5sMH85fIoVfdwP4xXnE9gpjTQf/lqnjMl5mOrNjSLvcHs
	xoR4rR0WWXeLt6KSOwEx98mk/MWug7zWcXu5X4VMJ584DszCIOYU6tTNOX7H2oAopFoN
	iMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xtJaArWry1ewjAKrNvoe7t3i6UWddTZClE5M3h1iIes=;
	b=qOZEws6zs5PW4z3jSpAA6fvuZupX+NqiRVwxs/9OX4fT03wW0dbfCUNLF7sOFwisWl
	IBqDHTgMsmc0RRgY7FeVnRwIuph4PKPhEB3r2dpuhj1nMeNeq3zJl2/O1XaEM8e6TyZ7
	CoanixIZ3/h39Ptt/mWZrgiiX8fK7PvXEN7Y2e7NaN3mT4AvDc2DCh6Ery9fZ4Ngp3us
	FvLw8/8OXT7RMYhZ0SFXoEsRZo141NxOUKBNpYD3DFkIwW/tUVJgTfKhiAOseEvjuXu1
	H4uxoEKBpyKVnL56j1gC1Xdkh7HT8u3JlET5IM571FaB1z6tyxeynU3cw4EW3TwCxQOc
	af4w==
X-Gm-Message-State: APzg51BYibmTy042/e9rdJZeotDGM3KSipBfaXYRwUclg1SjAj0cmK5k
	uGyoicJDzT2tqMK2RcXqykF4/Hw4
X-Google-Smtp-Source: ANB0VdZhpiQ6FF/Ze0NpyLd4bvcU2LaMb1QnDcGUGdMKMbMbeMmrzg+Mb5Mb/YZYnIEQFATS4ztUwA==
X-Received: by 2002:adf:f7c4:: with SMTP id a4-v6mr466387wrq.86.1534598824166; 
	Sat, 18 Aug 2018 06:27:04 -0700 (PDT)
Received: from localhost.localdomain ([37.160.72.44])
	by smtp.gmail.com with ESMTPSA id
	y128-v6sm5443749wmy.26.2018.08.18.06.27.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 06:27:03 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 15:26:59 +0200
Message-Id: <20180818132659.4734-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: bump version to 2.10.5, refresh patches
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
X-List-Received-Date: Sat, 18 Aug 2018 13:27:04 -0000

---
 .../cpprest/cpprest-2.10.3/732.patch          | 25 --------
 .../cpprest-2.10.3/fix-cmake-install.patch    | 59 -------------------
 .../747.patch                                 |  1 +
 .../cpprest/cpprest-2.10.5/845.patch          | 42 +++++++++++++
 .../disable-float-tests.patch                 |  0
 .../disable-outside-tests.patch               |  0
 .../disable-test-timeouts.patch               |  0
 .../{cpprest_2.10.3.bb => cpprest_2.10.5.bb}  |  7 +--
 8 files changed, 46 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.3/732.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.3 => cpprest-2.10.5}/747.patch (87%)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.5/845.patch
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.3 => cpprest-2.10.5}/disable-float-tests.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.3 => cpprest-2.10.5}/disable-outside-tests.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.3 => cpprest-2.10.5}/disable-test-timeouts.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.3.bb => cpprest_2.10.5.bb} (82%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/732.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/732.patch
deleted file mode 100644
index 9fcffbfed..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/732.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3d8caad3f459d8b2136c5bc9be7fdec53e5d777d Mon Sep 17 00:00:00 2001
-From: Wu Yongwei <wuyongwei@gmail.com>
-Date: Tue, 10 Apr 2018 11:29:12 +0800
-Subject: [PATCH] Fix a build problem on Clang.
-
-AND_CAPTURE_MEMBER_FUNCTION_POINTERS workaround had a check for GCC,
-but did not exclude Clang.  Clang has a fake GCC version of 4.2, thus
-caused problems.
----
- Release/src/http/client/http_client_asio.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Release/src/http/client/http_client_asio.cpp b/Release/src/http/client/http_client_asio.cpp
-index 4ba3e085..fca4bb5b 100644
---- a/Release/src/http/client/http_client_asio.cpp
-+++ b/Release/src/http/client/http_client_asio.cpp
-@@ -47,7 +47,7 @@
- #include <unordered_set>
- #include <memory>
- 
--#if defined(__GNUC__)
-+#if defined(__GNUC__) && !defined(__clang__)
- 
- #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
- #define AND_CAPTURE_MEMBER_FUNCTION_POINTERS
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch
deleted file mode 100644
index 4d03e6d28..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Description: install cmake files into /usr/lib/cmake/cpprestsdk
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-Upstream-Status: https://github.com/Microsoft/cpprestsdk/pull/737
-Forwarded: https://github.com/Microsoft/cpprestsdk/pull/737
-Last-Update: 2018-04-19
-
-Index: cpprest/Release/CMakeLists.txt
-===================================================================
---- cpprest.orig/Release/CMakeLists.txt
-+++ cpprest/Release/CMakeLists.txt
-@@ -18,7 +18,6 @@
- set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
- set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
- set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
--set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
- set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
- set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
- 
-@@ -63,6 +62,9 @@
- include(cmake/cpprest_find_openssl.cmake)
- include(cmake/cpprest_find_websocketpp.cmake)
- include(CheckIncludeFiles)
-+if(UNIX)
-+include(GNUInstallDirs)
-+endif(UNIX)
- 
- find_package(Threads REQUIRED)
- if(THREADS_HAVE_PTHREAD_ARG)
-Index: cpprest/Release/src/CMakeLists.txt
-===================================================================
---- cpprest.orig/Release/src/CMakeLists.txt
-+++ cpprest/Release/src/CMakeLists.txt
-@@ -253,21 +253,21 @@
-   install(
-     TARGETS ${CPPREST_TARGETS}
-     EXPORT cpprestsdk-targets
--    RUNTIME DESTINATION bin
--    LIBRARY DESTINATION lib
--    ARCHIVE DESTINATION lib
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-   )
- 
-   configure_file(../cmake/cpprestsdk-config.in.cmake "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake" @ONLY)
- 
-   install(
-     FILES "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake"
--    DESTINATION ${CPPREST_EXPORT_DIR}
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
-   )
-   install(
-     EXPORT cpprestsdk-targets
-     FILE cpprestsdk-targets.cmake
-     NAMESPACE cpprestsdk::
--    DESTINATION ${CPPREST_EXPORT_DIR}
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
-   )
- endif()
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/747.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch
similarity index 87%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.3/747.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch
index 94bb00598..81a76ea9f 100644
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/747.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch
@@ -1,4 +1,5 @@
 Description: fix for upstream issue 747, clang 6 build error
+Forwarded: https://github.com/Microsoft/cpprestsdk/pull/844
 From: rozhuk-im
 --- a/Release/include/pplx/pplxlinux.h	2018-04-29 16:22:39.927675000 +0300
 +++ b/Release/include/pplx/pplxlinux.h	2018-04-29 16:22:57.809537000 +0300
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/845.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/845.patch
new file mode 100644
index 000000000..8a349aef7
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/845.patch
@@ -0,0 +1,42 @@
+From c4a09f3d29a57022e03e2849f04c111a57a6a388 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Sat, 18 Aug 2018 14:59:38 +0200
+Subject: [PATCH] Fix default installation path
+
+---
+ Release/CMakeLists.txt     | 2 +-
+ Release/src/CMakeLists.txt | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
+index c93d3cc49..d20b4b070 100644
+--- a/Release/CMakeLists.txt
++++ b/Release/CMakeLists.txt
+@@ -18,7 +18,7 @@ enable_testing()
+ set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
+ set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
+ set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
+-set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
++set(CPPREST_EXPORT_DIR cmake CACHE STRING "Directory to install CMake config files.")
+ set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
+ set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
+ 
+diff --git a/Release/src/CMakeLists.txt b/Release/src/CMakeLists.txt
+index a34605bda..050ff71fc 100644
+--- a/Release/src/CMakeLists.txt
++++ b/Release/src/CMakeLists.txt
+@@ -262,12 +262,12 @@ if(CPPREST_INSTALL)
+ 
+   install(
+     FILES "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake"
+-    DESTINATION ${CPPREST_EXPORT_DIR}
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CPPREST_EXPORT_DIR}
+   )
+   install(
+     EXPORT cpprestsdk-targets
+     FILE cpprestsdk-targets.cmake
+     NAMESPACE cpprestsdk::
+-    DESTINATION ${CPPREST_EXPORT_DIR}
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CPPREST_EXPORT_DIR}
+   )
+ endif()
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-float-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-float-tests.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-float-tests.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-outside-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-outside-tests.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-outside-tests.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-test-timeouts.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-test-timeouts.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-test-timeouts.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-test-timeouts.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.5.bb
similarity index 82%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.5.bb
index addacbbd2..040c43ff0 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.5.bb
@@ -9,13 +9,12 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-outside-tests.patch \
            file://disable-test-timeouts.patch \
            file://disable-float-tests.patch \
-           file://fix-cmake-install.patch \
            file://747.patch \
-           file://732.patch \
+           file://845.patch \
            "
 
-# tag 2.10.3
-SRCREV= "e388a2e523f4d0b6aee2bb923637d82d8b969556"
+# tag 2.10.5
+SRCREV= "25d6b26f7038eeec3b51e2e0a70960a8e34fcd68"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


