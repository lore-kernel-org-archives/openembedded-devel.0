Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DE31B74D78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 09:37:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2018 02:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,426,1520924400"; d="scan'208";a="48430453"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2018 02:37:41 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2018 12:37:43 +0300
Message-Id: <20180521093743.41053-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] networkmanager: remove wireless-tools dependency
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
X-List-Received-Date: Mon, 21 May 2018 09:37:41 -0000

NM hasn't used this for many years, and wireless-tools are being
removed from oe-core, having been obsolete for about that long as well.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../networkmanager/networkmanager_1.10.6.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index 31fa13241..6891ef4fc 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -86,7 +86,7 @@ PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-clien
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
-PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
+PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
-- 
2.17.0


