Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lrr7I-0001W1-Ce
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2009 12:04:19 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id B9D581893E3; Thu,  9 Apr 2009 12:04:06 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Apr 2009 12:04:06 +0200
Message-Id: <1239271446-6732-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_05,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] bluez4: add less restrictive (and hence less secure) bluetooth dbus config
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
X-List-Received-Date: Thu, 09 Apr 2009 10:04:19 -0000

From: Koen Kooi <koen@openembedded.org>

* this makes bluetooth actually work for non-root users and when using ssh/vnc/etc
* this also overwrites the bluetooth.conf in the files/ that wasn't used anymore
* this also includes the fixup commit from .dev named "bluez4: fix dbus service file" 

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/bluez/bluez4_4.31.bb       |    5 ++++-
 recipes/bluez/files/bluetooth.conf |   29 ++++++++++++++++-------------
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/recipes/bluez/bluez4_4.31.bb b/recipes/bluez/bluez4_4.31.bb
index 15e8b00..8c2f656 100644
--- a/recipes/bluez/bluez4_4.31.bb
+++ b/recipes/bluez/bluez4_4.31.bb
@@ -4,12 +4,13 @@ PRIORITY = "optional"
 DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
 HOMEPAGE = "http://www.bluez.org"
 LICENSE = "GPL"
-PR = "r4"
+PR = "r6"
 
 SRC_URI = "\
   http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
   file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
   file://sbc-thumb.patch;patch=1 \
+  file://bluetooth.conf \
 #  file://hid2hci_usb_init.patch;patch=1 \
 "
 S = "${WORKDIR}/bluez-${PV}"
@@ -43,6 +44,8 @@ do_install_append() {
         install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
         install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
         install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+        # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+        install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
 }
 
 PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
diff --git a/recipes/bluez/files/bluetooth.conf b/recipes/bluez/files/bluetooth.conf
index 8720847..ca5e9e4 100644
--- a/recipes/bluez/files/bluetooth.conf
+++ b/recipes/bluez/files/bluetooth.conf
@@ -1,13 +1,16 @@
-#
-# additional cards for /etc/pcmcia/bluetooth.conf
-# Note for OE: This file is _appended_ to the stock
-# bluetooth.conf in bluez-utils, so no need to duplicate
-# entries for individual cards.
-#
-card "CSR BT01x0M Bluetooth CF Card"
-  version "Bluetooth BT0100M", "", ""
-  bind "serial_cs" class "bluetooth"
-
-card "Socket Bluetooth CF Card Rev. G" 
-  manfid 0x0104, 0x0096 
-  bind "serial_cs" class "bluetooth"
+<!-- This configuration file specifies the required security policies
+     for Bluetooth core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- ../system.conf have denied everything, so we just punch some holes -->
+
+  <policy context="default">
+    <allow own="org.bluez"/>
+    <allow send_destination="org.bluez"/>
+    <allow send_interface="org.bluez.Agent"/>
+  </policy>
+
+</busconfig>
-- 
1.5.6.5



