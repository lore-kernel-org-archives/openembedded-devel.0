Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OgVpu-0000bb-HX
	for Openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 06:44:15 +0200
Received: by qwg8 with SMTP id 8so2777562qwg.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 21:44:10 -0700 (PDT)
Received: by 10.224.37.131 with SMTP id x3mr3536827qad.186.1280897049435;
	Tue, 03 Aug 2010 21:44:09 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t25sm2511128qcs.30.2010.08.03.21.44.08
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 21:44:08 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 23:44:07 -0500
Message-Id: <1280897047-28860-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-image: added ramdisk
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
X-List-Received-Date: Wed, 04 Aug 2010 04:44:15 -0000

Simply adding 'ext2.gz' to the IMAGE_FSTYPES to produce a default sized
ramdisk image whenever this image is built.
---
 recipes/images/beagleboard-test-image.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/beagleboard-test-image.bb
index 0ea323a..f4d736d 100644
--- a/recipes/images/beagleboard-test-image.bb
+++ b/recipes/images/beagleboard-test-image.bb
@@ -22,4 +22,5 @@ IMAGE_INSTALL += " \
 
 export IMAGE_BASENAME = "beagleboard-test-image"
 
-EXTRA_IMAGEDEPENDS += "x-load u-boot virtual/kernel"
+EXTRA_IMAGEDEPENDS += " x-load u-boot virtual/kernel"
+IMAGE_FSTYPES += " ext2.gz"
-- 
1.5.6.4



