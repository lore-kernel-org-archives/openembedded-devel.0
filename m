Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 177957E600
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:27:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Stl91BJXz4h
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 18:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560875221;
	bh=5IlK5RcUEw0TibWSj28nJJWx59wW2vPS478kQ7zQ9Pc=;
	h=From:To:Subject:Date:From;
	b=PALVzjB1yHgpNgzTqj42tyA4wne7Gm/pPu/lBGoX2KXvoxdspAwRktbmtRW6PdXCe
	angCWFnY7Q+gHSVmrmfSxwbcwiqp2X2yPKwXP5Ca2MTiAVBfsXE04AzmOoWGiT6dxt
	iSP6cBBiqVw6VOmjwDF9uR0ABjTxwKerW/g2+J+7UG0xXu3Nbn/0jGN3hF6udgcEdB
	AKGjLnEWKCmZ/Rpv9xXWP+5KGnSar5BTsDN+sL1gphbT2r8p8bDt4e1xFBOttRY0co
	aS4pIptN2moKiP5zPOGHdiF13AlfeL53ChLqKPlugyY5vFolQ+6cgjZ1XQZnhFm5RY
	PdBajwkbPT121CEcxjATUPo4kZc7Rpt9pHDI3Pm8PUiiXcwh9p4wRy/TDjHGQoHvyx
	dYjSrJenKNP70Bfm6KgYbERO+M3oEwmuu9b9L7313bVRGkLGTlra5alZt4wCsbX9V4
	+jFHHVqURaGNA7lXkwKc90p8O2LWO1mDj5LJ5FLn1+vm3Z/6W0MtBZZZqk9+Wzvgsk
	ICCDYg8MVcSDdd7bL7UBdPs0s1yg2pI1qfpOeEQ4hGL3XdhNgVsgFkHgbYSyGU8ByP
	uhn8ku7MvKlw+UkJ/xT8R9qZjMYxEHxJ2MHu23OFTJLIlhVrTF3UI97iaQctHxfHwy
	GjXgxvp0uh6kmiKuVi9mCERU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 19:27:02 +0300
Message-Id: <20190618162702.3533-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] network-manager-applet: Remove obsolete dbus-glib and libnm-glib dependencies
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
X-List-Received-Date: Tue, 18 Jun 2019 16:27:01 -0000

network-manager-applet stopped using dbus-glib 3 years ago.

Building of the obsolete libnm-gtk is disabled by default in 1.8.20.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../network-manager-applet/network-manager-applet_1.8.20.bb  | 5 ++---
 .../networkmanager/networkmanager_%.bbappend                 | 3 ---
 2 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
index 7181f5ecf..80aafc870 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
@@ -2,7 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
+DEPENDS = "gtk+3 libnotify libsecret networkmanager \
            gconf libgnome-keyring iso-codes nss \
            intltool-native \
 "
@@ -34,14 +34,13 @@ do_configure_append() {
 GI_DATA_ENABLED_libc-musl = "False"
 
 do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs:${B}/src/libnm-gtk/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs"
 }
 
 RDEPENDS_${PN} =+ "networkmanager"
 
 FILES_${PN} += " \
     ${datadir}/nm-applet/ \
-    ${datadir}/libnm-gtk/wifi.ui \
     ${datadir}/libnma/wifi.ui \
     ${datadir}/metainfo \
 "
diff --git a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend b/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
deleted file mode 100644
index 1abb5bbcd..000000000
--- a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# networkmanager-applet requires glib support
-PACKAGECONFIG_append = " glib"
-
-- 
2.17.1


