Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 80A2B771B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:42 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so126794353wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZU+H6bllmMa4kjA/WSJDsdMPklnUd3z5SLejkxTmSPU=;
	b=iJLoyoadUnhVwqe0e7d6qYIEUwzB/3OF6oGEyFGEvNS35OzpXCp8w1TbAZR/DamnRO
	+WjE3JYPK2pkIWaF48XGRlOxCg12FZyprVlFVoFvKuyMf2QRw4TtNByXgTTEdhlM3/kr
	eOR0mBCEOVlqSN06tpM2cbRHH/OerHJtjQz6udMicw5VC4iKVgHYz8yyczHKQEdDiNuo
	2osnqWaYZAsZpEhWW16TjPZDUuJSuUS/00uxPAIOI997UOyCMQUmss5L7HxqCG7o23kl
	09l8U2cxnuz8kS/rrZLNj42poYDmLDR9/58itYOwnzXZPAUG2Yk4e/ddps//EGN796Fk
	2XVA==
X-Received: by 10.28.47.8 with SMTP id v8mr25619609wmv.30.1447271322555;
	Wed, 11 Nov 2015 11:48:42 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:16 +0100
Message-Id: <1447271300-4153-14-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 13/17] networkmanager: PACKAGECONFIG for dnsmasq
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
 .../networkmanager/networkmanager_1.0.6.bb                     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index c11602a..27b6378 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -43,15 +43,14 @@ EXTRA_OECONF = " \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
-    --with-dnsmasq=${bindir}/dnsmasq \
     --with-nmtui=yes \
 "
 
 # If you need a different configuration for networkmanager, add lines similar to
 # the following example to your local.conf or distro config
-# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig dhclient"
+# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig dhclient dnsmasq"
 # PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
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


