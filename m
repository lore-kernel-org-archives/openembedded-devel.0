Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1D4C83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 12:38:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.47098.1693831114946237210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 05:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eTaBsZcB;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c1f8aaab9aso10835685ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693831114; x=1694435914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C72JJYitft0xw+zh51QidSSeX7aWqLQF/iS9grbcuQg=;
        b=eTaBsZcBebHJYj0/b0Is47Y9kwY7l6QaDto5fv8vNPiyFcYK8lCQ4ssaT/2UigDCLn
         l93lWcHQXf4Lq4T4kdzcLBprjqfhWjpuzcp7M01x0o3FCC6KheRs8o+o5eq5EGwMDlqw
         96+BOtghHwdvYtPPyuyuxYXc1/M/k0hj8OnTf8NbizHU24oRlxYdudrYq0vPvS4hUcUv
         093HwEjAGQBxIJXSbo+aP0AEzOZs+5CEXF6yhMp6NuWR/LKmHlxK6m+nQzeJ4ab7FAIo
         6ftgKV4fiY0xJzxwVMmmFAew+pUSuv6rXptRWtN4qlKYD+LMfp6jBmNO/iGjCHoLf60A
         24mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693831114; x=1694435914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C72JJYitft0xw+zh51QidSSeX7aWqLQF/iS9grbcuQg=;
        b=U0ztgKYC7YFULbbzqCMbXQSXMK/ArZtVMqDKSbfNofGu7DIBrmtjTsf0kXsnIXTts2
         b4R3pOKJDqLUMqeO/Qcqal2CRJO9Hoz3Dob0mbM48+h+2Dv1rWF/aQUv+aM3PWPAAQdd
         Mn4fGN60ab7SdOn0HTTvne83m/SjIqYHAwFdJ40kZW2yi4Jcy9q0xzkoHKlwoVpzHaHf
         o6Mfnd7hzmYSDH5pZc1awQhUs7nBrKen8XkdXbpNreeFj/cD9Ka8Dnv5IzVukmZinjN/
         cbXuoRVM6rKoi4nY4qlqW0C8xnlno1cI2X3t6Dw/m9fVII4kpXJqfbtyAcCID4uDV8tp
         OLAw==
X-Gm-Message-State: AOJu0YzMHJ0VRpD1HXxv7oeublHyIpWijDGXfWgPWtGcf3Koo+T77/Ik
	9cLFr4U+M9QYRNXxJuj43Xr5gzamRCSk9Q==
X-Google-Smtp-Source: AGHT+IHH9+WmHldISbzu8cR2/wtUT7Iy86C2KixLVBQ7noyP59JFphBgoA+YgrchLqUbphB0WncgEg==
X-Received: by 2002:a17:902:eacc:b0:1bf:2e5c:7367 with SMTP id p12-20020a170902eacc00b001bf2e5c7367mr11557325pld.42.1693831114051;
        Mon, 04 Sep 2023 05:38:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:18be:6e26:cebe:deeb:ef24])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902c1c400b001c0e92d862bsm7529603plc.99.2023.09.04.05.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:38:33 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][master][PATCH] meta-oe-components: Avoid usage of nobranch=1
Date: Mon,  4 Sep 2023 18:08:18 +0530
Message-Id: <20230904123818.76100-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 12:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104713

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1 for these components.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb        | 2 +-
 .../webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb              | 2 +-
 .../xdg-desktop-portal/xdg-desktop-portal-gnome_44.1.bb         | 2 +-
 .../xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb         | 2 +-
 .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb      | 2 +-
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.20.bb    | 2 +-
 meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb              | 2 +-
 meta-oe/recipes-extended/minio/minio_git.bb                     | 2 +-
 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb               | 2 +-
 meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb             | 2 +-
 meta-oe/recipes-support/glog/glog_0.6.0.bb                      | 2 +-
 meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb                | 2 +-
 meta-oe/recipes-support/tio/tio_2.6.bb                          | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
index 343135bfa..58e72efb7 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 
 RRECOMMENDS:${PN}  = "gnuchess"
 
-SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=master"
 
 inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
 
diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb
index 71c5244f1..6f9156ded 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb
@@ -12,7 +12,7 @@ inherit meson pkgconfig
 
 EXTRA_OEMESON = "-Dupdate_cache=true"
 
-SRC_URI = "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=https;branch=mainline"
 
 S = "${WORKDIR}/git"
 SRCREV = "a35014104a226265e44fe30fcdb4df9305af3466"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_44.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_44.1.bb
index d6bc0e9c8..a8e8c83de 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_44.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_44.1.bb
@@ -21,7 +21,7 @@ inherit meson pkgconfig gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;protocol=https;nobranch=1"
+SRC_URI = "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 SRCREV = "89203bf3522556965fc225782d1a635afdac611e"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
index 1e0a90618..b291991d3 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.14.1.bb
@@ -18,7 +18,7 @@ inherit gettext autotools pkgconfig gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 SRCREV = "952005f6a7850a247d286f14838202f506b402b7"
diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
index b845c5f79..8ffe652b2 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 inherit meson pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "opengl wayland"
 
-SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1 \
+SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;branch=master \
            file://0001-screencast-Fix-build-with-older-mesa.patch"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index caf55ed6d..fbad5e136 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -12,7 +12,7 @@ DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools p7zip libselinux goo
 SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
 
 SRC_URI = " \
-    git://salsa.debian.org/android-tools-team/android-platform-tools;name=core;protocol=https;nobranch=1 \
+    git://salsa.debian.org/android-tools-team/android-platform-tools;name=core;protocol=https;branch=master \
 "
 
 # Patches copied from android-platform-tools/debian/patches
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.20.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.20.bb
index 061441669..1121e9a4c 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.20.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.20.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41f7469eaacac62c67d5664fff2c062d"
 
 inherit cargo cargo-update-recipe-crates
 
-SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;nobranch=1"
+SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main"
 
 # musl not supported because the libc crate does not support functions like "endutxent" at the moment,
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
index f5a726a83..ca0f0e82c 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
-    gitsm://github.com/flatpak/flatpak;protocol=https;nobranch=1 \
+    gitsm://github.com/flatpak/flatpak;protocol=https;branch=main \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index 049f35ca0..f278a728f 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "MinIO Client (mc) provides a modern alternative to \
                cloud storage service (AWS Signature v2 and v4). \
 "
 
-SRC_URI = "git://github.com/minio/mc;nobranch=1;name=mc;protocol=https \
+SRC_URI = "git://github.com/minio/mc;branch=master;name=mc;protocol=https \
            file://modules.txt \
           "
 
diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
index 22b482640..0049bbe23 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
@@ -8,7 +8,7 @@ DESCRIPTION = "Allow the use of PNG images in LVGL. This implementation uses lod
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
 
-SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;branch=master"
 SRCREV = "bf1531afe07c9f861107559e29ab8a2d83e4715a"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
index 6784b099a..822e3043e 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
 
 SRCREV = "bbfb6289dedb88cb8155d9f6868787d5432e1f90"
-SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;nobranch=1 \
+SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master \
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
 
diff --git a/meta-oe/recipes-support/glog/glog_0.6.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
index 1c8867f04..c09ce73f9 100644
--- a/meta-oe/recipes-support/glog/glog_0.6.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
 SRC_URI = " \
-    git://github.com/google/glog.git;nobranch=1;protocol=https \
+    git://github.com/google/glog.git;branch=master;protocol=https \
     file://libexecinfo.patch \
     file://0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch \
 "
diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb b/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
index b81050b25..2f6b1f247 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
-SRC_URI = "git://github.com/michaelrsweet/mxml.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
 SRCREV = "fd47c7d115191c8a6bce2c781ffee41e179530f2"
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/tio/tio_2.6.bb b/meta-oe/recipes-support/tio/tio_2.6.bb
index 1a83a2e42..faef29073 100644
--- a/meta-oe/recipes-support/tio/tio_2.6.bb
+++ b/meta-oe/recipes-support/tio/tio_2.6.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "tio is a simple serial device tool which features a \
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
-SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master"
 SRCREV = "88ef473362c5a1ff0dcd389fd5b1d4d6bf202472"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


