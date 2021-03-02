Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.4507.1614661813149284850
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 21:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gpNVcSCY;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u12so1143159pjr.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 21:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WBan/J0y5KnjIM0qEKJLNefUYNOSH+zclQ4eLJb2rlM=;
        b=gpNVcSCY8kTais14fpx0ANbAWC3GZYc77usEUczL7aC0LyinvUXtrVZMj+CSoCU3Po
         Aybome3UjTM+4Z0DLj0zWIF26AoJZFwqPKhiwyf8EodxbhNaH+HPzwW+BuEUNHOHUGmG
         Kcwy966NQPnz1o6qWmyuhDMQ6kA4jlUrCjy79sxHeW5ICC2USQwLCqjQzEfY1eQlkIuD
         J4splF9qkP8Z+TyBZ6DVncPfs4i+pRQpCEoH1LWUJT427L3KnBtJPL943/5ykLnvDH69
         UF7/CDtaFzv1U5rlBoPMiIItE9GXkrTrx8O2iIbkWZLQDSOCrgu44WyWHhMXQ4mdCrQX
         N3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WBan/J0y5KnjIM0qEKJLNefUYNOSH+zclQ4eLJb2rlM=;
        b=lDH2DjOAGup2ujB5cZcsHw2sQaD8BJGB/T1ENWo7+CAOMq3XCxfY+5Z8ijb+KDGe51
         fPCGl6U0ITjmzIfnsOMXMRucgG3j3z6pkpG4VQYhe1FfV3vVK/jfj5+lZOehFMdLZdAo
         vkOY9nKXAxqygUEwc07pnxpL4KncWv1RJ9L4KVE/DI3CUyGBrF0ocH5v9ElL7bn+aJ5I
         f4DE+B+jFLKJt3nt1KEhtrDWOeRVUQnVl5bSz2Kt/wtAE8nbAbnQ24s59aI+DFJ1GPwP
         SW5aDU1Jd0Q/HNUoqBqEnVoB3KZAXZDHSN1NaqGYM6WYWTqx3x8QqQ6ScA3noOzYZGQu
         +eoA==
X-Gm-Message-State: AOAM533+d6g9a7iMKXFGBVi5NSUohe7N2IYu7JHToMi2UKasJ47ZeuEp
	9TeeRKL+ehWENV6lmuqdVUwaCdeB94KZmg==
X-Google-Smtp-Source: ABdhPJy3hfa1Welu+FxzZA49ArCSdRAbCbGqgJEn8KCP4GjoQw50WsQjOtDf8+b445c3HiY7VDEbJQ==
X-Received: by 2002:a17:90a:9f43:: with SMTP id q3mr2539170pjv.50.1614661812089;
        Mon, 01 Mar 2021 21:10:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id p190sm4470195pga.78.2021.03.01.21.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:10:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH 1/3] glog: Upgrade to 0.4.0
Date: Mon,  1 Mar 2021 21:10:07 -0800
Message-Id: <20210302051009.292001-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...001-Find-Libunwind-during-configure.patch} | 40 +++++------
 ...Rework-CMake-glog-VERSION-management.patch | 71 -------------------
 .../glog/0003-installation-path-fix.patch     | 65 -----------------
 .../glog/{glog_0.3.5.bb => glog_0.4.0.bb}     |  6 +-
 4 files changed, 21 insertions(+), 161 deletions(-)
 rename meta-oe/recipes-support/glog/glog/{0002-Find-Libunwind-during-configure.patch => 0001-Find-Libunwind-during-configure.patch} (79%)
 delete mode 100644 meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch
 delete mode 100644 meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch
 rename meta-oe/recipes-support/glog/{glog_0.3.5.bb => glog_0.4.0.bb} (80%)

diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
similarity index 79%
rename from meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
rename to meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
index 15cf67fd2e..577007a62e 100644
--- a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
@@ -1,6 +1,5 @@
-diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
---- a/cmake/FindLibunwind.cmake	1970-01-01 01:00:00.000000000 +0100
-+++ b/cmake/FindLibunwind.cmake	2018-11-20 15:53:48.799078114 +0100
+--- /dev/null
++++ b/cmake/FindLibunwind.cmake
 @@ -0,0 +1,54 @@
 +# - Try to find libunwind
 +# Once done this will define
@@ -56,10 +55,9 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 +else()
 +    message("Can't find libunwind library")
 +endif()
