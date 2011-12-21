Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFXq-0003G1-QN
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:20:55 +0100
Received: from mail203-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 05:58:32 +0000
Received: from mail203-ch1 (localhost [127.0.0.1])	by
	mail203-ch1-R.bigfish.com (Postfix) with ESMTP id 7696B2C00C8	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:03 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275bhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail203-ch1 (localhost.localdomain [127.0.0.1]) by mail203-ch1
	(MessageSwitch) id 1324447141391855_21159;
	Wed, 21 Dec 2011 05:59:01 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail203-ch1.bigfish.com (Postfix) with ESMTP id
	5B56720044 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 05:58:30 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 20 Dec 2011 23:58:38 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBL5wYWW015654;
	Tue, 20 Dec 2011 23:58:36 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:01:39 +0800
Message-ID: <1324447304-4874-2-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324447304-4874-1-git-send-email-b19537@freescale.com>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 meta-oe 2/7] libxaw: fix build error due to missing xmlto
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
X-List-Received-Date: Wed, 21 Dec 2011 06:20:55 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    libxaw build failed due to missing native xmlto, add xmlto-native in
    DEPENDS of libxaw

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
index 40d11da..1b8b5da 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
@@ -1,11 +1,11 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau xmlto-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1beacbc336a5a256bb28dbfcf01c2be"
 
 PE = "1"
-PR = "r10"
+PR = "r11"
 
 SRC_URI[md5sum] = "ccc57478c41b7a75b9702241b889b1d4"
 SRC_URI[sha256sum] = "a83977546b78e24ac5dca86affc10b6404a87c16272405b05386feca1a2db037"
-- 
1.7.0.4




