Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1U1EeA-0000ba-Lc
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 12:19:16 +0100
Received: from mail132-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 10:03:00 +0000
Received: from mail132-va3 (localhost [127.0.0.1])	by
	mail132-va3-R.bigfish.com (Postfix) with ESMTP id 906A42C0208	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz177df4h17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail132-va3 (localhost.localdomain [127.0.0.1]) by mail132-va3
	(MessageSwitch) id 1359712979430510_1975;
	Fri,  1 Feb 2013 10:02:59 +0000 (UTC)
Received: from VA3EHSMHS037.bigfish.com (unknown [10.7.14.252])	by
	mail132-va3.bigfish.com (Postfix) with ESMTP id 657771A0123	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:02:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS037.bigfish.com
	(10.7.99.47) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 10:02:59 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 1 Feb 2013 10:02:58 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r11A2o9a030747;	Fri, 1 Feb 2013 03:02:55 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2013 18:02:46 +0800
Message-ID: <1359712968-22554-3-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1359712968-22554-1-git-send-email-b28495@freescale.com>
References: <1359712968-22554-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-java][for denzil] 2/4] llvm: not use pythonnative class
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
X-List-Received-Date: Fri, 01 Feb 2013 11:19:16 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-core/llvm/llvm.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index de52443..65d36c5 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -26,13 +26,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
 DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common"
 DEPENDS_virtclass-native = "llvm-common-native cmake-native"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
 
 S = "${WORKDIR}/llvm-${PV}"
 
-inherit cmake perlnative pythonnative
+inherit cmake perlnative
 
 # Defines the LLVM supported arches. By now we always build either for ${BUILD}
 # (native) or ${TARGET}. In the future it may make sense to enable all backends
-- 
1.7.5.4




