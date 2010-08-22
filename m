Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnH6l-0007RE-71
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 22:25:38 +0200
Received: by qyk8 with SMTP id 8so2271469qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 13:25:06 -0700 (PDT)
Received: by 10.224.6.129 with SMTP id 1mr253177qaz.325.1282508706454;
	Sun, 22 Aug 2010 13:25:06 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id f15sm6108435qcr.37.2010.08.22.13.25.05
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Aug 2010 13:25:05 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 15:25:03 -0500
Message-Id: <1282508703-7417-2-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282508703-7417-1-git-send-email-jkridner@beagleboard.org>
References: <1282508703-7417-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-image: eliminate splash screen
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
X-List-Received-Date: Sun, 22 Aug 2010 20:25:38 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-test-image.bb |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/beagleboard-test-image.bb
index e6c2c7e..c5a300c 100644
--- a/recipes/images/beagleboard-test-image.bb
+++ b/recipes/images/beagleboard-test-image.bb
@@ -1,9 +1,18 @@
 # this image was created for use with the BeagleBoard for diagnostics
 # for creating a small ramdisk image
 
-require minimal-image.bb
+ANGSTROM_EXTRA_INSTALL ?= ""
+DISTRO_SSH_DAEMON ?= "dropbear"
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 IMAGE_INSTALL += " \
+  task-boot \
+  ${DISTRO_SSH_DAEMON} \
+  ${ANGSTROM_EXTRA_INSTALL} \
+  angstrom-version \
+  util-linux-ng-mount \
+  util-linux-ng-umount \
   dosfstools \
   e2fsprogs \
   e2fsprogs-mke2fs \
@@ -30,9 +39,12 @@ IMAGE_INSTALL += " \
 "
 
 export IMAGE_BASENAME = "beagleboard-test-image"
+IMAGE_LINGUAS = ""
+
+inherit image
 
 EXTRA_IMAGEDEPENDS += "x-load u-boot virtual/kernel"
-IMAGE_FSTYPES += "ext2.gz cpio.gz.u-boot"
+IMAGE_FSTYPES = "ext2.gz"
 IMAGE_ROOTFS_SIZE_ext2 = "131072"
 EXTRA_IMAGECMD_ext2.gz += "-i 8192"
 
-- 
1.5.6.4



