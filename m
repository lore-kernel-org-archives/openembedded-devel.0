Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2p7D-0003HZ-Tc
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 19:14:04 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 981DEE96AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:10:35 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 13:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=y2qBl9LSpPzRrSP1QUWkylyxEwo=;
	b=WV2gC6S2dYgEylh42sY52Q21mVTe+UntGfI/yCRnw8SkkPCGMYG5KZjoCnrtm08BP/roD0yJ1uFWMBCDwnqWiTdlLkihmQnfXkKZ6Q/afKegS36zqkOYZinfmPmHiEIzRcR8T7Mne951WVgOpN3PKw5rzNJIk0UcAnu82lH6sQw=
X-Sasl-enc: /dmZFyCDpEd29FJ0+YLtVy+G6SJ8Cy4nzQTpoaJHd57y 1271437835
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 05AC84A771B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:10:34 -0400 (EDT)
Date: Fri, 16 Apr 2010 19:10:33 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004161904380.13411@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1004161910120.13411@vitus.devnet.local>
References: <alpine.DEB.1.10.1004161904380.13411@vitus.devnet.local>
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
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] bluepro: add machine configuration for TQ BluePro
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
X-List-Received-Date: Fri, 16 Apr 2010 17:14:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/machine/bluepro.conf |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/bluepro.conf

diff --git a/conf/machine/bluepro.conf b/conf/machine/bluepro.conf
new file mode 100644
index 0000000..e9d928c
--- /dev/null
+++ b/conf/machine/bluepro.conf
@@ -0,0 +1,28 @@
+#@TYPE: Machine
+#@NAME: TQ Components' BluePro
+#@DESCRIPTION: Blue IPC Series
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
+#PREFERRED_VERSION_linux = "2.6.32"
+PREFERRED_VERSION_linux-libc-headers = "2.6.32"
+
+# don't try to access tty1 (used for application code)
+USE_VT = "0"
+
+SERIAL_CONSOLE = "115200 ttyPSC0"
+KERNEL_DEVICETREE_tb5200l = "arch/${ARCH}/boot/dts/tqm5200.dts"
+EXTRA_IMAGECMD_jffs2 = "--big-endian -e 0x20000"
+
+# BluePro carries kernel in separate flash partition
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*;"
+
+require conf/machine/include/tune-ppc603e.inc
-- 
1.5.6.5



