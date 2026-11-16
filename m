Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22056.1794808967653587932
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fukKQ3+z;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso4512697eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808967; x=1795413767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHmzvzmOrHET4FqHYlt5GpAwVWQBF14zXy4fipkWg+g=;
        b=fukKQ3+zhlhNl5Zv56oB72EysOxUSsZcNr97Nf7BjGwyfCdFojUuhu6M0pdUcelw82
         xoJwWIr4PiCYsdy/Zuliyw+lSac4FwmD7ALFvTPSBqIWVtSLlvLB0IKXzvEwQPmPySEN
         nKIaCmHKMrRr2sItDi4IbyemYozape6K5IxbRF0m6cUvg1gLXa2wAR8ocMiEbrB7A9Li
         Xf3j7I+uf5HKCp/ngZuNryhHnU4eBjV9GKQZRUIAz0XXCKdZPLpmpw0p2VCayfsmVgNo
         JVBVLWGC9/YEIULRv12/Y7S6HeqoFa36TRKvfk0/Vn1NrICEHFltKKVahfgQe/nBn02c
         cS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808967; x=1795413767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wHmzvzmOrHET4FqHYlt5GpAwVWQBF14zXy4fipkWg+g=;
        b=q+7Ut4t51oHTEMtyl26qGAlkd6TszfZskpNXJnt/SnYpsKfsGuoxclyC5htFBeqAi0
         aCvfY/FKmyal92044T2ufsvcL/YCoJnfdmIloBzcMc19RrZqdTPCz6QEu92CMkf93ewg
         95eFSBqbIiRPfzmLk0TETz3qWTXR5cu1cJC2CSb6XPfR0x8sM9XioUhZDzsmQp4/7UVC
         L1w0rDr4aR07JI58jc0aSHBUJpGKx+sppH6fR18MALXr4sHulROEOLXKdb1WRX6Xmbb0
         x286QtXNxp3/vGg+vxxlB1x4En6F7tLUTPodvTbppbjmFMSOlE2Gyy7FqQZ0k61hn3dL
         xNKQ==
X-Gm-Message-State: APuU4Z/TaBre5lVBNdMV+fxe2O++FAAvGefVLQQIK5TAHJfxr1v+nQdq
	obL61Ra6tg7JmW6oguR2tgDgg1wX6mGAcUhTlKuzJr1h48spFr3OLbtYY2NDRhbI
X-Gm-Gg: AYBFou0LJcFOAAgoNRqXodC4Cyt6k2YN3hBkz1zH60+g+aEmCMStQ27z9aIWOo5RGb0
	QoM1Y4Mhpp3wlKm53NEDeuWL/og6BEHkPdaqL+CZ2/1OmOJ31jYHqUFHsRMgj18+/VZCK80ZsOB
	n2DtLRl4Z3Jdsjhd13JTWIjhvXApYmsBJgVr40SYlYTrJT34/K+wX5aAcYtw4ko4ygwVLR/rlGU
	I4aqEiJhStTXaMwYROCwhCqw0H2+OHkwW+dfLFgTrD9xmhITj0JuYvjWRzEkX1Xr7D0LBRqFW7p
	B3RvXeifoD+oZxS/FG9J/eY9js3kyEVNzAAgMdmZGxeL14ny/uB4WaunDmJtHI9X4HEqhydcvki
	j/HnT0fULqAuJefspWpQBMP/bi+CYeyjNHPrDdK1ewPtRpNY4GZ2Qn9qB8J3wejPA8srDhAuGXG
	nP7nJ1dfB98i+X0WCWMY0ae+j9dC68fjpZaQRoYmj1vmttCb5pzFUd666IUH34GCkPZzZ3Ryoio
	9xUdahcbSs/1q1iDg7lTU2rFAmA8hCmyed8rjw7bHiC6g7QoXxKNGp4Z/ioeDhisYU1spf9EQHA
	Lv5V2oY+EOVW7TTOG9KzuWjY4wHmYGidjyLOhD0kUg9mvxTNYgJO49eggxfGj7Dyu8zk/xuJNFH
	30kUwECh1vugaerj/77jSqoCFt2Md8Y17tj8YL0cDNAUYshARlTAvVNoZUR43eUm9ighgIM2dT4
	O3xzr3D/2LMhJQ1uVPOYF9SRo/IGo7IRASZ1GMNUszr4ZOFaA7J58CLCz58uwTLHLAgFGVogpOd
	xsRNK74NkWjzOHbEWtRti9bZ19hHwtvCSvOCgQj6Ok9LlV+lcWsJNyN0SiQnnEwJAjvzX8cfKEZ
	gzoDNAndes0NknQoxX5HtAbWNw==
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr14433528eec.22.1794808966679;
        Sun, 15 Nov 2026 22:02:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 30/30] parole: upgrade 4.18.2 -> 4.20.0
