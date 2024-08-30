Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7249CA0EDC
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:45 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5158.1724990316777279405
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFHFrcF0;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-656d8b346d2so854053a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990316; x=1725595116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywKebfd1EfHhuuotQoA+LSYe0Iw8bJ7JdPWTTgYgCPM=;
        b=lFHFrcF0f3RgNX8UgH3xz/vUlSiBgEAjqMQ5SYwMMaJnSGwv90cyCXFouPcrzGDRXd
         pOQZHHeLT5Jeq5IiilHwtMFDAvyDPOnl0JmlcM1anxPS1aAA2w4MzLCqGmCHjZxqrvG/
         pacBWiIekX+uhcjKMBFsx3XtumDfO72U8TVjAsDFGaPYj9Eo6Ey2Y3N518j5qU9CcOsl
         eSQX1Ccv7kt+p1wRV9UcJcqo6wIurdLDvBUvxyVLqsMwkzE3Q2PCM+fVpL2xfM7+tY9c
         k/eSeHnMZvmuc0ACHQ8R49QGwNZ6k8D3mfRw9PddGHkCDgQ4xI5Ndcpl32pdv2sKuPgd
         ZRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990316; x=1725595116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywKebfd1EfHhuuotQoA+LSYe0Iw8bJ7JdPWTTgYgCPM=;
        b=KGSd/f23PS7tgywxZgoXKaWlWlrUkW4f4khoN9JHYDFn27UqgoV+jL4tgZiAG+3FtO
         qfObvx0FyPdIF6Mt3lXmlQ6IQzsQUorNy8hAUIUudQI+7vN+9mYYiHhPMZOvYNI+/sxf
         nPsL8VowXxGIdrWOJtiaUS+fE5yJJvFdwydAsQfnzKyI0nBtE5vZ3mWhxpAzYBHvpBnf
         Y03LsQ4wrr/5oLcEnQ0aA5tkah+CzyBX1XFFEUD34ihunSaADOTzq5pt4KW4kw2m68O8
         YQEnmzd3ubsslHNUfqNtYxzqXe+KxdMojCl/UMJhmLCia/l1HLWfSF3xXWLIzAMWPsy7
         /rAQ==
X-Gm-Message-State: AOJu0YxAw2Mt6K5qxEDu0EEXROMUTH0URe297W4Gw5b+Pt7W9tbpKP6k
	2/hvJPMb+T/+/RJpJBgF5qtKfd3vB0OJQzaKQ4U4QmmXs7Xd/kXxq0gpoXRB
X-Google-Smtp-Source: AGHT+IGqqOqsTSPcWgQV4jLT936S0ONRkDDewtVhNKz5ktqCbOdOUDDE9Do0v5uRP1PGPcfc7HLJHg==
X-Received: by 2002:a17:903:35cc:b0:1fa:a89:fd1a with SMTP id d9443c01a7336-2050c372578mr60470225ad.10.1724990315829;
        Thu, 29 Aug 2024 20:58:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/8] mpv: Upgrade to 0.38.0 release
Date: Thu, 29 Aug 2024 20:58:24 -0700
Message-ID: <20240830035827.406391-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830035827.406391-1-raj.khem@gmail.com>
References: <20240830035827.406391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112044

https://github.com/mpv-player/mpv/releases

