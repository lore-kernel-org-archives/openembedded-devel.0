Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S0KSV-0001Vz-I1
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 23:14:47 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp206.alice.it (8.6.023.02)
	id 4F1836AD0464EBC0; Wed, 22 Feb 2012 23:06:27 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 23:05:32 +0100
Message-Id: <1329948332-4238-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] kexecboot_cfg: add missing default OE icon.xpm
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
X-List-Received-Date: Wed, 22 Feb 2012 22:14:47 -0000

* while there do minor cleanings wrt DISTRO vars:
* remove ${@base_conditional('DISTRO_TYPE',...
* fix label of second kernel stanza
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm   |   43 ++++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb     |    6 +-
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
new file mode 100644
index 0000000..6e6fd77
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
@@ -0,0 +1,43 @@
+/* XPM */
+static char * icon_xpm[] = {
+"32 32 8 1",
+" 	c None",
+".	c #D6DBDE",
+"+	c #9BA6AE",
+"@	c #60727D",
+"#	c #B8BFC5",
+"$	c #A9E8F6",
+"%	c #12BCE4",
+"&	c #57D2EC",
+"                                ",
+"                                ",
+"                                ",
+"           .++@@@@++.           ",
+"         +@@@@@@@@@@@@+         ",
+"       #@@@@@@@@@@@@@@@@#       ",
+"      +@@@@@@@@@@@@@@@@@@+      ",
+"    .@@@@@@@@++##+@@@@@@@@@.    ",
+"    @@@@@@@.        .@@@@@@@    ",
+"   +@@@@@+    $$$$    #@@@@@+   ",
+"  #@@@@@.  $%%%%%%%%$  .@@@@@#  ",
+"  @@@@@.  &%%%%%%%%%%&  .@@@@@  ",
+" #@@@@+  %%%%%%%%%%%%%%  +@@@@# ",
+" @@@@@  &%%%%%%%%%%%%%%&  @@@@@ ",
+".@@@@. $%%%%%&   $%%%%%&  .@@@@.",
+"+@@@@  %%%%%    $%%%%%&    @@@@+",
+"+@@@+  %%%%$   $%%%%%&  $$ +@@@+",
+"@@@@+ $%%%%   $%%%%%&  $%$ +@@@@",
+"@@@@# &%%%&   &%%%%&  $%%& #@@@@",
+"@@@@. &%%%&   %%%%&  $%%%& .@@@@",
+"@@@@# $%%%&   &%%&   &%%%$ #@@@@",
+"+@@@+ $%%%%          %%%%$ +@@@+",
+"+@@@@  %%%%&        &%%%%  @@@@+",
+"#@@@@  &%%%%&      &%%%%&  @@@@#",
+" @@@@+  %%%%%%&$$&%%%%%%  +@@@@ ",
+" +@@@@. $%%%%%%%%%%%%%%$ .@@@@+ ",
+" .@@@@@  $%%%%%%%%%%%%$  @@@@@. ",
+"  #++++.   &%%%%%%%%&   .++++#  ",
+"            $&&%%&&$            ",
+"                                ",
+"                                ",
+"                                "};
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index 84c1116..4dca06c 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -3,14 +3,14 @@ SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r13"
+PR = "r14"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://icon.xpm"
 
 CMDLINE ?= ""
-CMDLINE_DEBUG ?= "${@base_conditional('DISTRO_TYPE', 'release', 'quiet', 'debug',d)}"
+CMDLINE_DEBUG ?= "quiet"
 
 # Note: for qvga the label is currently limited to about 24 chars
 KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VERSION', True)}-${MACHINE}"
@@ -45,7 +45,7 @@ APPEND=${CMDLINE} ${CMDLINE_DEBUG}
 #
 # Second kernel stanza.
 # KERNEL=/boot/${KERNEL_IMAGETYPE}-test
-# LABEL=${DISTRO}-${MACHINE}-test
+# LABEL=${KEXECBOOT_LABEL}-test
 # APPEND=${CMDLINE}
 #' >> ${S}/boot.cfg
 }
-- 
1.7.3.4



