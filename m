Return-Path: <Zongchun.Yu@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe002.messaging.microsoft.com [216.32.180.185])
	by mail.openembedded.org (Postfix) with ESMTP id 82F1C6DD0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:53:19 +0000 (UTC)
Received: from mail119-co1-R.bigfish.com (10.243.78.231) by
	CO1EHSOBE027.bigfish.com (10.243.66.90) with Microsoft SMTP Server id
	14.1.225.22; Tue, 26 Nov 2013 02:53:18 +0000
Received: from mail119-co1 (localhost [127.0.0.1])	by
	mail119-co1-R.bigfish.com (Postfix) with ESMTP id BA7E4C00B3C;
	Tue, 26 Nov 2013 02:53:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h1155h)
Received: from mail119-co1 (localhost.localdomain [127.0.0.1]) by mail119-co1
	(MessageSwitch) id 1385434397658192_9977;
	Tue, 26 Nov 2013 02:53:17 +0000 (UTC)
Received: from CO1EHSMHS025.bigfish.com (unknown [10.243.78.240])	by
	mail119-co1.bigfish.com (Postfix) with ESMTP id 934032C0068;
	Tue, 26 Nov 2013 02:53:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS025.bigfish.com
	(10.243.66.35) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 26 Nov 2013 02:53:17 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 26 Nov 2013 02:53:16 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.192.208.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rAQ2rDLt015073;	Mon, 25 Nov 2013 19:53:14 -0700
From: <b40527@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Nov 2013 10:54:12 +0800
Message-ID: <1385434452-4083-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, otavio.salvador@gmail.com
Subject: [meta-oe][meta-networking][PATCH] tcpdump: move from meta-oe to meta-networking
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
X-List-Received-Date: Tue, 26 Nov 2013 02:53:20 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 .../0001-minimal-IEEE802.15.4-allowed.patch        |    0
 .../tcpdump/tcpdump-4.3.0/configure.patch          |    0
 .../tcpdump/tcpdump-4.3.0/ipv6-cross.patch         |    0
 .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |    0
 .../recipes-support/tcpdump/tcpdump_4.3.0.bb       |    0
 .../packagegroups/packagegroup-cli-tools.bb        |    1 -
 6 files changed, 0 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-networking}/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/tcpdump/tcpdump_4.3.0.bb (100%)

diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index fa53a67..8807fd1 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -45,7 +45,6 @@ RDEPENDS_${PN}-debug = "\
     s3c64xx-gpio \
     serial-forward \
     strace \
-    tcpdump \
 "
 
 RRECOMMENDS_${PN}-debug = "\
-- 
1.7.0.4



