Received: from defout.telus.net ([204.209.205.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kwong@wurldtech.com>) id 1OzYua-0003Jf-O9
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 19:51:50 +0200
Received: from edtnaa01.telusplanet.net ([209.52.149.70])
	by priv-edtnes25.telusplanet.net
	(InterMail vM.7.09.01.00 201-2219-108-20080618) with ESMTP id
	<20100925170752.JQVK16918.priv-edtnes25.telusplanet.net@edtnaa01.telusplanet.net>;
	Sat, 25 Sep 2010 11:07:52 -0600
Received: from localhost.localdomain (s209-52-149-70.bc.hsia.telus.net
	[209.52.149.70])
	by edtnaa01.telusplanet.net (BorderWare Security Platform) with ESMTP
	id E983A0F26B995852; Sat, 25 Sep 2010 11:07:52 -0600 (MDT)
From: Kelvie Wong <kwong@wurldtech.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 10:07:06 -0700
Message-Id: <1285434426-17736-3-git-send-email-kwong@wurldtech.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
References: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
X-Cloudmark-Analysis: v=1.1 cv=3YgEYBDakSuntAG8tytJ+Tf/IoGYUzfPnchu+/rcU8U=
	c=1 sm=0 a=foQiyU2LyM8A:10 a=45p8Zyiy/ZpScqfSBMwu1A==:17
	a=7FBX-s5ViZ6jxHClUTQA:9 a=uw1aqjqZEIR0gsqRN-wA:7
	a=A-kUu7qDteux-amv_KpUxN4FtgkA:4 a=HpAAvcLHHh0Zw7uRqdWCyQ==:117
X-SA-Exim-Connect-IP: 204.209.205.13
X-SA-Exim-Mail-From: kwong@wurldtech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Kelvie Wong <kwong@wurldtech.com>
Subject: [PATCH 3/3] initramfs-udev-image: new image target.
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
X-List-Received-Date: Sat, 25 Sep 2010 17:51:50 -0000

This is an initramfs image target with udev support.  This is useful for
things such as booting from /dev/disk/by-{uuid,label}/*
---
 recipes/images/initramfs-udev-image.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/initramfs-udev-image.bb

diff --git a/recipes/images/initramfs-udev-image.bb b/recipes/images/initramfs-udev-image.bb
new file mode 100644
index 0000000..669cbfc
--- /dev/null
+++ b/recipes/images/initramfs-udev-image.bb
@@ -0,0 +1,7 @@
+# initramfs image with udev support
+#
+# (New!) Now with a more populated /dev!
+
+require initramfs-image.bb
+
+IMAGE_INSTALL += "initramfs-module-udev"
-- 
1.7.0.4



