Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFB-0007sx-MH
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:35 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2157248fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=oizHX+frkw9/bmuCua2fDeNNW7VXmZ920KQnz4FaOmE=;
	b=W3ETWmgRBRaVVi/qBGY1wVWZHyN+nhvbFYz11T6PZamJRVj52JQ5iGQfPvmLGfli0z
	d07hBwzzIgS+dMdomm59sbivKVZ6ICTYXl7DdDsy8kydzWTvR6bF5G8hFo38swtoMNlC
	Ckoh+eQwfXYsEpN9tmvSCyN39Jtt/X9b9RaLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jX7O+WNBhj5jiK7qmmIRsiZAHd4cHXmbwQsy0UJz0ggB44qFffclR8Mod4xz1puDoQ
	gu3n+r+w1kherdS7uU47+g5PTHjy/KAITVxewlSxTIFKMSJff8GTPVM+ZfVX6S4m2XKr
	0a8CWCAGmzBoA2mnAc4ycj8+Cp1JnIfw/hxw4=
Received: by 10.223.118.11 with SMTP id t11mr7589689faq.51.1280852492539;
	Tue, 03 Aug 2010 09:21:32 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.28
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:31 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:17 -0500
Message-Id: <1280852605-3524-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/11][v2] linux-xilinx: kernel recipe for xilinx virtex platforms
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:35 -0000

* Kernel recipe for generic xilinx platforms
* Inherits xilinx-bsp.bbclass to pass device
  tree for the final target
* v2 reorder patch set

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



