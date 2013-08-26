Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe001.messaging.microsoft.com [216.32.180.184])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFF56A95B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:19:52 +0000 (UTC)
Received: from mail170-co1-R.bigfish.com (10.243.78.242) by
	CO1EHSOBE034.bigfish.com (10.243.66.99) with Microsoft SMTP Server id
	14.1.225.22; Mon, 26 Aug 2013 03:19:52 +0000
Received: from mail170-co1 (localhost [127.0.0.1])	by
	mail170-co1-R.bigfish.com (Postfix) with ESMTP id B660A6200FA	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:19:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah186068h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail170-co1 (localhost.localdomain [127.0.0.1]) by mail170-co1
	(MessageSwitch) id 1377487191342690_5026;
	Mon, 26 Aug 2013 03:19:51 +0000 (UTC)
Received: from CO1EHSMHS021.bigfish.com (unknown [10.243.78.231])	by
	mail170-co1.bigfish.com (Postfix) with ESMTP id 50ECFCE003F	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:19:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS021.bigfish.com
	(10.243.66.31) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 26 Aug 2013 03:19:51 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Mon, 26 Aug 2013 03:19:50 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r7Q3JlxM031999;	Sun, 25 Aug 2013 20:19:48 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2013 11:19:44 +0800
Message-ID: <1377487184-31296-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 2/4] libdnet: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2013 03:19:52 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

     *dumb networking library
     *snort depends libdnet

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-connectivity/libdnet/libdnet_1.12.bb   |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libdnet/libdnet_1.12.bb

diff --git a/meta-oe/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-oe/recipes-connectivity/libdnet/libdnet_1.12.bb
new file mode 100644
index 0000000..88b893b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "dumb networking library"
+HOMEPAGE = "http://code.google.com/p/libdnet/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
+
+SRC_URI = "http://libdnet.googlecode.com/files/libdnet-${PV}.tgz"
+
+SRC_URI[md5sum] = "9253ef6de1b5e28e9c9a62b882e44cc9"
+SRC_URI[sha256sum] = "83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026"
+
+inherit autotools 
+
+
+do_configure_prepend() {
+   cp ${S}/config/acinclude.m4 ${S}/
+}
-- 
1.7.5.4