migrate to using meson build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-emitting-absolute-filepaths-into-g.patch | 33 ++++++++
 .../mplayer/{mpv_0.35.1.bb => mpv_0.38.0.bb}  | 79 ++++++++-----------
 2 files changed, 68 insertions(+), 44 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.35.1.bb => mpv_0.38.0.bb} (51%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch
new file mode 100644
index 0000000000..b96ec5d4c4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch
@@ -0,0 +1,33 @@
+From 9878681df9919d28da3e4c6cc706e264abd9df92 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2024 17:54:15 -0700
+Subject: [PATCH] file2string: Avoid emitting absolute filepaths into generated
+ sources
+
+These sources are bundled into src packages to be distributed and leaking
+buildpaths results in violating reproducibility norms.
+
+Upstream-Status: Submitted [https://github.com/mpv-player/mpv/pull/14763]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ TOOLS/file2string.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/TOOLS/file2string.py b/TOOLS/file2string.py
+index 5b1c4a95d1..39c1122a35 100755
+--- a/TOOLS/file2string.py
++++ b/TOOLS/file2string.py
+@@ -22,10 +22,10 @@
+ # License along with mpv.  If not, see <http://www.gnu.org/licenses/>.
+ #
+ 
+-import sys
++import os, sys
+ 
+ def file2string(infilename, infile, outfile):
+-    outfile.write("// Generated from %s\n\n" % infilename)
++    outfile.write("// Generated from %s\n\n" % os.path.basename(infilename))
+ 
+     conv = ["\\%03o" % c for c in range(256)]
+     safe_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" \
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
similarity index 51%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
index 0f50a6e8fe..e9384e88d3 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
@@ -9,20 +9,20 @@ DEPENDS = " \
     jpeg \
     libv4l \
     libass \
+    libplacebo \
 "
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV_mpv = "140ec21c89d671d392877a7f3b91d67e7d7b9239"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.35;protocol=https \
-           https://waf.io/waf-2.0.25;name=waf;subdir=git \
+SRCREV_mpv = "02254b92dd237f03aa0a151c2a68778c4ea848f9"
+SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.38;protocol=https \
+           file://0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patch \
            "
-SRC_URI[waf.sha256sum] = "21199cd220ccf60434133e1fd2ab8c8e5217c3799199c82722543970dc8e38d5"
 
 S = "${WORKDIR}/git"
 
-inherit waf pkgconfig mime-xdg
+inherit meson pkgconfig mime-xdg
 
 LDFLAGS:append:riscv64 = " -latomic"
 
@@ -42,59 +42,55 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
 
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
-PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
-PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgbm"
-PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
-PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
-PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
-PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
-PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland wayland-native libxkbcommon"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=diabled,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
+PACKAGECONFIG[xv] = "-Dxv=enabled,-Dxv=disabled,libxv"
+PACKAGECONFIG[opengl] = "-Dgl=enabled,-Dgl=disabled,virtual/libgl"
+PACKAGECONFIG[egl] = "-Degl=enabled,-Degl-disabled,virtual/egl"
+PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,libdrm"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/libgbm"
+PACKAGECONFIG[lua] = "-Dlua=luajit,-Dlua=disabled,lua luajit"
+PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
+PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
+PACKAGECONFIG[vaapi] = "-Dvaapi=enabled,-Dvaapi=disabled,libva"
+PACKAGECONFIG[vdpau] = "-Dvdpau=enabled,-Dvdpau=disabled,libvdpau"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland wayland-native libxkbcommon"
 
 python __anonymous() {
     packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
     extras = []
     if "x11" in packageconfig and "opengl" in packageconfig:
-        extras.append(" --enable-gl-x11")
+        extras.append(" -Dgl-x11=enabled")
     if "x11" in packageconfig and "egl" in packageconfig:
-        extras.append(" --enable-egl-x11")
+        extras.append(" -Degl-x11=enabled")
     if "egl" in packageconfig and "drm" in packageconfig:
-        extras.append(" --enable-egl-drm")
+        extras.append(" -Degl-drm=enabled")
     if "vaapi" in packageconfig and "x11" in packageconfig:
-        extras.append(" --enable-vaapi-x11")
+        extras.append(" -Dvaapi-x11=enabled")
     if "vaapi" in packageconfig and "drm" in packageconfig:
-        extras.append(" --enable-vaapi-drm")
+        extras.append(" -Dvaapi-drm=enabled")
     if "vaapi" in packageconfig and "x11" in packageconfig and "egl" in packageconfig:
-        extras.append(" --enable-vaapi-x-egl")
+        extras.append(" -Dvaapi-x-egl=enabled")
     if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" in packageconfig:
-        extras.append(" --enable-vdpau-gl-x11")
+        extras.append(" -Dvdpau-gl-x11=enabled")
     if "wayland" in packageconfig and "opengl" in packageconfig:
-        extras.append(" --enable-gl-wayland")
+        extras.append(" -Dgl-wayland=enabled")
     if "wayland" in packageconfig and "vaapi" in packageconfig:
-        extras.append(" --enable-vaapi-wayland")
+        extras.append(" -Dvaapi-wayland=enabled")
     if extras:
         d.appendVar("EXTRA_OECONF", "".join(extras))
 }
 
-SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
+#SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
 
 EXTRA_OECONF = " \
-    --prefix=${prefix} \
-    --target=${SIMPLE_TARGET_SYS} \
-    --confdir=${sysconfdir} \
-    --datadir=${datadir} \
-    --disable-manpage-build \
-    --disable-libbluray \
-    --disable-dvdnav \
-    --disable-cdda \
-    --disable-uchardet \
-    --disable-rubberband \
-    --disable-lcms2 \
-    --disable-vapoursynth \
+    -Dmanpage-build=disabled \
+    -Dlibbluray=disabled \
+    -Ddvdnav=disabled \
+    -Dcdda=disabled \
+    -Duchardet=disabled \
+    -Drubberband=disabled \
+    -Dlcms2=disabled \
+    -Dvapoursynth=disabled \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
@@ -102,11 +98,6 @@ do_configure:append() {
     sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
 }
 
-link_waf() {
-    ln -s waf-2.0.25 ${S}/waf
-}
-do_unpack[postfuncs] += "link_waf"
-
 FILES:${PN} += " \
     ${datadir}/icons \
     ${datadir}/zsh \

