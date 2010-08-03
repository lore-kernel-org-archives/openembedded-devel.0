Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OgHDm-0004rb-HS
	for Openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 15:07:55 +0200
Received: by vws13 with SMTP id 13so3137676vws.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 06:07:50 -0700 (PDT)
Received: by 10.220.61.140 with SMTP id t12mr5292299vch.54.1280840870602;
	Tue, 03 Aug 2010 06:07:50 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id e31sm6814761vbm.7.2010.08.03.06.07.49
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 06:07:49 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 08:07:48 -0500
Message-Id: <1280840868-23058-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,TVD_SPACE_RATIO
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-uboot-scripts: added default boot scripts
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
X-List-Received-Date: Tue, 03 Aug 2010 13:07:55 -0000

Added default boot scripts for the BeagleBoard validation image.
---
 .../beagleboard-validation-boot.cmd                |   15 +++++++++++++++
 .../beagleboard-validation-user.cmd                |   15 +++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
 create mode 100644 recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd

diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
new file mode 100644
index 0000000..1d0f223
--- /dev/null
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
@@ -0,0 +1,15 @@
+setenv dvimode 'hd720'
+setenv vram '16M omapfb.vram=0:8M,1:4M,2:4M'
+if "${beaglerev}" = "AxBx"; then
+setenv mpurate 600
+setenv optargs 'mem=80M@0x80000000 musb_hdrc.fifomode=5'
+elif "${beaglerev}" = "Cx"; then
+setenv mpurate 720
+setenv optargs 'mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5'
+else
+setenv mpurate 1000
+setenv optargs 'mem=80M@0x80000000 mem=384M@0x88000000'
+fi
+run loaduimage
+run mmcboot
+
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
new file mode 100644
index 0000000..0c32ae1
--- /dev/null
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
@@ -0,0 +1,15 @@
+setenv console 'tty0 console=ttyS2,115200n8'
+if "${beaglerev}" = "AxBx"; then
+setenv mpurate 600
+setenv optargs 'mem=80M@0x80000000 musb_hdrc.fifomode=5'
+elif "${beaglerev}" = "Cx"; then
+setenv mpurate 720
+setenv optargs 'mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5'
+else
+setenv mpurate 1000
+setenv optargs 'mem=99M@0x80000000 mem=384M@0x88000000'
+fi
+run loaduimage
+run loadramdisk
+run ramboot
+
-- 
1.5.6.4



