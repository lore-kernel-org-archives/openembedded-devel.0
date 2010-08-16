Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Ol4qh-0005Er-PV
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 20:55:56 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 6B935275D865; Mon, 16 Aug 2010 20:55:40 +0200 (CEST)
Received: from localhost (p5489A50E.dip.t-dialin.net [84.137.165.14])
	by gravedo.de (Postfix) with ESMTPSA id 9D817275D863;
	Mon, 16 Aug 2010 20:55:39 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 20:55:36 +0200
Message-Id: <1281984936-4886-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] palmpre: use omap3530beagle config for x-load
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
X-List-Received-Date: Mon, 16 Aug 2010 18:55:56 -0000

We currently have no palmpre support for x-load. As long as we miss it we use the config
from the beagleboard machine.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 conf/machine/palmpre.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/palmpre.conf b/conf/machine/palmpre.conf
index dccc892..2a62c30 100644
--- a/conf/machine/palmpre.conf
+++ b/conf/machine/palmpre.conf
@@ -26,5 +26,6 @@ IMAGE_FSTYPES += "tar.bz2"
 # Let's keep the following three from the beagleboard machine config
 UBOOT_MACHINE = "omap3_beagle_config"
 PREFERRED_VERSION_u-boot = "git"
+XLOAD_MACHINE = "omap3530beagle_config"
 
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa phone bluetooth touchscreen keyboard wifi"
-- 
1.7.0.4



