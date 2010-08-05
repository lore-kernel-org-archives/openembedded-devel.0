Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Ogsos-00055n-Am
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 07:17:00 +0200
Received: by qwg8 with SMTP id 8so3787000qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 22:16:36 -0700 (PDT)
Received: by 10.229.228.146 with SMTP id je18mr3124548qcb.13.1280985396681;
	Wed, 04 Aug 2010 22:16:36 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t1sm3969451qcs.9.2010.08.04.22.16.35
	(version=SSLv3 cipher=RC4-MD5); Wed, 04 Aug 2010 22:16:35 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 00:16:34 -0500
Message-Id: <1280985394-20000-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-image: add cpuburn-neon
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
X-List-Received-Date: Thu, 05 Aug 2010 05:17:03 -0000
X-List-Received-Date: Thu, 05 Aug 2010 05:17:03 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-test-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/beagleboard-test-image.bb
index 669eb52..e25a427 100644
--- a/recipes/images/beagleboard-test-image.bb
+++ b/recipes/images/beagleboard-test-image.bb
@@ -18,6 +18,7 @@ IMAGE_INSTALL += " \
   angstrom-uboot-scripts \
   beagleboard-test-scripts \
   nano \
+  cpuburn-neon \
 "
 
 export IMAGE_BASENAME = "beagleboard-test-image"
-- 
1.5.6.4



