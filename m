Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF85CC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 18:33:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.92361.1701973982635953395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 10:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TuCa9dZo;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3332e351670so1181621f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 10:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701973980; x=1702578780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llgbPSermisypcGJ2KTZE8uQTYJJAyWsWsJVO/BbEKE=;
        b=TuCa9dZoJPgFqbKAnkJ814uDOBsZqBt55lHxgLSLymQfR87Wfzi247c2zf1IOvWM09
         mdYAoTcIPUuvTmRtR9rJKNsQIGHE/N/diP3oreQi2WQsX1TamsKmJYQSpWEZImmdeYDR
         cr6PIMKxQJt2B+ipN4+gJ5Y5fECY8p8qDpTxQk56JxUbbgedCVeEfStCVZ7h0e0Q5Si4
         19oeO9QxC1bdMXzOeTTY4rESQt9YWUaaUCwiosAOb14+zcrId0fwyjGzsA1E+VOHOPOW
         3g7zoY3ecDu0mrHUOZnK3dyOZtIBUqTYZFjVL7pD6Xyy6EiaQDPChBptGk7CBPQwguzy
         wOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701973980; x=1702578780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llgbPSermisypcGJ2KTZE8uQTYJJAyWsWsJVO/BbEKE=;
        b=n2o9fhtHgDiekK+hrtbAP5JsEwrV/83r4tXOLqnJtSLTfuH8v8/uO32q+ZG6+qPSUC
         wX4Nob/dF0kwWnB52zYrodMKDOnkrtY05lL6UKHDT/seSrQPEtNxIsWAZ812482bBGzE
         JVYRReJe88BOd4Pm/A7GXtSLA34S83k8+yW9MIshz4mxX58ohAy18+vASoB3/jLpmm2J
         gY9G5/UJa7EeujLcjxiWLrp4dpxMptOldKTuMbBLjebIjpYYi/0sI9T7t15L9rouDeCm
         E6lqd2fWYCh/5fTj1n1MuJDwD13OtD95HEdBrILGNMkzoBivMXk3yrM4O1q+FgytufvH
         qL4Q==
X-Gm-Message-State: AOJu0YwGWrMYh+LQZIKnsBNQuF7tLXE6ZAnTVYBpDIsMa6MQMCDeLSUl
	aE2htOgASMsXm4bhrO96pmwkqqSxoc6yrQ==
X-Google-Smtp-Source: AGHT+IGqVNAj0krPKxgDUflQ5ltvRcIUVcWLKdgm9ShFw1bTeTLVXjT8zkc8+bTGskboHmcW94NmDA==
X-Received: by 2002:adf:f585:0:b0:333:3117:c432 with SMTP id f5-20020adff585000000b003333117c432mr890393wro.195.1701973980227;
        Thu, 07 Dec 2023 10:33:00 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id e10-20020adffd0a000000b003334675634bsm274331wrr.29.2023.12.07.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:32:59 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
Date: Thu,  7 Dec 2023 21:32:54 +0300
Message-Id: <20231207183254.1753575-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107290

* checkfile.patch removed because fixed in the new version -> https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64b567783825a2c18b87971
* License-Update: Fixed the typo in a word. "MERCHANTIBILITY" -> "MERCHANTABILITY"

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


