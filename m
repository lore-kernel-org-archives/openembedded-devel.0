Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MDw4K-0002BS-KB
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 09:48:29 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKY00H7PNWRU0V0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Jun 2009 02:38:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B565614AF5D; Tue,
	09 Jun 2009 03:38:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 09 Jun 2009 03:38:51 -0400
Message-id: <1244533131-18950-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Subject: [PATCH] u-boot: add support for DaVinci EVMs, provided by a staging tree
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
X-List-Received-Date: Tue, 09 Jun 2009 07:48:33 -0000

This staging tree holds the patches submitted to the upstream U-Boot

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 conf/machine/dm355-evm.conf      |    2 +-
 conf/machine/dm365-evm.conf      |    2 +-
 conf/machine/dm6467-evm.conf     |    2 +-
 conf/machine/include/davinci.inc |    2 +-
 recipes/u-boot/u-boot_git.bb     |   22 +++++++++++++++++-----
 5 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/conf/machine/dm355-evm.conf b/conf/machine/dm355-evm.conf
index d509152..9ef4ff7 100644
--- a/conf/machine/dm355-evm.conf
+++ b/conf/machine/dm355-evm.conf
@@ -4,4 +4,4 @@
 
 require conf/machine/include/davinci.inc
 
-UBOOT_MACHINE = "davinci_dvevm_config"
+UBOOT_MACHINE = "davinci_dm355_evm_config"
diff --git a/conf/machine/dm365-evm.conf b/conf/machine/dm365-evm.conf
index 09f4a35..de2cc4a 100644
--- a/conf/machine/dm365-evm.conf
+++ b/conf/machine/dm365-evm.conf
@@ -4,4 +4,4 @@
 
 require conf/machine/include/davinci.inc
 
-UBOOT_MACHINE = "davinci_dvevm_config"
+UBOOT_MACHINE = "davinci_dm365_evm_config"
diff --git a/conf/machine/dm6467-evm.conf b/conf/machine/dm6467-evm.conf
index 66ed1fe..a7596f1 100644
--- a/conf/machine/dm6467-evm.conf
+++ b/conf/machine/dm6467-evm.conf
@@ -4,4 +4,4 @@
 
 require conf/machine/include/davinci.inc
 
-UBOOT_MACHINE = "davinci_dvevm_config"
+UBOOT_MACHINE = "davinci_dm6467_evm_config"
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 3134c28..af9dc0f 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -9,7 +9,7 @@ KERNEL_IMAGETYPE = "uImage"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
 
-PREFERRED_VERSION_u-boot = "git"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 UBOOT_MACHINE = "davinci_dvevm_config"
 
 UBOOT_ENTRYPOINT = "0x80008000"
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 9f1bd61..12ebcfe 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,13 +1,10 @@
 require u-boot.inc
-PR ="r25"
+PR ="r26"
 
 FILESPATHPKG =. "u-boot-git:"
 
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
 SRCREV_davinci-sffsdr = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
-SRCREV_dm6446-evm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
-SRCREV_dm6467-evm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
-SRCREV_dm355-evm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
 SRCREV_akita = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_spitz = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_c7x0 = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
@@ -38,6 +35,22 @@ SRC_URI_overo = "git://gitorious.org/u-boot-omap3/mainline.git;branch=omap3-dev;
 SRCREV_overo = "2dea1db2a3b7c12ed70bbf8ee50755089c5e5170"
 PV_overo = "2009.03+${PR}+gitr${SRCREV}"
 
+SRC_URI_dm6446-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
+SRCREV_dm6446-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
+PV_dm6446-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
+
+SRC_URI_dm6467-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
+SRCREV_dm6467-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
+PV_dm6467-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
+
+SRC_URI_dm355-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
+SRCREV_dm355-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
+PV_dm355-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
+
+SRC_URI_dm365-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
+SRCREV_dm365-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
+PV_dm365-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
+
 SRC_URI_dm355-leopard = "git://www.denx.de/git/u-boot-arm.git;protocol=git;branch=next \
                         file://leopardboard-support.patch;patch=1 \
 "
@@ -95,4 +108,3 @@ do_deploy_prepend_mini2440() {
 do_deploy_prepend_micro2440() {
 	cp ${S}/u-boot-nand16k.bin ${S}/u-boot.bin
 }
-
-- 
1.6.0.6



