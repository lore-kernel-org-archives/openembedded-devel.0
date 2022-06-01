Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000E1C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.6753.1654086381130564077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LO01Y6+F;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so6084338pju.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=b2xXVtpx0FN6/tl2mQRk9x2zuy81GdHskCIjOaVhYXo=;
        b=LO01Y6+FqJbjQNLPwB6Mlh+D4dwSltPkI/SPaCl4ETGZJLEVf68GNT1Ipm7I+e42Zb
         zPS7fBgwwMwZCqH1kEVXavrG9NuYenK9QuoVYJzqOEYw0pOdpf2EkknFi5EUdOyK/rOm
         ioMsq7t7/yV6rhcCPPqjEzW3JJWKUquJh/6+Ldt2ejwPo4/oGEdUSYEKgfFoqXnAqlUm
         edSPYXXtLOmmJoh07o0YhPMZS0CWcCx1nxqzUYR9BKeCZCahsUlfIWkmIps+QM5WpnUb
         +M2FV1L47L/LOoYTzitcWuDBNBojwcshcHFt7qy12njBf9bWQNU3LQ54OSaL7ExYLqet
         va3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=b2xXVtpx0FN6/tl2mQRk9x2zuy81GdHskCIjOaVhYXo=;
        b=fM2BSA+4saTlAJU57/ORmvoLbfzTxYxsOofNjEeRAo7zW7Xbw7sQAwqybVdNVycnA/
         kgHMdbhYcY9cMXGqRWNIJTsVuqjRUz4HjQ/coFKebeVPP4UwHAdM8xA44MV+g/fhZwlq
         H3RIm5ePICLNzisOH/NCFKuaBsWIMHUNrv71gGnuYHn7jQTjn+Te4aKhfsfkYB+4rnqr
         h4H+CwtugGOm/RvaTbyoGE+BBuhSAWoOzGoNzgZKriGss/f85B+abXwbKV1ppWjKGeL/
         Wzwd0edKHbeQ2FAHX6LZaPahcrJMrlHkvhqQf38hNUae+y7KGi3VYYJz4NLi9GTnH2Qg
         nWHg==
X-Gm-Message-State: AOAM5337mnyPd2BLGoOvmrczIA5qJ9f4Sl4NAFgLsBCLykkOZt54h/O5
	/LK7/yyXy5XpqKD4Zm686i9ZC2jUDe8QIg==
X-Google-Smtp-Source: 
 ABdhPJy0/JnpkR+vo12FRdUNCckBgEKCHM7P8/7RO+8H+5xppxCKvKt1yYx0zGpqOdSQb3Bqta+ZIw==
X-Received: by 2002:a17:90b:1211:b0:1e2:cb44:c68 with SMTP id
 gl17-20020a17090b121100b001e2cb440c68mr20876760pjb.146.1654086380186;
        Wed, 01 Jun 2022 05:26:20 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:19 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Leon Anavi <leon.anavi@konsulko.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 1/9] python3-pillow: Upgrade 6.2.1 ->
 7.2.0
Date: Wed,  1 Jun 2022 17:55:19 +0530
Message-Id: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:26:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97359

From: Leon Anavi <leon.anavi@konsulko.com>

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

Conflicts:
	meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
Conflicts due to extra parameter protocol=https in SRC_URI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 995fc86b298d5b09fdd6288b9e9f4211feea3b18)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../0001-explicitly-set-compile-options.patch | 19 +++++++++++--------
 ...illow_6.2.1.bb => python3-pillow_7.2.0.bb} |  6 +++---
 2 files changed, 14 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_6.2.1.bb => python3-pillow_7.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
index 35aee42145..005fea5c66 100644
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
index 80b7e941ae..28aaff8060 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
+SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
 
 
 inherit setuptools3
-- 
2.17.1


