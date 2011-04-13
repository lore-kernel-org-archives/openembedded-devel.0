Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QA4lp-0005lL-Jn
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 20:26:31 +0200
Received: by yia13 with SMTP id 13so378157yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=YTvob3A07R54K39Dk6OjkVu+en56RTnrs+uhZgWR8b4=;
	b=FcSwcUH2MOwgHGNI5Cg2d+CmuSmkDO8/S41z2i9RvJr3vheILx7L3G++SCjR+r5keu
	N5e8B9O40CU07AHzTCR1rQuj8YGC8F+SWK7E9/3c/+KnELk0GZvq0sTI717AtvZvD1Hm
	ONOXEgB6a1Ncxd6EHNzi6ULywPAgkSjMMkLbg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tTEWIQZRB72ro+YXb54CT6iYkff2mC1o1KiYjBq4k4CLofQuhMPVipQExB2cYrvSpK
	l6Vo59LoMeMTyvJKsg/7wVjEj56K1A3pswKQ0lAaaaUB2Et0n2VaOlIstoCHXL63Uu2y
	B8mOkggRQY9ifuGPEpnAPw3bMyd6PrqI2v9Po=
Received: by 10.236.183.138 with SMTP id q10mr10166659yhm.281.1302719049872;
	Wed, 13 Apr 2011 11:24:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 44sm371690yhl.53.2011.04.13.11.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 11:24:08 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2011 21:08:14 +0300
Message-Id: <1302718094-6384-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCHv2] hostap-daemon: build from git sources
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
X-List-Received-Date: Wed, 13 Apr 2011 18:26:31 -0000

* Builds a new version 0.8.x which is not released yet as a zip file.
  This version has new features like WIFI-direct used in new mac80211
  versions
* As the recipe is very similar to the 0.7.3 version, I have created
  a common include file shared between the 0.7.3 version and the
  git version
* Updated the 0.7.3 recipe to use this include file and bumped the PR

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/hostap/hostap-daemon-0.7.inc       |   26 ++++
 recipes/hostap/hostap-daemon-git/defconfig |  187 ++++++++++++++++++++++++++++
 recipes/hostap/hostap-daemon_0.7.3.bb      |   29 +----
 recipes/hostap/hostap-daemon_git.bb        |   16 +++
 4 files changed, 233 insertions(+), 25 deletions(-)
 create mode 100644 recipes/hostap/hostap-daemon-0.7.inc
 create mode 100644 recipes/hostap/hostap-daemon-git/defconfig
 create mode 100644 recipes/hostap/hostap-daemon_git.bb

