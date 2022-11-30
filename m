Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070F1C4708E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.22655.1669838481001263131
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0MzJq6v;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 21so4682038pfw.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egXq/ocrepqjSF1aEUSlynTUN+XMfVINF/xQxdDtj9E=;
        b=W0MzJq6vSIiVkB7pbUVRfNbRzXas/HV4x4AJ7mvOOQju/8sqnNcDXmTBAtaxDXp5nv
         E+BuuQDIGrCV7SeDGnunJTJ8WWMZ6Wf6ZDPIztTmDtAEgrFmb5VtFMMVDIQ7iM1loVTF
         oNXtxfV4Yhyv+wZidRTvB4yq+RtE8r4zo9G5m0PVyCbvwJ6XHdJkSMCHEEz01KXVaax8
         PvhiNegts4HSbchx82PKf9fdyviZ/KDyKYPMQWRCMYlwobWUyg42MBzs0PzL9Yey9MAR
         Vxr4GqitGML/wPx8h2ZrR7vQyW/1f3Yjflmhhy80vJzETns/cfjJjWsVo5nCDBMv+VTe
         dZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egXq/ocrepqjSF1aEUSlynTUN+XMfVINF/xQxdDtj9E=;
        b=hX8n84iNzArH0Bvbc+Dy/yyrpGopefTq6T+jrDInMgDIHeZ+kPG58R5/B/8ewZtXVM
         Bn8nXhIf9RFQqitOIfN20G+vQISyV/YBb4EimoMF8wgeeWpk7gn0+nzcydNmEZ0u8ueU
         JjpQtoz/KGKYO1zUoQG2zxUQZEkTv1BeWiKam8dDRjKbB5Rmlra6OR4ekSJqh7jFzBR9
         8H9qe+AVsmgQcQO2UIPfPTChq4qpKIt5INU5Mr32Bhvct4K1Ai3FJ2b9lx91wSO0lYLw
         ewQihJsJwJJO5ShW0/+2AUyUxVta2sHa5RqiAoV0+Ci2Uhr2dW/m0YAHy0gxa6v9q+TY
         3vOQ==
X-Gm-Message-State: ANoB5pmZYHQpMg2rwQaQ1UKpiV+UuaRFUDoRIEWVya5n66Ewo1vtyPjw
	anIpleN5oSRxDF9eHDyOWQ1xRdSkfrQ=
X-Google-Smtp-Source: AA0mqf7N4d4KXhMd2rDCeDZbXH6TqNT9Bav7+/hef/pTjg9nv8Sg8d80i6EGKyXbCIfpBcvaNFATpQ==
X-Received: by 2002:a63:ec47:0:b0:46f:c465:5848 with SMTP id r7-20020a63ec47000000b0046fc4655848mr38583593pgj.148.1669838480171;
        Wed, 30 Nov 2022 12:01:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/7] gtk4: remove recipe
Date: Wed, 30 Nov 2022 12:01:12 -0800
Message-Id: <20221130200115.1954308-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130200115.1954308-1-raj.khem@gmail.com>
References: <20221130200115.1954308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99874

From: Markus Volk <f_l_k@t-online.de>

It has been moved to oe-core

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb | 142 --------------------
 1 file changed, 142 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb
