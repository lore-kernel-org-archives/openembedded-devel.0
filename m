Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0E0473216
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498924"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:57:00 +0300
Message-Id: <25e3d42ffef76c310baa0f61a99ee8e2a19f403e.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/8] cmpi-bindings: fix build with python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:56:09 -0000

This recipe seemed to have a floating dependency on Python 3, so
let's make it fixed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...HON_ABI-suffix-to-the-python-library-name.patch | 27 ++++++++++++++++++++++
 .../cmpi-bindings/cmpi-bindings_git.bb             |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
new file mode 100644
index 0000000..b2a149b
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
@@ -0,0 +1,27 @@
+From a701ed30ac1bc2f77d063c237d6ae040a2d53f6b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 16 May 2016 16:52:24 +0300
+Subject: [PATCH] Add 'm' suffix to the python library name.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ swig/python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
+index 128798b..391cef7 100644
+--- a/swig/python/CMakeLists.txt
++++ b/swig/python/CMakeLists.txt
+@@ -49,7 +49,7 @@ ADD_DEFINITIONS(-DCMPI_PLATFORM_LINUX_GENERIC_GNU -DCMPI_VERSION=200)
+ SET( NAME pyCmpiProvider )
+ ADD_LIBRARY( ${NAME} SHARED ${SWIG_OUTPUT})
+ #TARGET_LINK_LIBRARIES( ${NAME} ${PYTHON_LIBRARIES} )
+-TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION} )
++TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}m )
+ TARGET_LINK_LIBRARIES( ${NAME} pthread )
+ TARGET_LINK_LIBRARIES( ${NAME} dl )
+ TARGET_LINK_LIBRARIES( ${NAME} util )
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
index e203198..25166ab 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/kkaempf/cmpi-bindings"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
-DEPENDS = "swig-native python sblim-cmpi-devel"
+DEPENDS = "swig-native python3 sblim-cmpi-devel"
 
 SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=http \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
@@ -13,12 +13,13 @@ SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=http \
            file://0001-Modify-cmakelist.patch \
            file://0001-Fix-error.patch \
            file://0001-fix-the-build-error-when-python-3.0.patch \
+           file://0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch \
           "
 
 SRCREV = "62f60e065aa1b901f826e4f530c0573ae32d065e"
 S = "${WORKDIR}/git"
 
-inherit cmake pythonnative
+inherit cmake python3native
 
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
                  -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
-- 
2.8.1


