Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by mail.openembedded.org (Postfix) with ESMTP id 812076B1F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:17:09 +0000 (UTC)
Received: from mail145-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.22; Wed, 31 Jul 2013 02:17:09 +0000
Received: from mail145-tx2 (localhost [127.0.0.1])	by
	mail145-tx2-R.bigfish.com (Postfix) with ESMTP id D4A2240030B	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:17:09 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(z37d5kzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah1de096h8275bh1de097hz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail145-tx2 (localhost.localdomain [127.0.0.1]) by mail145-tx2
	(MessageSwitch) id 1375237028362618_5653;
	Wed, 31 Jul 2013 02:17:08 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.231])	by
	mail145-tx2.bigfish.com (Postfix) with ESMTP id 54CDBE0046	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:17:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 31 Jul 2013 02:17:08 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Wed, 31 Jul 2013 02:17:07 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r6V2H4QZ027301;	Tue, 30 Jul 2013 19:17:05 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2013 10:16:56 +0800
Message-ID: <1375237016-32362-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe,v2][PATCH] iperf: Fix license
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
X-List-Received-Date: Wed, 31 Jul 2013 02:17:09 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

     *the current version of Iperf has a false LICENSE set,
         so fix license with the generic BSD license

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
index 8107701..4261c95 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
 HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
 SECTION = "console/network"
-LICENSE = "NewBSD"
+LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
 SRC_URI = " \
-- 
1.7.5.4



