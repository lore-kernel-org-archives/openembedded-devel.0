Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QuRka-00006i-TL
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 18:16:53 +0200
Received: by fxg11 with SMTP id 11so2265272fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WqS3Lg2lmo0PN3vQrm+lQZ+aVU1jRr8xWkuHSZTOhA8=;
	b=S/jUIl+iqHTKI6mg9AT30PKG66wFYwMh9/PuMZAKjhVxYMOj6HB3b0fJsk+Nk/AweJ
	IvEOyVSpf6qlHjpVzOmRIfBYz5uy+bJXkbBFd8uEeK8aVyQfEM1i3s3aal4iwiaYrwny
	AMan1OwM1SK8mKvvj5rTRxzYqpIvHRfaU0Tko=
Received: by 10.223.16.210 with SMTP id p18mr3112339faa.71.1313770332301;
	Fri, 19 Aug 2011 09:12:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b13sm818067fak.40.2011.08.19.09.12.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 09:12:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2011 18:12:02 +0200
Message-Id: <1313770322-22830-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313655217.git.Martin.Jansa@gmail.com>
References: <cover.1313655217.git.Martin.Jansa@gmail.com>
Subject: [PATCH] bluez4: remove from meta-oe, fixed version is now in oe-core
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
X-List-Received-Date: Fri, 19 Aug 2011 16:16:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../bluez/bluez4/bluetooth.conf                    |   16 -----
 .../fix-dfutool-usb-declaration-mismatch.patch     |   20 ------
 meta-oe/recipes-connectivity/bluez/bluez4_4.96.bb  |   69 --------------------
 3 files changed, 0 insertions(+), 105 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.96.bb

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
index 27dead0..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-# bluez4: add compile patch fixing some usb declaration mismatch
-# Author: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-# Date:   Thu Jan 29 16:52:21 2009 +0000
-#
-# Acquired from OpenEmbedded
-Upstream-Status: Pending
-
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
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.96.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.96.bb
deleted file mode 100644
index 211e910..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.96.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-SUMMARY = "Linux Bluetooth Stack Userland V4"
-DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
-HOMEPAGE = "http://www.bluez.org"
-SECTION = "libs"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
-                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib usbpath"
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-
-ASNEEDED = ""
-
-PR = "r0"
-
-SRC_URI = "\
-  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
-  file://fix-dfutool-usb-declaration-mismatch.patch \
-  file://bluetooth.conf \
-"
-
-SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
-SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
-
-S = "${WORKDIR}/bluez-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF = "\
-  --enable-gstreamer \
-  --enable-alsa \
-  --enable-usb \
-  --enable-tools \
-  --enable-bccmd \
-  --enable-hid2hci \
-  --enable-dfutool \
-  --enable-hidd \
-  --enable-pand \
-  --enable-dund \
-  --disable-cups \
-  --enable-test \
-  --enable-configfiles \
-"
-
-do_install_append() {
-	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
-	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-}
-
-PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
-
-FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
-FILES_${PN}-dev += "\
-  ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
-  ${libdir}/gstreamer-0.10/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/bluetooth/plugins/.debug \
-  ${libdir}/*/.debug \
-  ${base_libdir}/udev/.debug \
-"
-- 
1.7.6



