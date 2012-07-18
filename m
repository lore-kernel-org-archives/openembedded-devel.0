Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1SrcYL-0002r3-SP
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 00:17:05 +0200
Received: from gnutoo-laptop.workgroup (79.1.133.74) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 5006060B000A23C5; Thu, 19 Jul 2012 00:00:29 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: martin.jansa@gmail.com
Date: Thu, 19 Jul 2012 00:00:17 +0200
Message-Id: <1342648817-23943-3-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1342648817-23943-1-git-send-email-GNUtoo@no-log.org>
References: <1342648817-23943-1-git-send-email-GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] Add hostapd 1.0 recipe
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
X-List-Received-Date: Wed, 18 Jul 2012 22:17:06 -0000

This recipe was based on the hostap-daemon_0.7.3.bb recipe in openembedded-classic
  at commit c1f52c58deee65c7498a3b3e82b4cc3ae5231b0e

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../hostapd/hostap-daemon-1.0/defconfig            |  145 ++++++++++++++++++++
 .../hostapd/hostap-daemon-1.0/init                 |   37 +++++
 .../hostapd/hostap-daemon_1.0.bb                   |   44 ++++++
 3 files changed, 226 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/init
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb

diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
new file mode 100644
index 0000000..1f3c6f4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
@@ -0,0 +1,145 @@
+# Example hostapd build time configuration
+#
+# This file lists the configuration options that are used when building the
+# hostapd binary. All lines starting with # are ignored. Configuration option
+# lines must be commented out complete, if they are not to be included, i.e.,
+# just setting VARIABLE=n is not disabling that variable.
+#
+# This file is included in Makefile, so variables like CFLAGS and LIBS can also
+# be modified from here. In most cass, these lines should use += in order not
+# to override previous values of the variables.
+
+# Driver interface for Host AP driver
+CONFIG_DRIVER_HOSTAP=y
+
+# Driver interface for wired authenticator
+CONFIG_DRIVER_WIRED=y
+
+# Driver interface for madwifi driver
+#CONFIG_DRIVER_MADWIFI=y
+#CFLAGS += -I../../madwifi # change to the madwifi source directory
+
+# Driver interface for Prism54 driver
+CONFIG_DRIVER_PRISM54=y
+
+# Driver interface for drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL20=y
+# driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
+# shipped with your distribution yet. If that is the case, you need to build
+# newer libnl version and point the hostapd build to use it.
+#LIBNL=/usr/src/libnl
+#CFLAGS += -I$(LIBNL)/include
+#LIBS += -L$(LIBNL)/lib
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+
+# Driver interface for no driver (e.g., RADIUS server only)
+#CONFIG_DRIVER_NONE=y
+
+# IEEE 802.11F/IAPP
+CONFIG_IAPP=y
+
+# WPA2/IEEE 802.11i RSN pre-authentication
+CONFIG_RSN_PREAUTH=y
+
+# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
+CONFIG_PEERKEY=y
+
+# IEEE 802.11w (management frame protection)
+# This version is an experimental implementation based on IEEE 802.11w/D1.0
+# draft and is subject to change since the standard has not yet been finalized.
+# Driver support is also needed for IEEE 802.11w.
+#CONFIG_IEEE80211W=y
+
+# Integrated EAP server
+CONFIG_EAP=y
+
+# EAP-MD5 for the integrated EAP server
+CONFIG_EAP_MD5=y
+
+# EAP-TLS for the integrated EAP server
+CONFIG_EAP_TLS=y
+
+# EAP-MSCHAPv2 for the integrated EAP server
+CONFIG_EAP_MSCHAPV2=y
+
+# EAP-PEAP for the integrated EAP server
+CONFIG_EAP_PEAP=y
+
+# EAP-GTC for the integrated EAP server
+CONFIG_EAP_GTC=y
+
+# EAP-TTLS for the integrated EAP server
+CONFIG_EAP_TTLS=y
+
+# EAP-SIM for the integrated EAP server
+#CONFIG_EAP_SIM=y
+
+# EAP-AKA for the integrated EAP server
+#CONFIG_EAP_AKA=y
+
+# EAP-AKA' for the integrated EAP server
+# This requires CONFIG_EAP_AKA to be enabled, too.
+#CONFIG_EAP_AKA_PRIME=y
+
+# EAP-PAX for the integrated EAP server
+#CONFIG_EAP_PAX=y
+
+# EAP-PSK for the integrated EAP server (this is _not_ needed for WPA-PSK)
+#CONFIG_EAP_PSK=y
+
+# EAP-SAKE for the integrated EAP server
+#CONFIG_EAP_SAKE=y
+
+# EAP-GPSK for the integrated EAP server
+#CONFIG_EAP_GPSK=y
+# Include support for optional SHA256 cipher suite in EAP-GPSK
+#CONFIG_EAP_GPSK_SHA256=y
+
+# EAP-FAST for the integrated EAP server
+# Note: Default OpenSSL package does not include support for all the
+# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
+# the OpenSSL library must be patched (openssl-0.9.9-session-ticket.patch)
+# to add the needed functions.
+#CONFIG_EAP_FAST=y
+
+# Wi-Fi Protected Setup (WPS)
+CONFIG_WPS=y
+# Enable UPnP support for external WPS Registrars
+#CONFIG_WPS_UPNP=y
+
+# EAP-IKEv2
+#CONFIG_EAP_IKEV2=y
+
+# Trusted Network Connect (EAP-TNC)
+#CONFIG_EAP_TNC=y
+
+# PKCS#12 (PFX) support (used to read private key and certificate file from
+# a file that usually has extension .p12 or .pfx)
+CONFIG_PKCS12=y
+
+# RADIUS authentication server. This provides access to the integrated EAP
+# server from external hosts using RADIUS.
+CONFIG_RADIUS_SERVER=y
+
+# Build IPv6 support for RADIUS operations
+CONFIG_IPV6=y
+
+# IEEE Std 802.11r-2008 (Fast BSS Transition)
+#CONFIG_IEEE80211R=y
+
+# Use the hostapd's IEEE 802.11 authentication (ACL), but without
+# the IEEE 802.11 Management capability (e.g., madwifi or FreeBSD/net80211)
+CONFIG_DRIVER_RADIUS_ACL=y
+
+# IEEE 802.11n (High Throughput) support
+CONFIG_IEEE80211N=y
+
+# Remove debugging code that is printing out debug messages to stdout.
+# This can be used to reduce the size of the hostapd considerably if debugging
+# code is not needed.
+#CONFIG_NO_STDOUT_DEBUG=y
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/init b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/init
new file mode 100644
index 0000000..79f74b6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/init
@@ -0,0 +1,37 @@
+#!/bin/sh
+DAEMON=/usr/sbin/hostapd
+NAME=hostapd
+DESC="HOSTAP Daemon"
+ARGS="/etc/hostapd.conf -B"
+
+test -f $DAEMON || exit 0
+
+set -e
+
+case "$1" in
+    start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon -S -x $DAEMON -- $ARGS
+	echo "$NAME."
+	;;
+    stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x $DAEMON
+	echo "$NAME."
+	;;
+    restart)
+	$0 stop
+	$0 start
+	;;
+    reload)
+	echo -n "Reloading $DESC: "
+	killall -HUP $(basename ${DAEMON})
+	echo "$NAME."
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
new file mode 100644
index 0000000..0ae0b70
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
@@ -0,0 +1,44 @@
+HOMEPAGE = "http://hostap.epitest.fi"
+SECTION = "kernel/userland"
+PRIORITY = "optional"
+LICENSE = "GPLv2 | BSD"
+LIC_FILES_CHKSUM = "file://README;md5=4d709ce0f9c84b87d148e16731f647e1"
+DEPENDS = "libnl openssl"
+DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
+
+inherit update-rc.d
+INITSCRIPT_NAME = "hostapd"
+
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = " \
+  http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
+  file://defconfig \
+  file://init \
+"
+
+S = "${WORKDIR}/hostapd-${PV}/hostapd"
+
+
+do_configure() {
+	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+}
+
+do_compile() {
+	make
+}
+
+do_install() {
+	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
+	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
+	install -m 0755 ${S}/hostapd ${D}${sbindir}
+	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
+	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
+}
+
+CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
+
+SRC_URI[md5sum] = "236247a7bbd4f60d5fa3e99849d1ffc9"
+SRC_URI[sha256sum] = "002e9dcb7e46cf82b5900a2fcf92b30fc8cdfd32a72d7fd4488588f1c013dfcc"
-- 
1.7.5.4



