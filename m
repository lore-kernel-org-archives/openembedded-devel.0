Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Ltetq-0003I2-Ew
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 11:26:17 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 5F2FF189358; Tue, 14 Apr 2009 11:25:30 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 11:25:15 +0200
Message-Id: <1239701117-7033-3-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1239701117-7033-2-git-send-email-k.kooi@student.utwente.nl>
References: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>
	<1239701117-7033-2-git-send-email-k.kooi@student.utwente.nl>
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][STABLE][PATCH 2/4] bluez + obex: sync with .dev
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
X-List-Received-Date: Tue, 14 Apr 2009 09:26:20 -0000

From: Koen Kooi <koen@openembedded.org>

---
 recipes/bluez/bluez4_4.35.bb                       |   66 ++++++++++++++++++++
 recipes/bluez/obexd_0.10.bb                        |   10 +++
 recipes/openobex/obex-data-server_0.4.4.bb         |   11 +++
 .../openobex-1.5/libusb_crosscompile_check.patch   |   11 +++
 recipes/openobex/openobex_1.5.bb                   |   22 +++++++
 5 files changed, 120 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.35.bb
 create mode 100644 recipes/bluez/obexd_0.10.bb
 create mode 100644 recipes/openobex/obex-data-server_0.4.4.bb
 create mode 100644 recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch
 create mode 100644 recipes/openobex/openobex_1.5.bb

diff --git a/recipes/bluez/bluez4_4.35.bb b/recipes/bluez/bluez4_4.35.bb
new file mode 100644
index 0000000..fec1411
--- /dev/null
+++ b/recipes/bluez/bluez4_4.35.bb
@@ -0,0 +1,66 @@
+DESCRIPTION = "Linux Bluetooth Stack Userland V4"
+SECTION = "libs"
+PRIORITY = "optional"
+DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
+HOMEPAGE = "http://www.bluez.org"
+LICENSE = "GPL"
+
+# For angstrom we want this to replace at least bluez-libs
+PROVIDES_append_angstrom = " bluez-libs"
+
+PR = "r1"
+
+SRC_URI = "\
+  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
+  file://sbc-thumb.patch;patch=1 \
+  file://bluetooth.conf \
+"
+S = "${WORKDIR}/bluez-${PV}"
+
+inherit autotools_stage
+AUTOTOOLS_STAGE_PKGCONFIG = "1"
+
+EXTRA_OECONF = "\
+  --enable-gstreamer \
+  --enable-alsa \
+  --enable-usb \
+  --enable-netlink \
+  --enable-tools \
+  --enable-bccmd \
+  --enable-hid2hci \
+  --enable-dfutool \
+  --enable-hidd \
+  --enable-pandd \
+  --enable-dund \
+  --disable-cups \
+  --enable-test \
+  --enable-manpages \
+  --enable-configfiles \
+  --enable-initscripts \
+  --disable-pcmciarules \
+"
+
+do_install_append() {
+        install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+        install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
+        install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+        # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+        install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+}
+
+PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
+
+FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
+FILES_${PN}-dev += "\
+  ${libdir}/bluetooth/plugins/*.la \
+  ${libdir}/alsa-lib/*.la \
+  ${libdir}/gstreamer-0.10/*.la \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/bluetooth/plugins/.debug \
+  ${libdir}/*/.debug \
+"
diff --git a/recipes/bluez/obexd_0.10.bb b/recipes/bluez/obexd_0.10.bb
new file mode 100644
index 0000000..e1cc6ce
--- /dev/null
+++ b/recipes/bluez/obexd_0.10.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "OBEX Server and Client"
+DEPENDS = "openobex glib-2.0 dbus bluez4"
+
+LICENSE = "GPLv2"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
+
+inherit autotools_stage
+
+FILES_${PN} += "${datadir}/dbus-1/"
diff --git a/recipes/openobex/obex-data-server_0.4.4.bb b/recipes/openobex/obex-data-server_0.4.4.bb
new file mode 100644
index 0000000..34efcc7
--- /dev/null
+++ b/recipes/openobex/obex-data-server_0.4.4.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "obex-data-server is a D-Bus service providing high-level OBEX client and server side functionality"
+LICENSE = "GPLv2"
+
+DEPENDS = "bluez4 dbus-glib openobex"
+
+SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
+
+inherit autotools
+
+FILES_${PN} += "${datadir}/dbus-1/"
+
diff --git a/recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch b/recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch
new file mode 100644
index 0000000..1177dfe
--- /dev/null
+++ b/recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch
@@ -0,0 +1,11 @@
+--- /tmp/acinclude.m4	2009-04-12 10:32:15.000000000 +0200
++++ openobex-1.5/acinclude.m4	2009-04-12 10:32:38.000000000 +0200
+@@ -158,7 +158,7 @@
+ 		;;
+ 	*)
+ 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
+-		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
++		REQUIRES="libusb"
+ 		;;
+ 	esac
+ 	AC_SUBST(USB_CFLAGS)
diff --git a/recipes/openobex/openobex_1.5.bb b/recipes/openobex/openobex_1.5.bb
new file mode 100644
index 0000000..ab69cf1
--- /dev/null
+++ b/recipes/openobex/openobex_1.5.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "The Openobex project is an open source implementation of the \
+Object Exchange (OBEX) protocol."
+HOMEPAGE = "http://openobex.triq.net"
+SECTION = "libs"
+PROVIDES = "openobex-apps"
+DEPENDS = "libusb-compat bluez4"
+LICENSE = "GPL"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
+           file://disable-cable-test.patch;patch=1 \
+           file://libusb_crosscompile_check.patch;patch=1"
+
+inherit autotools_stage binconfig pkgconfig
+
+EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \
+                --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
+
+PACKAGES += "openobex-apps"
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${bindir}/openobex-config"
+FILES_${PN}-apps = "${bindir}/*"
+DEBIAN_NOAUTONAME_${PN}-apps = "1"
-- 
1.6.1



