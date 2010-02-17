Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NhpaY-0007PK-Kb
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:29:38 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o1HJYLsl017091; 
	Wed, 17 Feb 2010 13:34:21 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o1HJYIp8017089;
	Wed, 17 Feb 2010 13:34:18 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2010 13:34:08 -0600
Message-Id: <1266435248-17054-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] xilinx-ml507.conf: fix u-boot config file
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
X-List-Received-Date: Wed, 17 Feb 2010 19:29:39 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-ml507.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
index 6194469..b2448e3 100644
--- a/conf/machine/xilinx-ml507.conf
+++ b/conf/machine/xilinx-ml507.conf
@@ -19,7 +19,7 @@ MACHINE_FEATURES = "kernel26 ext2 usbhost udev"
 MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
 
 UBOOT_ARCH = "ppc"
-UBOOT_MACHINE = "ml507_defconfig"
+UBOOT_MACHINE = "ml507_config"
 
 # Xilinx EDK override hardware  definitions for xilinx-bsp
 # Include in your local.conf
-- 
1.6.6



