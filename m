Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYnxF-0001ok-3E
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 00:27:59 +0200
Received: by pvg13 with SMTP id 13so2908815pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 15:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=2Xi8wC0JYtdkEFACm1fFMj9ZuUd7FAqh67B9W/EvYHA=;
	b=pz1ld+hmppeUPdWBdL3xsNr4qRmCD9EM+ScSAcBHa2o3qaHQHRtTBFoN5Dg7/SMTX8
	vI6w1tayPKRYzi03Uk7nAN/iPBM+/T2dNNSjh+FHgpeT18H3al9ZqmzI6J7/Ebm7vUL0
	qp7lE0Z+voabwaNotfvcFr6bKqcj3YFgsEGF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Z27V5aqrsSde/JIHY+84b+MnqDmRUkR1YkiHVrBAzT18uLPWPXKEmjVzYcJ/QQas45
	je8/gRZzUWl7dTk8ZLJh6B55WcDuFvRjeBtimQKIDrUN77qBNwp6yXnxN1wpZXKf1ubm
	XBSiIiSvmH65V8/l6SfmYh8On5pcscitMXPEU=
Received: by 10.142.166.6 with SMTP id o6mr3474804wfe.22.1279060071287;
	Tue, 13 Jul 2010 15:27:51 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id g37sm6348269rvb.17.2010.07.13.15.27.49
	(version=SSLv3 cipher=RC4-MD5); Tue, 13 Jul 2010 15:27:50 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 17:29:00 -0500
Message-Id: <1279060140-17856-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3 v2] linux-xilinx: new kernel recipe
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
X-List-Received-Date: Tue, 13 Jul 2010 22:27:59 -0000

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
index 0000000..2a17c85
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



