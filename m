Received: from [148.204.65.239] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NtlHI-0003dS-HX
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 18:19:06 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o2MHOvZr002972; 
	Mon, 22 Mar 2010 11:24:57 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o2MHOuOt002970;
	Mon, 22 Mar 2010 11:24:56 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 11:24:53 -0600
Message-Id: <1269278693-2935-1-git-send-email-aalonso00@gmail.com>
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
Subject: [PATCH v2] u-boot_git.bb: add xilinx ml507 support
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
X-List-Received-Date: Mon, 22 Mar 2010 17:19:06 -0000

* Based on xilinx official repos
* If a hardware project dir is set in local.conf XILINX_BSP_PATH
* it will over write xparameters header and append some canonical
* definitions. It also install u-boot elf executable for bare metal
* execution, early development stages.

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/u-boot/u-boot_git.bb |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index fb81caf..928642d 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r42"
+PR ="r43"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -207,6 +207,9 @@ SRC_URI_append_c7x0 = "file://pdaXrom-u-boot.patch;patch=1 \
 SRC_URI_sheevaplug = "git://git.denx.de/u-boot-marvell.git;protocol=git;branch=testing"
 SRCREV_sheevaplug = "119b9942da2e450d4e525fc004208dd7f7d062e0"
 
+SRC_URI_xilinx-ml507 = "git://git.xilinx.com/u-boot-xlnx.git;protocol=git"
+SRCREV_xilinx-ml507 = "26e999650cf77c16f33c580abaadab2532f5e8b2"
+
 S = "${WORKDIR}/git"
 
 
@@ -237,3 +240,19 @@ do_deploy_prepend_mini2440() {
 do_deploy_prepend_micro2440() {
 	cp ${S}/u-boot-nand16k.bin ${S}/u-boot.bin
 }
+
+do_configure_prepend_xilinx-ml507() {
+if [ -e "${XILINX_BSP_PATH}/ppc440_0/include/xparameters.h" ]; then
+    cp ${XILINX_BSP_PATH}/ppc440_0/include/xparameters.h \
+    ${S}/board/xilinx/ml507
+    echo "#define XPAR_PLB_CLOCK_FREQ_HZ XPAR_CPU_PPC440_MPLB_FREQ_HZ
+#define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_PPC440_CORE_CLOCK_FREQ_HZ
+#define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> ${S}/board/xilinx/ml507/xparameters.h
+fi
+}
+
+do_deploy_prepend_xilinx-ml507() {
+if [ -d "${XILINX_BSP_PATH}" ]; then
+    install ${S}/u-boot ${XILINX_BSP_PATH}
+fi
+}
-- 
1.6.6.1



