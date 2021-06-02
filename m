Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1050.1622654449164436562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 10:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3Zu/KQM;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id r1so2801112pgk.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oDf8xkc1E5EvKyOsFfGL1scTfL3TRlEiFvS/mW6DeYs=;
        b=X3Zu/KQM1CC0Q/PQSvBCYu65Fi0Tvva5b0cQFoephidsR7PAP3puFNO6BgGDKOVrD9
         ccUJw38hwz7FxKte6sP5gysLEvAum3bK4sHb/l7ygjw4zAOic4wk1/WQrQZS2XvZzr8C
         9YbQjbqsZNW3Zk/2G/w+ysYIPDlZRbAPL0Zefn71A/W3A34MsYe524Ievz9OgTEEXQEj
         riIwvDRv3iEek/ug2yCkp8yDmzdDoyIlTKmg1djekrUjEb1yOyuKMkaSy8I1aAJnqbaM
         NxebBfS854bveswVwTyU8KKNhjYX2kzJFIEka+M1MfLLOc5Mtc+IvPUSNfiiAS5U0kPU
         xARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oDf8xkc1E5EvKyOsFfGL1scTfL3TRlEiFvS/mW6DeYs=;
        b=bPw1C9wS9rag4mP+bk4lAU1Y6qplJl8ixb9H+J5IePkb5AgTW31KvQcjFun1cff3Iu
         45rJKcL9YihdyS8omh1gtpImNHbfJ5y39q0HC5XEjJUZWuRBcxobvz9zeEOofeBPluJR
         mPd0uDke++mEggRkXeYkYWjzgQb9DIRnGEJ5Lnj3HhDP4tbiVyYMpwr2j+Ir6ES82tMg
         gEpiB40C9xVwuB5oKyODjP3Pr+fRXyiSEgih/uzAUwYZgwfvH4uzSslGMRrR65NzUdwo
         MjbbVaRSuYo9ojsWVs5L7zJOlXjVbyWKnjyptACpHKHSNKg4AEsUS3BFmip+8eUvYwrH
         VmUQ==
X-Gm-Message-State: AOAM533gCIzMNSBnT9imsXsnbpZe/86aJcPOWasbLfRTfGm+Ljtq0uAO
	xj0OFCLVoB0HDVL+1dG/7uC79cwd7jNYOg==
X-Google-Smtp-Source: ABdhPJyq2xq/03pgBFBSepssd2mTyEeVVCsjF5P6rC++wyt5wVPJExYdTNEplKmtbJWQ/MwP1zvPqw==
X-Received: by 2002:aa7:947d:0:b029:2ea:1b56:3acb with SMTP id t29-20020aa7947d0000b02902ea1b563acbmr4819416pfq.68.1622654448099;
        Wed, 02 Jun 2021 10:20:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q91sm110107pja.50.2021.06.02.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 10:20:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] glog: Upgrade to 0.5.0
Date: Wed,  2 Jun 2021 10:20:45 -0700
Message-Id: <20210602172045.3020072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Libunwind is being detected now via cmake correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...0001-Find-Libunwind-during-configure.patch | 119 ------------------
 .../glog/glog/libexecinfo.patch               |  14 +--
 .../glog/{glog_0.4.0.bb => glog_0.5.0.bb}     |   3 +-
 3 files changed, 8 insertions(+), 128 deletions(-)
 delete mode 100644 meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
 rename meta-oe/recipes-support/glog/{glog_0.4.0.bb => glog_0.5.0.bb} (90%)

