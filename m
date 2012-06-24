Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SiqBC-0008CJ-BH
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2012 19:00:54 +0200
Received: by pbbrq2 with SMTP id rq2so5346275pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2012 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kYNsEvEvZVsZmEeVWXFvxfpRQOAyuEPSxx6364ZlsJQ=;
	b=w5u+dZqyR6C11u6SvrRCWfzE6fRY7skVo3+ZvDsLvdpyiWxPcUi7QhRjP5qtl/AO0h
	h0staJ29hpG7PHaMldp/CyU/o3YkwmS+yTh1P+uLQcPxO/hX3HzWkU8q40Kt4K6K3MzW
	C7acR81hWGrUkAGQNSDYDPeh1nCEsYH1J8GfiwyfUTW1O7WlWNxS+AxQ09H6qlvJIXbR
	2YD4DXOvhOJ3MJR2t429q3tyCmDiww2EaTPCvaGnpaAn6T1u233DznK60OcgpI2Me/pk
	EW4EWduCTCJF3PJgyBc9n7myt1tsV4bSoQeUwUYr4l1wxTUrs1tQOQwSj+3InSuPWgVy
	nNzg==
Received: by 10.68.228.102 with SMTP id sh6mr31193928pbc.134.1340556603749;
	Sun, 24 Jun 2012 09:50:03 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id hf5sm5771980pbc.4.2012.06.24.09.50.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jun 2012 09:50:02 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2012 18:49:54 +0200
Message-Id: <1340556594-46375-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <y>
References: <y>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] linux-xilinx: Update xilinx linux kernel to v3.3.0.
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
X-List-Received-Date: Sun, 24 Jun 2012 17:00:54 -0000

* Update xilinx linux kernel to v3.3.0.
* Update recipe to use SRCREV_pn-${PN} to set the commit id.
* Refactor recipe and move common definitions to linux-xilinx.inc
* Bump PR.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-kernel/linux/linux-xilinx.inc    |   16 ++++++++++++++++
 recipes-kernel/linux/linux-xilinx_git.bb |   21 +++++++++++----------
 2 files changed, 27 insertions(+), 10 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-xilinx.inc

diff --git a/recipes-kernel/linux/linux-xilinx.inc b/recipes-kernel/linux/linux-xilinx.inc
new file mode 100644
index 0000000..0b92d0e
--- /dev/null
+++ b/recipes-kernel/linux/linux-xilinx.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Linux kernel for Xilinx platforms"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+PROVIDES += "virtual/kernel"
+
+KBRANCH ?= "master"
+
+# Pick up shared functions
+require recipes-kernel/linux/linux-dtb.inc
+
+S = "${WORKDIR}/git"
+
+# extra tasks
diff --git a/recipes-kernel/linux/linux-xilinx_git.bb b/recipes-kernel/linux/linux-xilinx_git.bb
index 845a1b3..0f53de7 100644
--- a/recipes-kernel/linux/linux-xilinx_git.bb
+++ b/recipes-kernel/linux/linux-xilinx_git.bb
@@ -1,20 +1,21 @@
 inherit kernel xilinx-kernel xilinx-utils
-require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/linux-xilinx.inc
 
-DESCRIPTION = "Linux kernel for Xilinx platforms"
-COMPATIBLE_MACHINE = "(virtex4|virtex5|virtex5mb|spartan6-sp605|spartan6-lx9mb)"
+DEFAULT_PREFERENCE = "1"
+
+KBRANCH = "master"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LINUX_VERSION ?= "3.3.0"
+SRCREV_pn-${PN} = "ed63a4d76efadcb68f5776e4244766ffea226cc4"
 
-PR = "r16"
-LINUX_VERSION = "2.6.37.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-SRC_URI = "git://git.xilinx.com/linux-xlnx.git;protocol=git \
+PR = "r17"
+PV = "${LINUX_VERSION}+git-${SRCREV}"
+
+SRC_URI = "git://git.xilinx.com/linux-xlnx.git;protocol=git;branch=${KBRANCH} \
            file://defconfig"
 
 XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
 KERNEL_DEVICETREE = "${@device_tree(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
 KERNEL_DEVICETREE_microblazeel = "${@device_tree(bb.data.getVar('TARGET_CPU', d, 1), d)}"
 
-S = "${WORKDIR}/git"
+COMPATIBLE_MACHINE = "(virtex4|virtex5|virtex5mb|spartan6-sp605|spartan6-lx9mb)"
-- 
1.7.9.5



