Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB7AC6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 22:07:53 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.2632.1680905273023494446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 15:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=G+Up+E37;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ga37so75920ejc.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680905271; x=1683497271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zqt/MxWLjVqTjKhRuO50N8NLuzVZKGzmkO4LeNWQbRE=;
        b=G+Up+E37IZ9itR0SEJtOGZucr1sS5GAEwhhNH07kMJfQ49okpj3JSfUClhyAKSSpUi
         t99N5ylydQfzddnA3dgIQWtM4oo0iLrecubACAF8cbXnCRo4T2qCJ2Bu7L7zTzf+4tm6
         7UTBa5noVxdSejKTUMZAENFi662JPxNsUfhoMnSSr3WOuPpDncGGycNdKEXHYEdF+TyI
         CqCNRPnOugf3pZlwHZ3CLciyVrUuOVlcK2wvQZctIy2GZI8XxLAoXeX9P/196Bijt7kF
         eBKzPbL6V09b0fCk4+LT3gab8asKlfBWiL/5RadckfESP6lU//gYOZOnce+tdS8SZ768
         WG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680905271; x=1683497271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zqt/MxWLjVqTjKhRuO50N8NLuzVZKGzmkO4LeNWQbRE=;
        b=WivnefnDpSLUm7neeUYQCTtZosOakV4UDRJm2M8fO6EoLSji1hGdiH5zdN85nUV/ft
         J0p5Wo+gdD94ObRcLPh3i8D946mrMdF2u1VkuRmUHs8kOtz9i4yyHr2gcRG7c4+ktGzU
         W7GUU90udWysV3PGjnPjpx8gstULJ0FKy1eP55yyyrSddYIW0maZEQ9A6v0wrmiM/DwW
         QxkfxADLlaI6QcHv5jhm/FYKkl2XKU7BiFANhUUKMSuG9WwxYrV9wBMuDR4A5Daa6tUA
         yHsFf4GXbu1jtNAStd9Qt/C8+IzZTkx/I38mOxmgxn4c96ZVcGd7zvQVxm+bRZddEwup
         yT4Q==
X-Gm-Message-State: AAQBX9f8jwbyUq4wZ9f3NyYMHcQzn5/S2H2SWRsdi2I2glqjb9xDEiq7
	rpsXPZ+XJm6YWBs8Jd/Pqde+5CZVWBI=
X-Google-Smtp-Source: AKy350bILFlxZ6qU6mncVQc9zSjFDo5Hd80YQYw/EUJfE0gCY9WvgvrbRtR690IOnCvDzz7wmpNvSw==
X-Received: by 2002:a17:907:1dc8:b0:947:bf71:a54f with SMTP id og8-20020a1709071dc800b00947bf71a54fmr60736ejc.52.1680905271418;
        Fri, 07 Apr 2023 15:07:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lf27-20020a170906ae5b00b008e68d2c11d8sm2441478ejb.218.2023.04.07.15.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 15:07:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] lvgl,lv-lib-png,lv-drivers: fix installed-vs-shipped QA issue with multilib
Date: Sat,  8 Apr 2023 00:07:37 +0200
Message-Id: <20230407220737.889502-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230407220737.889502-1-Martin.Jansa@gmail.com>
References: <20230407220737.889502-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 22:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101991

* with multilib BASELIB is just "lib" while baselib is "lib64"
  and libdir is "/usr/lib64".
* fixes:
  ERROR: QA Issue: lvgl: Files/directories were installed but not shipped in any package:
    /usr/lib
    /usr/lib/liblvgl.a
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  lvgl: 2 installed and not shipped files. [installed-vs-shipped]

* lowercase baselib should work for ppc64 as well (I hope)
  # $baselib [3 operations]
  #   set oe-core/meta/conf/bitbake.conf:10
  #     "${BASELIB}"
  #   set oe-core/meta/conf/bitbake.conf:11
  #     [vardepvalue] "${baselib}"
  #   set oe-core/meta/conf/multilib.conf:2
  #     "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
  # pre-expansion value:
  #   "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
  baselib="lib64"

