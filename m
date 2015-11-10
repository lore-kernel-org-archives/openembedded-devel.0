Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 147A277191
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:11 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so29564521wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nSA2FdDOxbJL1m28lT2oviZ2QIrgJW/VHfur/YGAcbY=;
	b=FWz/hvrnFtGZ0TE9fPkT+qKQldyTLGW2GjudNewW8BRCS3CRA469y0PaxEwULodx1q
	mMGtQqGI+MtHEN5EGzmQBvP615WRwJEsyjvQEMt8etOdVbiWnjQMvHStWc20R9m0yDuG
	NzczvBTb11Zd3ytOV1k1cIT0U7d5MN/lopLdUz49GFIa72sfs4sb1HprMjXeaalyFqwl
	KC+vszwGBYU4Dq3H7InD4OWCrBlM5KV1/nssCNum0N/LNB1VCgt24z2UF1X6U+KtLcCk
	Tcx/7TwVGzS1aDI2tSTdcVHwe9sQvGozy0EGq2mI1Ui7qy5YWixKbCuy6jc1BTnZyRpv
	IGSA==
X-Received: by 10.28.218.70 with SMTP id r67mr34759900wmg.74.1447192211577;
	Tue, 10 Nov 2015 13:50:11 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:10 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:20 +0100
Message-Id: <1447192164-9399-14-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 13/17] networkmanager: PACKAGECONFIG for dnsmasq
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:12 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 88f495b..c00e544 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -43,7 +43,6 @@ EXTRA_OECONF = " \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
-    --with-dnsmasq=${bindir}/dnsmasq \
     --with-nmtui=yes \
 "
 
@@ -51,7 +50,7 @@ EXTRA_OECONF = " \
 # the following examples to your local.conf or distro config
 # PACKAGECONFIG_pn-networkmanager = "systemd gnutls"
 # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
-PACKAGECONFIG ??= "nss ifupdown netconfig dhclient \
+PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
 "
 PACKAGECONFIG[systemd] = " \
@@ -67,6 +66,7 @@ PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
 # Use full featured dhcp client instead of internal one
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
+PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
@@ -88,7 +88,9 @@ FILES_${PN} += " \
     ${systemd_unitdir}/system \
 "
 
-RRECOMMENDS_${PN} += "iptables dnsmasq"
+RRECOMMENDS_${PN} += "iptables \
+    ${@bb.utils.contains('PACKAGECONFIG','dnsmasq','dnsmasq','',d)} \
+"
 RCONFLICTS_${PN} = "connman"
 RDEPENDS_${PN} = " \
     wpa-supplicant \
-- 
2.4.3


