Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5272A60125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:38:20 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so14456858wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=F+ZIYxwms2BJ75Y+uGrQAOpAy7Vm4Ecn+UlEwyzt2sg=;
	b=Dh4RIzNyYRdk5kwroYUFZ8Wh4lOG6pFBLCoU0NlCrrNEc0JdVZepdwBVKiaSihEDAM
	I7Pz2nWRUVMVfEJkZake/FM071GzoTh4NGgekrpZ1z4RfA6RVbN621z65dCqHoYjDxGG
	5nM1AQ3BJKfyGq+elz5naACB+ps6Byk80RpKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=F+ZIYxwms2BJ75Y+uGrQAOpAy7Vm4Ecn+UlEwyzt2sg=;
	b=kQfxwldE2hVmCGV+KtZAZDRUZTgXZhrgzPJe4c+60I91ayQdlAlz/Ub9ghTwChKlPM
	YXfC0JHgaXqbHxPBEoMFizRGFuxpjGLlxDN5xhYSq1aM5pXuf+rcE3Ps3VMRFqKSwz+m
	PyZv5Ovqf9CaRV5drwE1UwYRZRd6Vjop+6eD+uY3YSKkFsPjFiG1+Se1irDEC2svRCPC
	94jJk1glGiaA853IxvhM6c5Uc1t+Ns11WXNsLeCBGe7msTXHFFZuF392pOjs9uxvBBS6
	lsv20Q7seRIGGGzvHm1IbJe2r+W8h9IAGgynNmBC+kY3+oXdhqTgDCIMKsVY1h9A5dYn
	BV3w==
X-Gm-Message-State: ALoCoQlMQw5W9ao06gm23hklOLojBZ7oHKczaLprlTp6zw28f33xNtCboklzGhMSbRDI69oM8aoj
X-Received: by 10.194.90.47 with SMTP id bt15mr6893812wjb.18.1444293500068;
	Thu, 08 Oct 2015 01:38:20 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	gd10sm10948811wjb.47.2015.10.08.01.38.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 01:38:19 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Oct 2015 10:41:53 +0200
Message-Id: <1444293713-5683-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v3][meta-oe] freerdp: get out of PNBLACKLIST, fix build, improve
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
X-List-Received-Date: Thu, 08 Oct 2015 08:38:21 -0000

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
 meta-oe/recipes-support/freerdp/freerdp.inc        | 38 +++++++++++++++++-----
 .../winpr-makecert-Build-with-install-RPATH.patch  | 31 ++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     | 18 +++++-----
 3 files changed, 70 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 34dac4b..af93e83 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -1,23 +1,38 @@
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
 
@@ -26,6 +41,13 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
 
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


