Return-Path: <uvv.mail@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34E6579A4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:40:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e4-v6so29760227wrs.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h2C31uoC4V/uAnMVUgdqE2kK01xQ0/DxOzAo4kssOfY=;
	b=ZrTmg3yYgMN7YpSxTP7OLh2wCcIKeb2bl9tvXALmNg54lZr0yvTEVe5vRqZM3wK4Dd
	oxgQ8smtsNuNwbalVkMd7qCztxGGBJ5h66LfcnOaM9P4zXLCkz2pWrOw+m75KYSgiYKr
	O1hUh2BvyPH5RhYuHn3+DiyYXi1Kym2CKZCi6KIW8nKtPOrmoLeMpTC9PE3H+WPWuqHa
	GAjG1IrqgmTeEsYkfqQq+v7t6NWsvzt4LOkgFie6oIlBlApTWfvQexJFsmPqGzrKKJsf
	S+8YkA792KXUYL1Cg9hFbvfUUz7HlPuUDXzVOnq7D78lEHnPOZJLrKu/aLAHdPWZoLt6
	70uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h2C31uoC4V/uAnMVUgdqE2kK01xQ0/DxOzAo4kssOfY=;
	b=Lp3Dr39i5oj7PWBboxEpYueO7wi4BogZMmOLYODdm+814s9t4YnZ/zwemPDk84DIa5
	i5xrZq7QT2PjX7p8Xkmi5FEprQJ/Yon1/h9Mh6mG/nM24NjvVSBA/wLeeWG++UnRzxue
	ZZ2BXJpj3OJTdQN1q1GpJ2/0yr0tjJm1umBkiNZNAi3wkuXpm+oGE21VFr7IsJIkOygm
	9p5fp1rsci/XdMHYAg374hanNbU2Gc9NgKH6eQhWRjzAJjubXGCxjGLDMAp0+dD7liFv
	sb8cWXUPb4cm/3Smz1uOjKseRB5oTthMFNsDdJzvzVL5jgECQZGeBJtR0/dubzpq3dam
	LwWA==
X-Gm-Message-State: ABuFfogJBvSVGkPYdp0By0I1cc5tYzNmSMUy+RKf6w4dKYoilwGQARiY
	OANCSgfn3sAq6BMd3GLI+paBs+SD9vI=
X-Google-Smtp-Source: ACcGV63fz8RsJQfyo23smYsTr65lUUadSb9ZcGmfjzhAhJocER3D5EzApLNTLl/800C1afXEMkNxyQ==
X-Received: by 2002:adf:c00e:: with SMTP id
	z14-v6mr23602018wre.268.1539783634407; 
	Wed, 17 Oct 2018 06:40:34 -0700 (PDT)
Received: from localhost.localdomain (ip-109-42-3-150.web.vodafone.de.
	[109.42.3.150]) by smtp.gmail.com with ESMTPSA id
	j46-v6sm23926681wre.91.2018.10.17.06.40.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Oct 2018 06:40:33 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2018 15:39:54 +0200
Message-Id: <20181017133954.109748-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] glog: fixed shared library versioning
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
X-List-Received-Date: Wed, 17 Oct 2018 13:40:34 -0000
Content-Transfer-Encoding: 8bit

Build glog as a shared library by default. Backported CMake patch
from master that sets SONAME properly. Updated the patch for libunwind look up
and added libunwind as a run-time dependency

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 ...0001-find-libunwind-during-configure.patch | 80 +++++++++++++----
 .../glog/0002-rework-cmake-glog-version.patch | 87 +++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |  7 +-
 3 files changed, 153 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-support/glog/glog/0002-rework-cmake-glog-version.patch

