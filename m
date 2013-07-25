Return-Path: <B40290@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by mail.openembedded.org (Postfix) with ESMTP id DFA5160FEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 09:27:48 +0000 (UTC)
Received: from mail204-co9-R.bigfish.com (10.236.132.227) by
	CO9EHSOBE024.bigfish.com (10.236.130.87) with Microsoft SMTP Server id
	14.1.225.22; Thu, 25 Jul 2013 09:27:48 +0000
Received: from mail204-co9 (localhost [127.0.0.1])	by
	mail204-co9-R.bigfish.com (Postfix) with ESMTP id B63E11001C3	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 09:27:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah1de097h1de096h8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail204-co9 (localhost.localdomain [127.0.0.1]) by mail204-co9
	(MessageSwitch) id 1374744466704005_14097;
	Thu, 25 Jul 2013 09:27:46 +0000 (UTC)
Received: from CO9EHSMHS018.bigfish.com (unknown [10.236.132.225])	by
	mail204-co9.bigfish.com (Postfix) with ESMTP id A8218580047	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 09:27:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS018.bigfish.com
	(10.236.130.28) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 25 Jul 2013 09:27:43 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Thu, 25 Jul 2013 09:27:41 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r6P9Rc59027919;	Thu, 25 Jul 2013 02:27:39 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jul 2013 17:27:35 +0800
Message-ID: <1374744455-20983-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: b40527@freescale.com
Subject: [meta-oe][PATCH] iperf: Fix license
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
X-List-Received-Date: Thu, 25 Jul 2013 09:27:49 -0000
Content-Type: text/plain

    *the current version of Iperf has a false LICENSE set,
     so fix license with the generic BSD license

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
index 8107701..03b8fe0 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
 HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
 SECTION = "console/network"
-LICENSE = "NewBSD"
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
 SRC_URI = " \
-- 
1.7.5.4



