Received: from defout.telus.net ([204.209.205.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kwong@wurldtech.com>) id 1OzYug-0003Jf-2i
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 19:51:55 +0200
Received: from edtnaa01.telusplanet.net ([209.52.149.70])
	by priv-edtnes27.telusplanet.net
	(InterMail vM.7.09.01.00 201-2219-108-20080618) with ESMTP id
	<20100925170751.JKEY25952.priv-edtnes27.telusplanet.net@edtnaa01.telusplanet.net>;
	Sat, 25 Sep 2010 11:07:51 -0600
Received: from localhost.localdomain (s209-52-149-70.bc.hsia.telus.net
	[209.52.149.70])
	by edtnaa01.telusplanet.net (BorderWare Security Platform) with ESMTP
	id E52BB3E1AFB9C240; Sat, 25 Sep 2010 11:07:51 -0600 (MDT)
From: Kelvie Wong <kwong@wurldtech.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 10:07:04 -0700
Message-Id: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
X-Mailer: git-send-email 1.7.0.4
X-Cloudmark-Analysis: v=1.1 cv=hBVX3jwt5i4MoaZNfIokgIgrRn7Ub1xV2Xl/aTlnX78=
	c=1 sm=0 a=HANr1JaJRdIA:10 a=45p8Zyiy/ZpScqfSBMwu1A==:17
	a=U7h-iygFb5z7wB3n1ZwA:9 a=8NHUWzCn7Pwi5ofCqBkA:7
	a=HT2zSFT2XfldxeRAyQHHunN6ULQA:4 a=HpAAvcLHHh0Zw7uRqdWCyQ==:117
X-SA-Exim-Connect-IP: 204.209.205.13
X-SA-Exim-Mail-From: kwong@wurldtech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Kelvie Wong <kwong@wurldtech.com>
Subject: [PATCH 1/3] initramfs-image: Make intiramfs images cpio.gz
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
X-List-Received-Date: Sat, 25 Sep 2010 17:51:55 -0000

The kernel doesn't recognize anything else, anyways.
---
 recipes/images/initramfs-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/images/initramfs-image.bb b/recipes/images/initramfs-image.bb
index e518984..ba9d8fe 100644
--- a/recipes/images/initramfs-image.bb
+++ b/recipes/images/initramfs-image.bb
@@ -3,6 +3,7 @@
 # recursive) and NFS.
 
 IMAGE_INSTALL = "busybox-static initramfs-module-block initramfs-module-loop initramfs-module-nfs"
+IMAGE_FSTYPES = "cpio.gz"
 IMAGE_LINGUAS = ""
 
 # Remove any kernel-image that the kernel-module-* packages may have pulled in.
-- 
1.7.0.4



