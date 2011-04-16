Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QB49q-0003Mm-0E
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:59:22 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2693953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=iuRz50ZxKuWrOd6CNJRmD+85WkPpiKHyrXZkcmoICMo=;
	b=itr8CmvuVO2o+MKa0IMhhEZ5X6ByUACOm5kX75yBBRyiSJQL1bdJix3JOAPqE68wml
	d8wDrIaylRIVxRqXrdH+6Cdj9kb9OYFct3mRyUyS8DMl5SSc5V4DlewavXTnmvjc2I/f
	eWcVtlp3a0x5pAC8WmIQSG28FVsTITBVo+ovA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=k2EqR3cRQybySnmEsKoH+lnjVnlCWab6UzAV12Jvn+tWJzQ7oMl5mW4sB1vyC7rwF1
	apspRlh8J/MyuRUQ0WbanUsnpk6Vt0tD3NI8Bv1PhOn+DYo9q5WVgiKh5actT3VLvpIe
	CLSqaffC5jkIf7PtTClwoQOaT+syfzm1zOimI=
Received: by 10.223.60.81 with SMTP id o17mr3081111fah.48.1302955025927;
	Sat, 16 Apr 2011 04:57:05 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c21sm1065948fac.46.2011.04.16.04.57.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 04:57:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 13:57:04 +0200
Message-Id: <3a493483b59cfe700400737a38b8147583685de6.1302954782.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302954782.git.Martin.Jansa@gmail.com>
References: <cover.1302954782.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] bluez4: merge .inc file to .bb file itself
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2011 11:59:22 -0000

* .inc file are not so usefull with one version per package rule
* remove unsupported configure options
* fix --enable-pand option, there is not extra 'd'
* remove update-rc.d inherit as init.d script is not created anymore
* enable udevrules by default (distros can override it from their layer)
* use FILESPATH from oe-core layer for patches instead of duplicating them here
* netlink option removed in http://git.kernel.org/?p=bluetooth/bluez.git;a=blobdiff;f=configure.ac;h=63a0fd89f5836ab6d114bb52c49f73adba26369a;hp=eee4c01bd1dd72b53f121c7820b6b93ba3d48032;hb=ecb835fca7e7134f38a3d061d186eb38d83bcb8b;hpb=c681fac492394bb95f164296056068dad1254921
* sbc-thumb.patch was applied upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/bluez/bluez4.inc      |   71 --------------------
 .../bluez/bluez4/bluetooth.conf                    |   16 -----
 .../fix-dfutool-usb-declaration-mismatch.patch     |   13 ----
 .../bluez/bluez4/hid2hci_usb_init.patch            |   33 ---------
 .../bluez/bluez4/sbc-thumb.patch                   |   11 ---
 meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb  |   71 +++++++++++++++++--
 6 files changed, 63 insertions(+), 152 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch

