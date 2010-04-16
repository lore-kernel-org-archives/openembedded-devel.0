Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2oou-0006qL-7R
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 18:55:10 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id B4530EA972
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:51:39 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 12:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=/pUsoLcuImE9vlPZmn7Cjo6/gH8=;
	b=Q6krWfbD5aWJauMi68qn3wEHmT24nEgtVsIFo5U47KLnlldC93iT5BEoHXSc7dfMD2p5+1ezwcT1hp5CcIchBkfP3Gkn5hHvx+Oay44xjOMsGx58pNAJjVSPeeipoGcY+CCrkOGLOQXBIt72KG03tuNa/AXoKIsHuv4R0Geo9zk=
X-Sasl-enc: u84q5K8zQZ4LsVPrW+hl4k+s1XzT6grUD4P9G7AHXssC 1271436699
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 2AFF849AEB2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:51:39 -0400 (EDT)
Date: Fri, 16 Apr 2010 18:51:37 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.DEB.1.10.1004161850310.13187@vitus.devnet.local>
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] tb5200l: add machine configuration for TQ TB5200L 'tinyBox'
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
X-List-Received-Date: Fri, 16 Apr 2010 16:55:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

[PATCH 1/5] tb5200l: add machine configuration for TQ TB5200L 'tinyBox'

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/machine/tb5200l.conf |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/tb5200l.conf

diff --git a/conf/machine/tb5200l.conf b/conf/machine/tb5200l.conf
new file mode 100644
index 0000000..5601397
--- /dev/null
+++ b/conf/machine/tb5200l.conf
@@ -0,0 +1,28 @@
+#@TYPE: Machine
+#@NAME: TQ Components' Tiny Box TB5200L
+#@DESCRIPTION: Mini industrial control
+
+TARGET_ARCH = "powerpc"
+PACKAGE_EXTRA_ARCHS = "ppc"
+
+MACHINE_FEATURES                = "kernel26 usbhost ext2"
+MACHINE_TASK_PROVIDER           = "task-base"
+MACHINE_EXTRA_RRECOMMENDS       = "u-boot-utils iproute2 canutils"
+
+USE_DEVFS = "0"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.32"
+PREFERRED_VERSION_linux-libc-headers = "2.6.32"
+
+# don't try to access tty1 (used for application code)
+USE_VT = "0"
+
+SERIAL_CONSOLE = "115200 ttyPSC0"
+KERNEL_DEVICETREE_tb5200l = "arch/${ARCH}/boot/dts/tqm5200.dts"
+EXTRA_IMAGECMD_jffs2 = "--big-endian -e 0x20000"
+
+# TB5200L carries kernel in separate flash partition
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*"
+
+require conf/machine/include/tune-ppc603e.inc
-- 
1.5.6.5



