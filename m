Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B07CB771B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:43 +0000 (UTC)
Received: by wmww144 with SMTP id w144so173225354wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VDw/DdZQG5wrvP1dRTds1HutC1ABHpVQFQtZNY2xDqk=;
	b=YxHsuvcAU/EDDcAJWhiE9Rv9lWB572UUySsZBEQvjtez/WS8rGnrB36YnLnRMSQMhV
	/58XLNEYetkMy28jOemXJGFcX7+yhnADJcrWWuiogz2vEOhq2IKgEkjVwWDF8GukfC8U
	C8Wxhl23xO32NU7b+/RclQcVTI0+NlMFk2e7VjLpsHx52gC+wSu2QcyE2/HaDvgTIGan
	3yg6dCB3gnObKAKQIuqHuc5qlXzB+L+esmnZmle2xlWvKK1TO5Pj4umKRrnheaUKGxpq
	OlOhhPYAkoWvARwvUf3gJqXx0Bppj5oAI/eVz2OIF+P7uykMLf3MkFBfLwTYbXsX8b7k
	6ZqQ==
X-Received: by 10.28.217.6 with SMTP id q6mr14008786wmg.5.1447271323357;
	Wed, 11 Nov 2015 11:48:43 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:42 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:17 +0100
Message-Id: <1447271300-4153-15-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 14/17] networkmanager: PACKAGECONFIG for wifi
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:44 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb  | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 27b6378..326ac31 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b"
 
-DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools util-linux libndp libnewt"
+DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
 
 inherit gnomebase gettext systemd
 
@@ -48,10 +48,11 @@ EXTRA_OECONF = " \
 
 # If you need a different configuration for networkmanager, add lines similar to
 # the following example to your local.conf or distro config
-# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig dhclient dnsmasq"
+# PACKAGECONFIG_remove_pn-networkmanager = "nss ifupdown netconfig dhclient dnsmasq wifi"
 # PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
 "
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
@@ -69,6 +70,7 @@ PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-clien
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
+PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 
@@ -92,9 +94,6 @@ RRECOMMENDS_${PN} += "iptables \
     ${@bb.utils.contains('PACKAGECONFIG','dnsmasq','dnsmasq','',d)} \
 "
 RCONFLICTS_${PN} = "connman"
-RDEPENDS_${PN} = " \
-    wpa-supplicant \
-"
 
 FILES_${PN}-dbg += " \
     ${libdir}/NetworkManager/.debug/ \
-- 
2.4.3


