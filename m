Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe003.messaging.microsoft.com [216.32.180.186])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8306BF9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:54:35 +0000 (UTC)
Received: from mail20-co1-R.bigfish.com (10.243.78.227) by
	CO1EHSOBE018.bigfish.com (10.243.66.81) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 06:54:36 +0000
Received: from mail20-co1 (localhost [127.0.0.1])	by mail20-co1-R.bigfish.com
	(Postfix) with ESMTP id 4C3054017A	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:54:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail20-co1 (localhost.localdomain [127.0.0.1]) by mail20-co1
	(MessageSwitch) id 1378796075161000_17164;
	Tue, 10 Sep 2013 06:54:35 +0000 (UTC)
Received: from CO1EHSMHS024.bigfish.com (unknown [10.243.78.225])	by
	mail20-co1.bigfish.com (Postfix) with ESMTP id 19FD78C0067	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:54:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS024.bigfish.com
	(10.243.66.34) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 06:54:35 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 10 Sep 2013 06:54:33 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r8A6sUir014009;	Mon, 9 Sep 2013 23:54:32 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2013 14:54:22 +0800
Message-ID: <1378796062-15201-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-fsl-ppc][PATCH v2] tclap: update SRC_URI
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
X-List-Received-Date: Tue, 10 Sep 2013 06:54:36 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *fix unfetchable SRC_URI

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
index 7075664..8cbe912 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
 
 SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
-SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap \
+SRC_URI = "git://git.code.sf.net/p/tclap/code \
     file://Makefile.am-disable-docs.patch \
 " 
 
-- 
1.7.5.4



