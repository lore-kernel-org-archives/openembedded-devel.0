Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B2B707719C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:40 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so126793422wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rtwK4d8O52fe+ApY14TFRAgoVsRFSUI7zpod1OYTPNg=;
	b=wYqoXrGi1Zjl6HqWTgib31s/DeUODwAuMu0tMtVBUvam86KIjHaz9lrIqYjDW4nGZU
	47acIbEhVx9IhA8+GTbKu09cPaEjWdFwo6hFqKW7A5FKgWJ02k55WZyJhxvC7lk7BWaM
	ikc0RyGJEOF40+c45Mqyo/Mu0FmyddEr9GzpfQrpnZ2/mnZ0adeGUBNhfLsasPPz/N79
	Kjfnn2TXpj/+R681I+Q58eVhm6/QYWTYbnDGPwGsHGOo7dH3chI+5pItwuXDABUcJ93k
	h6i1fUPr0MpBxxFNY4YhZDfBQxbGgUufMaFxIRDprZuKRk7RDIwKMqtRtpotJl7ouWsT
	+H6Q==
X-Received: by 10.28.22.67 with SMTP id 64mr39627846wmw.61.1447271320828;
	Wed, 11 Nov 2015 11:48:40 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:40 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:14 +0100
Message-Id: <1447271300-4153-12-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 11/17] networkmanager: PACKAGECONFIG for ifupdown netconfig
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:40 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index bb94f09..a80aeca 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -37,11 +37,9 @@ SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb9264
 S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
-    --enable-ifupdown \
     --disable-ifcfg-rh \
     --disable-ifnet \
     --disable-ifcfg-suse \
-    --with-netconfig \
     --disable-more-warnings \
     --with-dhclient=${base_sbindir}/dhclient \
     --with-iptables=${sbindir}/iptables \
@@ -52,9 +50,9 @@ EXTRA_OECONF = " \
 
 # If you need a different configuration for networkmanager, add lines similar to
 # the following example to your local.conf or distro config
-# PACKAGECONFIG_remove_pn-networkmanager = "nss"
+# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig"
 # PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
-PACKAGECONFIG ??= "nss \
+PACKAGECONFIG ??= "nss ifupdown netconfig \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
 "
 PACKAGECONFIG[systemd] = " \
@@ -70,6 +68,8 @@ PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
+PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
+PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion ${PN}-nmtui ${PN}-nmtui-doc"
 
-- 
2.4.3


