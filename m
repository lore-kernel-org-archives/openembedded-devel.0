Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4D51060043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 13:53:17 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u4BDrHUV012128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 15:53:17 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.34])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u4BDrHGa023178;
	Wed, 11 May 2016 15:53:17 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2016 15:53:14 +0200
Message-Id: <1462974794-8160-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] qtbase: add patch to make Qt5Config modules behave better with cmake builds
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
X-List-Received-Date: Wed, 11 May 2016 13:53:20 -0000

Currently if a project if using the cmake bbclass and the CMakeLists.txt file
uses find_package to find Qt5 and error like this is produced:

|   The imported target "Qt5::Core" references the file
|
|      "/qmake"
|
|   but this file does not exist.  Possible reasons include:

This is because OE_QMAKE_PATH_EXTERNAL_HOST_BINS is only set in the cmake_qt5 bblcass.

To make it work better in that case the Qt5Config files check if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
is defined and bail out if not. For CMake this is the same as Qt5 wasn't found.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch | 67 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch

diff --git a/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
new file mode 100644
index 0000000..7a24459
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -0,0 +1,67 @@
+From f5a949e17aa8b37491fbc414c38557c9920fa1e5 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Wed, 11 May 2016 15:20:41 +0200
+Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
+ isn't set
+
+This prevents errors like:
+
+|   The imported target "Qt5::Core" references the file
+|
+|      "/qmake"
+|
+|   but this file does not exist.  Possible reasons include:
+
+Which happen if CMake is used without setting OE_QMAKE_PATH_EXTERNAL_HOST_BINS.
+To achieve this a check for OE_QMAKE_PATH_EXTERNAL_HOST_BINS is added to each Qt5*Config.cmake
+file. And in the case where the variable is not set we just return which is basically
+equal to telling CMake that Qt5 wasn't found.
+
+Upstream-Status: Pending
+  The patch only makes sense in connection with other patches included here.
+  Specifically this are:
+    - 0003-Add-external-hostbindir-option.patch
+    - 0010-Add-external-hostbindir-option-for-native-sdk.patch
+
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+---
+ mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in | 5 +++++
+ src/corelib/Qt5Config.cmake.in                      | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
+index d2358ca..feb73c0 100644
+--- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
++++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
+@@ -9,6 +9,11 @@ if (CMAKE_VERSION VERSION_LESS 3.0.0)
+ endif()
+ !!ENDIF
+ 
++if(NOT DEFINED OE_QMAKE_PATH_EXTERNAL_HOST_BINS)
++    message(WARNING "Skipping because OE_QMAKE_PATH_EXTERNAL_HOST_BINS is not defined")
++    return()
++endif()
++
+ !!IF !isEmpty(CMAKE_USR_MOVE_WORKAROUND)
+ !!IF !isEmpty(CMAKE_LIB_DIR_IS_ABSOLUTE)
+ set(_qt5$${CMAKE_MODULE_NAME}_install_prefix \"$$[QT_INSTALL_PREFIX]\")
+diff --git a/src/corelib/Qt5Config.cmake.in b/src/corelib/Qt5Config.cmake.in
+index a872d0e..233d663 100644
+--- a/src/corelib/Qt5Config.cmake.in
++++ b/src/corelib/Qt5Config.cmake.in
+@@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 2.8.9)
+     message(FATAL_ERROR \"Qt5 requires at least CMake version 2.8.9\")
+ endif()
+ 
++if(NOT DEFINED OE_QMAKE_PATH_EXTERNAL_HOST_BINS)
++    message(WARNING "Skipping because OE_QMAKE_PATH_EXTERNAL_HOST_BINS is not defined")
++    return()
++endif()
++
+ if (NOT Qt5_FIND_COMPONENTS)
+     set(Qt5_NOT_FOUND_MESSAGE \"The Qt5 package requires at least one component\")
+     set(Qt5_FOUND False)
+-- 
+2.1.4
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index b85c563..2fcaecb 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -20,6 +20,7 @@ SRC_URI += "\
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.1.4


