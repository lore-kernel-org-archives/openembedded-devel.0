Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OgdMW-0001ou-AH
	for Openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 14:46:25 +0200
Received: by qwg8 with SMTP id 8so3036901qwg.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 05:46:15 -0700 (PDT)
Received: by 10.224.40.10 with SMTP id i10mr3730732qae.389.1280925974839;
	Wed, 04 Aug 2010 05:46:14 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r29sm2884496qcs.37.2010.08.04.05.46.11
	(version=SSLv3 cipher=RC4-MD5); Wed, 04 Aug 2010 05:46:12 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: Openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 07:46:10 -0500
Message-Id: <1280925970-11423-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1280897047-28860-1-git-send-email-jkridner@beagleboard.org>
References: <1280897047-28860-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Wed, 04 Aug 2010 12:46:25 -0000

Simply adding 'ext2.gz' to the IMAGE_FSTYPES to produce a default sized
ramdisk image whenever this image is built.

Uses 'IMAGE_FSTYPES +=' syntax to add a compressed ext2 image to use as
a ramdisk for BeagleBoard validation.  No space is required in the
string per link provided by Paul Menzel. [1]

[1] http://docs.openembedded.org/usermanual/usermanual.html
---
 recipes/images/beagleboard-test-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/beagleboard-test-image.bb
index 0ea323a..669eb52 100644
--- a/recipes/images/beagleboard-test-image.bb
+++ b/recipes/images/beagleboard-test-image.bb
@@ -23,3 +23,4 @@ IMAGE_INSTALL += " \
 export IMAGE_BASENAME = "beagleboard-test-image"
 
 EXTRA_IMAGEDEPENDS += "x-load u-boot virtual/kernel"
+IMAGE_FSTYPES += "ext2.gz"
-- 
1.5.6.4



