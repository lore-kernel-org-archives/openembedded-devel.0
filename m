Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PKYk7-0004i7-S4
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 16:56:20 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PKYix-0002Wf-D3 by authid <stefan@sostec.de> with cram_md5;
	Mon, 22 Nov 2010 16:54:37 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1PKYiu-0003UQ-Sf; Mon, 22 Nov 2010 16:54:32 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Nov 2010 16:54:29 +0100
Message-Id: <1290441269-13382-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][RELEASE 2010.12] bug20.conf: Use beagleboard config for x-load
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
X-List-Received-Date: Mon, 22 Nov 2010 15:56:55 -0000

We don't provide a x-load config for the bug20 in OE yet. Still omap3.inc adds
it to the image depends which makes all images fail for this machine. Avoid this
by building the beagleboard x-load config until we build our bug20 x-load with
OE.
---
 conf/machine/bug20.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index 549743b..7b71629 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -46,3 +46,6 @@ PREFERRED_VERSION_u-boot = "git"
 
 # and sdio
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+
+# We don't provide a bug20 x-load config yet
+XLOAD_MACHINE = "omap3530beagle_config"
-- 
1.7.2.3



