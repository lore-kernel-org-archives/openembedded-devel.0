Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Q26dR-00065I-Tu
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 19:48:53 +0100
Received: from localhost.localdomain (79.25.134.226) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A960818EA85; Tue, 22 Mar 2011 19:44:44 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Tue, 22 Mar 2011 19:44:36 +0100
Message-Id: <1300819478-6906-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] bug20: add wifi and bluetooth to MACHINE_FEATURES
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
X-List-Received-Date: Tue, 22 Mar 2011 18:48:54 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/machine/bug20.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index a9441bd..95ce49c 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -47,7 +47,7 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 PREFERRED_VERSION_u-boot = "git"
 
 # and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa wifi bluetooth"
 
 # We don't provide a bug20 x-load config yet
 XLOAD_MACHINE = "omap3530beagle_config"
-- 
1.7.0.4



