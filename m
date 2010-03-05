Received: from [148.204.64.197] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnhRK-00061f-HX
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 01:00:23 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o25NFTED014761; 
	Fri, 5 Mar 2010 17:15:29 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o25NFSCc014760;
	Fri, 5 Mar 2010 17:15:28 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 17:15:15 -0600
Message-Id: <1267830919-14718-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1267830919-14718-2-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-2-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.64.197
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/7] linux-xilinx-ml507_git: new kernel recipe for xilinx ml507
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
X-List-Received-Date: Sat, 06 Mar 2010 00:00:23 -0000

* Based on the oficial xilinx repo since not all drivers are in the
* mainline kernel tree
* Make use off the xilinx-bsp bbclass to override device tree descriptor

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx-ml507_git.bb |   24 ++++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-xilinx-ml507_git.bb

diff --git a/recipes/linux/linux-xilinx-ml507_git.bb b/recipes/linux/linux-xilinx-ml507_git.bb
new file mode 100644
index 0000000..2cbe689
--- /dev/null
+++ b/recipes/linux/linux-xilinx-ml507_git.bb
@@ -0,0 +1,23 @@
+require linux.inc
+
+DESCRIPTION = "Linux kernel for Xilinx ml507 platform"
+KERNEL_RELEASE = "2.6.32+git"
+
+COMPATIBLE_MACHINE = "xilinx-ml507"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_xilinx-ml507 = "1"
+
+PV = "${KERNEL_RELEASE}"
+PR = "r0"
+
+SRCREV = "dc53725d22405e384b984d222542f526eaa9b829"
+SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
+           file://defconfig"
+
+inherit kernel xilinx-bsp
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+}
-- 
1.6.6.1



