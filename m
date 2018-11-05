Return-Path: <uvv.mail@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB3BB79E76
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 07:20:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q12-v6so6943759wmq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Nov 2018 23:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gobv/z6uE0HB4HyZeTMXf0mTKOrAah0igt0RADdNo7g=;
	b=d0F6YFHVNKySViMsaNGd708Qk0bK0/xEuIreEjwwF1XCtKQ/MLcDU7nqnPthz1oIBS
	WkVeIFe8GulI9P7d+CuykDUkU+a8yaKN4/EcLw7UJ0j2Us7t7oEYYjJY6ZyhwyZHPVYM
	wUKFUcOXlihjfLpebl3Cdr+89xgF1NzQrvLglm+DCj0oioyIy9e8Si6ez1u1RPeGNjHy
	ha7gFS0i2KGarjcLnhRIMDaPApjKs1rWRgCQ+Y8BRZ7ZDJq5n1AK17SmHFgB0sZzDLDs
	kwieoZakljte1pwakvOkCxCjq/36vaqQMB+8i66GmGnVeKg/ZrN5fie+qUPiQC8Aeq9F
	BUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gobv/z6uE0HB4HyZeTMXf0mTKOrAah0igt0RADdNo7g=;
	b=Eb3XIADzqbNMh/vjbnapTnG5Dgfje4avhv6aBl4jyCUmzhUrrcO7tcD8KwTonnS84j
	Eu27Mta/cNzyzo0t2IzBY+5z9eiAogDkx1fX9XXz0geQyCTAqjVzgmSkYHpKsPFtMuuX
	YwVpofy+Yj6peaiZGYiI2XMjXEAj9+in6BP3nsX+pgL/e6a0em6RQ8v2EeimelxukMKI
	xdwequQdyCDaO28yhVY6SowTk/cIU+9CEvtadoQb4N7tKY2eKP5sE4N08Ha8WYBQtcSV
	nJ/6xGIXi8uwxtn8tAeyBQeFmGFchcGU7i1WDxESHw883Al65Q0WJkuITRBXmTYGo0Bd
	uVfQ==
X-Gm-Message-State: AGRZ1gKnNjsAfUr50Ro8Xr0HT8tAV/l8s6j27xSzEFf+otU7ZF2vNHnV
	z6Pw62U0kvN1JLldQrZakCdSnOvMXqQ=
X-Google-Smtp-Source: AJdET5deqLaV7JZEpk0Ytg9QqCpIdR8SgzxtZHTPf+VL2HyjUeP5pw8eKrTw5D20nLz1MFdzcOGPsA==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15-v6mr5229401wmb.1.1541402403969;
	Sun, 04 Nov 2018 23:20:03 -0800 (PST)
Received: from localhost.localdomain (ip-109-42-0-118.web.vodafone.de.
	[109.42.0.118]) by smtp.gmail.com with ESMTPSA id
	e8-v6sm19353151wrw.75.2018.11.04.23.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 Nov 2018 23:20:03 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Nov 2018 08:18:47 +0100
Message-Id: <20181105071847.26859-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH v2] glog: updated libunwind look up function
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
X-List-Received-Date: Mon, 05 Nov 2018 07:20:04 -0000
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Updated FindLinunwind cmake file to locate libunwind properly in the system.
This includes settings all needed defines in config.h file, which are used
for glog compilation. Changed unwind cmake target to interface, because in
cross-compilation environment we could link against several libunwind shared
libraries.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...0001-find-libunwind-during-configure.patch |  30 -----
 ...0002-Find-Libunwind-during-configure.patch | 113 ++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |   6 +-
 3 files changed, 115 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
 create mode 100644 meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch

