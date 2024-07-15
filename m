Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A522C3DA66
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.33827.1721034178749344561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FlOSb7dj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V/vlfCgl7vn/PyM74sQpxkPKRZ7lGOZSnmUZgWNaGGo=;
  b=FlOSb7djgPUmE3HfQb6lyl8OjJ243r1i9SpQdV3/9thOxqX23zGJDELg
   OBeDFG4XBBSIe9yMe5n9lPRN1qjBr95ohwd740GROgYU9kiHtSWzmfswX
   /HMEQ8vZvUh3+Fr3VR3PQNBJIxaMJOrk6t1UHyo7up9oVo6JpG8qjHYPX
   3ohEyaPdn9qb+eSE+V6fcBCLR0JPJnaJUrVc+eVqhlcY6ubULFrtqnlM7
   1pBiCJR9oXrry9LeXIBM1JPJBuQIMpEPXdiII09/7szQXicDmN2/hFoVg
   FCuKhxY7C1uh3Ky0A8lZnVh4Q1tSbuLN1jiNpM1bmcJpN1w/YevseQJAW
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166935617"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166935617"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15D62DB3AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 52188D5083
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D150A6BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FD391A000A;
	Mon, 15 Jul 2024 17:02:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/38] python3-pillow: upgrade 10.3.0 -> 10.4.0
Date: Mon, 15 Jul 2024 17:02:16 +0800
Message-Id: <1721034151-540-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--6.918600-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yQk3qL3jdFBNnJdsOLB4zv79wRnyxuPjhOQ5
	wujMC0dGIwT+liqdb4bwRQeUEJylgUz5mWBF5saRaU7ee17qjHOZmLDnd2pI3+s/IVlBXKLmU6e
	mM+AKrjL8NbUa8eS06Evs6ag5Ig7dYrO1KENDMW5eYVWU5uHQ/FkN0eJOT05wneNb6EyvrfwTYb
	tN3Gng+71/tzoqsVtZhVaMx/vKxVS7xhJnFx1wJvCCu8kVj0TR3ckghXgrdPvfUZT83lbkENb2e
	7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AZskwWqoib3F/TJVF6hUzt79wR
	II9R06R3nVkLAl03ygwxXcerFDp6+/CYwUsia6GeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJJc/0eraGXf9zx/SnZqqJBU6bjJpj1x/6vNXw1KWTS+LftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111344

From: Wang Mingyu <wangmy@fujitsu.com>

0001-support-cross-compiling.patch
refreshed for 10.4.0

Changelog:
===========
- Raise FileNotFoundError if show_file() path does not exist
- Improved reading 16-bit TGA images with colour
- Deprecate non-image ImageCms modes
- Fixed processing multiple JPEG EXIF markers
- Do not preserve EXIFIFD tag by default when saving TIFF images
- Added ImageFont.load_default_imagefont()
- Added Image.WARN_POSSIBLE_FORMATS
- Remove zero-byte end padding when parsing any XMP data
- Do not detect Ultra HDR images as MPO
- Raise SyntaxError specific to JP2
- Do not use first frame duration for other frames when saving APNG images
- Consider I;16 pixel size when using a 1 mode mask
- When saving multiple PNG frames, convert to mode rather than raw mode
- Added byte support to FreeTypeFont
- Allow float center for rotate operations
- Do not read layers immediately when opening PSD images
- Restore original thread state
- Read IM and TIFF images as RGB, rather than RGBX
- Only preserve TIFF IPTC_NAA_CHUNK tag if type is BYTE or UNDEFINED
- Clarify ImageDraw2 error message when size is missing
- Support unpacking more rawmodes to RGBA palettes
- Removed support for Qt 5
- Improve ImageFont.freetype support for XDG directories on Linux
- Improved consistency of XMP handling
- Use pkg-config to help find libwebp and raqm
- Accept 't' suffix for libtiff version #8126,
- Deprecate ImageDraw.getdraw hints parameter
- Added ImageDraw circle()
- Add mypy target to Makefile
- Added more modes to Image.MODES
- Deprecate BGR;15, BGR;16 and BGR;24 modes
- Fix ImagingAccess for I;16N on big-endian
- Support reading P mode TIFF images with padding
- Deprecate support for libtiff < 4
- Corrected ImageShow UnixViewer command
- Use functools.cached_property in ImageStat
- Add support for reading BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
- Support reading CMYK JPEG2000 images

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-pillow/0001-support-cross-compiling.patch | 11 ++++-------
 ...hon3-pillow_10.3.0.bb => python3-pillow_10.4.0.bb} |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_10.3.0.bb => python3-pillow_10.4.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index e4ba35b88..220c4edc3 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From cd09b6f68aa49c72e9a9bb0765e8c666238a7b7e Mon Sep 17 00:00:00 2001
+From 5b28d19d6513cc3eb3105d3f917df352283f3c5e Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
@@ -12,10 +12,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index cbc2641c..302bc6e7 100755
+index 0abfaaddc..557420a6b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -123,7 +123,7 @@ _LIB_IMAGING = (
+@@ -129,7 +129,7 @@ _LIB_IMAGING = (
      "codec_fd",
  )
  
@@ -24,7 +24,7 @@ index cbc2641c..302bc6e7 100755
  
  
  class DependencyException(Exception):
-@@ -408,12 +408,12 @@ class pil_build_ext(build_ext):
+@@ -508,12 +508,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
@@ -39,6 +39,3 @@ index cbc2641c..302bc6e7 100755
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(library_dirs, d)
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
index debf48815..71159ba50 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://0001-support-cross-compiling.patch \
            file://run-ptest \
            "
-SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
+SRCREV = "9b4fae77178e827ab17118fbc89c739ffd6a0fab"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.34.1