deleted file mode 100644
index c71be23a7d..0000000000
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb
+++ /dev/null
@@ -1,142 +0,0 @@
-SUMMARY = "Multi-platform toolkit for creating GUIs"
-DESCRIPTION = "GTK is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
-set of widgets, GTK is suitable for projects ranging from small one-off projects to complete application suites."
-HOMEPAGE = "http://www.gtk.org"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "libs"
-
-DEPENDS = " \
-    sassc-native \
-    glib-2.0 \
-    libepoxy \
-    graphene \
-    cairo \
-    pango \
-    atk \
-    jpeg \
-    libpng \
-    librsvg \
-    tiff \
-    gdk-pixbuf-native gdk-pixbuf \
-"
-
-LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
-    file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
-"
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
-
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "effd2e7c4b5e2a5c7fad43e0f24adea68baa4092abb0b752caff278e6bb010e8"
-
-S = "${WORKDIR}/gtk-${PV}"
-
-inherit meson gettext pkgconfig gtk-doc update-alternatives gsettings features_check gobject-introspection
-
-# TBD: nativesdk
-# gobject-introspection.bbclass pins introspection off for nativesk. As long as
-# we do not remove this wisdom or hack gtk4, it is not possible to build
-# nativesdk-gtk4
-BBCLASSEXTEND = "native"
-
-GSETTINGS_PACKAGE:class-native = ""
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-GTKDOC_MESON_OPTION = 'gtk_doc'
-
-EXTRA_OEMESON = " -Dbuild-tests=false"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
-PACKAGECONFIG:class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-
-PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
-PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
-PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups"
-PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
-# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
-PACKAGECONFIG[gstreamer] = "-Dmedia-gstreamer=enabled,-Dmedia-gstreamer=disabled,gstreamer1.0-plugins-bad"
-PACKAGECONFIG[tracker] = "-Dtracker=enabled,-Dtracker=disabled,tracker"
-
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
-}
-
-
-PACKAGES =+ "${PN}-demo"
-LIBV = "4.0.0"
-
-FILES:${PN}-demo = " \
-    ${datadir}/applications/org.gtk.Demo4.desktop \
-    ${datadir}/applications/org.gtk.IconBrowser4.desktop \
-    ${datadir}/applications/org.gtk.WidgetFactory4.desktop \
-    ${datadir}/icons/hicolor/*/apps/org.gtk.Demo4*.* \
-    ${datadir}/icons/hicolor/*/apps/org.gtk.IconBrowser4*.* \
-    ${datadir}/icons/hicolor/*/apps/org.gtk.WidgetFactory4*.* \
-    ${bindir}/gtk4-demo \
-    ${bindir}/gtk4-demo-application \
-    ${bindir}/gtk4-icon-browser \
-    ${bindir}/gtk4-widget-factory \
-"
-
-FILES:${PN}:append = " \
-    ${datadir}/glib-2.0/schemas/ \
-    ${datadir}/gtk-4.0/emoji/ \
-    ${datadir}/metainfo/ \
-    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
-    ${libdir}/gtk-4.0/${LIBV}/printbackends \
-    ${bindir}/gtk4-update-icon-cache \
-    ${bindir}/gtk4-launch \
-"
-
-FILES:${PN}-dev += " \
-    ${datadir}/gtk-4.0/gtk4builder.rng \
-    ${datadir}/gtk-4.0/include \
-    ${datadir}/gtk-4.0/valgrind \
-    ${datadir}/gettext/its \
-    ${bindir}/gtk4-builder-tool \
-    ${bindir}/gtk4-encode-symbolic-svg \
-    ${bindir}/gtk4-query-settings \
-"
-
-GTKBASE_RRECOMMENDS ?= " \
-    liberation-fonts \
-    gdk-pixbuf-loader-png \
-    gdk-pixbuf-loader-jpeg \
-    gdk-pixbuf-loader-gif \
-    gdk-pixbuf-loader-xpm \
-    shared-mime-info \
-    adwaita-icon-theme-symbolic \
-"
-
-GTKBASE_RRECOMMENDS:class-native ?= ""
-
-GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
-
-RRECOMMENDS:${PN} = "${GTKBASE_RRECOMMENDS}"
-RRECOMMENDS:${PN}:libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
-RDEPENDS:${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG", "wayland", "wayland-protocols", "", d)}"
-
-PACKAGES_DYNAMIC += "^gtk4-printbackend-.*"
-python populate_packages:prepend () {
-    import os.path
-
-    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
-    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
-
-    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES')):
-        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
-}
-- 
2.38.1


