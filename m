Received: from exprod5og109.obsmtp.com ([64.18.0.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpMMZ-0001QX-0Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 14:54:19 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5ej1gACpGO8rNajHPZ9A9IaxNZ4jMBe@postini.com;
	Wed, 10 Mar 2010 05:51:19 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip07.e2k.ad.ge.com with ESMTP; 10 Mar 2010 08:51:14 -0500
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 10 Mar 2010 08:51:14 -0500
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Mar 2010 13:54:25 +0000
Message-ID: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.188
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 13:54:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This patch adds the Freescale P2020DS demo board, which is based on the
p2020 SOC.

Signed-off-by: Martyn Welch <martyn.welch@gefanuc.com>
---

 conf/machine/p2020ds.conf     |   23 +++++++++++++++++++++++
 recipes/linux/linux.inc       |    1 +
 recipes/linux/linux_2.6.33.bb |    5 +++++
 recipes/u-boot/u-boot_git.bb  |    1 +
 4 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/conf/machine/p2020ds.conf b/conf/machine/p2020ds.conf
new file mode 100644
index 0000000..48ab353
--- /dev/null
+++ b/conf/machine/p2020ds.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@Name: P2020ds
+#@DESCRIPTION: Machine configuration for the freescale p2020ds development board
+
+TARGET_ARCH = "powerpc"
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux"
+
+MACHINE_FEATURES = "kernel26 usbhost pci pcmcia ext2 vfat nfs uboot"
+
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "0"
+
+UBOOT_MACHINE = "P2020DS_config"
+
+# Need to create jffs2 images with the correct endianess
+EXTRA_IMAGECMD_jffs2 = " --big-endian -e 0x40000"
+
+#don't try to access tty1
+USE_VT = "0"
+
+#setup serial console on Com1
+SERIAL_CONSOLE = "-L 115200 ttyS0"
diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 6c2ce31..803b856 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE_mpc8313e-rdb = "arch/${ARCH}/boot/dts/mpc8313erdb.dts"
 KERNEL_DEVICETREE_mpc8315e-rdb = "arch/${ARCH}/boot/dts/mpc8315erdb.dts"
 KERNEL_DEVICETREE_mpc8323e-rdb = "arch/${ARCH}/boot/dts/mpc832x_rdb.dts"
 KERNEL_DEVICETREE_sequoia = "arch/${ARCH}/boot/dts/sequoia.dts"
+KERNEL_DEVICETREE_p2020ds = "arch/${ARCH}/boot/dts/p2020ds.dts"
 
 KERNEL_DEVICETREE_FLAGS = "-R 8 -S 0x3000"
 
diff --git a/recipes/linux/linux_2.6.33.bb b/recipes/linux/linux_2.6.33.bb
index 68b4cf0..1cfaaaa 100644
--- a/recipes/linux/linux_2.6.33.bb
+++ b/recipes/linux/linux_2.6.33.bb
@@ -2,9 +2,14 @@ require linux.inc
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_p2020ds = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
            file://defconfig"
 
 SRC_URI[kernel.md5sum] = "c3883760b18d50e8d78819c54d579b00"
 SRC_URI[kernel.sha256sum] = "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5c6"
+
+do_configure_p2020ds() {
+	oe_runmake mpc85xx_defconfig
+}
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index b63edbd..6109561 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -12,6 +12,7 @@ SRCREV_afeb9260 = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
 SRCREV_afeb9260-180 = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
 SRCREV_palmpre = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
 SRCREV_cm-t35 = "3c014f1586d5bfe30dca7549396915c83f31cd30"
+SRCREV_p2020ds = "f20393c5e787b3776c179d20f82a86bda124d651"
 SRC_URI_append_afeb9260 = " file://AFEB9260-network-fix.patch;patch=1"
 SRC_URI_append_afeb9260-180 = " file://AFEB9260-network-fix.patch;patch=1"
 SRC_URI_append_cm-t35 = "file://cm-t35/cm-t35.patch;patch=1"


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


