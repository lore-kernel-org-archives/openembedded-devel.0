Return-Path: <B19537@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mail.openembedded.org (Postfix) with ESMTP id D9E6B6D323
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:56:13 +0000 (UTC)
Received: from mail169-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Thu, 24 Oct 2013 07:56:14 +0000
Received: from mail169-ch1 (localhost [127.0.0.1])	by
	mail169-ch1-R.bigfish.com (Postfix) with ESMTP id 3F308160166	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:56:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail169-ch1 (localhost.localdomain [127.0.0.1]) by mail169-ch1
	(MessageSwitch) id 1382601373305204_27838;
	Thu, 24 Oct 2013 07:56:13 +0000 (UTC)
Received: from CH1EHSMHS032.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail169-ch1.bigfish.com (Postfix) with ESMTP id
	4255D2A0085	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:56:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS032.bigfish.com
	(10.43.70.32) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 24 Oct 2013 07:56:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 24 Oct 2013 07:56:11 +0000
Received: from localhost.localdomain (B19537-03.ap.freescale.net
	[10.192.208.81])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9O7u8Lo001373;	Thu, 24 Oct 2013 00:56:09 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2013 15:56:06 +0800
Message-ID: <1382601366-38422-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [meta-oe/meta-oe][PATCH] libedit: fix multilib build issue
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
X-List-Received-Date: Thu, 24 Oct 2013 07:56:14 -0000
Content-Type: text/plain

Failed to fetch URL http://www.thrysoee.dk/editline/lib64-libedit-20121213-3.0.tar.gz

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta-oe/recipes-devtools/libedit/libedit_20121213.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb b/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
index 35e619c..08dba44 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
@@ -10,9 +10,9 @@ inherit autotools
 
 # upstream site does not allow wget's User-Agent
 FETCHCMD_wget += "-U bitbake"
-SRC_URI = "http://www.thrysoee.dk/editline/${PN}-${PV}-3.0.tar.gz"
+SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}-3.0.tar.gz"
 
-S = "${WORKDIR}/${PN}-${PV}-3.0"
+S = "${WORKDIR}/${BPN}-${PV}-3.0"
 
 SRC_URI[md5sum] = "f475f50fe7467c1074c0fbae8b5bca1a"
 SRC_URI[sha256sum] = "0379e4a73c219f260e6d16adbc2e87635532ebb4c5a83a7399f231dc40108d1f"
-- 
1.8.3.1



