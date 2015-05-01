Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id EA90273DB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 May 2015 10:16:47 +0000 (UTC)
Received: by wizk4 with SMTP id k4so48503051wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kRzEHdvfT1jvG8+135G0H8bbYTQMeCawogCaTcarVsg=;
	b=yrVis+RLdiV3E2YKepZsuwqb54ru1v4VXmiDvUty//rIY0YyPMsT1STHaYiSOb7Cc3
	VexL94ZzQXbSrvQpm9rIaCwmkOs55nI9TE1LNvxRWmhGjlkVQr8Uj5T48KM7DQZNeWya
	6ob+Z1KMo5lV2Ksd3hOOLHBDw9WrBwhH3J131IlT2SZXebA4y92y3/Fb90Jz0wy2I4cg
	ym9DaKfNJocR3iMUVCCCH1oguWGXh0ZcpNuonrkOMlkQOz2wsc6ajTlMWpmXntX4mDgO
	oGgTMHHTrz3I5n4n6EwUhW+qWmcNgqEC2GNyR5Ah98h61syHbFzd91BqG7slTyDaiCf0
	mIjA==
X-Received: by 10.194.190.49 with SMTP id gn17mr17102295wjc.11.1430475408681; 
	Fri, 01 May 2015 03:16:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l3sm7048871wjy.3.2015.05.01.03.16.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 May 2015 03:16:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 May 2015 12:17:01 +0200
Message-Id: <1430475421-31701-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][RFC][PATCH] *obex*, foxtrotgps, gypsy, bluez-hcidump, bluez4, gst-plugin-bluetooth, gnome-bluetooth: blacklist bluez4 only recipes when bluez5 is in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 01 May 2015 10:16:52 -0000

---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                 | 1 +
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 2 ++
 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb            | 2 ++
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb                 | 4 +++-
 meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb   | 2 ++
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb        | 2 ++
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb                  | 2 ++
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb          | 2 ++
 meta-oe/recipes-navigation/gypsy/gypsy.inc                         | 2 ++
 9 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index f28f77b..6058b04 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -6,6 +6,7 @@ RCONFLICTS_${PN} = "bluez5"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
+PNBLACKLIST[obexd] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
            file://ssize_t_definition.patch \
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 8711b8a..9a63b38 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -9,6 +9,8 @@ PR = "r1"
 SECTION = "x11/gnome"
 DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
 
+PNBLACKLIST[gnome-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 inherit gnomebase gtk-icon-cache
 
 SRC_URI += " \
diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
index 3950630..3a15d64 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
 PR = "r1"
 
+PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
 "
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
index 96ce0f6..e97b22e 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,5 +1,7 @@
 require bluez4.inc
 
+PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 PR = "r11"
 
 SRC_URI += "file://bluetooth.conf \
@@ -47,4 +49,4 @@ FILES_${PN}-dbg += "\
 "
 
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
-SYSTEMD_AUTO_ENABLE = "disable"
\ No newline at end of file
+SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
index 6a16520..822aec4 100644
--- a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
@@ -1,6 +1,8 @@
 require bluez4.inc
 require recipes-multimedia/gstreamer/gst-plugins-package.inc
 
+PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 PR = "r1"
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index afe6106..99448d0 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "gtk+ bluez4 dbus-glib imagemagick openobex"
 RCONFLICTS_${PN} = "bluez5"
 
+PNBLACKLIST[obex-data-server] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index b07779d..ed3d6b2 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
 
+PNBLACKLIST[openobex] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch \
            file://libusb_crosscompile_check.patch \
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index def3451..d91cbcb 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -6,6 +6,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4 intltool-native"
 
+PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
 SRC_URI[sha256sum] = "ae9706285510554cc0813ac92522e0d1672b0ddb065307bfacfcff3c328f6adb"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 7c93d0a..9efd356 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -8,6 +8,8 @@ LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "console/network"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
 
+PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+
 inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"
 
-- 
2.3.5