diff --git a/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
index 33dc9d38a..6becdc15f 100644
--- a/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
@@ -1,30 +1,74 @@
-diff -ur git/CMakeLists.txt ../0.3.5-r0.unwind/git/CMakeLists.txt
---- git/CMakeLists.txt	2018-10-08 08:54:15.118989400 +0200
-+++ ../0.3.5-r0.unwind/git/CMakeLists.txt	2018-10-05 16:26:59.745922318 +0200
-@@ -384,7 +384,9 @@
+diff -ur --new-file git/cmake/FindLibunwind.cmake ../0.3.5-r0.unwind/git/cmake/FindLibunwind.cmake
+--- git/cmake/FindLibunwind.cmake	1970-01-01 01:00:00.000000000 +0100
++++ ../0.3.5-r0.unwind/git/cmake/FindLibunwind.cmake	2018-10-09 09:43:59.803216273 +0200
+@@ -0,0 +1,17 @@
++# - Try to find libunwind
++# Once done this will define
++#
++#  LIBUNWIND_FOUND - system has libunwind
++#  unwind - cmake target for libunwind
++
++find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
++
++include(FindPackageHandleStandardArgs)
++# handle the QUIETLY and REQUIRED arguments and set Libunwind_FOUND to TRUE
++# if all listed variables are TRUE
++find_package_handle_standard_args(Libunwind DEFAULT_MSG UNWIND_LIBRARY)
++
++mark_as_advanced (UNWIND_LIBRARY)
++
++add_library(unwind SHARED IMPORTED)
++set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
+diff -ur --new-file git/CMakeLists.txt ../0.3.5-r0.unwind/git/CMakeLists.txt
+--- git/CMakeLists.txt	2018-10-09 10:31:33.483584675 +0200
++++ ../0.3.5-r0.unwind/git/CMakeLists.txt	2018-10-09 09:43:59.799215966 +0200
+@@ -118,8 +118,7 @@
+ 
+ check_library_exists (unwind get_static_proc_name "" HAVE_LIB_UNWIND)
+ 
+-find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
+-mark_as_advanced (UNWIND_LIBRARY)
++find_package(Libunwind)
+ 
+ check_c_source_compiles ("
+ #include <stdlib.h>
+@@ -383,9 +382,9 @@
+ 
  set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
  
- if (UNWIND_LIBRARY)
+-if (UNWIND_LIBRARY)
 -  target_link_libraries (glog PUBLIC ${UNWIND_LIBRARY})
-+  add_library(unwind SHARED IMPORTED)
-+  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
+-endif (UNWIND_LIBRARY)
++if (Libunwind_FOUND)
 +  target_link_libraries (glog PUBLIC unwind)
- endif (UNWIND_LIBRARY)
++endif (Libunwind_FOUND)
  
  if (HAVE_PTHREAD)
-diff -ur git/glog-config.cmake.in ../0.3.5-r0.unwind/git/glog-config.cmake.in
---- git/glog-config.cmake.in	2018-10-08 08:54:15.122989699 +0200
-+++ ../0.3.5-r0.unwind/git/glog-config.cmake.in	2018-10-08 08:14:48.550745810 +0200
-@@ -4,4 +4,12 @@
+   target_link_libraries (glog PUBLIC ${CMAKE_THREAD_LIBS_INIT})
+@@ -578,6 +577,7 @@
+ install (FILES
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config-version.cmake
++  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindLibunwind.cmake
+   DESTINATION lib/cmake/glog)
+ 
+ install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
+diff -ur --new-file git/glog-config.cmake.in ../0.3.5-r0.unwind/git/glog-config.cmake.in
+--- git/glog-config.cmake.in	2018-10-09 10:31:33.487584975 +0200
++++ ../0.3.5-r0.unwind/git/glog-config.cmake.in	2018-10-09 09:43:59.799215966 +0200
+@@ -4,4 +4,15 @@
  
  @gflags_DEPENDENCY@
  
-+find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
-+mark_as_advanced (UNWIND_LIBRARY)
++# Record the state of the CMake module path when this script was
++# called so that we can ensure that we leave it in the same state on
++# exit as it was on entry, but modify it locally.
++set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
++
++set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
++find_dependency (Libunwind)
 +
-+if (UNWIND_LIBRARY)
-+  add_library(unwind SHARED IMPORTED)
-+  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
-+endif (UNWIND_LIBRARY)
++# Restore original module path
++set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
 +
  include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
diff --git a/meta-oe/recipes-support/glog/glog/0002-rework-cmake-glog-version.patch b/meta-oe/recipes-support/glog/glog/0002-rework-cmake-glog-version.patch
new file mode 100644
index 000000000..8066e2718
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/0002-rework-cmake-glog-version.patch
@@ -0,0 +1,87 @@
+diff -ur git/CMakeLists.txt ../0.3.5-r0/git/CMakeLists.txt
+--- git/CMakeLists.txt	2018-10-17 15:02:49.241749024 +0200
++++ ../0.3.5-r0/git/CMakeLists.txt	2018-10-17 15:13:59.703188731 +0200
+@@ -1,3 +1,26 @@
++## CMake configuration file of glog project
++##
++## When this project is a subproject. The "glog::glog" target is in this case
++## an ALIAS library target for the "glog" library target. Targets which depend
++## on the glog library should link to the "glog::glog" library target.
++##
++## Example CMakeLists.txt of user project which requires separate glog installation:
++##   cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++##   project(Foo)
++##
++##   find_package(glog REQUIRED)
++##
++##   add_executable(foo src/foo.cc)
++##   target_link_libraries(foo glog::glog)
++##
++## Example CMakeLists.txt of super-project which contains glog source tree:
++##   cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++##   project(Foo)
++##
++##   add_subdirectory(glog)
++##
++##   add_executable(foo src/foo.cc)
++##   target_link_libraries(foo glog::glog)
+ cmake_minimum_required (VERSION 3.0)
+ 
+ if (POLICY CMP0042)
+@@ -8,23 +31,14 @@
+   cmake_policy (SET CMP0063 NEW)
+ endif (POLICY CMP0063)
+ 
+-project (google-glog)
+-
+-enable_testing ()
+-
+-set (GLOG_MAJOR_VERSION 0)
+-set (GLOG_MINOR_VERSION 3)
+-set (GLOG_PATCH_VERSION 5)
+-
+-set (GLOG_VERSION
+-  ${GLOG_MAJOR_VERSION}.${GLOG_MINOR_VERSION}.${GLOG_PATCH_VERSION})
++project(glog VERSION 0.3.5 LANGUAGES C CXX)
+ 
+ set (CPACK_PACKAGE_NAME glog)
+ set (CPACK_PACKAGE_DESCRIPTION_SUMMARY "")
+-set (CPACK_PACKAGE_VERSION_MAJOR ${GLOG_MAJOR_VERSION})
+-set (CPACK_PACKAGE_VERSION_MINOR ${GLOG_MINOR_VERSION})
+-set (CPACK_PACKAGE_VERSION_PATCH ${GLOG_PATCH_VERSION})
+-set (CPACK_PACKAGE_VERSION ${GLOG_VERSION})
++set (CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_MAJOR_VERSION})
++set (CPACK_PACKAGE_VERSION_MINOR ${PROJECT_MINOR_VERSION})
++set (CPACK_PACKAGE_VERSION_PATCH ${PROJECT_PATCH_VERSION})
++set (CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
+ 
+ option (WITH_GFLAGS "Use gflags" ON)
+ option (WITH_THREADS "Enable multithreading support" ON)
+@@ -379,6 +393,7 @@
+ add_library (glog
+   ${GLOG_SRCS}
+ )
++add_library(glog::glog ALIAS glog)
+ 
+ set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
+ 
+@@ -405,8 +420,8 @@
+   endif (NOT BUILD_SHARED_LIBS)
+ endif (gflags_FOUND)
+ 
+-set_target_properties (glog PROPERTIES VERSION ${GLOG_MAJOR_VERSION})
+-set_target_properties (glog PROPERTIES SOVERSION ${GLOG_VERSION})
++set_target_properties (glog PROPERTIES VERSION ${PROJECT_VERSION})
++set_target_properties (glog PROPERTIES SOVERSION ${PROJECT_VERSION_MAJOR})
+ 
+ if (WIN32)
+   target_compile_definitions (glog PUBLIC GLOG_NO_ABBREVIATED_SEVERITIES)
+@@ -569,7 +584,7 @@
+   NO_CHECK_REQUIRED_COMPONENTS_MACRO)
+ 
+ write_basic_package_version_file (glog-config-version.cmake VERSION
+-  ${GLOG_VERSION} COMPATIBILITY SameMajorVersion)
++  ${PROJECT_VERSION} COMPATIBILITY SameMajorVersion)
+ 
+ export (TARGETS glog NAMESPACE glog:: FILE glog-targets.cmake)
+ export (PACKAGE glog)
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index bf7df53f3..10347bb36 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -11,6 +11,7 @@ DEPENDS = "libunwind"
 SRC_URI = " \
     git://github.com/google/glog.git;branch=v035 \
     file://0001-find-libunwind-during-configure.patch \
+    file://0002-rework-cmake-glog-version.patch \
 "
 
 SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
@@ -19,6 +20,6 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+
+RDEPENDS_${PN} += "libunwind"
-- 
2.19.1


