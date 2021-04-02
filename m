Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.15395.1617366903684290445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 05:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52498 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lSJ0v-0004S7-Kd; Fri, 02 Apr 2021 15:35:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pillow: Upgrade 8.1.2 -> 8.2.0
Date: Fri,  2 Apr 2021 15:34:54 +0300
Message-Id: <20210402123455.23702-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402123455.23702-1-leon.anavi@konsulko.com>
References: <20210402123455.23702-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 8.2.0:

- Added getxmp() method
- Add ImageShow support for GraphicsMagick
- Do not load transparent pixels from subsequent GIF frames
- Use LZW encoding when saving GIF images
- Set all transparent colors to be equal in quantize()
- Allow PixelAccess to use Python __int__ when parsing x and y
- Removed Image._MODEINFO
- Add preserve_tone option to autocontrast
- Fixed linear_gradient and radial_gradient I and F modes
- Add support for reading TIFFs with PlanarConfiguration=2
- Deprecated categories
- Do not premultiply alpha when resizing with Image.NEAREST
  resampling
- Dynamically link FriBiDi instead of Raqm
- Allow fewer PNG palette entries than the bit depth maximum when
  saving
- Use duration from info dictionary when saving WebP
- Stop flattening EXIF IFD into getexif()
- Replaced tiff_deflate with tiff_adobe_deflate compression when
  saving TIFF images
- Save ICC profile from TIFF encoderinfo
- Moved RGB fix inside ImageQt class
- Allow alpha_composite destination to be negative
- Ensure file is closed if it is opened by ImageQt.ImageQt
- Added ImageDraw rounded_rectangle method
- Added IPythonViewer
- Only draw each rectangle outline pixel once
- Use mmap instead of built-in Win32 mapper
- Handle PCX images with an odd stride
- Only read different sizes for "Large Thumbnail" MPO frames
- Added PyQt6 support
- Changed Image.open formats parameter to be case-insensitive
- Deprecate Tk/Tcl 8.4, to be removed in Pillow 10 (2023-01-02)
- Added tk version to pilinfo
- Support for ignoring tests when running valgrind
- OSS-Fuzz support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pillow_8.1.2.bb => python3-pillow_8.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.1.2.bb => python3-pillow_8.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index a1b4f9059..3241230d1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "88bd672dafad68b419ea29bef941dfa17f941038"
+SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
 inherit setuptools3
 
-- 
2.17.1

