Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 18CD6605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:27 +0000 (UTC)
Received: by wgck11 with SMTP id k11so61486117wgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=O/XTrpm4oIMt1M5YImH5Vy9wCgUIf5dGGXmGcLLipps=;
	b=h9jozLq0n/YbBfxLpTTrqkUdjrNacbrmBsMEXMGPgdQV3fLjLoaGVbOeMPKSPKDkUW
	btMkdyvqoozt88AeozuFe8Cug502rLNAj7gkAuw2b2s6K1/y4jmahfVmqJuNEmpcoC7B
	/fcalLI3GHeDb8tgiVxQpwKkH0Rmtvpza+CvnPRm1NslDu2lCRWPwIK5qBr1x21YNdHR
	FIol7ridc6vBJrXRs1ryU2aPohMv5rX853nfn2nT+8k8xYAJABslQQdEw9Q7SV9TjP3H
	3GVWy4kMfbKMSo94yKLpGw/aEgnB2KrlY1eKJiZjmT989YfVYDhuhP7euO/GAl+pknVe
	a5tg==
X-Received: by 10.180.24.65 with SMTP id s1mr5278946wif.66.1435235788683;
	Thu, 25 Jun 2015 05:36:28 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:49 +0200
Message-Id: <1435235754-7339-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] networkmanager: update to 1.0.2
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
X-List-Received-Date: Thu, 25 Jun 2015 12:36:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* at_console support is gone
* add PACKAGECONFIG for bluez5/modemmanager/ppp and disable them by default

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ----------------
 ...manager_0.9.8.10.bb => networkmanager_1.0.2.bb} | 41 +++++-----------------
 2 files changed, 8 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb => networkmanager_1.0.2.bb} (59%)

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
similarity index 59%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
index 8d37c98..324d165 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
@@ -4,18 +4,16 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp"
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux libndp"
 
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
 
@@ -40,30 +38,11 @@ PACKAGECONFIG[systemd] = " \
     polkit \
 "
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
+PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
-PACKAGECONFIG[concheck] = "--enable-concheck,--disable-concheck,libsoup-2.4"
-
-# Work around dbus permission problems since we lack a proper at_console
-do_install_prepend() {
-    sed -i 's:deny send_destination:allow send_destination:g' ${S}/src/org.freedesktop.NetworkManager.conf
-    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-dispatcher.conf
-    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-dhcp-client.conf
-    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-avahi-autoipd.conf
-}
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/dbus-1/event.d
-    # Additional test binaries
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/test/.libs/libnm* ${D}${bindir}
-
-    # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
-    # With or without VPN support built in ;).
-    install -d ${D}${sysconfdir}/NetworkManager/VPN
-
-    rm -rf "${D}${localstatedir}/run"
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-}
+PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
+PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
+PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
 
@@ -78,7 +57,7 @@ FILES_${PN} += " \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
     ${base_libdir}/udev/* \
-    ${systemd_unitdir}/system/NetworkManager-wait-online.service \
+    ${systemd_unitdir}/system \
 "
 
 RRECOMMENDS_${PN} += "iptables dnsmasq"
@@ -86,7 +65,6 @@ RCONFLICTS_${PN} = "connman"
 RDEPENDS_${PN} = " \
     wpa-supplicant \
     dhcp-client \
-    ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
 "
 
 FILES_${PN}-dbg += " \
@@ -95,14 +73,11 @@ FILES_${PN}-dbg += " \
 "
 
 FILES_${PN}-dev += " \
-    ${datadir}/NetworkManager/gdb-cmd \
     ${libdir}/pppd/*/*.la \
     ${libdir}/NetworkManager/*.la \
 "
 
 FILES_${PN}-tests = " \
-    ${bindir}/nm-tool \
-    ${bindir}/libnm-glib-test \
     ${bindir}/nm-online \
 "
 
-- 
1.9.3


