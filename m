Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D35B87DC1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 07:39:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F7dY0p023240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 00:39:34 -0700 (PDT)
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 00:39:33 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 10:38:43 +0300
Message-ID: <20190715073844.7334-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python3-pillow: 5.4.1 -> 6.1
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
X-List-Received-Date: Mon, 15 Jul 2019 07:39:34 -0000
Content-Type: text/plain

Update python3-pillow to version 6.1 and refresh patches.

License-Update: copyright years

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../0001-explicitly-set-compile-options.patch | 10 +++---
 .../0001-support-cross-compiling.patch        | 32 +++++++++----------
 ...-pillow_5.4.1.bb => python3-pillow_6.1.bb} |  6 ++--
 3 files changed, 24 insertions(+), 24 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_5.4.1.bb => python3-pillow_6.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
index de89ba005..d4372696f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
@@ -1,4 +1,4 @@
-From 52879439f2976662140b76951f43f16e1d5ef08e Mon Sep 17 00:00:00 2001
+From 9f3073bf6a7c7c51bb49d25f65c8f75cc704a5ee Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 18 Mar 2019 23:23:55 -0400
 Subject: [PATCH] explicitly set compile options
@@ -15,12 +15,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/setup.cfg b/setup.cfg
-index 95900ff..27da313 100644
+index 3ab2e127..e92615f3 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -9,3 +9,15 @@ addopts = -vx Tests
- 
+@@ -4,3 +4,15 @@ test=pytest
  [flake8]
+ extend-ignore = E203, W503
  max-line-length = 88
 +
 +[build_ext]
@@ -35,5 +35,5 @@ index 95900ff..27da313 100644
 +disable-webpmux = 1
 +disable-imagequant = 1
 -- 
-2.8.1
+2.20.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index e86293421..6de19ad87 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From a78411402c824668283beb94db4bf7e206a4cf60 Mon Sep 17 00:00:00 2001
+From ae7c8d0336381dd4c10e809e9c8926f9deeafeb8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Mar 2019 03:48:10 -0400
 Subject: [PATCH] support cross compiling
@@ -11,29 +11,29 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 10 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 79f912b..37e5827 100755
+index 5ceae344..07863340 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -50,7 +50,7 @@ _LIB_IMAGING = (
-     "ZipEncode", "TiffDecode", "Jpeg2KDecode", "Jpeg2KEncode", "BoxBlur",
-     "QuantPngQuant", "codec_fd")
+@@ -105,7 +105,7 @@ _LIB_IMAGING = (
+     "codec_fd",
+ )
  
 -DEBUG = False
 +DEBUG = True
  
  
  class DependencyException(Exception):
-@@ -345,21 +345,16 @@ class pil_build_ext(build_ext):
+@@ -396,21 +396,16 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
--        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE'):
+-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
 +        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(include_dirs, d)
  
--        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB'):
+-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
 +        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
@@ -47,15 +47,15 @@ index 79f912b..37e5827 100755
          #
          # add platform directories
  
-@@ -413,8 +408,6 @@ class pil_build_ext(build_ext):
-         elif sys.platform.startswith("linux") or \
-                 sys.platform.startswith("gnu") or \
-                 sys.platform.startswith("freebsd"):
+@@ -469,8 +464,6 @@ class pil_build_ext(build_ext):
+             or sys.platform.startswith("gnu")
+             or sys.platform.startswith("freebsd")
+         ):
 -            for dirname in _find_library_dirs_ldconfig():
 -                _add_directory(library_dirs, dirname)
-             if sys.platform.startswith("linux") and \
-                     os.environ.get('ANDROID_ROOT', None):
-                 # termux support for android.
+             if sys.platform.startswith("linux") and os.environ.get(
+                 "ANDROID_ROOT", None
+             ):
 -- 
-2.8.1
+2.20.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_6.1.bb
index 6fce1623d..13e6b4143 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c6379001ecb47e2a0420c40177fc1125"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=5.4.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.1.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "f38f01bbe3a0a9f49ce592c86ff20c01c9655133"
+SRCREV ?= "aaca672173413883fbcefd659f04d74fe44fb5d5"
 
 
 inherit setuptools3
-- 
2.20.1


