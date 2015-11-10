Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D1A9977103
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:09 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so89837636wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9djY8upHR8GzTx8JCedP09pNEOlOxFYMqsqerCCBCuA=;
	b=uUTlftk23aYiCxNfltQ+FxU2Vp5vBeQB/ZcOQuDGtkSmLt+/UQuU9+nlSNqoNtkhkM
	5h828Wz02e+vh34y08tDyK6D6TaHAw4n6aqZZG4mT1eaaj/Moqwzt3E1u/8mTWAnreey
	XxbTxpljt30NMXF+w3BjZaepzl/8Mu3qoDUrEhP9rZ0we6axXCSXpdt/W78yOe2Y+6Kd
	6dMf8ocaOo5R0NuPiUH+4fnypgj99KKDPhZtIufYhG5aK8vQxFsX7bwtJbSIb8zjgdle
	EHeXP1N2iVtvIoTs9Yo18onlIlksPJ6IZGlDA4nhzSi7mhc0b9tPT3CsKuXilinqWc92
	Y3JQ==
X-Received: by 10.194.116.100 with SMTP id jv4mr6042763wjb.67.1447192209662;
	Tue, 10 Nov 2015 13:50:09 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:09 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:18 +0100
Message-Id: <1447192164-9399-12-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 11/17] networkmanager: PACKAGECONFIG for ifupdown netconfig
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:10 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 4df8793..e2bb1ff 100644
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
@@ -54,7 +52,7 @@ EXTRA_OECONF = " \
 # the following examples to your local.conf or distro config
 # PACKAGECONFIG_pn-networkmanager = "systemd gnutls"
 # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
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


