Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OiH2V-0004fr-2a
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 03:20:32 +0200
Received: by qyk32 with SMTP id 32so8747051qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 18:20:21 -0700 (PDT)
Received: by 10.229.226.78 with SMTP id iv14mr6697746qcb.136.1281316821392;
	Sun, 08 Aug 2010 18:20:21 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id m5sm3817067qcu.3.2010.08.08.18.20.20
	(version=SSLv3 cipher=RC4-MD5); Sun, 08 Aug 2010 18:20:20 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Aug 2010 20:20:18 -0500
Message-Id: <1281316818-22277-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-image: add additional packages
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
X-List-Received-Date: Mon, 09 Aug 2010 01:20:32 -0000

Add sox for audio testing.
Add kernel-module-mt9t112 for camera testing.
Add u-boot-mkimage for editing the boot.scr and user.scr files.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-test-image.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/beagleboard-test-image.bb
index e25a427..b54bc62 100644
--- a/recipes/images/beagleboard-test-image.bb
+++ b/recipes/images/beagleboard-test-image.bb
@@ -19,6 +19,9 @@ IMAGE_INSTALL += " \
   beagleboard-test-scripts \
   nano \
   cpuburn-neon \
+  kernel-module-mt9t112 \
+  u-boot-mkimage \
+  sox \
 "
 
 export IMAGE_BASENAME = "beagleboard-test-image"
-- 
1.5.6.4