* simplify destsuffix/S setting
* I was surprised that ${WORKDIR}/${PN}-${PV} works in multilib build
  but then I've noticed that it's because destsuffix is set to S which
  is a bit uncommon, so drop that and use default "git"

* use ${STAGING_INCDIR} instead of ${RECIPE_SYSROOT}/${includedir}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb | 8 ++++----
 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb  | 8 +++++---
 meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb        | 6 +++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
index 1a94215839..cf33c69048 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
 
 # TODO: Pin upstream release (current v7.11.0-80-g419a757)
-SRC_URI = "git://github.com/lvgl/lv_drivers;destsuffix=${S};protocol=https;nobranch=1"
+SRC_URI = "git://github.com/lvgl/lv_drivers;protocol=https;nobranch=1"
 SRCREV = "419a757c23aaa67c676fe3a2196d64808fcf2254"
 
 DEPENDS = "libxkbcommon lvgl wayland"
@@ -19,15 +19,15 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 inherit cmake
 inherit features_check
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/git"
 
 LVGL_CONFIG_WAYLAND_HOR_RES ?= "480"
 LVGL_CONFIG_WAYLAND_VER_RES ?= "320"
 
-EXTRA_OECMAKE += "-Dinstall:BOOL=ON -DLIB_INSTALL_DIR=${BASELIB}"
+EXTRA_OECMAKE += "-Dinstall:BOOL=ON -DLIB_INSTALL_DIR=${baselib}"
 
 TARGET_CFLAGS += "-DLV_CONF_INCLUDE_SIMPLE=1"
-TARGET_CFLAGS += "-I${RECIPE_SYSROOT}/${includedir}/lvgl"
+TARGET_CFLAGS += "-I${STAGING_INCDIR}/lvgl"
 
 # Upstream does not support a default configuration
 # but propose a default "disabled" template, which is used as reference
diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
index 032e85f522..22b4826403 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
@@ -8,21 +8,23 @@ DESCRIPTION = "Allow the use of PNG images in LVGL. This implementation uses lod
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
 
-SRC_URI = "git://github.com/lvgl/lv_lib_png;destsuffix=${S};protocol=https;nobranch=1"
+SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;nobranch=1"
 SRCREV = "bf1531afe07c9f861107559e29ab8a2d83e4715a"
 
+S = "${WORKDIR}/git"
+
 # because of lvgl dependency
 REQUIRED_DISTRO_FEATURES = "wayland"
 
 DEPENDS += "lvgl"
 
-EXTRA_OECMAKE += "-DLIB_INSTALL_DIR=${BASELIB}"
+EXTRA_OECMAKE += "-DLIB_INSTALL_DIR=${baselib}"
 
 inherit cmake
 inherit features_check
 
 TARGET_CFLAGS += "-DLV_CONF_INCLUDE_SIMPLE=1"
-TARGET_CFLAGS += "-I${RECIPE_SYSROOT}/${includedir}/lvgl"
+TARGET_CFLAGS += "-I${STAGING_INCDIR}/lvgl"
 
 FILES:${PN}-dev = "\
     ${includedir}/lvgl/lv_lib_png/ \
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
index 2005afa2fd..ea74c59185 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
@@ -8,7 +8,7 @@ SUMMARY = "Light and Versatile Graphics Library"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
-SRC_URI = "gitsm://github.com/lvgl/lvgl;destsuffix=${S};protocol=https;nobranch=1"
+SRC_URI = "gitsm://github.com/lvgl/lvgl;protocol=https;nobranch=1"
 SRCREV = "d38eb1e689fa5a64c25e677275172d9c8a4ab2f0"
 
 REQUIRED_DISTRO_FEATURES = "wayland"
@@ -16,8 +16,8 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 inherit cmake
 inherit features_check
 
-EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${BASELIB}"
-S = "${WORKDIR}/${PN}-${PV}"
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib}"
+S = "${WORKDIR}/git"
 
 LVGL_CONFIG_LV_MEM_CUSTOM ?= "0"
 
-- 
2.40.0


