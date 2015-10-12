Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2534C75BC5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 14:09:35 +0000 (UTC)
Received: by wijq8 with SMTP id q8so59838614wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2NWovcv61MIL4w/BMh0JYF4ALzPoX5UitrJs6eJb81A=;
	b=aD3JmlPcx/NdZm3E2nVho2QmvdL+g/V8wpX/e/iVhQcJAZ7Dv4IsFKgwECx/rS49sY
	Fdp7VEYHDocgvjtXqRZQvYL8MBcz3QhXNrDnl2FWHTtRDqp7Ki+eYui2dpiiBUoT9+zm
	NDaKUQAwk1BX+fxVEewTjvTeHhTa/GFoU45Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=2NWovcv61MIL4w/BMh0JYF4ALzPoX5UitrJs6eJb81A=;
	b=ixG4HwmvMB0inEibRIolbgnvE0Vm0rUhdrJo5lOgDrkBem7NQayQtr4ey4rnb+Lq6A
	X+89IB8L/Np8bgQOJfNqlaeyOK7Zq8tDSQf3vKH6TQrgyS14Z8g3UmuduDXphTRACUVj
	Dnr/60MsvdnORZb7+PWsBPb+Ks9HESNMNB8enNY5ZGRs0GWY2Mg1eVCEtRrs0h6/MwD7
	CaFwSfBHGcDv+x5sUoco3EKX33WXklcR3fQ7va/pUIoJngYWLTW9AbxGr2YJBzQbqYzm
	2jSyypiUxzRRWPy1dv0p8sYlYov5HutWst7Py1/vDe9aficqcKeGIne5j/4ebwtDZitr
	S6/A==
X-Gm-Message-State: ALoCoQk0BiDcY3v4rRCGDFlRf5K0+61nqGQsFEbl9ihtdF8Fxj74+gBCTltUVvklomMRyf0koTnd
X-Received: by 10.194.22.69 with SMTP id b5mr29545596wjf.157.1444658975541;
	Mon, 12 Oct 2015 07:09:35 -0700 (PDT)
Received: from centos7.vannes.iot ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	wt4sm11163884wjb.29.2015.10.12.07.09.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 07:09:34 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2015 16:09:01 +0200
Message-Id: <1444658941-16418-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v4][meta-oe] freerdp: get out of PNBLACKLIST, fix build, improve
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
X-List-Received-Date: Mon, 12 Oct 2015 14:09:36 -0000

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
 meta-oe/recipes-support/freerdp/freerdp.inc        | 39 +++++++++++++++++-----
 .../winpr-makecert-Build-with-install-RPATH.patch  | 31 +++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     | 18 +++++-----
 3 files changed, 71 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 34dac4b..2937bc5 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -1,23 +1,39 @@
 # Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license
 
-DESCRIPTION = "FreeRDP RDP client"
+DESCRIPTION = "FreeRDP RDP client & server library"
 HOMEPAGE = "http://www.freerdp.com"
-DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite libxkbfile libxinerama"
-SECTION = "x11/network"
+DEPENDS = "openssl alsa-lib pcsc-lite"
+SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pkgconfig cmake
 
-EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
+EXTRA_OECMAKE += "-DWITH_ALSA=ON \
                   -DWITH_PCSC=ON \
-                  -DWITH_CUPS=ON \
                   -DWITH_FFMPEG=OFF \
                   -DWITH_CUNIT=OFF \
-                  -DWITH_X11=ON \
-                  -DWITH_XKBFILE=ON \
-                  -DWITH_XINERAMA=ON"
+                  -DWITH_NEON=OFF \
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
 
 PACKAGES =+ "libfreerdp"
 
@@ -26,6 +42,13 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
 
 PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
+# we will need winpr-makecert to generate TLS certificates
+do_install_append () {
+    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
+    rm -rf ${D}/${libdir}/cmake
+    rm -rf ${D}/${libdir}/freerdp
+}
+
 python populate_packages_prepend () {
     freerdp_root = d.expand('${libdir}/freerdp')
 
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
index fd7f74c..f9cb9a6 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -5,17 +5,17 @@ include freerdp.inc
 
 inherit gitpkgv
 
-PV = "1.0.2+gitr${SRCPV}"
+PV = "1.2.5+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 
-EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
+EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
+                  -DCMAKE_POSITION_INDEPENDANT_CODE=ON \
+                  -DWITH_MANPAGES=OFF \
+                 "
 
-SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
+SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
+           file://winpr-makecert-Build-with-install-RPATH.patch \
+          "
 
 S = "${WORKDIR}/git"
-
-PNBLACKLIST[freerdp] ?= "Installs into double prefix, causing all files installed in /usr/usr and empty packages"
-# freerdp-1.0.2+gitrAUTOINC+f311acaffb: freerdp: Files/directories were installed but not shipped
-#       /usr/usr
-#       ....
-- 
1.8.3.1


