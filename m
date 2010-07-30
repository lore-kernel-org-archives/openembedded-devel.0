Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oerhu-0001D6-Cg
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:16 +0200
Received: by wwb34 with SMTP id 34so23251wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=98/o11vObIdjxwW2QbQBCXhg7rHiA9HNnzr/G0FRI7E=;
	b=UbMEBIvmUVoqJZICgeOlmJMAvwDofxc/xoQyhlqNNryIxO006ZPW5JmOo4I+9LusgB
	4WQaY8Mi6i3vhlKnX199z3y1kMgdcMuCsmTXJ0TRyjw39zwI2d7kN+IW90IF797Mh718
	mr5gimpGTLReRFl6vCeLR02aONMVPESI8MLf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c/mB4Hz+Wg0t8H+g+zH4K5q5aVLZn8T5KR8KDYUOW0yxrSZP8GwbySmCZNvxkjOsct
	Nz4A/gPa/IN4q61pVWJa9Va0a1uJrmIcnpmc86sLapomb7EKplGc51rLDtQlJkdlhFnr
	YyI0rBcY0YZkDqQqfuj3qworoHyzqAhIYGJdw=
Received: by 10.227.94.138 with SMTP id z10mr1872569wbm.166.1280504448826;
	Fri, 30 Jul 2010 08:40:48 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.46
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:48 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:30 -0500
Message-Id: <1280504555-3633-5-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/10] linux-xilinx: new kernel recipe
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:17 -0000

* Kernel recipe for generic xilinx platforms
* Inherits xilinx-bsp.bbclass to pass device
  tree for the final arch

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx_git.bb |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-xilinx_git.bb

diff --git a/recipes/linux/linux-xilinx_git.bb b/recipes/linux/linux-xilinx_git.bb
new file mode 100644
index 0000000..6f6d5a5
--- /dev/null
+++ b/recipes/linux/linux-xilinx_git.bb
@@ -0,0 +1,35 @@
+require linux.inc
+
+DESCRIPTION = "Linux kernel for Xilinx platforms"
+
+COMPATIBLE_MACHINE = "xilinx-virtex4|xilinx-virtex5|xilinx-mb-gen"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_xilinx-virtex4 = "1"
+DEFAULT_PREFERENCE_xilinx-virtex5 = "1"
+DEFAULT_PREFERENCE_xilinx-mb-gen = "1"
+
+PV = "2.6.33+git"
+PR = "r0"
+
+SRCREV = "17431547113100a3ae0a622b9f76ad17fb76eb56"
+SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
+           file://xilinxfb-update-tft-comp.patch \
+	    file://defconfig"
+
+PV_xilinx-mb-gen = "2.6.34+git"
+SRCREV_xilinx-mb-gen = "382e23534109197daddbcbcdf5aae75c674638e7"
+SRC_URI_xilinx-mb-gen = "git://developer.petalogix.com/linux-2.6-microblaze.git;protocol=git \
+                       file://defconfig"
+
+inherit kernel xilinx-bsp
+
+TARGET_BOARD = "${@map_target(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+KERNEL_DEVICETREE_xilinx-virtex4 = "arch/${ARCH}/boot/dts/virtex${TARGET_BOARD}.dts"
+KERNEL_DEVICETREE_xilinx-virtex5 = "arch/${ARCH}/boot/dts/virtex${TARGET_BOARD}.dts"
+KERNEL_DEVICETREE_xilinx-mb-gen = "arch/${ARCH}/platform/generic/${TARGET_BOARD}.dts"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+}
-- 
1.7.2



