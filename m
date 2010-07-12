Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0b-0004Nv-BT
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:47 +0200
Received: by pwi10 with SMTP id 10so2330627pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WvcLlULmWC73N5P5nNZVomR25K6D5RwiZQ/ce7E3axw=;
	b=d3mu3GcYT5mRw3cXbCVmgsaas+d14KPkHaUq+ar/xGOuJekF4+lFIcqymzWnnKcsOd
	7p/fprb9MkU4PAM+Ub2Kd0k57pa9qx3l7PDml1jyMIJ7jvwNPCdHByVf+3Dum5VdbrkJ
	q3pPBXlUS7hGLQVGQckItL/ROK3Hl06hZYaE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SU5QT3U92mEMP0y4ycID82Gub2o9/I2ONZXaFXQ9nILBkl/GzPiWqP51rvd22P8qvP
	wSNgNoEf26Dw/oFVk/q+SBJWBsf8fTjc7eFC60VPEbc2DjtSgTBkCHsfQdoKejQ4mExE
	PmyT8Ntu7Is1/NFBt54qMXx+EYav+zmEAa5Qg=
Received: by 10.142.127.9 with SMTP id z9mr1269926wfc.260.1278963885330;
	Mon, 12 Jul 2010 12:44:45 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.43
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:44 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:45 -0500
Message-Id: <1278963950-2587-4-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/9] xilinx-linux: new kernel recipe
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:47 -0000

* Kernel recipe for generic xilinx platforms
* Inherits xilinx-bsp.bbclass to pass device
  tree for the final arch

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx_git.bb |   35 ++++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-xilinx_git.bb

diff --git a/recipes/linux/linux-xilinx_git.bb b/recipes/linux/linux-xilinx_git.bb
new file mode 100644
index 0000000..a637c35
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
+           file://xilinxfb.c-update-tft-comp.patch \
+		   file://defconfig"
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
1.7.1.1



