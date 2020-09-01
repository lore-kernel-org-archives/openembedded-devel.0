Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12124.1598964702339807384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41250 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kD5lB-0004Pw-FS; Tue, 01 Sep 2020 15:51:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pillow: Upgrade 6.2.1 -> 7.2.0
Date: Tue,  1 Sep 2020 15:51:32 +0300
Message-Id: <20200901125132.9501-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.2.0:

- Do not convert I;16 images when showing PNGs
- Fixed ICNS file pointer saving
- Fixed loading non-RGBA mode APNGs with dispose background
- Deprecated _showxv
- Deprecate Image.show(command="...")
- Updated JPEG magic number
- Change STRIPBYTECOUNTS to LONG if necessary when saving
- Write JFIF header when saving JPEG
- Replaced tiff_jpeg with jpeg compression when saving TIFF images
- Writing TIFF tags: improved BYTE, added UNDEFINED
- Consider transparency when pasting text on an RGBA image
- Added method argument to single frame WebP saving
- Use ImageFileDirectory_v2 in Image.Exif
- Corrected reading EXIF metadata without prefix
- Fixed drawing a jointed line with a sequence of numeric values
- Added support for 1-D NumPy arrays
- Parse orientation from XMP tags
- Speed up text layout by not rendering glyphs
- Fixed ZeroDivisionError in Image.thumbnail
- Replaced TiffImagePlugin DEBUG with logging
- Fix repeatedly loading .gbr
- JPEG: Truncate icclist instead of setting to None
- Fixes default offset for Exif
- Fixed bug when unpickling TIFF images
- Fix pickling WebP
- Replace IOError and WindowsError aliases with OSError

License-Update: Word wrap and updated copyright year.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-explicitly-set-compile-options.patch | 19 +++++++++++--------
 ...illow_6.2.1.bb => python3-pillow_7.2.0.bb} |  6 +++---
 2 files changed, 14 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_6.2.1.bb => python3-pillow_7.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
index 35aee4214..005fea5c6 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
@@ -1,6 +1,6 @@
-From 862a981ce462cd83a99e3db9faeeda1f8c64983f Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 18 Mar 2019 23:23:55 -0400
+From 27bfa4028453dc79a72569823e97da8fd1994ffc Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 1 Sep 2020 11:53:53 +0000
 Subject: [PATCH] explicitly set compile options
 
 OE does not support to install egg package, so
@@ -10,19 +10,19 @@ explicitly set build_ext options for oe-core's
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  setup.cfg | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
 diff --git a/setup.cfg b/setup.cfg
-index 1c6ebc84..1ccc3d69 100644
+index 19979cf7..ed27dfe1 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -13,3 +13,15 @@ multi_line_output = 3
- 
+@@ -11,3 +11,15 @@ multi_line_output = 3
  [tool:pytest]
- addopts = -rs
+ addopts = -ra --color=yes
+ testpaths = Tests
 +
 +[build_ext]
 +disable-platform-guessing = 1
@@ -35,3 +35,6 @@ index 1c6ebc84..1ccc3d69 100644
 +disable-webp = 1
 +disable-webpmux = 1
 +disable-imagequant = 1
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
index a383a3ff9..13cab4300 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
+SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
 
 
 inherit setuptools3
-- 
2.17.1

