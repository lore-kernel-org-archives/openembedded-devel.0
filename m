Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RaJDm-0000ZB-Bb
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 04:40:02 +0100
Received: from mail6-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Tue, 13 Dec 2011 03:17:54 +0000
Received: from mail6-tx2 (localhost [127.0.0.1])	by mail6-tx2-R.bigfish.com
	(Postfix) with ESMTP id AA0BC64010E	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 03:17:54 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz1432Nzz1202hzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail6-tx2 (localhost.localdomain [127.0.0.1]) by mail6-tx2
	(MessageSwitch) id 1323746274563857_18610;
	Tue, 13 Dec 2011 03:17:54 +0000 (UTC)
Received: from TX2EHSMHS005.bigfish.com (unknown [10.9.14.241])	by
	mail6-tx2.bigfish.com (Postfix) with ESMTP id 830BA680047	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 03:17:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS005.bigfish.com
	(10.9.99.105) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 13 Dec 2011 03:17:54 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 12 Dec 2011 21:17:56 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197] (may
	be forged))	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pBD3HqdI029069;	Mon, 12 Dec 2011 21:17:55 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Dec 2011 11:20:24 +0800
Message-ID: <1323746424-18637-2-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1323746424-18637-1-git-send-email-b19537@freescale.com>
References: <1323746424-18637-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH mate-oe 2/2] libxaw: fix build error due to missing xmlto
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
X-List-Received-Date: Tue, 13 Dec 2011 03:40:02 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    > libxaw build failed due to missing native xmlto, add xmlto-native in
      DEPENDS of libxaw

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
index 40d11da..602f887 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
@@ -1,11 +1,12 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 DESCRIPTION = "X Athena Widget Set"
 DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+DEPENDS += "xmlto-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1beacbc336a5a256bb28dbfcf01c2be"
 
 PE = "1"
-PR = "r10"
+PR = "r11"
 
 SRC_URI[md5sum] = "ccc57478c41b7a75b9702241b889b1d4"
 SRC_URI[sha256sum] = "a83977546b78e24ac5dca86affc10b6404a87c16272405b05386feca1a2db037"
-- 
1.7.0.4




