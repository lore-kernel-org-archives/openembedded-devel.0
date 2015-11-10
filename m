Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8384D77191
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:10 +0000 (UTC)
Received: by wmec201 with SMTP id c201so155223544wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d65wD7Fnts5LzZM4FelUCbSPdpO4HSvoywc6WYYjY7U=;
	b=Ov3ffLz1Uv/FmFg5Ke2N0mq/Y/pZSjBdvCEwgn5o4YrVn4p0Kpi0ZYTYe2N7f1Zdty
	od85sIVmzdNsaXaYOIeKRQZ+l595MM+QR8Geq53P6oVNvy0TCknUXa5oxjiWwD36aYZC
	5BCx0AKWTfG2DiPIIC8ncgDbVdMHlKFDCGRimFr1onjoytMmGsQQqPePpvyfS1VNUAmL
	tGcJggnrQnONrlld4BDRNJTnY3elHjWD9Ni56USKWTz0NYBzPSYLb1w6vP4pn34ikOv7
	3aOW91HnQ3QXCkF618ZViCVH0s79cYmQd1Kff19hYv+AGl5963dHI62FyDKAxAv/aUYY
	2DyQ==
X-Received: by 10.194.188.112 with SMTP id fz16mr6175738wjc.65.1447192210671; 
	Tue, 10 Nov 2015 13:50:10 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:09 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:19 +0100
Message-Id: <1447192164-9399-13-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 12/17] networkmanager: PACKAGECONFIG for dhclient
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:11 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index e2bb1ff..88f495b 100644
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
@@ -52,7 +51,7 @@ EXTRA_OECONF = " \
 # the following examples to your local.conf or distro config
 # PACKAGECONFIG_pn-networkmanager = "systemd gnutls"
 # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
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


