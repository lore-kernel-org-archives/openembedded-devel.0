Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Q26dR-00065J-Tu
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 19:48:54 +0100
Received: from localhost.localdomain (79.25.134.226) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A960818EA9B; Tue, 22 Mar 2011 19:44:48 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Tue, 22 Mar 2011 19:44:38 +0100
Message-Id: <1300819478-6906-3-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300819478-6906-1-git-send-email-GNUtoo@no-log.org>
References: <1300819478-6906-1-git-send-email-GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] linux-omap-hah-2.6.31: enable XV for omapfb
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

Without that fix we have that in /var/log/Xorg.0.log:
  [2909187.116] (EE) omapfb(0): Failed to open /dev/fb2: No such file or directory
  [2909187.116] (EE) omapfb(0): XVScreenInit failed
That means that without 3 framebuffers it refuses to enable XV
Setting CONFIG_FB_OMAP2_NUM_FBS to 3 should fix the problem

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../linux/linux-omap-hah-2.6.31/bug20/defconfig    |    2 +-
 recipes/linux/linux-omap-hah_2.6.31.bb             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-omap-hah-2.6.31/bug20/defconfig b/recipes/linux/linux-omap-hah-2.6.31/bug20/defconfig
index b59847b..3216876 100644
--- a/recipes/linux/linux-omap-hah-2.6.31/bug20/defconfig
+++ b/recipes/linux/linux-omap-hah-2.6.31/bug20/defconfig
@@ -1397,7 +1397,7 @@ CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0
 CONFIG_FB_OMAP2=y
 # CONFIG_FB_OMAP2_DEBUG_SUPPORT is not set
 # CONFIG_FB_OMAP2_FORCE_AUTO_UPDATE is not set
-CONFIG_FB_OMAP2_NUM_FBS=1
+CONFIG_FB_OMAP2_NUM_FBS=3
 
 #
 # OMAP2/3 Display Device Drivers
diff --git a/recipes/linux/linux-omap-hah_2.6.31.bb b/recipes/linux/linux-omap-hah_2.6.31.bb
index 9170a64..9fd20ba 100644
--- a/recipes/linux/linux-omap-hah_2.6.31.bb
+++ b/recipes/linux/linux-omap-hah_2.6.31.bb
@@ -5,7 +5,7 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "bug20"
 
-MACHINE_KERNEL_PR = "r96"
+MACHINE_KERNEL_PR = "r97"
 
 SRCREV = "b8231a0d64e371aca70e69a702dbb57f5d69f376"
 
-- 
1.7.0.4



