Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnLyl-0002Cs-5H
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 02:05:32 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o251ACOU017231; 
	Thu, 4 Mar 2010 19:10:12 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o251ACxO017230;
	Thu, 4 Mar 2010 19:10:12 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Mar 2010 19:09:34 -0600
Message-Id: <1267751376-17182-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1267751376-17182-2-git-send-email-aalonso00@gmail.com>
References: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
	<1267751376-17182-2-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] linux-xilinx-ml507_git.bb: new kernel recipe for ml507 devboard
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

* Based on xilinx repos since not all drivers are in mainline kernel tree
* inherit xilinx-bsp for updating harware model changes

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx-ml507_git.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-xilinx-ml507_git.bb

diff --git a/recipes/linux/linux-xilinx-ml507_git.bb b/recipes/linux/linux-xilinx-ml507_git.bb
new file mode 100644
index 0000000..ec9de1c
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



