Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCB97E8F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:48:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5RDmXnj000628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 06:48:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 27 Jun 2019 06:48:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 27 Jun 2019 09:47:49 -0400
Message-ID: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2019 13:48:33 -0000
Content-Type: text/plain

Since commit [061953143 networkmanager: Update to 1.18.0] applied,
upstream disable libnm-glib by default. And in further networkmanager,
upstream removes libnm-glib, libnm-glib-vpn, and libnm-util for good

https://github.com/NetworkManager/NetworkManager/commit/df58895fb3479c4f00b9107126759d138250fef2
https://github.com/NetworkManager/NetworkManager/commit/5801f89f4d1464fc15cb1d97755b73f9f68cb2e6

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../networkmanager/networkmanager_1.18.0.bb                | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 9215a8676..cc84d614d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -87,21 +87,16 @@ PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
-PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
+PACKAGES =+ " \
   ${PN}-nmtui ${PN}-nmtui-doc \
   ${PN}-adsl \
 "
 
-FILES_libnmutil += "${libdir}/libnm-util.so.*"
-FILES_libnmglib += "${libdir}/libnm-glib.so.*"
-FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
-
 FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
 
 FILES_${PN} += " \
-- 
2.17.1


