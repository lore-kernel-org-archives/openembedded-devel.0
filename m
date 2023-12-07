Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8C6C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 09:13:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.80046.1701940395068114723
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 01:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BkpLa0F8;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so3747695e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 01:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701940393; x=1702545193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLwhq88ucU//XseHBU5Y2Qmyzap90P9T6HA8O+LQQIc=;
        b=BkpLa0F8ltsYi2FBZuEWCocQpHnRUnMu+83gwlHQ51LQTYewSIW2bWeWvwEb6yJ2Q9
         kAayFhogGKZsZp9dVHEjFr/3W0IXnEs/Y+Fh/FoFH1ldfzkfXJB8ysSA+Zs3M/BHHhXo
         mvIdDdzqlDrXsqMvGHdXhQ8QL7/dEXfOGhZ0zdH1Nu662YTGNXsXuVJfjP0bl8eVHgT4
         6+KBAeVNXGsqA/DMhPFOcJvEt3YfGTzkL9wlWN3On9lKNV0KdALm0Hx0czVK4cu6XAFx
         iY1fuHYkiFtI/rLEPHRF7h9OBdbwBfOvDkdXUohF20916EsbFq2ExH8Yj9EIzM7gJMj9
         Fglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940393; x=1702545193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLwhq88ucU//XseHBU5Y2Qmyzap90P9T6HA8O+LQQIc=;
        b=qvas7efo3N022sPR3kxWS8CdS1M2TNcgSWCiVR2BBK/BuuP0U1RoeHnbxtpZl/spdM
         POxXtvjuT/+2xjyTWVyjraJDl86spAYPq2Mzje3sqixpo9Ia5dno61fLfDv8YN3E0qIF
         2YzQ07WQsbGtWigesenJ/DM68Gzz53/YZ1g8+BYX02Cw1YE/szkaXbmhc5uRr5DosVy4
         NdXaI+xr9cUd5D5SCOAiJtZimJ7NYI4gJHb6DJuAAh/FSwbqVePQzUMsauhexU9ETreQ
         2yeF2AySLGVGPNyrUqIahzCSEjD6epZcltOX6GksaYK2icnKBXQMndDgadJHPffILuFk
         cb/Q==
X-Gm-Message-State: AOJu0YwAr0/Xse4HGeQH624RuHTxWoSYHWcokc3DVPZUDAXlviiDMv2k
	Ag5w4D5IXQ9MIQxWAVcI9ZqHo/tJUX+NPg==
X-Google-Smtp-Source: AGHT+IHG0Wu74qUbT1TrQIVviZ6Ezagwx1WncTJpgyeYK/ARn+CjEsXYcbNKXW8KofdglzhKJ9Tyhg==
X-Received: by 2002:a7b:ce08:0:b0:40b:5e56:7b67 with SMTP id m8-20020a7bce08000000b0040b5e567b67mr2469453wmc.176.1701940392699;
        Thu, 07 Dec 2023 01:13:12 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b0040b3e79bad3sm1220456wmq.40.2023.12.07.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 01:13:12 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
Date: Thu,  7 Dec 2023 12:13:00 +0300
Message-Id: <20231207091300.1292252-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 09:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107275

* checkfile.patch removed because fixed in the new version -> https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64b567783825a2c18b87971
* License-Update: Fix spelling/wording

Changelog:

* Fix uninitialized read in MGAEnableSecondOutPut
* gitlab CI: add a basic build test
* Fix spelling/wording issues
* Build xz tarballs instead of bzip2
* configure.ac: fix cross-compilation

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xf86-video-mga/checkfile.patch            | 68 -------------------
 ...o-mga_2.0.0.bb => xf86-video-mga_2.0.1.bb} |  8 +--
 2 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_2.0.0.bb => xf86-video-mga_2.0.1.bb} (66%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
deleted file mode 100644
index ceae6dfba..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57606]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 29 Nov 2012 11:00:43 +0000
-Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
-
-Automatically enabling or disabling a feature based on installed files isn't
-deterministic, and AC_CHECK_FILE returns an error when cross-compiling.
-
-Fix this by enabling DRI by default, and removing the explicit file checks as
-pkg-config is good enough.
-
-(#57606)
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- configure.ac |   25 ++-----------------------
- 1 file changed, 2 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fca1a9c..d2aa2ed 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
-             [moduledir="$libdir/xorg/modules"])
- 
- AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
--                                  [Disable DRI support [[default=auto]]]),
-+                                  [Disable DRI support [[default=enabled]]]),
-               [DRI="$enableval"],
--              [DRI=auto])
-+              [DRI=yes])
- AC_ARG_ENABLE(exa,
-               AS_HELP_STRING([--disable-exa],
-                              [Disable EXA support [[default=enabled]]]),
-@@ -76,27 +76,6 @@ sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
- 
- # Checks for libraries.
- 
--if test "x$DRI" != xno; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
--                      [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
--                      [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
--                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
--fi
--
--AC_MSG_CHECKING([whether to include DRI support])
--if test "x$DRI" = xauto; then
--        if test "x$have_dri_h" = xyes && \
--           test "x$have_sarea_h" = xyes && \
--           test "x$have_dristruct_h" = xyes; then
--                DRI="yes"
--        else
--                DRI="no"
--        fi
--fi
--AC_MSG_RESULT([$DRI])
--
- AM_CONDITIONAL(DRI, test "x$DRI" = xyes)
- if test "x$DRI" = xyes; then
-         PKG_CHECK_MODULES(DRI, [libdrm >= 2.0 xf86driproto])
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
similarity index 66%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
index a9ae901d0..34b3e4cde 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
@@ -4,16 +4,14 @@ SUMMARY = "X.Org X server -- Matrox MGA display driver"
 
 DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3fc"
-
-SRC_URI += "file://checkfile.patch"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4aa220f495ce9be5ce4243d21ebac14f"
 
 DEPENDS += "virtual/libx11 libpciaccess"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-SRC_URI[md5sum] = "b8fc99b4adea8bfe80156b13df4b6c9c"
-SRC_URI[sha256sum] = "268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+SRC_URI[sha256sum] = "27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm xorgproto,xserver-xorg-extension-dri"
-- 
2.25.1


