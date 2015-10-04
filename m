Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1D711757AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Oct 2015 09:09:16 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so82517656wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2015 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jksYNtAhJ7ALSFqQlJdIhzmDely8ybEOoPL7ZLhGIAs=;
	b=CSNfFdA/KweZPhRU49kgPEAgdln5RKGKMb/VGR5inVIFP9WZobYHDCKpFnxd4sFp4W
	b3qD+1tTtuAVJ5j6715XYMg1MgbxFp5qsfzCVvufPbL64Vf/iuI4TpAd+Nig+FLAlr7S
	gxKA1sOkdRPrezeUiAu8/afojxuU4fhmHjE5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=jksYNtAhJ7ALSFqQlJdIhzmDely8ybEOoPL7ZLhGIAs=;
	b=E1wXM2d5ZMEyaqjna1KcXksfE5pVy0MTLoFy/8bZxLkFwFwxW/c5ZWweiD9CkCKxWd
	QmitlrNk9+JWyMR0HktYzpVIZa0o30gFdZLd8wZJm0I90+YhXAKknSBPDX1xWNpJRfUb
	+AyvZtsBNaNhJezyKvTWKFWvqQuFc8trHe62Ibyv9rymZLB6MZ9E0zqj9tmHqF+UgRb2
	JrS7GH8Kh1GozWuHqcJyuHOzH7OLdwrsKKLJ95c+FDLUT+qlMcAG8EwloGViz9LOxXM3
	DULVB5Qs/4dmT1hGyj87lJ4LjZs48i1jRz+6G025OnNYGw39mFZBDs9+ujSXH7uFPj9D
	56Pw==
X-Gm-Message-State: ALoCoQnuSSi3hcbGqPsvj5Y1QfufWwCEwxMtVQttpjSQXOGubtHlSHo3Ue4RCtOLd8Wh3+p3G19/
X-Received: by 10.180.106.4 with SMTP id gq4mr6265372wib.53.1443949756544;
	Sun, 04 Oct 2015 02:09:16 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id jf3sm8293899wic.8.2015.10.04.02.09.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Oct 2015 02:09:15 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Oct 2015 11:13:42 +0200
Message-Id: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Oct 2015 09:09:20 -0000

We make the "freerdp" recipe active again, fix the build
by pulling a more recent version (the "stable" branches are
buggy and useless), and fix ARM runtime with -fPIC.

We can then :
- make X11 non-mandatory ;
- add support for Wayland ("wlfreerdp" client) ;
- add support for DirectFB ("dfreerdp" client) ;
- add support for GStreamer 1.0 ;
- make "heavy" features such as pulseaudio, cups...
non-mandatory.

We really want to install the "winpr-makecert" tool to have
TLS, but CMake does not position its RPATH cleanly, so let
us have a custom patch for that until it gets sorted out.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-oe/recipes-support/freerdp/freerdp.inc        | 73 ++++++++++++++++++++++
 .../winpr-makecert-Build-with-install-RPATH.patch  | 31 +++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     | 21 +++++++
 .../recipes-support/nonworking/freerdp/freerdp.inc | 51 ---------------
 .../nonworking/freerdp/freerdp_git.bb              | 16 -----
 5 files changed, 125 insertions(+), 67 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb
 delete mode 100644 meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
 delete mode 100644 meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
new file mode 100644
index 0000000..af93e83
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -0,0 +1,73 @@
+# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license
+
+DESCRIPTION = "FreeRDP RDP client & server library"
+HOMEPAGE = "http://www.freerdp.com"
+DEPENDS = "openssl alsa-lib pcsc-lite"
+SECTION = "net"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+EXTRA_OECMAKE += "-DWITH_ALSA=ON \
+                  -DWITH_PCSC=ON \
+                  -DWITH_FFMPEG=OFF \
+                  -DWITH_CUNIT=OFF \
+                 "
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
diff --git a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
new file mode 100644
index 0000000..d279d6d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
@@ -0,0 +1,31 @@
+From 253eafc8c8da83fc2b1a99a9e43824efc6105c7a Mon Sep 17 00:00:00 2001
+From: Manuel Bachmann <manuel.bachmann@iot.bzh>
+Date: Sun, 4 Oct 2015 10:44:49 +0200
+Subject: [PATCH] winpr-makecert: Build with install RPATH
+
+As we are installing "winpr-makecert" manually, we do want
+to refer to the library in DESTDIR, not the one resting in
+the build tree.
+
+Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
+---
+ winpr/tools/makecert/cli/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/winpr/tools/makecert/cli/CMakeLists.txt b/winpr/tools/makecert/cli/CMakeLists.txt
+index 17954c4..90c446b 100644
+--- a/winpr/tools/makecert/cli/CMakeLists.txt
++++ b/winpr/tools/makecert/cli/CMakeLists.txt
+@@ -45,5 +45,9 @@ set(${MODULE_PREFIX}_LIBS winpr-makecert-tool)
+ 
+ target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS})
+ 
++set_target_properties(${MODULE_NAME} PROPERTIES 
++	BUILD_WITH_INSTALL_RPATH 1)
++
+ set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
+ 
++
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
new file mode 100644
index 0000000..f9cb9a6
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
+# Released under the MIT license
+
+include freerdp.inc
+
+inherit gitpkgv
+
+PV = "1.2.5+gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+
+EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
+                  -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
+                  -DWITH_MANPAGES=OFF \
+                 "
+
+SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
+           file://winpr-makecert-Build-with-install-RPATH.patch \
+          "
+
+S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc b/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
deleted file mode 100644
index 34dac4b..0000000
--- a/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license
-
-DESCRIPTION = "FreeRDP RDP client"
-HOMEPAGE = "http://www.freerdp.com"
-DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite libxkbfile libxinerama"
-SECTION = "x11/network"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-inherit pkgconfig cmake
-
-EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
-                  -DWITH_PCSC=ON \
-                  -DWITH_CUPS=ON \
-                  -DWITH_FFMPEG=OFF \
-                  -DWITH_CUNIT=OFF \
-                  -DWITH_X11=ON \
-                  -DWITH_XKBFILE=ON \
-                  -DWITH_XINERAMA=ON"
-
-PACKAGES =+ "libfreerdp"
-
-LEAD_SONAME = "libfreerdp.so"
-FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
-
-PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
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
diff --git a/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb b/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb
deleted file mode 100644
index 0e9bf06..0000000
--- a/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
-# Released under the MIT license
-
-include freerdp.inc
-
-inherit gitpkgv
-
-PV = "1.0.2+gitr${SRCPV}"
-PKGV = "${GITPKGVTAG}"
-
-EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
-
-SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
-
-S = "${WORKDIR}/git"
-- 
1.8.3.1