diff --git a/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
deleted file mode 100644
index 4c0861cca1..0000000000
--- a/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
+++ /dev/null
@@ -1,119 +0,0 @@
---- /dev/null
-+++ b/cmake/FindLibunwind.cmake
-@@ -0,0 +1,54 @@
-+# - Try to find libunwind
-+# Once done this will define
-+#
-+#  Libunwind_FOUND - system has libunwind
-+#  unwind - cmake target for libunwind
-+
-+find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
-+include (CheckIncludeFile)
-+check_include_file (libunwind.h HAVE_LIBUNWIND_H)
-+check_include_file (unwind.h HAVE_UNWIND_H)
-+
-+if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
-+    set(LIBUNWIND_ARCH "arm")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
-+    set(LIBUNWIND_ARCH "aarch64")
-+elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
-+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
-+        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
-+    set(LIBUNWIND_ARCH "x86_64")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
-+    set(LIBUNWIND_ARCH "x86")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
-+    set(LIBUNWIND_ARCH "ppc64")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
-+    set(LIBUNWIND_ARCH "ppc32")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
-+    set(LIBUNWIND_ARCH "mips")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
-+    set(LIBUNWIND_ARCH "hppa")
-+elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
-+    set(LIBUNWIND_ARCH "ia64")
-+endif()
-+
-+find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}" DOC "unwind library platform")
-+if (UNWIND_LIBRARY_PLATFORM)
-+    set(HAVE_LIB_UNWIND "1")
-+endif()
-+
-+include(FindPackageHandleStandardArgs)
-+# handle the QUIETLY and REQUIRED arguments and set Libunwind_FOUND to TRUE
-+# if all listed variables are TRUE
-+find_package_handle_standard_args(Libunwind DEFAULT_MSG
-+    UNWIND_LIBRARY HAVE_LIBUNWIND_H HAVE_UNWIND_H HAVE_LIB_UNWIND)
-+
-+mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
-+
-+if (Libunwind_FOUND)
-+    add_library(unwind INTERFACE IMPORTED)
-+    set_target_properties(unwind PROPERTIES
-+        INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
-+    )
-+else()
-+    message("Can't find libunwind library")
-+endif()
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -64,7 +64,6 @@ check_include_file (dlfcn.h HAVE_DLFCN_H
- check_include_file (execinfo.h HAVE_EXECINFO_H)
- check_include_file (glob.h HAVE_GLOB_H)
- check_include_file (inttypes.h HAVE_INTTYPES_H)
--check_include_file (libunwind.h HAVE_LIBUNWIND_H)
- check_include_file (memory.h HAVE_MEMORY_H)
- check_include_file (pwd.h HAVE_PWD_H)
- check_include_file (stdint.h HAVE_STDINT_H)
-@@ -80,7 +79,6 @@ check_include_file (syscall.h HAVE_SYSCA
- check_include_file (syslog.h HAVE_SYSLOG_H)
- check_include_file (ucontext.h HAVE_UCONTEXT_H)
- check_include_file (unistd.h HAVE_UNISTD_H)
--check_include_file (unwind.h HAVE_UNWIND_H)
- check_include_file (pwd.h HAVE_PWD_H)
- 
- check_include_file_cxx ("ext/hash_map" HAVE_EXT_HASH_MAP)
-@@ -116,11 +114,9 @@ check_cxx_compiler_flag (-Wunnamed-type-
- # snprintf as an inline function
- check_symbol_exists (snprintf stdio.h HAVE_SNPRINTF)
- 
--check_library_exists (unwind get_static_proc_name "" HAVE_LIB_UNWIND)
- check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
- 
--find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
--mark_as_advanced (UNWIND_LIBRARY)
-+find_package(Libunwind)
- 
- check_c_source_compiles ("
- #include <stdlib.h>
-@@ -471,9 +467,9 @@ add_library(glog::glog ALIAS glog)
- 
- set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
- 
--if (UNWIND_LIBRARY)
--  target_link_libraries (glog PUBLIC ${UNWIND_LIBRARY})
--endif (UNWIND_LIBRARY)
-+if (Libunwind_FOUND)
-+  target_link_libraries (glog PUBLIC unwind)
-+endif (Libunwind_FOUND)
- 
- if (HAVE_DBGHELP)
-    target_link_libraries (glog PUBLIC dbghelp)
-@@ -678,6 +674,7 @@ export (PACKAGE glog)
- install (FILES
-   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
-   ${CMAKE_CURRENT_BINARY_DIR}/glog-config-version.cmake
-+  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindLibunwind.cmake
-   DESTINATION ${_glog_CMake_INSTALLDIR})
- 
- install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
---- a/glog-config.cmake.in
-+++ b/glog-config.cmake.in
-@@ -8,4 +8,7 @@ include (CMakeFindDependencyMacro)
- 
- @gflags_DEPENDENCY@
- 
-+list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
-+find_dependency (Libunwind)
-+
- include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
diff --git a/meta-oe/recipes-support/glog/glog/libexecinfo.patch b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
index ae46d3274f..927c269a6a 100644
--- a/meta-oe/recipes-support/glog/glog/libexecinfo.patch
+++ b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
@@ -8,17 +8,17 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -115,6 +115,7 @@ check_cxx_compiler_flag (-Wunnamed-type-
- check_symbol_exists (snprintf stdio.h HAVE_SNPRINTF)
+@@ -144,6 +144,7 @@ check_cxx_compiler_flag (-Wunnamed-type-
+ check_symbol_exists (snprintf cstdio HAVE_SNPRINTF)
  
  check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
 +check_library_exists (execinfo backtrace "" HAVE_EXECINFO)
  
- find_package(Libunwind)
- 
-@@ -471,6 +472,10 @@ if (Libunwind_FOUND)
-   target_link_libraries (glog PUBLIC unwind)
- endif (Libunwind_FOUND)
+ check_cxx_source_compiles ("
+ #include <cstdlib>
+@@ -584,6 +585,10 @@ if (Unwind_FOUND)
+   set (Unwind_DEPENDENCY "find_dependency (Unwind ${Unwind_VERSION})")
+ endif (Unwind_FOUND)
  
 +if (HAVE_EXECINFO)
 +  target_link_libraries (glog PUBLIC execinfo)
diff --git a/meta-oe/recipes-support/glog/glog_0.4.0.bb b/meta-oe/recipes-support/glog/glog_0.5.0.bb
similarity index 90%
rename from meta-oe/recipes-support/glog/glog_0.4.0.bb
rename to meta-oe/recipes-support/glog/glog_0.5.0.bb
index 6b101ef676..c4ba9f244f 100644
--- a/meta-oe/recipes-support/glog/glog_0.4.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.5.0.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
 SRC_URI = " \
     git://github.com/google/glog.git;nobranch=1 \
-    file://0001-Find-Libunwind-during-configure.patch \
     file://libexecinfo.patch \
 "
 
-SRCREV = "96a2f23dca4cc7180821ca5f32e526314395d26a"
+SRCREV = "8f9ccfe770add9e4c64e9b25c102658e3c763b73"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