diff --git a/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
deleted file mode 100644
index 33dc9d38a..000000000
--- a/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff -ur git/CMakeLists.txt ../0.3.5-r0.unwind/git/CMakeLists.txt
---- git/CMakeLists.txt	2018-10-08 08:54:15.118989400 +0200
-+++ ../0.3.5-r0.unwind/git/CMakeLists.txt	2018-10-05 16:26:59.745922318 +0200
-@@ -384,7 +384,9 @@
- set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
- 
- if (UNWIND_LIBRARY)
--  target_link_libraries (glog PUBLIC ${UNWIND_LIBRARY})
-+  add_library(unwind SHARED IMPORTED)
-+  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
-+  target_link_libraries (glog PUBLIC unwind)
- endif (UNWIND_LIBRARY)
- 
- if (HAVE_PTHREAD)
-diff -ur git/glog-config.cmake.in ../0.3.5-r0.unwind/git/glog-config.cmake.in
---- git/glog-config.cmake.in	2018-10-08 08:54:15.122989699 +0200
-+++ ../0.3.5-r0.unwind/git/glog-config.cmake.in	2018-10-08 08:14:48.550745810 +0200
-@@ -4,4 +4,12 @@
- 
- @gflags_DEPENDENCY@
- 
-+find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
-+mark_as_advanced (UNWIND_LIBRARY)
-+
-+if (UNWIND_LIBRARY)
-+  add_library(unwind SHARED IMPORTED)
-+  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
-+endif (UNWIND_LIBRARY)
-+
- include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
new file mode 100644
index 000000000..3a6f824ea
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
@@ -0,0 +1,113 @@
+diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
+--- a/cmake/FindLibunwind.cmake	1970-01-01 01:00:00.000000000 +0100
++++ b/cmake/FindLibunwind.cmake	2018-11-02 14:04:35.460437058 +0100
+@@ -0,0 +1,37 @@
++# - Try to find libunwind
++# Once done this will define
++#
++#  LIBUNWIND_FOUND - system has libunwind
++#  unwind - cmake target for libunwind
++
++find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
++include (CheckIncludeFile)
++check_include_file (libunwind.h HAVE_LIBUNWIND_H)
++check_include_file (unwind.h HAVE_UNWIND_H)
++
++if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
++    set(LIBUNWIND_ARCH "arm")
++elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
++    set(LIBUNWIND_ARCH "x86_64")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
++    set(LIBUNWIND_ARCH "x86")
++endif()
++
++find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}" DOC "unwind library platform")
++if (UNWIND_LIBRARY_PLATFORM)
++    set(HAVE_LIB_UNWIND "1")
++endif()
++
++include(FindPackageHandleStandardArgs)
++# handle the QUIETLY and REQUIRED arguments and set Libunwind_FOUND to TRUE
++# if all listed variables are TRUE
++find_package_handle_standard_args(Libunwind DEFAULT_MSG
++    UNWIND_LIBRARY HAVE_LIBUNWIND_H HAVE_UNWIND_H HAVE_LIB_UNWIND)
++
++mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
++
++add_library(unwind INTERFACE IMPORTED)
++set_target_properties(unwind PROPERTIES
++    INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
++)
+diff -uNr a/CMakeLists.txt b/CMakeLists.txt
+--- a/CMakeLists.txt	2018-11-02 14:02:21.784835854 +0100
++++ b/CMakeLists.txt	2018-11-02 14:03:16.796935594 +0100
+@@ -58,7 +58,6 @@
+ check_include_file (execinfo.h HAVE_EXECINFO_H)
+ check_include_file (glob.h HAVE_GLOB_H)
+ check_include_file (inttypes.h HAVE_INTTYPES_H)
+-check_include_file (libunwind.h HAVE_LIBUNWIND_H)
+ check_include_file (memory.h HAVE_MEMORY_H)
+ check_include_file (pwd.h HAVE_PWD_H)
+ check_include_file (stdint.h HAVE_STDINT_H)
+@@ -74,7 +73,6 @@
+ check_include_file (syslog.h HAVE_SYSLOG_H)
+ check_include_file (ucontext.h HAVE_UCONTEXT_H)
+ check_include_file (unistd.h HAVE_UNISTD_H)
+-check_include_file (unwind.h HAVE_UNWIND_H)
+ 
+ check_include_file_cxx ("ext/hash_map" HAVE_EXT_HASH_MAP)
+ check_include_file_cxx ("ext/hash_set" HAVE_EXT_HASH_SET)
+@@ -109,10 +107,7 @@
+ # snprintf as an inline function
+ check_symbol_exists (snprintf stdio.h HAVE_SNPRINTF)
+ 
+-check_library_exists (unwind get_static_proc_name "" HAVE_LIB_UNWIND)
+-
+-find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
+-mark_as_advanced (UNWIND_LIBRARY)
++find_package(Libunwind)
+ 
+ check_c_source_compiles ("
+ #include <stdlib.h>
+@@ -376,9 +371,9 @@
+ 
+ set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
+ 
+-if (UNWIND_LIBRARY)
+-  target_link_libraries (glog PUBLIC ${UNWIND_LIBRARY})
+-endif (UNWIND_LIBRARY)
++if (Libunwind_FOUND)
++  target_link_libraries (glog PUBLIC unwind)
++endif (Libunwind_FOUND)
+ 
+ if (HAVE_PTHREAD)
+   target_link_libraries (glog PUBLIC ${CMAKE_THREAD_LIBS_INIT})
+@@ -571,6 +566,7 @@
+ install (FILES
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config-version.cmake
++  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindLibunwind.cmake
+   DESTINATION lib/cmake/glog)
+ 
+ install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
+Binary files a/.git/index and b/.git/index differ
+diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
+--- a/glog-config.cmake.in	2018-11-02 14:02:21.784835854 +0100
++++ b/glog-config.cmake.in	2018-11-02 14:03:16.796935594 +0100
+@@ -4,4 +4,15 @@
+ 
+ @gflags_DEPENDENCY@
+ 
++# Record the state of the CMake module path when this script was
++# called so that we can ensure that we leave it in the same state on
++# exit as it was on entry, but modify it locally.
++set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
++
++set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
++find_dependency (Libunwind)
++
++# Restore original module path
++set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
++
+ include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 4c1bce74e..5e58450c2 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -10,8 +10,8 @@ DEPENDS = "libunwind"
 
 SRC_URI = " \
     git://github.com/google/glog.git;branch=v035 \
-    file://0001-find-libunwind-during-configure.patch \
     file://0001-Rework-CMake-glog-VERSION-management.patch \
+    file://0002-Find-Libunwind-during-configure.patch \
 "
 
 SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
@@ -20,8 +20,6 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "libunwind"
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
-- 
2.19.1


