Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75722C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:51 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.52987.1681153121972529624
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=e3aoG2/w;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5047074939fso13461054a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153120; x=1683745120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahmRrvIDoYAOLiz7IHcgAKyZqoXrFe879ITy6r3KMHE=;
        b=e3aoG2/w3EjRQVao9r9g8x7EbgQL96pS3Ox8XhJ9jsSEqm6boz7Q87k3xH3uc27QLL
         EmKUm3/cKjqtOKu8wz8/XQxeqiygg75IU7XYKwFrMa+D/YxpYZrf6B8NPGcNKa5p+dkD
         DMQxGFD43M6pmaNxTUd86LRWoB/3ds1+s4xlXBmemVFB9HqvKTCCkFyuBEuWYLtNX47y
         TVKZO9oDMIq+Xsix8/wjDwHvmXywmGh36umb0ZQwI6nfwT3HxT9rU5BeCfE5gYZsLd5n
         spwX7m86KQJ3cYyWm7bJQmCV2Parm06hJk0pVPzHEguRl4Ftte5gXFNlA5DL7LtJiGc3
         ZbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153120; x=1683745120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahmRrvIDoYAOLiz7IHcgAKyZqoXrFe879ITy6r3KMHE=;
        b=dGoLeDi0v/9b+1JQi0pzGQmhq1npsqabdWZb7GXmDCNKQG5+mNkj4crEB5WL5RKh4u
         dPUBRg9+k8CnU0xWmO8J/GDjubdXddSTKTmFokwEv29oAhs7ha7+uuHggau81e28ppCj
         0klEklDyU2XWpvVIq85ghvhTXoq/97xtCZ7nsMqMEgskm/tHo2/8DKTDpLeZHHecC42/
         ZKfXSPtht5m3aIXzNRF6RUun+AyDsfHkyAG8eZa4apmXpMNWvFbJBZuENfwGAUvmFeHD
         1Y6rxV8+bKGg35JU4T2D438BLfYfvtgmjvN2R92V+dFaJoA4J3mM7DYPjQtm35+xrCJk
         1E7A==
X-Gm-Message-State: AAQBX9dfT8Oy8tb4EVVtTuLHOUlf6X8sCQiixk9c4ZeJIiXENurIiYzn
	XJKLOEAuTJRqCjfVlTd+vbmGNWWky/c=
X-Google-Smtp-Source: AKy350YJFgt6cYYCEwK/GpfK4CBUADwMbJxqsYwDAKl0OUnqabz7eHMNKUt3mvEQ4NyipF7SPuRuVA==
X-Received: by 2002:aa7:c490:0:b0:504:9350:f458 with SMTP id m16-20020aa7c490000000b005049350f458mr6061634edq.1.1681153120425;
        Mon, 10 Apr 2023 11:58:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s10-20020a508d0a000000b00501d5432f2fsm3564886eds.60.2023.04.10.11.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 7/9] lvgl,lv-lib-png,lv-drivers: fix installed-vs-shipped QA issue with multilib
Date: Mon, 10 Apr 2023 20:58:17 +0200
Message-Id: <20230410185819.2416704-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102049

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


