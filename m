Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8864060232
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:31:51 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so14592197wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Iuf5h1Ipl7Frc5w1f4bOwl3gUqPrtFubcHJ8P8YzmDs=;
	b=k4aVMZyM5GSqI1fxxcOdj2iGFPJlo4ARyh6UMuSMOg3keroiX0FRIt+xAT+LTAEiNj
	cVpdI4FYHhwOddMnBqyIzGrpFZIxEZ5srrlnYpzBkKA5NEn/goKtWw2EJPL2Aje1vEhc
	64hMkkxHDdvFCcCG6caFaXg1ZEex/VPzFaTcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Iuf5h1Ipl7Frc5w1f4bOwl3gUqPrtFubcHJ8P8YzmDs=;
	b=l9N3+h1MjUg1ERgRzqPPQlQaVzai2uQLtBD6MsHxTJX5nhd1wdzZJg8fFJePH1EnA2
	3fKPrbxG+42uIkdsywRSv74Rx/TeWz7eR9BQqVNg9UtLyShbK8RhWwexEiH09Qg/YMVX
	ohkBOz5Ndqt7ZYQv4vict5e5qlXIX3eLyhwhdiRUHccUUMmtM9Eb/xFuhXo75TB5hC3D
	U6G3IleV90mBWhMgdI1orOJqUh9gd6YFQ1ZQeKrw4XWq3SRPdVp+33tP2MbbGQ1e5DTP
	p8SxSaxVeg4b1EvmWeKLCOqVBooMHyfzlSDC8lqKGQVdkxolTURIYObM4UY/sZwigVGg
	yKZw==
X-Gm-Message-State: ALoCoQmLzZ6yh5tKX0EPcxuICLHfDizYZutArVdF4d6qVpAD44Svg9XokBlSBKnWn0sH5qe0uCMa
X-Received: by 10.180.107.130 with SMTP id hc2mr2322396wib.92.1444293111222;
	Thu, 08 Oct 2015 01:31:51 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	hk5sm44581961wjb.6.2015.10.08.01.31.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 01:31:50 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Oct 2015 10:35:26 +0200
Message-Id: <1444293326-5535-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [PATCH v2][meta-oe] freerdp: get out of PNBLACKLIST, fix build, improve
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
X-List-Received-Date: Thu, 08 Oct 2015 08:31:51 -0000

From: Manuel Bachmann <mbc@iot.bzh>

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
 meta-oe/recipes-support/freerdp/freerdp.inc    | 38 ++++++++++++++++++++------
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 18 ++++++------
 2 files changed, 39 insertions(+), 17 deletions(-)

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


