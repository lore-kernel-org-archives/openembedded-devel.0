Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe003.messaging.microsoft.com [216.32.180.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDFC61957
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:44:16 +0000 (UTC)
Received: from mail75-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.22; Fri, 1 Nov 2013 08:44:17 +0000
Received: from mail75-va3 (localhost [127.0.0.1])	by mail75-va3-R.bigfish.com
	(Postfix) with ESMTP id 446F31001A5	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:44:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail75-va3 (localhost.localdomain [127.0.0.1]) by mail75-va3
	(MessageSwitch) id 138329545662666_9326; Fri,  1 Nov 2013 08:44:16 +0000
	(UTC)
Received: from VA3EHSMHS017.bigfish.com (unknown [10.7.14.226])	by
	mail75-va3.bigfish.com (Postfix) with ESMTP id 08FF63E005F	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:44:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS017.bigfish.com
	(10.7.99.27) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 1 Nov 2013 08:44:13 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 1 Nov 2013 08:44:12 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA18iADc006257;	Fri, 1 Nov 2013 01:44:11 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2013 16:44:08 +0800
Message-ID: <1383295448-12107-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH v3 3/3 ] libdnet: add recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 08:44:17 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

    *dumb networking library
    *snort depends libdnet

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-connectivity/libdnet/libdnet_1.12.bb   |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
new file mode 100644
index 0000000..40b5758
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -0,0 +1,14 @@
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
+acpaths = "-I ./config/"
+
-- 
1.7.5.4



