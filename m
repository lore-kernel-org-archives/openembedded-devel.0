Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BB816731D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498908"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:56:58 +0300
Message-Id: <91d47835b27b3e7b3580eb69f8caee2848a7982a.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/8] python-pyrex: add a recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:56:08 -0000

This is moved from oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/python-pyrex-native_0.9.9.bb            |  5 +++++
 .../python-pyrex/pyrex-fix-optimized-mode.patch    | 15 +++++++++++++++
 .../recipes-devtools/python/python-pyrex_0.9.9.bb  | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb

diff --git a/meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
new file mode 100644
index 0000000..e8ef1aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
@@ -0,0 +1,5 @@
+require python-pyrex_${PV}.bb
+inherit native pythonnative
+DEPENDS = "python-native"
+RDEPENDS_${PN} = ""
+PR = "r3"
diff --git a/meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch b/meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
new file mode 100644
index 0000000..c58c328
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Index: Pyrex-0.9.8.4/Pyrex/Distutils/extension.py
+===================================================================
+--- Pyrex-0.9.8.4.orig/Pyrex/Distutils/extension.py
++++ Pyrex-0.9.8.4/Pyrex/Distutils/extension.py
+@@ -15,7 +15,7 @@ except ImportError:
+     warnings = None
+ 
+ class Extension(_Extension.Extension):
+-    _Extension.Extension.__doc__ + \
++    _Extension.Extension.__doc__ or "" + \
+     """pyrex_include_dirs : [string]
+         list of directories to search for Pyrex header files (.pxd) (in
+         Unix form for portability)
diff --git a/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb
new file mode 100644
index 0000000..c4dd2e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Language for writing Python extension modules"
+DESCRIPTION = "Pyrex is a language specially designed for writing Python extension modules. \
+It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
+and the messy, low-level world of C."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
+SRCNAME = "Pyrex"
+PR = "r4"
+
+SRC_URI = "\
+  http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+  file://pyrex-fix-optimized-mode.patch \
+"
+
+SRC_URI[md5sum] = "515dee67d15d4393841e2d60e8341947"
+SRC_URI[sha256sum] = "5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+FILES_${PN} += "${datadir}${base_libdir}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
-- 
2.8.1


