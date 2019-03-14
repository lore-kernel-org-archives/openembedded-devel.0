Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C72279D60
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 09:26:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2E9Q5Sa032739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 02:26:15 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 14 Mar 2019 02:25:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 17:25:51 +0800
Message-ID: <1552555551-37865-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552555551-37865-1-git-send-email-hongxu.jia@windriver.com>
References: <1552555551-37865-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-pillow: add 5.4.1
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
X-List-Received-Date: Thu, 14 Mar 2019 09:26:40 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-support-cross-compiling.patch             | 61 ++++++++++++++++++++++
 .../python/python3-pillow_5.4.1.bb                 | 44 ++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
new file mode 100644
index 0000000..e862934
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -0,0 +1,61 @@
+From a78411402c824668283beb94db4bf7e206a4cf60 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 14 Mar 2019 03:48:10 -0400
+Subject: [PATCH] support cross compiling
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 79f912b..37e5827 100755
+--- a/setup.py
++++ b/setup.py
+@@ -50,7 +50,7 @@ _LIB_IMAGING = (
+     "ZipEncode", "TiffDecode", "Jpeg2KDecode", "Jpeg2KEncode", "BoxBlur",
+     "QuantPngQuant", "codec_fd")
+ 
+-DEBUG = False
++DEBUG = True
+ 
+ 
+ class DependencyException(Exception):
+@@ -345,21 +345,16 @@ class pil_build_ext(build_ext):
+                     _add_directory(library_dirs, match.group(1))
+ 
+         # include, rpath, if set as environment variables:
+-        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE'):
++        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
+             if k in os.environ:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     _add_directory(include_dirs, d)
+ 
+-        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB'):
++        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
+             if k in os.environ:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     _add_directory(library_dirs, d)
+ 
+-        prefix = sysconfig.get_config_var("prefix")
+-        if prefix:
+-            _add_directory(library_dirs, os.path.join(prefix, "lib"))
+-            _add_directory(include_dirs, os.path.join(prefix, "include"))
+-
+         #
+         # add platform directories
+ 
+@@ -413,8 +408,6 @@ class pil_build_ext(build_ext):
+         elif sys.platform.startswith("linux") or \
+                 sys.platform.startswith("gnu") or \
+                 sys.platform.startswith("freebsd"):
+-            for dirname in _find_library_dirs_ldconfig():
+-                _add_directory(library_dirs, dirname)
+             if sys.platform.startswith("linux") and \
+                     os.environ.get('ANDROID_ROOT', None):
+                 # termux support for android.
+-- 
+2.8.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
new file mode 100644
index 0000000..db656e0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Python Imaging Library (Fork). Pillow is the friendly PIL fork by Alex \
+Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
+Contributors."
+HOMEPAGE = "https://pillow.readthedocs.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6379001ecb47e2a0420c40177fc1125"
+
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=5.4.x \
+           file://0001-support-cross-compiling.patch \
+"
+SRCREV ?= "f38f01bbe3a0a9f49ce592c86ff20c01c9655133"
+
+
+inherit setuptools3
+do_compile() {
+        NO_FETCH_BUILD=1 \
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        build_ext --disable-platform-guessing \
+                  --enable-zlib \
+                  --enable-jpeg \
+                  --enable-tiff \
+                  --enable-freetype \
+                  --enable-lcms \
+                  --enable-jpeg2000 \
+                  --disable-webp \
+                  --disable-webpmux \
+                  --disable-imagequant || \
+        bbfatal_log "'${PYTHON_PN} setup.py build_ext' execution failed."
+}
+
+DEPENDS += " \
+    zlib \
+    jpeg \
+    tiff \
+    freetype \
+    lcms \
+    openjpeg \
+"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