diff --git a/meta-oe/recipes-connectivity/bluez/bluez4.inc b/meta-oe/recipes-connectivity/bluez/bluez4.inc
deleted file mode 100644
index 747ae77..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-DESCRIPTION = "Linux Bluetooth Stack Userland V4"
-HOMEPAGE = "http://www.bluez.org"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPLv2/LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-"
-DEPENDS = "gst-plugins-base alsa-lib virtual/libusb0 dbus-glib"
-INC_PR = "r8"
-
-# temporary solution until bug 5176 is properly fixed
-PROVIDES += "bluez-utils bluez-libs bluez-utils-dbus"
-RPROVIDES_bluez4 += "bluez-utils bluez-libs bluez-utils-dbus"
-RPROVIDES_bluez4-dev = "bluez-libs-dev"
-
-SRC_URI = "\
-  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
-  file://fix-dfutool-usb-declaration-mismatch.patch \
-  file://bluetooth.conf \
-"
-S = "${WORKDIR}/bluez-${PV}"
-
-inherit autotools update-rc.d
-
-EXTRA_OECONF = "\
-  --enable-gstreamer \
-  --enable-alsa \
-  --enable-usb \
-  --enable-netlink \
-  --enable-tools \
-  --enable-bccmd \
-  --enable-hid2hci \
-  --enable-dfutool \
-  --enable-hidd \
-  --enable-pand \
-  --enable-dund \
-  --disable-cups \
-  --enable-test \
-  --enable-manpages \
-  --enable-configfiles \
-  --enable-initscripts \
-  --disable-pcmciarules \
-"
-
-do_install_append() {
-        install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-        install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-        install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
-        # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-        install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-}
-
-INITSCRIPT_NAME = "bluetooth"
-INITSCRIPT_PARAMS = "defaults 23 19"
-
-PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
-
-FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa/bluetooth.conf"
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev"
-FILES_${PN}-dev += "\
-  ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
-  ${libdir}/gstreamer-0.10/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/bluetooth/plugins/.debug \
-  ${libdir}/*/.debug \
-"
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf b/meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
deleted file mode 100644
index ca5e9e4..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-<!-- This configuration file specifies the required security policies
-     for Bluetooth core daemon to work. -->
-
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-
-  <!-- ../system.conf have denied everything, so we just punch some holes -->
-
-  <policy context="default">
-    <allow own="org.bluez"/>
-    <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent"/>
-  </policy>
-
-</busconfig>
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch b/meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
deleted file mode 100644
index b1ee510..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: bluez-4.27/tools/dfutool.c
-===================================================================
---- bluez-4.27.orig/tools/dfutool.c
-+++ bluez-4.27/tools/dfutool.c
-@@ -59,7 +59,7 @@
- #endif
- 
- #ifdef NEED_USB_GET_BUSSES
--static inline struct usb_bus *usb_get_busses(void)
-+inline struct usb_bus *usb_get_busses(void)
- {
- 	return usb_busses;
- }
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch b/meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch
deleted file mode 100644
index ed15fd5..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-# Signed-off-by: Khem Raj <raj.khem@gmail.com>
-#
-# Use the new usb1 API for usb_init() and check for fails from 
-# usb_init (). Currently we see a crash on a system which does
-# not have USB because usb_init() fails and it cleans up all initialized
-# data (e.g. ctx) which is used in subsequent calls to libusb
-# We return immediately if usb_init() fails for some reason.
-
-Index: bluez-4.24/tools/hid2hci.c
-===================================================================
---- bluez-4.24.orig/tools/hid2hci.c	2008-10-25 23:40:34.000000000 -0700
-+++ bluez-4.24/tools/hid2hci.c	2008-12-29 22:06:04.000000000 -0800
-@@ -337,7 +337,7 @@
- int main(int argc, char *argv[])
- {
- 	struct device_info dev[16];
--	int i, opt, num, quiet = 0, mode = HCI;
-+	int i, ret, opt, num, quiet = 0, mode = HCI;
- 
- 	while ((opt = getopt_long(argc, argv, "+01qh", main_options, NULL)) != -1) {
- 		switch (opt) {
-@@ -361,8 +361,9 @@
- 	argc -= optind;
- 	argv += optind;
- 	optind = 0;
--
--	usb_init();
-+	ret = libusb_init();
-+	if (ret < 0)
-+		return ret;
- 
- 	num = find_devices(mode, dev, sizeof(dev) / sizeof(dev[0]));
- 	if (num <= 0) {
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch b/meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch
deleted file mode 100644
index 3505426..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- bluez/sbc/sbc_math.h~	2008-03-05 20:18:03.000000000 +0000
-+++ bluez/sbc/sbc_math.h	2008-10-27 13:39:27.000000000 +0000
-@@ -59,7 +59,7 @@
- 
- #define SBC_FIXED_0(val) { val = 0; }
- #define MUL(a, b)        ((a) * (b))
--#ifdef __arm__
-+#if defined(__arm__) && !defined(__thumb__)
- #define MULA(a, b, res) ({				\
- 		int tmp = res;			\
- 		__asm__(				\
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb
index ebb2dab..8806946 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb
@@ -1,15 +1,70 @@
-require bluez4.inc
+SUMMARY = "Linux Bluetooth Stack Userland V4"
+DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
+HOMEPAGE = "http://www.bluez.org"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
+                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
+                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
+DEPENDS = "gst-plugins-base alsa-lib libusb dbus-glib libnl"
+RDEPENDS_${PN}-dev = "bluez-hcidump"
+
+ASNEEDED = ""
+
+PR = "r9"
+
+# to find bluez patches from oe-core
+FILESPATH =. "${POKYBASE}/meta/recipes-connectivity/bluez/bluez4-4.82/:"
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://fix-dfutool-usb-declaration-mismatch.patch \
+  file://bluetooth.conf \
+"
 
 SRC_URI[md5sum] = "3059b7ef5168c84cd0c6a67034ce79f9"
 SRC_URI[sha256sum] = "11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842a0bbcad8a4eac18d"
+S = "${WORKDIR}/bluez-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+  --enable-gstreamer \
+  --enable-alsa \
+  --enable-usb \
+  --enable-tools \
+  --enable-bccmd \
+  --enable-hid2hci \
+  --enable-dfutool \
+  --enable-hidd \
+  --enable-pand \
+  --enable-dund \
+  --disable-cups \
+  --enable-test \
+  --enable-configfiles \
+"
 
-DEPENDS += "libsndfile1"
+do_install_append() {
+	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+}
 
-PR = "${INC_PR}.0"
+PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
 
-# Not all distros have a recent enough udev
-BTUDEV = " --disable-udevrules"
-BTUDEV_angstrom = " --enable-udevrules"
-BTUDEV_shr = " --enable-udevrules"
+FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
+FILES_${PN}-dev += "\
+  ${libdir}/bluetooth/plugins/*.la \
+  ${libdir}/alsa-lib/*.la \
+  ${libdir}/gstreamer-0.10/*.la \
+"
 
-EXTRA_OECONF += "${BTUDEV}"
+FILES_${PN}-dbg += "\
+  ${libdir}/bluetooth/plugins/.debug \
+  ${libdir}/*/.debug \
+"
-- 
1.7.5.rc1



