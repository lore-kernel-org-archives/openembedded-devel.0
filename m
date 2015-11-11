Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E4D6A771B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:38 +0000 (UTC)
Received: by wmec201 with SMTP id c201so1060828wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AYnX3rh/VYCOOhRlkpwjDPtEubKTOAEqh55He+jgiEA=;
	b=SMUY60NPnPyGGAQDY8jNuusd+FtsMyA1C2eJdYfbV9215eEVZ5k8FYo+CIdcHKohSE
	dvg4iKeD1ZD1CX1fwK7idw41SLnNn0S//mqwrbZ98Ub+XaE4YDnB17bfgIXwwj7ncvMt
	w2CaoVEdbSGPT6benH0Zq3fmnj56GrfmcgTqfYgGOsscOAPqSuyw2E1qKux+CGvD6qyS
	OTWISpKuzAJsPS4mM7/3jQmzjp+Wok7wEqunbwfPpAicdef+8d694AtwLglScBqmUqJi
	R6AmStqXp7LIz45RMeUViRh6wlMbGs994UlHuJcjQP0qWcaahBPpAFBq6LBbME0wWHLo
	2iOw==
X-Received: by 10.194.176.70 with SMTP id cg6mr13777199wjc.155.1447271318849; 
	Wed, 11 Nov 2015 11:48:38 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:38 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:12 +0100
Message-Id: <1447271300-4153-10-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 09/17] networkmanager: Add package for nmtui
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:39 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../networkmanager/networkmanager_1.0.6.bb               | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 9eeaefd..39a775a 100644
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
 
 # If you need a different configuration for networkmanager, add lines similar to
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