Date: Sun, 15 Nov 2026 22:02:08 -0800
Message-ID: <20261116060209.2916444-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132428
Content-Type: text/plain; charset="utf-8"

The release tarball is .tar.xz and is made for meson, the autotools
build cannot find a native glib-compile-resources. Switch to meson,
map the PACKAGECONFIGs to the meson options, add x11 and wayland, drop
clutter which is gone and the Makefile.am patch, and add
dbus-glib-native for dbus-binding-tool.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-Makefile.am-fix-compile-failure.patch | 31 -------------------
 .../{parole_4.18.2.bb => parole_4.20.0.bb}    | 18 ++++++-----
 2 files changed, 11 insertions(+), 38 deletions(-)
 delete mode 100644 meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch
 rename meta-xfce/recipes-multimedia/parole/{parole_4.18.2.bb => parole_4.20.0.bb} (51%)

diff --git a/meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch b/meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch
deleted file mode 100644
index f84f6e5388..0000000000
--- a/meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 34ff86795396c320a9e19641d9d226190b7fdfc6 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Sun, 12 Apr 2026 19:30:23 +0800
-Subject: [PATCH] Makefile.am: fix compile failure
-
-Fix build failure:
-/build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld: parole-conf.o: undefined reference to symbol 'xfce_rc_close'
-/build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld: /build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot/usr/lib/libxfce4util.so.7: error adding symbols: DSO missing from command line
-
-Upstream-Status: Submitted [https://gitlab.xfce.org/apps/parole/-/issues/146]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 920b708..244c14c 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -90,6 +90,7 @@ parole_LDADD =						   	\
- 	$(GMODULE_LIBS)				\
- 	$(DBUS_GLIB_LIBS)                       \
- 	$(LIBXFCE4UI_LIBS)                     \
-+	$(LIBXFCE4UTIL_LIBS)                \
- 	$(XFCONF_LIBS)                     \
- 	$(GST_VIDEO_LIBS)			\
- 	$(TAGLIBC_LIBS)				\
---
-2.34.1
-
diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb b/meta-xfce/recipes-multimedia/parole/parole_4.20.0.bb
similarity index 51%
rename from meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
rename to meta-xfce/recipes-multimedia/parole/parole_4.20.0.bb
index 1d2c858a2d..29b17c6db4 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.20.0.bb
@@ -3,10 +3,15 @@ HOMEPAGE = "https://docs.xfce.org/apps/parole/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"

+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 inherit xfce-app gtk-doc mime mime-xdg

 DEPENDS += " \
     dbus-glib \
+    dbus-glib-native \
     xfce4-dev-tools-native \
     libxfce4util \
     libxfce4ui \
@@ -15,17 +20,16 @@ DEPENDS += " \
     taglib \
 "

-SRC_URI += "file://0001-Makefile.am-fix-compile-failure.patch"
-
-SRC_URI[sha256sum] = "6625288b760d38a15c295051ecf66c556fcad21dd1516d6d661c2a582421ee0e"
+SRC_URI[sha256sum] = "5cf753e670d6518701133eb860d8bceb3a08a496af6a2b7cc67b93320230c983"

 RDEPENDS:${PN} += "gstreamer1.0-plugins-good"

-EXTRA_OECONF = "--disable-gtk-doc DATADIRNAME=share"
+EXTRA_OEMESON = "-Dtaglib=enabled"

-PACKAGECONFIG ??= "notify"
-PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter-gtk-1.0"
-PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
+PACKAGECONFIG ??= "notify ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG[notify] = "-Dnotify-plugin=enabled,-Dnotify-plugin=disabled,libnotify"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11"

 FILES:${PN} += " \
     ${datadir}/metainfo \