-diff -uNr a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt	2018-11-20 15:49:07.576278417 +0100
-+++ b/CMakeLists.txt	2018-11-20 15:49:32.106819928 +0100
-@@ -58,7 +58,6 @@
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -64,7 +64,6 @@ check_include_file (dlfcn.h HAVE_DLFCN_H
  check_include_file (execinfo.h HAVE_EXECINFO_H)
  check_include_file (glob.h HAVE_GLOB_H)
  check_include_file (inttypes.h HAVE_INTTYPES_H)
@@ -67,27 +65,28 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
  check_include_file (memory.h HAVE_MEMORY_H)
  check_include_file (pwd.h HAVE_PWD_H)
  check_include_file (stdint.h HAVE_STDINT_H)
-@@ -74,7 +73,6 @@
+@@ -80,7 +79,6 @@ check_include_file (syscall.h HAVE_SYSCA
  check_include_file (syslog.h HAVE_SYSLOG_H)
  check_include_file (ucontext.h HAVE_UCONTEXT_H)
  check_include_file (unistd.h HAVE_UNISTD_H)
 -check_include_file (unwind.h HAVE_UNWIND_H)
+ check_include_file (pwd.h HAVE_PWD_H)
  
  check_include_file_cxx ("ext/hash_map" HAVE_EXT_HASH_MAP)
- check_include_file_cxx ("ext/hash_set" HAVE_EXT_HASH_SET)
-@@ -109,10 +107,7 @@
+@@ -116,11 +114,9 @@ check_cxx_compiler_flag (-Wunnamed-type-
  # snprintf as an inline function
  check_symbol_exists (snprintf stdio.h HAVE_SNPRINTF)
  
 -check_library_exists (unwind get_static_proc_name "" HAVE_LIB_UNWIND)
--
+ check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
+ 
 -find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
 -mark_as_advanced (UNWIND_LIBRARY)
 +find_package(Libunwind)
  
  check_c_source_compiles ("
  #include <stdlib.h>
-@@ -376,9 +371,9 @@
+@@ -471,9 +467,9 @@ add_library(glog::glog ALIAS glog)
  
  set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
  
@@ -98,20 +97,19 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
 +  target_link_libraries (glog PUBLIC unwind)
 +endif (Libunwind_FOUND)
  
- if (HAVE_PTHREAD)
-   target_link_libraries (glog PUBLIC ${CMAKE_THREAD_LIBS_INIT})
-@@ -571,6 +566,7 @@
+ if (HAVE_DBGHELP)
+    target_link_libraries (glog PUBLIC dbghelp)
+@@ -678,6 +674,7 @@ export (PACKAGE glog)
  install (FILES
    ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/glog-config-version.cmake
 +  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindLibunwind.cmake
-   DESTINATION lib/cmake/glog)
+   DESTINATION ${_glog_CMake_INSTALLDIR})
  
- install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
-diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
---- a/glog-config.cmake.in	2018-11-20 15:49:07.576278417 +0100
-+++ b/glog-config.cmake.in	2018-11-20 15:52:32.330418489 +0100
-@@ -4,4 +4,6 @@
+ install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
+--- a/glog-config.cmake.in
++++ b/glog-config.cmake.in
+@@ -8,4 +8,6 @@ include (CMakeFindDependencyMacro)
  
  @gflags_DEPENDENCY@
  
diff --git a/meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch b/meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch
deleted file mode 100644
index f41a6c9724..0000000000
--- a/meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4ea11e0d7c0575316a6ccc07a931164ca29c3d2f Mon Sep 17 00:00:00 2001
-From: Corentin Le Molgat <corentinl@google.com>
-Date: Mon, 29 Jan 2018 14:59:08 +0100
-Subject: [PATCH] Rework CMake glog VERSION management.
-
-- Use of Project version properties instead of custom variables
-- fix missmatch between VERSION (build version) and SOVERSION (API version)
-src: https://cmake.org/cmake/help/latest/prop_tgt/VERSION.html#prop_tgt:VERSION
-
-Upstream-Status: Backport [https://github.com/google/glog/commit/6b6e38a7d53fe01f42ce34384cf4ba4c50e8cb65]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- CMakeLists.txt | 23 ++++++++---------------
- 1 file changed, 8 insertions(+), 15 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7415eab..fb4e408 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -8,23 +8,16 @@ if (POLICY CMP0063)
-   cmake_policy (SET CMP0063 NEW)
- endif (POLICY CMP0063)
- 
--project (google-glog)
-+project(glog VERSION 0.3.5 LANGUAGES C CXX)
- 
- enable_testing ()
- 
--set (GLOG_MAJOR_VERSION 0)
--set (GLOG_MINOR_VERSION 3)
--set (GLOG_PATCH_VERSION 5)
--
--set (GLOG_VERSION
--  ${GLOG_MAJOR_VERSION}.${GLOG_MINOR_VERSION}.${GLOG_PATCH_VERSION})
--
- set (CPACK_PACKAGE_NAME glog)
- set (CPACK_PACKAGE_DESCRIPTION_SUMMARY "")
--set (CPACK_PACKAGE_VERSION_MAJOR ${GLOG_MAJOR_VERSION})
--set (CPACK_PACKAGE_VERSION_MINOR ${GLOG_MINOR_VERSION})
--set (CPACK_PACKAGE_VERSION_PATCH ${GLOG_PATCH_VERSION})
--set (CPACK_PACKAGE_VERSION ${GLOG_VERSION})
-+set (CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
-+set (CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
-+set (CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
-+set (CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
- 
- option (WITH_GFLAGS "Use gflags" ON)
- option (WITH_THREADS "Enable multithreading support" ON)
-@@ -406,8 +399,8 @@ if (gflags_FOUND)
-   endif (NOT BUILD_SHARED_LIBS)
- endif (gflags_FOUND)
- 
--set_target_properties (glog PROPERTIES VERSION ${GLOG_MAJOR_VERSION})
--set_target_properties (glog PROPERTIES SOVERSION ${GLOG_VERSION})
-+set_target_properties (glog PROPERTIES VERSION ${PROJECT_VERSION})
-+set_target_properties (glog PROPERTIES SOVERSION ${PROJECT_VERSION_MAJOR})
- 
- if (WIN32)
-   target_compile_definitions (glog PUBLIC GLOG_NO_ABBREVIATED_SEVERITIES)
-@@ -570,7 +563,7 @@ configure_package_config_file (glog-config.cmake.in
-   NO_CHECK_REQUIRED_COMPONENTS_MACRO)
- 
- write_basic_package_version_file (glog-config-version.cmake VERSION
--  ${GLOG_VERSION} COMPATIBILITY SameMajorVersion)
-+  ${PROJECT_VERSION} COMPATIBILITY SameMajorVersion)
- 
- export (TARGETS glog NAMESPACE glog:: FILE glog-targets.cmake)
- export (PACKAGE glog)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch b/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch
deleted file mode 100644
index 641f70cb24..0000000000
--- a/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-diff -uNr a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt	2018-12-05 12:55:59.630792054 +0100
-+++ b/CMakeLists.txt	2018-12-05 13:00:22.922269200 +0100
-@@ -403,10 +403,15 @@
- 
- set_target_properties (glog PROPERTIES PUBLIC_HEADER "${GLOG_PUBLIC_H}")
- 
-+set (_glog_CMake_BINDIR ${CMAKE_INSTALL_BINDIR})
-+set (_glog_CMake_INCLUDE_DIR ${CMAKE_INSTALL_INCLUDEDIR})
-+set (_glog_CMake_LIBDIR ${CMAKE_INSTALL_LIBDIR})
-+set (_glog_CMake_INSTALLDIR ${_glog_CMake_LIBDIR}/cmake/glog)
-+
- target_include_directories (glog BEFORE PUBLIC
-   "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
-   "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>"
--  "$<INSTALL_INTERFACE:include>"
-+  "$<INSTALL_INTERFACE:${_glog_CMake_INCLUDE_DIR}>"
-   PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
-   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)
- 
-@@ -543,10 +548,10 @@
- 
- install (TARGETS glog
-   EXPORT glog-targets
--  RUNTIME DESTINATION bin
--  PUBLIC_HEADER DESTINATION include/glog
--  LIBRARY DESTINATION lib
--  ARCHIVE DESTINATION lib)
-+  RUNTIME DESTINATION ${_glog_CMake_BINDIR}
-+  PUBLIC_HEADER DESTINATION ${_glog_CMake_INCLUDE_DIR}/glog
-+  LIBRARY DESTINATION ${_glog_CMake_LIBDIR}
-+  ARCHIVE DESTINATION ${_glog_CMake_LIBDIR})
- 
- if (gflags_FOUND)
-   set (gflags_DEPENDENCY "find_dependency (gflags ${gflags_VERSION})")
-@@ -554,7 +559,7 @@
- 
- configure_package_config_file (glog-config.cmake.in
-   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
--  INSTALL_DESTINATION lib/cmake/glog
-+  INSTALL_DESTINATION ${_glog_CMake_INSTALLDIR}
-   NO_CHECK_REQUIRED_COMPONENTS_MACRO)
- 
- write_basic_package_version_file (glog-config-version.cmake VERSION
-@@ -567,6 +572,7 @@
-   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
-   ${CMAKE_CURRENT_BINARY_DIR}/glog-config-version.cmake
-   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindLibunwind.cmake
--  DESTINATION lib/cmake/glog)
-+  DESTINATION ${_glog_CMake_INSTALLDIR})
- 
--install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
-+install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
-+  ${_glog_CMake_INSTALLDIR})
-diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
---- a/glog-config.cmake.in	2018-12-05 12:55:59.630792054 +0100
-+++ b/glog-config.cmake.in	2018-12-05 13:05:19.547196843 +0100
-@@ -4,6 +4,7 @@
- 
- @gflags_DEPENDENCY@
- 
-+list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
- find_dependency (Libunwind)
- 
- include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.4.0.bb
similarity index 80%
rename from meta-oe/recipes-support/glog/glog_0.3.5.bb
rename to meta-oe/recipes-support/glog/glog_0.4.0.bb
index 56bf515544..8dc84e4125 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.4.0.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
 SRC_URI = " \
     git://github.com/google/glog.git;nobranch=1 \
-    file://0001-Rework-CMake-glog-VERSION-management.patch \
-    file://0002-Find-Libunwind-during-configure.patch \
-    file://0003-installation-path-fix.patch \
+    file://0001-Find-Libunwind-during-configure.patch \
 "
 
-SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
+SRCREV = "96a2f23dca4cc7180821ca5f32e526314395d26a"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.1

