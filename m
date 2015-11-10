Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 080AB77181
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:07 +0000 (UTC)
Received: by wmww144 with SMTP id w144so136527849wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U+abaIF7c1CVAynl3jERotzIjP2lvoPjZat+FfJ9iyI=;
	b=B+yDKiJ07/NcIFGHh1Na6nXThdjh8NZzwgspiNEx4DV6Ci/fYh7bQngF+mX/VMN4vr
	dXygi90kP2MvxTQ9YI2C5USS0+XofkubLtfurHiGLkvLWZyxuFF9fDMW2Y6zZF3sJ5dK
	oLg0Mgg8kWHMQ2VMn3ZD3Mx+j0+lwllc5+lvXxG7E7fIYw+te1KPmCxurznlBzEMchPS
	7I0eBSEpdy7LWnA0ilhcOPjuVyUx6POel9p+ydk0h5E2aNpfbPYpWc6H5RyH7ExGfZgU
	SJ813F+LFjqRyPNsFiZg9BqnWJx0Pa5G2+Xs7WBjW6W5DefDKCv1zUIEf+C6SL3qG9yF
	EM9Q==
X-Received: by 10.194.134.199 with SMTP id pm7mr6302515wjb.46.1447192207814;
	Tue, 10 Nov 2015 13:50:07 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:07 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:16 +0100
Message-Id: <1447192164-9399-10-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 09/17] networkmanager: Add package for nmtui
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:08 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../networkmanager/networkmanager_1.0.6.bb               | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 294a666..3277fdc 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b"
 
-DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools util-linux libndp"
+DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools util-linux libndp libnewt"
 
 inherit gnomebase gettext systemd
 
@@ -47,6 +47,7 @@ EXTRA_OECONF = " \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
     --with-dnsmasq=${bindir}/dnsmasq \
+    --with-nmtui=yes \
 "
 
 # If you need a different configuration for networkmanager, add a line similar to
@@ -70,7 +71,7 @@ PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion ${PN}-nmtui ${PN}-nmtui-doc"
 
 FILES_libnmutil += "${libdir}/libnm-util.so.*"
 FILES_libnmglib += "${libdir}/libnm-glib.so.*"
@@ -114,6 +115,17 @@ FILES_${PN}-tests = " \
 
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
+FILES_${PN}-nmtui = " \
+    ${bindir}/nmtui \
+    ${bindir}/nmtui-edit \
+    ${bindir}/nmtui-connect \
+    ${bindir}/nmtui-hostname \
+"
+
+FILES_${PN}-nmtui-doc = " \
+    ${mandir}/man1/nmtui* \
+"
+
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
 
 do_install_append() {
-- 
2.4.3


