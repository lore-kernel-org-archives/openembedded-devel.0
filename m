Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe002.messaging.microsoft.com [65.55.88.12])
	by mail.openembedded.org (Postfix) with ESMTP id 771386AE73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:12:39 +0000 (UTC)
Received: from mail135-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.22; Wed, 15 Jan 2014 02:12:39 +0000
Received: from mail135-tx2 (localhost [127.0.0.1])	by
	mail135-tx2-R.bigfish.com (Postfix) with ESMTP id BFE3A601D9	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:12:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2487h1155h)
Received: from mail135-tx2 (localhost.localdomain [127.0.0.1]) by mail135-tx2
	(MessageSwitch) id 1389751958302817_9478;
	Wed, 15 Jan 2014 02:12:38 +0000 (UTC)
Received: from TX2EHSMHS005.bigfish.com (unknown [10.9.14.231])	by
	mail135-tx2.bigfish.com (Postfix) with ESMTP id 237142005A;
	Wed, 15 Jan 2014 02:12:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS005.bigfish.com
	(10.9.99.105) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 15 Jan 2014 02:12:34 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 15 Jan 2014 02:12:33 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0F2CUFq017618;	Tue, 14 Jan 2014 19:12:32 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2014 10:12:28 +0800
Message-ID: <1389751948-7861-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] python-mako: fix SRC_URI
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
X-List-Received-Date: Wed, 15 Jan 2014 02:12:40 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   The package is no longer available in the
   official Mako site, so download it from a mirror.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
index 1d2bdd7..6993a3f 100644
--- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
+++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
 
 PR = "r2"
 
-SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
 SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
 SRC_URI[sha256sum] = "fe8698e845035586bd711a6748e4e40a208a58de276b9138026164700494b68f"
 
-- 
1.8.3.2



