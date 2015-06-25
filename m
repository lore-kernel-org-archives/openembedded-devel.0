Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCA56E6CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:00:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97724516"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 10:04:47 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P1x5gF025005
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:59:05 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Jun 2015 10:00:43 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 10:00:17 +0800
Message-ID: <1435197618-1621-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-oe][PATCH 1/2] networkmanager: upgrade from 0.9.8.10 to 1.0.2
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
X-List-Received-Date: Thu, 25 Jun 2015 02:00:44 -0000
Content-Type: text/plain

1) remove 0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch,
it is not needed any more.

2) set NetworkManager.service auto disable,otherwise,the Root file system
using the method of NFS mount can't boot successfully.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ----------------------
 ...manager_0.9.8.10.bb => networkmanager_1.0.2.bb} | 16 +++++-------
 2 files changed, 7 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb => networkmanager_1.0.2.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
deleted file mode 100644
index e356e9b..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 10427a19302e871daeeb245581e930dc58195492 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 27 Feb 2014 12:59:03 +0100
-Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
-
-* they were merged into libsystemd in systemd-209
-
-Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index cc66e9b..3fe958e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -283,7 +283,7 @@ AS_IF([! (echo "$with_session_tracking" | grep -q -E "^(systemd|consolekit|no)$"
- AM_CONDITIONAL(SESSION_TRACKING_CK, test "$with_session_tracking" = "consolekit")
- AM_CONDITIONAL(SESSION_TRACKING_SYSTEMD, test "xwith_session_tracking" = "systemd")
- if test "$with_session_tracking" = "systemd"; then
--	PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login])
-+	PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd])
- 	AC_SUBST(SYSTEMD_LOGIN_CFLAGS)
- 	AC_SUBST(SYSTEMD_LOGIN_LIBS)
- fi
--- 
-1.9.0
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
index 8d37c98..fb8efaf 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
@@ -4,18 +4,16 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp"
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp libndp"
 
 inherit gnome gettext systemd
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
-    file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
 "
-SRC_URI[md5sum] = "aad2558887e25417c52eb2deaade2f85"
-SRC_URI[sha256sum] = "064d27223d3824859df12e1fb25b787fec1c68bbc864dc52a0289b9211c4c972"
-
+SRC_URI[md5sum] = "5a4899f89edcbdd1ac46d2d947e8d6eb"
+SRC_URI[sha256sum] = "359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a47055c71e96439508ff"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -47,7 +45,6 @@ PACKAGECONFIG[concheck] = "--enable-concheck,--disable-concheck,libsoup-2.4"
 do_install_prepend() {
     sed -i 's:deny send_destination:allow send_destination:g' ${S}/src/org.freedesktop.NetworkManager.conf
     sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-dispatcher.conf
-    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-dhcp-client.conf
     sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-avahi-autoipd.conf
 }
 
@@ -55,8 +52,7 @@ do_install_append () {
     install -d ${D}${sysconfdir}/dbus-1/event.d
     # Additional test binaries
     install -d ${D}${bindir}
-    install -m 0755 ${B}/test/.libs/libnm* ${D}${bindir}
-
+    install -m 0755 ${B}/libnm-glib/libnm-glib-test ${D}${bindir}
     # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
     # With or without VPN support built in ;).
     install -d ${D}${sysconfdir}/NetworkManager/VPN
@@ -78,7 +74,7 @@ FILES_${PN} += " \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
     ${base_libdir}/udev/* \
-    ${systemd_unitdir}/system/NetworkManager-wait-online.service \
+    ${systemd_unitdir}/system/* \
 "
 
 RRECOMMENDS_${PN} += "iptables dnsmasq"
@@ -87,6 +83,7 @@ RDEPENDS_${PN} = " \
     wpa-supplicant \
     dhcp-client \
     ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
+    libndp \
 "
 
 FILES_${PN}-dbg += " \
@@ -109,3 +106,4 @@ FILES_${PN}-tests = " \
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.4.2


