Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ634-0007aO-Tv
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 16:33:03 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 16:28:44 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 16:28:44 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 16:28:43 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ5ys-0002yQ-WD; Mon, 31 May 2010 16:28:43 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 16:28:40 +0200
Message-Id: <1275316120-11406-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <hu05te$c6i$1@dough.gmane.org>
References: <hu05te$c6i$1@dough.gmane.org>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 14:28:44.0062 (UTC)
	FILETIME=[92C12BE0:01CB00CD]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 07/12 v2] motorola-ezx-base.inc: refresh machine definition
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
X-List-Received-Date: Mon, 31 May 2010 14:33:03 -0000

Reorder sections to a more logic scheme, following magician.conf, other
cleanups:

 * sort MACHINE_FEATURES alphabetically
 * add ezx-gen-blob to EXTRA_IMAGEDEPENDS
 * use MODUTILS=26
 * Add needed kernel modules for BP

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---

Changes since v1:

Drop the IMAGE_DEV_MANAGER = "" bit, as Koen remarked this belongs to
image not machine.

Regards,
   Antonio

 conf/machine/include/motorola-ezx-base.inc |   43 +++++++++++++++++----------
 1 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 9ad2f14..3fb42f4 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -1,7 +1,16 @@
+# use this for overrides
+MACHINE_CLASS = "motorola-ezx"
+
+#
+# Hardware-based properties
+#
 TARGET_ARCH = "arm"
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
+# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
+require conf/machine/include/tune-xscale.inc
+
+# Uncomment this to use iwmmxt optimizations. Remove the above xscale stuff first
+#require conf/machine/include/tune-iwmmxt.inc
 
 #cat /proc/mtd
 #dev:    size   erasesize  name
@@ -10,34 +19,36 @@ PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
 #mtd2: 00580000 00020000 "VFM_Filesystem"
 #mtd3: 00020000 00020000 "Logo"
 
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa bluetooth usbgadget usbhost keyboard screen phone"
-MACHINE_FEATURES += " iwmmxt"
-
+ROOT_FLASH_SIZE = "24"
+MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "180"
+MACHINE_FEATURES = "alsa apm bluetooth kernel26 keyboard phone screen touchscreen usbgadget usbhost vfat"
+MACHINE_FEATURES += " iwmmxt"
 
-# use this for overrides
-MACHINE_CLASS = "motorola-ezx"
-
+#
+# Software/packages selection
+#
+PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
+MODUTILS = "26"	
 XSERVER = "xserver-kdrive-fbdev"
-
-ROOT_FLASH_SIZE = "24"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
 
 IMAGE_FSTYPES ?= "jffs2"
 EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
 
-EXTRA_IMAGEDEPENDS += "ezx-boot-usb-native"
+EXTRA_IMAGEDEPENDS += "ezx-boot-usb-native ezx-gen-blob"
 
-# the EZX phones need a userspace daemon to stop the BP from shutting down the phone
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "ezxd"
+IMAGE_INSTALL_append += "\
+  kernel-module-ohci-hcd \
+  kernel-module-moto-usb-ipc \
+  kernel-module-ts27010mux \
+"
 
 # Ezxd needs to be started very early so we need the mux devices in static /dev
 IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
                        files/device_table-ezx.txt"
 
-# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
-require conf/machine/include/tune-xscale.inc
-
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.1



