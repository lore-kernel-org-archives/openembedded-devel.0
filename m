Received: from [148.204.65.239] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NsggZ-0005we-Mg
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 19:12:49 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o2JHHomL025844; 
	Fri, 19 Mar 2010 11:17:50 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o2JHHnZw025842;
	Fri, 19 Mar 2010 11:17:49 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 11:17:29 -0600
Message-Id: <1269019049-25807-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 148.204.65.239
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot_git.bb: add xilinx-ml507 support
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
X-List-Received-Date: Fri, 19 Mar 2010 18:12:49 -0000

* Based on xilinx official repos
* If a hardware project dir is set in local.conf XILINX_BSP_PATH
* it will over write xparameters header and append some canonical
* definitions. It also install u-boot elf executable for bare metal
* execution, early development stages.

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/u-boot/u-boot_git.bb |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index e8570e6..f2ea968 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r42"
+PR ="r43"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -193,6 +193,9 @@ SRC_URI_append_c7x0 = "file://pdaXrom-u-boot.patch;patch=1 \
 SRC_URI_sheevaplug = "git://git.denx.de/u-boot-marvell.git;protocol=git;branch=testing"
 SRCREV_sheevaplug = "119b9942da2e450d4e525fc004208dd7f7d062e0"
 
+SRC_URI_xilinx-ml507 = "git://git.xilinx.com/u-boot-xlnx.git;protocol=git"
+SRCREV_xilinx-ml507 = "26e999650cf77c16f33c580abaadab2532f5e8b2"
+
 S = "${WORKDIR}/git"
 
 
@@ -223,3 +226,22 @@ do_deploy_prepend_mini2440() {
 do_deploy_prepend_micro2440() {
 	cp ${S}/u-boot-nand16k.bin ${S}/u-boot.bin
 }
+
+do_configure_prepend_xilinx-ml507() {
+if [ -e ${XILINX_BSP_PATH}/ppc440_0/include/xparameters.h ]; then
+    oenote "Replacing device definitions"    
+    cp ${XILINX_BSP_PATH}/ppc440_0/include/xparameters.h \
+    ${S}/board/xilinx/ml507
+    oenote "Append canonical definitions"
+    echo "#define XPAR_PLB_CLOCK_FREQ_HZ XPAR_CPU_PPC440_MPLB_FREQ_HZ
+#define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_PPC440_CORE_CLOCK_FREQ_HZ
+#define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> ${S}/board/xilinx/ml507/xparameters.h
+fi
+}
+
+do_deploy_prepend_xilinx-ml507() {
+if [ -d ${XILINX_BSP_PATH} ]; then
+    oenote "Installing u-boot elf image in bsp path"
+    install ${S}/u-boot ${XILINX_BSP_PATH}/u-boot
+fi
+}
-- 
1.6.6.1



