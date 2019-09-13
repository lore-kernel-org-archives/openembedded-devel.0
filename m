Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB937ED17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 20:28:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8DKRi9I008331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:28:25 -0700
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 13 Sep 2019 13:28:13 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Sep 2019 16:28:12 -0400
Message-ID: <1568406492-14968-1-git-send-email-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] openjpeg: upgrade 2.3.0 -> 2.3.1
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
X-List-Received-Date: Fri, 13 Sep 2019 20:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Upgrading fixes CVE-2018-21010 and incorporates other bug fixes
from upstream.

The source upgrade to 2.3.1 changed the way include directories are
identified, so the patch 0001-Ensure-cmake-files-are-installed-at-common-location.patch
is no longer needed to help poppler find cmake files.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...ke-files-are-installed-at-common-location.patch | 48 ----------------------
 .../{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb}       |  3 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb} (79%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch
deleted file mode 100644
index 5c5fe64..0000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From fe491c0919f5adc8d626cb98c5ec19d0b99dfe20 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 27 Sep 2018 23:45:04 +0200
-Subject: [PATCH] Ensure cmake files are installed at common location
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* Otherwise recent poppler is not able to find them
-* Include path needs adjustment with this change
-
-Upstream-Status: Inappropriate [Configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- CMakeLists.txt                | 2 +-
- cmake/OpenJPEGConfig.cmake.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ff70a06f..23d2fac4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -150,7 +150,7 @@ if(NOT OPENJPEG_INSTALL_PACKAGE_DIR)
-   # We could install *.cmake files in share/ however those files contains
-   # hardcoded path to libraries on a multi-arch system (fedora/debian) those
-   # path will be different (lib/i386-linux-gnu vs lib/x86_64-linux-gnu)
--  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/${OPENJPEG_INSTALL_SUBDIR}")
-+  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/cmake/${OPENJPEG_INSTALL_SUBDIR}")
- endif()
- 
- if (APPLE)
-diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.in
-index b20294ca..6a2f4baf 100644
---- a/cmake/OpenJPEGConfig.cmake.in
-+++ b/cmake/OpenJPEGConfig.cmake.in
-@@ -26,7 +26,7 @@ get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
- if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
-   # This is an install tree
-   include(${SELF_DIR}/OpenJPEGTargets.cmake)
--  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../@OPENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
-+  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../../@OPENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
-   set(OPENJPEG_INCLUDE_DIRS ${OPENJPEG_INCLUDE_ROOT})
- 
- else()
--- 
-2.14.4
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
similarity index 79%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
index d30ff48..7c92ebc 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
@@ -7,10 +7,9 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = " \
     git://github.com/uclouvain/openjpeg.git \
-    file://0001-Ensure-cmake-files-are-installed-at-common-location.patch \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
 "
-SRCREV = "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
+SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.7.4


