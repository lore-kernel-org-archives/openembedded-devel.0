Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 59E3B7717D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:05 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so89835318wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9U5c2GXfCdWF6VvhDSYblTAOuGEW04Yq2oRKYaO09nw=;
	b=jR7pIBSy0M7D90yqBdt9+4HbJ3E5UX76FnAKjlaHfi2qNfsMxOOLkB0fUcDs0eEPJI
	KuinJAsgtPhPhuWqVYeOeOSRXZcfzuOsbD+4RD8Ya+CTLMzvQyTTGvH5Qf091Q6e8rGT
	HW8KtwVZAb29A9ErB6YRyZzgW5yoY2xdLRLUCA0rjzruBTXn7un7Kz8iAVHOM5M/k35o
	buh1DZ7r3kFwCnmCZNULLeIKQwW+rjlTwrgMcUqT3hBy4JBqTdnIfNHTQ+3os23hEWQj
	0GtzZvYRcSM8d7/Gt60VhIrIql2VCMfaw1mSQhvtHxNK3uxxfFC7zYUF8DOzHKQFVkTM
	cESQ==
X-Received: by 10.28.214.141 with SMTP id n135mr36807154wmg.53.1447192205088; 
	Tue, 10 Nov 2015 13:50:05 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:13 +0100
Message-Id: <1447192164-9399-7-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 06/17] networkmanager: Update to 1.0.6
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:05 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 ...tworkmanager_1.0.4.bb => networkmanager_1.0.6.bb} | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.4.bb => networkmanager_1.0.6.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 310a83b..d529b4a 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -2,18 +2,21 @@ SUMMARY = "NetworkManager"
 SECTION = "net/misc"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
+                    file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
+                    file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b"
 
 DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools nss util-linux libndp"
 
-inherit gnome gettext systemd
+inherit gnomebase gettext systemd
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
 "
-SRC_URI[md5sum] = "7eabef7bd3bbdd6dc0473dd32aeac924"
-SRC_URI[sha256sum] = "e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500bf79aecbf54cee018c9"
+
+SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
+SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -31,15 +34,15 @@ EXTRA_OECONF = " \
     --with-dnsmasq=${bindir}/dnsmasq \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
     --without-systemdsystemunitdir, \
     polkit \
 "
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
-PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
+PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
@@ -73,8 +76,13 @@ FILES_${PN}-dbg += " \
 "
 
 FILES_${PN}-dev += " \
+    ${datadir}/NetworkManager/gdb-cmd \
+"
+
+FILES_${PN}-staticdev += " \
     ${libdir}/pppd/*/*.la \
     ${libdir}/NetworkManager/*.la \
+    ${libdir}/*.la \
 "
 
 FILES_${PN}-tests = " \
-- 
2.4.3


