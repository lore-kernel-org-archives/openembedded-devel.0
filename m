Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 888A377181
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:12 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so89838954wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gRNHla6d4QVCwJAJgQJValtf3dq2uZiQE/9K3Ivlvx4=;
	b=nf+DK41q/LV229HSuxGVYHhP8WrxSp4/jERIvSCqVYfOOA6NGPL3E9zX25MVMGslAg
	HS78YQ9HoYzmOdkOqKeqG9xqopMmn4HeCac1rq2PBnSRHH+/aaUGiltdsHBgYUlNrjfH
	wpvUnflwq0GwYSc/vV0ZJuVBm+C6Tkzis/1HnVv/VD941xIvwg4SgVTXDXZ/5EkSeSX3
	g1Q3ilkXfJi3jqtbW/GydLcq1RWLIRSwV3DNk2N5e5+odx0YYW3jhlDQ4LOy70wS+iNt
	B0kBuoq2Y97lF873QY7irjhlTmx0xFEetHEwoAoMCeH/P5KD80tCsk91I+9jQJWADWTY
	OkYw==
X-Received: by 10.28.182.134 with SMTP id g128mr3719669wmf.95.1447192212491;
	Tue, 10 Nov 2015 13:50:12 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:11 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:21 +0100
Message-Id: <1447192164-9399-15-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 14/17] networkmanager: PACKAGECONFIG for wifi
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
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb  | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index c00e544..590ce3b 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b"
 
-DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools util-linux libndp libnewt"
+DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
 
 inherit gnomebase gettext systemd
 
@@ -48,10 +48,11 @@ EXTRA_OECONF = " \
 
 # If you need a different configuration for networkmanager, add a line similar to
 # the following examples to your local.conf or distro config
-# PACKAGECONFIG_pn-networkmanager = "systemd gnutls"
+# PACKAGECONFIG_pn-networkmanager = "systemd gnutls wifi"
 # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
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


