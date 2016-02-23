Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CDFDC771BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:27:57 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c200so229143781wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2KPl6+lybj6dKSB+k20ROAlUD5PRHwPooWTH4MnU2/E=;
	b=B5Mcw9d4Xkha7Ub+5x4vOUjNTqwtwgBCFIfP7c2CI42ANYiqV93R84ZJ9uF3mC04Ta
	T8sYYK2963OgzrlZlK58i+eL1mYwL3y4BJj2oeRNOYFBQEl0sslpgruWHZGzO4FfSiFz
	Lz2r0fg0Nak7tHWR39b2RBzwIWOqmkV2IP+udSwfRabffKpeQVX5I/mf0r2ugLluAYuo
	6RPhM8KpgFd9xsTOT4kNiO5CnwogfsSBXsRDTCFfLntrljMdR3rnl2lyRJ4BzMGLC8F2
	gyqij097hEn8hC3CTlKr+8+bgs7rH4K4nZaefItVJAPnMmqfXnS/q86YU8LgWRNDApx1
	YGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2KPl6+lybj6dKSB+k20ROAlUD5PRHwPooWTH4MnU2/E=;
	b=F6HgZKqI6gGbkTSwS2EShWm3IbLUlDHtcXObD8fWc5nUHFa2xIJuSqHY1HIZKnZ3bD
	JCFGvWkk2Uxxg6/LUwh53oGDy/kmhgN9Is0z0+waSz4RqChLYV9jOcYnjQ//VBUwortd
	D3MYyiojjAV0oy52M/IIcL06zf78lvCGehGzKJD/hWsiaKU8p8scm90rMVOJN79Bggdh
	hO25PsaGPMSuk48hBNkbvIT9huFwmt2ePmoNjXiMGBRvhudxvGbmMYBF3BRN6DECdZ4y
	ElpfXWVLsJxKCCTOg5XpjMhXFz+MHp/xpkRzJ/L+UwmuLVrJy3fcGd2IHiQxRBBkH5IG
	dtHw==
X-Gm-Message-State: AG10YOQH2FDRa5hwDQ9KWvk2kNjrwRaQ5VKrnZ0nFEaK1HRwx5IWXgmNcB3t+680sr+sGA==
X-Received: by 10.194.77.167 with SMTP id t7mr33515824wjw.90.1456244878457;
	Tue, 23 Feb 2016 08:27:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ko2sm30493565wjc.9.2016.02.23.08.27.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 08:27:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 17:28:55 +0100
Message-Id: <1456244935-5288-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] freerdp: fold .inc into .bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2016 16:27:58 -0000

* currently it's broken again
  ERROR: freerdp-1.2.5+gitrAUTOINC+62da9d28c6-r0 do_package: QA Issue: freerdp: Files/directories were installed but not shipped in any package:
    /usr/bin
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  freerdp: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    | 74 -----------------------
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 83 +++++++++++++++++++++++---
 2 files changed, 75 insertions(+), 82 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
deleted file mode 100644
index 2937bc5..0000000
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ /dev/null
@@ -1,74 +0,0 @@
-# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license
-
-DESCRIPTION = "FreeRDP RDP client & server library"
-HOMEPAGE = "http://www.freerdp.com"
-DEPENDS = "openssl alsa-lib pcsc-lite"
-SECTION = "net"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-inherit pkgconfig cmake
-
-EXTRA_OECMAKE += "-DWITH_ALSA=ON \
-                  -DWITH_PCSC=ON \
-                  -DWITH_FFMPEG=OFF \
-                  -DWITH_CUNIT=OFF \
-                  -DWITH_NEON=OFF \
-                 "
-
-PACKAGECONFIG ??= "  \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}\
-                gstreamer cups \
-                "
-
-X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
-PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
-PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland"
-PACKAGECONFIG[directfb] = "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
-PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
-PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
-PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
-
-PACKAGES =+ "libfreerdp"
-
-LEAD_SONAME = "libfreerdp.so"
-FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
-
-PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
-
-# we will need winpr-makecert to generate TLS certificates
-do_install_append () {
-    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
-    rm -rf ${D}/${libdir}/cmake
-    rm -rf ${D}/${libdir}/freerdp
-}
-
-python populate_packages_prepend () {
-    freerdp_root = d.expand('${libdir}/freerdp')
-
-    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='libfreerdp-plugin-audin')
-
-    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
-
-    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
-
-    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='')
-}
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 13dff6e..c749b0c 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -1,18 +1,18 @@
-# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
+# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license
 
-include freerdp.inc
+DESCRIPTION = "FreeRDP RDP client & server library"
+HOMEPAGE = "http://www.freerdp.com"
+DEPENDS = "openssl alsa-lib pcsc-lite"
+SECTION = "net"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit gitpkgv
+inherit pkgconfig cmake gitpkgv
 
 PV = "1.2.5+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 
-EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
-                  -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
-                  -DWITH_MANPAGES=OFF \
-                 "
-
 SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
     file://winpr-makecert-Build-with-install-RPATH.patch \
@@ -20,3 +20,70 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
 "
 
 S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += " \
+    -DWITH_ALSA=ON \
+    -DWITH_PCSC=ON \
+    -DWITH_FFMPEG=OFF \
+    -DWITH_CUNIT=OFF \
+    -DWITH_NEON=OFF \
+    -DBUILD_STATIC_LIBS=OFF \
+    -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
+    -DWITH_MANPAGES=OFF \
+"
+
+PACKAGECONFIG ??= "  \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
+                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
+                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}\
+                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}\
+                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}\
+                gstreamer cups \
+                "
+
+X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
+PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
+PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland"
+PACKAGECONFIG[directfb] = "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
+PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
+PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
+
+PACKAGES =+ "libfreerdp"
+
+LEAD_SONAME = "libfreerdp.so"
+FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
+
+PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
+
+# we will need winpr-makecert to generate TLS certificates
+do_install_append () {
+    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
+    rm -rf ${D}/${libdir}/cmake
+    rm -rf ${D}/${libdir}/freerdp
+}
+
+python populate_packages_prepend () {
+    freerdp_root = d.expand('${libdir}/freerdp')
+
+    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-audin')
+
+    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
+
+    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
+
+    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='')
+}
-- 
2.7.1


