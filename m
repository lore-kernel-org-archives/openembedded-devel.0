Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SzDin-00036A-4s
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 23:23:17 +0200
Received: from mail173-co1-R.bigfish.com (10.243.78.233) by
	CO1EHSOBE007.bigfish.com (10.243.66.70) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Aug 2012 20:56:21 +0000
Received: from mail173-co1 (localhost [127.0.0.1])	by
	mail173-co1-R.bigfish.com (Postfix) with ESMTP id BF1CBC0028E	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2012 20:56:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail173-co1 (localhost.localdomain [127.0.0.1]) by mail173-co1
	(MessageSwitch) id 1344459379577722_11011;
	Wed,  8 Aug 2012 20:56:19 +0000 (UTC)
Received: from CO1EHSMHS032.bigfish.com (unknown [10.243.78.251])	by
	mail173-co1.bigfish.com (Postfix) with ESMTP id 8B8683C0044	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2012 20:56:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS032.bigfish.com
	(10.243.66.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Aug 2012 20:56:19 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 8 Aug 2012 15:56:18 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q78KuHax028678 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:56:18 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Aug 2012 15:56:17 -0500
Message-ID: <1344459377-7717-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] strongswan_5.0.0.bb: update recipe packaging to fix QA warnings and package all content
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 21:23:17 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../recipes-support/strongswan/strongswan_5.0.0.bb |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
index 189cfa3..52c8bec 100644
--- a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
+++ b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
@@ -5,6 +5,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
+PR = "r1"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
 SRC_URI[md5sum] = "c8b861305def7c0abae04f7bbefec212"
@@ -18,4 +19,11 @@ inherit autotools
 
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
-FILES_${PN}-dbg += "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
+PACKAGES += "${PN}-plugins"
+FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
+FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
+FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-plugins += "${libdir}/ipsec/plugins/*"
+
+INSANE_SKIP_${PN}-plugins = "staticdev"
-- 
1.7.9.7




