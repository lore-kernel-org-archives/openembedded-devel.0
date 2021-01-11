Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.35457.1610378723631271721
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4J-0006IU-Tz; Mon, 11 Jan 2021 17:25:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-pillow: Upgrade 7.2.0 -> 8.1.0
Date: Mon, 11 Jan 2021 17:25:03 +0200
Message-Id: <20210111152512.23506-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 8.1.0:

- Fix TIFF OOB Write error
- Fix for Buffer Read Overrun in PCX Decoding
- Fix for SGI Decode buffer overrun
- Fix OOB Read when saving GIF of xsize=1
- Add support for PySide6
- Moved QApplication into one test
- Use disposal settings from previous frame in APNG
- Revert "skip wheels on 3.10-dev due to wheel#354"
- Better _binary module use
- Added exception explaining that repr_png saves to PNG
- Use previous disposal method in GIF load_end
- Do not catch a ValueError only to raise another
- Allow putpalette to accept 1024 integers to include alpha values
- Fix OOB Read when writing TIFF with custom Metadata
- Removed unused variable
- Fix dereferencing of potential null pointers
- Fixed warnings assigning to "unsigned char *" from "char *"
- Add append_images support for ICO
- Fixed comparison warnings
- Block TIFFTAG_SUBIFD
- Fix dereferencing potential null pointer
- Replaced PyErr_NoMemory with ImagingError_MemoryError
- Remove duplicate code
- Moved warning to end of execution
- Removed unused fromstring and tostring C methods
- init() if one of the formats is unrecognised

License-Update: Updated copyright year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-support-cross-compiling.patch        | 43 ++++++-------------
 ...illow_7.2.0.bb => python3-pillow_8.1.0.bb} |  7 ++-
 2 files changed, 16 insertions(+), 34 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_7.2.0.bb => python3-pillow_8.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index 6de19ad87..e4ba35b88 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,20 +1,21 @@
-From ae7c8d0336381dd4c10e809e9c8926f9deeafeb8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 14 Mar 2019 03:48:10 -0400
+From cd09b6f68aa49c72e9a9bb0765e8c666238a7b7e Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
 
 Upstream-Status: Inappropriate [oe specific]
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Suggested-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- setup.py | 13 +++----------
- 1 file changed, 3 insertions(+), 10 deletions(-)
+ setup.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 5ceae344..07863340 100755
+index cbc2641c..302bc6e7 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -105,7 +105,7 @@ _LIB_IMAGING = (
+@@ -123,7 +123,7 @@ _LIB_IMAGING = (
      "codec_fd",
  )
  
@@ -23,39 +24,21 @@ index 5ceae344..07863340 100755
  
  
  class DependencyException(Exception):
-@@ -396,21 +396,16 @@ class pil_build_ext(build_ext):
+@@ -408,12 +408,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
 -        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
-+        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDIR"):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(include_dirs, d)
  
 -        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
-+        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDIR"):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(library_dirs, d)
- 
--        prefix = sysconfig.get_config_var("prefix")
--        if prefix:
--            _add_directory(library_dirs, os.path.join(prefix, "lib"))
--            _add_directory(include_dirs, os.path.join(prefix, "include"))
--
-         #
-         # add platform directories
- 
-@@ -469,8 +464,6 @@ class pil_build_ext(build_ext):
-             or sys.platform.startswith("gnu")
-             or sys.platform.startswith("freebsd")
-         ):
--            for dirname in _find_library_dirs_ldconfig():
--                _add_directory(library_dirs, dirname)
-             if sys.platform.startswith("linux") and os.environ.get(
-                 "ANDROID_ROOT", None
-             ):
 -- 
-2.20.1
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
index 13cab4300..63974590c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
@@ -3,14 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
-
+SRCREV ?= "fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf"
 
 inherit setuptools3
 
-- 
2.17.1