diff --git a/recipes/hostap/hostap-daemon-0.7.inc b/recipes/hostap/hostap-daemon-0.7.inc
new file mode 100644
index 0000000..49f2650
--- /dev/null
+++ b/recipes/hostap/hostap-daemon-0.7.inc
@@ -0,0 +1,26 @@
+HOMEPAGE = "http://hostap.epitest.fi"
+SECTION = "kernel/userland"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "libnl openssl"
+
+inherit update-rc.d
+INITSCRIPT_NAME=hostapd
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
diff --git a/recipes/hostap/hostap-daemon-git/defconfig b/recipes/hostap/hostap-daemon-git/defconfig
new file mode 100644
index 0000000..4fd9061
--- /dev/null
+++ b/recipes/hostap/hostap-daemon-git/defconfig
@@ -0,0 +1,187 @@
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
+#CC=$(CROSS_COMPILE)gcc
+#CFLAGS += -I$(NFSROOT)/include -DCONFIG_LIBNL20
+#CPPFLAGS += -DCONFIG_LIBNL20
+#LIBS += -L$(NFSROOT)/lib -lnl-genl
+#LIBS_p += -L$(NFSROOT)/lib
+#LIBDIR = $(NFSROOT)/lib
+#BINDIR = $(NFSROOT)/usr/sbin
+
+# Driver interface for Host AP driver
+CONFIG_DRIVER_HOSTAP=y
+
+# Driver interface for wired authenticator
+#CONFIG_DRIVER_WIRED=y
+
+# Driver interface for madwifi driver
+#CONFIG_DRIVER_MADWIFI=y
+#CFLAGS += -I../../madwifi # change to the madwifi source directory
+
+# Driver interface for drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL20=y
+# driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
+# shipped with your distribution yet. If that is the case, you need to build
+# newer libnl version and point the hostapd build to use it.
+#LIBNL=$(LIBNL_PATH)
+#CFLAGS += -I$(LIBNL)/include
+#LIBS += -L$(LIBNL)/lib
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+#LIBS_p += -L/usr/local/lib
+#LIBS_c += -L/usr/local/lib
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
+#CONFIG_RADIUS_SERVER=y
+
+# Build IPv6 support for RADIUS operations
+CONFIG_IPV6=y
+
+# IEEE Std 802.11r-2008 (Fast BSS Transition)
+#CONFIG_IEEE80211R=y
+
+# Use the hostapd's IEEE 802.11 authentication (ACL), but without
+# the IEEE 802.11 Management capability (e.g., madwifi or FreeBSD/net80211)
+#CONFIG_DRIVER_RADIUS_ACL=y
+
+# IEEE 802.11n (High Throughput) support
+#CONFIG_IEEE80211N=y
+
+# Remove debugging code that is printing out debug messages to stdout.
+# This can be used to reduce the size of the hostapd considerably if debugging
+# code is not needed.
+#CONFIG_NO_STDOUT_DEBUG=y
+
+# Remove support for RADIUS accounting
+#CONFIG_NO_ACCOUNTING=y
+
+# Remove support for RADIUS
+#CONFIG_NO_RADIUS=y
+
+# Remove support for VLANs
+#CONFIG_NO_VLAN=y
+
+# Remove support for dumping state into a file on SIGUSR1 signal
+# This can be used to reduce binary size at the cost of disabling a debugging
+# option.
+#CONFIG_NO_DUMP_STATE=y
+
+# Enable tracing code for developer debugging
+# This tracks use of memory allocations and other registrations and reports
+# incorrect use with a backtrace of call (or allocation) location.
+#CONFIG_WPA_TRACE=y
+# For BSD, comment out these.
+#LIBS += -lexecinfo
+#LIBS_p += -lexecinfo
+#LIBS_c += -lexecinfo
+
+# Use libbfd to get more details for developer debugging
+# This enables use of libbfd to get more detailed symbols for the backtraces
+# generated by CONFIG_WPA_TRACE=y.
+#CONFIG_WPA_TRACE_BFD=y
+# For BSD, comment out these.
+#LIBS += -lbfd -liberty -lz
+#LIBS_p += -lbfd -liberty -lz
+#LIBS_c += -lbfd -liberty -lz
+
+
+
diff --git a/recipes/hostap/hostap-daemon_0.7.3.bb b/recipes/hostap/hostap-daemon_0.7.3.bb
index 10b1389..5a8aee7 100644
--- a/recipes/hostap/hostap-daemon_0.7.3.bb
+++ b/recipes/hostap/hostap-daemon_0.7.3.bb
@@ -1,10 +1,8 @@
 DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
-HOMEPAGE = "http://hostap.epitest.fi"
-SECTION = "kernel/userland"
-PRIORITY = "optional"
-LICENSE = "GPL"
-DEPENDS = "libnl openssl"
-PR = "r2"
+
+require hostap-daemon-0.7.inc
+
+PR = "r3"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -16,23 +14,4 @@ SRC_URI[sha256sum] = "31eb2781f37e1a4c27969d1594f8019c0ca87779349c099ab812833289
 
 S = "${WORKDIR}/hostapd-${PV}/hostapd"
 
-inherit update-rc.d
-INITSCRIPT_NAME=hostapd
-
-do_configure() {
-	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
-}
-
-do_compile() {
-	make
-}
-
-do_install() {
-	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
-	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
-	install -m 0755 ${S}/hostapd ${D}${sbindir}
-	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
-}
 
-CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
diff --git a/recipes/hostap/hostap-daemon_git.bb b/recipes/hostap/hostap-daemon_git.bb
new file mode 100644
index 0000000..da966b9
--- /dev/null
+++ b/recipes/hostap/hostap-daemon_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
+
+require hostap-daemon-0.7.inc
+
+PR = "r0"
+SRCREV = "b8fb017272ed4794339978c9fbc0e74571a44728"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://w1.fi/srv/git/hostap.git;protocol=git \
+	file://defconfig \
+	file://init"
+
+S = "${WORKDIR}/git/hostapd"
+
+
-- 
1.7.0.4



