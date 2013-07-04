Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe003.messaging.microsoft.com [216.32.180.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A211607F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:26:36 +0000 (UTC)
Received: from mail179-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE011.bigfish.com (10.7.40.61) with Microsoft SMTP Server id
	14.1.225.23; Thu, 4 Jul 2013 09:26:36 +0000
Received: from mail179-va3 (localhost [127.0.0.1])	by
	mail179-va3-R.bigfish.com (Postfix) with ESMTP id C126F380127	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:26:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(z37d4lzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail179-va3 (localhost.localdomain [127.0.0.1]) by mail179-va3
	(MessageSwitch) id 1372929995288138_1765;
	Thu,  4 Jul 2013 09:26:35 +0000 (UTC)
Received: from VA3EHSMHS021.bigfish.com (unknown [10.7.14.236])	by
	mail179-va3.bigfish.com (Postfix) with ESMTP id 3ADF9360089	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:26:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS021.bigfish.com
	(10.7.99.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 4 Jul 2013 09:26:32 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 4 Jul 2013 09:26:30 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r649QRBO031697;	Thu, 4 Jul 2013 02:26:28 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jul 2013 17:26:23 +0800
Message-ID: <1372929983-1410-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b40527@freescale.com
Subject: [meta-networking][PATCH] dnsmasq: install .service only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 04 Jul 2013 09:26:36 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 0f5b273..0710893 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -30,9 +30,11 @@ do_install () {
     install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
     install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+    
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+    fi
 
     if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
-- 
1.7.5.4



