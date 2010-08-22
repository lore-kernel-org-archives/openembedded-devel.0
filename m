Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnHMo-0000TU-K4
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 22:42:11 +0200
Received: by qwa26 with SMTP id 26so1626240qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 13:41:46 -0700 (PDT)
Received: by 10.229.71.68 with SMTP id g4mr2169155qcj.174.1282509706659;
	Sun, 22 Aug 2010 13:41:46 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l8sm6127913qck.30.2010.08.22.13.41.44
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Aug 2010 13:41:45 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 15:41:41 -0500
Message-Id: <1282509701-7944-3-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282509701-7944-2-git-send-email-jkridner@beagleboard.org>
References: <1282509701-7944-1-git-send-email-jkridner@beagleboard.org>
	<1282509701-7944-2-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-uboot-scripts: beagleboard: use XGA and toggle LEDs
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
X-List-Received-Date: Sun, 22 Aug 2010 20:42:11 -0000

* set dvimode to 1024x768
* add tty0 to console=
* toggle LEDs
** led 0 and 1 are on by default in u-boot
** turn led 1 off at start
** turn led 0 off at end of ramdisk load
** turn led 1 on again just before boot

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/angstrom/angstrom-uboot-scripts.bb         |    2 +-
 .../beagleboard-validation-user.cmd                |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/angstrom/angstrom-uboot-scripts.bb b/recipes/angstrom/angstrom-uboot-scripts.bb
index 020a7af..497bd79 100644
--- a/recipes/angstrom/angstrom-uboot-scripts.bb
+++ b/recipes/angstrom/angstrom-uboot-scripts.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Various uboot scripts"
 
-PR = "r10"
+PR = "r11"
 
 DEPENDS = "u-boot-mkimage-native"
 
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
index 971b96e..7a7939a 100644
--- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
@@ -1,4 +1,8 @@
+led 1 off
 mmc init
+setenv dvimode 1024x768MR-16@60
+setenv vram 16M omapfb.vram=0:8M,1:4M,2:4M
+setenv console tty0 console=ttyS2,115200n8
 if test "${beaglerev}" = "AxBx"; then
 setenv rdaddr 0x81000000
 setenv optargs mem=80M@0x80000000 musb_hdrc.fifomode=5
@@ -12,6 +16,8 @@ setenv ramroot /dev/ram0 rw ramdisk_size=131072 initrd=${rdaddr},128M
 setenv optargs mem=80M@0x80000000 mem=384M@0x88000000
 fi
 run loadramdisk
+led 0 off
 run loaduimage
+led 1 on
 run ramboot
 
-- 
1.5.6.4



