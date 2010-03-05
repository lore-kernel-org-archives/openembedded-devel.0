Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnLyl-0002Ct-5B
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 02:05:33 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o251AB2e017223; 
	Thu, 4 Mar 2010 19:10:12 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o251A6md017221;
	Thu, 4 Mar 2010 19:10:06 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Mar 2010 19:09:32 -0600
Message-Id: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] xilinx-ml507.conf: fix several options
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
X-List-Received-Date: Fri, 05 Mar 2010 01:05:33 -0000

* Fix u-boot entry and load address
* Prefered kernel based on xilinx repos, not all drivers in mainline tree
* Add device nodes for system ace

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-ml507.conf |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
index b2448e3..693f904 100644
--- a/conf/machine/xilinx-ml507.conf
+++ b/conf/machine/xilinx-ml507.conf
@@ -11,15 +11,18 @@ TARGET_FPU = "soft"
 require conf/machine/include/tune-ppc440.inc
 
 #ASSUME_PROVIDED += "virtual/kernel"
-PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-ml507"
 
 KERNEL_IMAGETYPE = "uImage"
 
-MACHINE_FEATURES = "kernel26 ext2 usbhost udev"
+MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
 MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
 
 UBOOT_ARCH = "ppc"
 UBOOT_MACHINE = "ml507_config"
+UBOOT_ENTRYPOINT ?= "0x00000000"
+UBOOT_LOADADDRESS ?= "0x00000000"
+PREFERRED_VERSION_u-boot_xilinx-ml507 = "git"
 
 # Xilinx EDK override hardware  definitions for xilinx-bsp
 # Include in your local.conf
@@ -30,4 +33,6 @@ UBOOT_MACHINE = "ml507_config"
 USE_VT = "0"
 SERIAL_CONSOLE = "9600 ttyS0"
 
-
+# Device nodes add xsa for (system ace)
+IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
+                       files/device_table_add-xsa.txt"
-- 
1.6.6.1



