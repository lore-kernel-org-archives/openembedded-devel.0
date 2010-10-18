Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoX-0004Vh-Fa
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:06 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 3C123275CEBA; Mon, 18 Oct 2010 20:51:34 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 91507275CD26;
	Mon, 18 Oct 2010 20:51:33 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:13 +0200
Message-Id: <1287427884-1517-5-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/15] netbase: powerup usb0 interface automatically on palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:06 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/netbase/netbase/palmpre/interfaces |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/netbase/netbase/palmpre/interfaces b/recipes/netbase/netbase/palmpre/interfaces
index ca2e007..17416c1 100644
--- a/recipes/netbase/netbase/palmpre/interfaces
+++ b/recipes/netbase/netbase/palmpre/interfaces
@@ -6,6 +6,7 @@ iface lo inet loopback
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
+auto usb0
 iface usb0 inet static
 	address 192.168.0.202
 	netmask 255.255.255.0
-- 
1.7.1



