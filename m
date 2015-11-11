Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B14DE771B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:41 +0000 (UTC)
Received: by wmww144 with SMTP id w144so173224472wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uR7GjtEyzzipGgSL86MU6kV3SAJKUzLhFcCM6p/7Oj4=;
	b=ANMYguFC73DD+jI5QkyiQR0i05IlJD9s9C3P3AzR0mDmSLZ0odyZoDIJMbXQ1lE4cr
	ZJ2oDcHydyjXRv3yLu9VAuoNqekjF8t+VuKPnJ/GoXGn3mz9JXceJvtF2kP8ES1nxEPQ
	5c9DZdcFsfqQrSU0ry95qMkb9MbrELG9oat1qQrRa17mCUGBJt1RvMO1+xV/HUfAbiOM
	p7y5vQdbHc4p9+KiDi7PrhtyqSByzXlY7N2WytXJIinez0RMT/WlXrJIySxSDYqEgr9Z
	G967A2ETg2TQf/7iBbZABnlCydpuGrl8WJiIMNbGO2mt4BvoOMBUtstIEKt/G+n/vjJB
	8mMg==
X-Received: by 10.194.90.79 with SMTP id bu15mr14078084wjb.36.1447271321686;
	Wed, 11 Nov 2015 11:48:41 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:15 +0100
Message-Id: <1447271300-4153-13-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 12/17] networkmanager: PACKAGECONFIG for dhclient
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:42 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index a80aeca..c11602a 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -41,7 +41,6 @@ EXTRA_OECONF = " \
     --disable-ifnet \
     --disable-ifcfg-suse \
     --disable-more-warnings \
-    --with-dhclient=${base_sbindir}/dhclient \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
     --with-dnsmasq=${bindir}/dnsmasq \
@@ -50,9 +49,9 @@ EXTRA_OECONF = " \
 
 # If you need a different configuration for networkmanager, add lines similar to
 # the following example to your local.conf or distro config
-# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig"
+# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig dhclient"
 # PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
-PACKAGECONFIG ??= "nss ifupdown netconfig \
+PACKAGECONFIG ??= "nss ifupdown netconfig dhclient \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
 "
 PACKAGECONFIG[systemd] = " \
@@ -66,6 +65,8 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
+# Use full featured dhcp client instead of internal one
+PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
@@ -91,7 +92,6 @@ RRECOMMENDS_${PN} += "iptables dnsmasq"
 RCONFLICTS_${PN} = "connman"
 RDEPENDS_${PN} = " \
     wpa-supplicant \
-    dhcp-client \
 "
 
 FILES_${PN}-dbg += " \
-- 
2.4.3


