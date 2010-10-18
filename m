Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uor-0004Yj-6p
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:26 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 202C9275CE43; Mon, 18 Oct 2010 20:51:54 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 46789275CE2F;
	Mon, 18 Oct 2010 20:51:53 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:24 +0200
Message-Id: <1287427884-1517-16-git-send-email-morphis@gravedo.de>
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
Subject: [PATCH 15/15] palmpre: add some utilities to MACHINE_EXTRA_RDEPEND
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:26 -0000

Some utilities are essential for the palmpre but no other machine so the machine config
rdepends on them. They will be installed in an image via task-base.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 conf/machine/palmpre.conf  |    1 +
 recipes/tasks/task-base.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/machine/palmpre.conf b/conf/machine/palmpre.conf
index f5852c5..ffa7669 100644
--- a/conf/machine/palmpre.conf
+++ b/conf/machine/palmpre.conf
@@ -32,3 +32,4 @@ PREFERRED_VERSION_u-boot = "git"
 XLOAD_MACHINE = "omap3530beagle_config"
 
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa phone bluetooth touchscreen keyboard wifi"
+MACHINE_EXTRA_RDEPENDS = "tsmd read-tokens tellbootie lvm2 palmpre-audio-scripts"
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index 2eedb31..ecc5278 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r90"
+PR = "r91"
 
 inherit task
 
-- 
1.7.1



