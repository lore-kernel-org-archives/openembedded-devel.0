Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1Q8HSf-0000ev-4J
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 21:35:17 +0200
Received: from mars.fritz.box (p57B40D8C.dip0.t-ipconnect.de [87.180.13.140])
	by mrelayeu.kundenserver.de (node=mreu3) with ESMTP (Nemesis)
	id 0MTact-1QWeYv2Tnb-00SR3F; Fri, 08 Apr 2011 21:33:07 +0200
From: Jan Kobler <eng1@koblersystems.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Apr 2011 21:33:02 +0200
Message-Id: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
X-Mailer: git-send-email 1.7.3.4
X-Provags-ID: V02:K0:6FeQWe5edng5c6KMWoafWP4F9JE5WHmYBmlzt9NBRcJ
	J/vxMt6ChZfqew+GwzquXhI+HnokwAC99WK6wPyLqmT/ps5yOp
	8Cs/mwUb2de5qaZl3boW09hkss3uK4aayXlj1lSrUXVqGO7j1z
	t9D5qfal1kA4waJX5+70oNa+j8Envx9cKg3NkVBG6KgAn21j3B
	ub042fciUJ+jq/rz49Sog==
Subject: [mpc5125-twr 1/2] New machine mpc5125-twr, Freescale TWR-MPC5125-KIT
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
X-List-Received-Date: Fri, 08 Apr 2011 19:35:17 -0000

Freescale Development Kit TWR-MPC5125-KIT

Vendor page:  http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT

The name mpc5125-twr is used by Freescale in the Linux kernel for this board.

Signed-off-by: Jan Kobler <eng1@koblersystems.de>
---
 MAINTAINERS                       |    2 +-
 conf/distro/include/sane-feed.inc |    1 +
 conf/machine/mpc5125-twr.conf     |   27 +++++++++++++++++++++++++++
 contrib/angstrom/sort.sh          |    2 +-
 recipes/linux/linux_2.6.29.bb     |    9 +++++++++
 5 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 conf/machine/mpc5125-twr.conf

diff --git a/MAINTAINERS b/MAINTAINERS
index 45e92d1..c0962cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -141,7 +141,7 @@ Recipes:    net-snmp, ebtables, ethtool, arpwatch, lib*-perl
 Person:     Jan Kobler
 Mail:       eng1@koblersystems.de
 Interests:  embedded systems, powerpc, arm
-Machines:   pcm043
+Machines:   mpc5125-twr, pcm043
 
 Person:     Jan Luebbe
 Mail:       jluebbe@lasnet.de
diff --git a/conf/distro/include/sane-feed.inc b/conf/distro/include/sane-feed.inc
index 70fc7a9..821f5bf 100644
--- a/conf/distro/include/sane-feed.inc
+++ b/conf/distro/include/sane-feed.inc
@@ -156,6 +156,7 @@ FEED_ARCH_storcenter 	= "ppc603e"
 FEED_ARCH_turbostation 	= "ppc603e"
 FEED_ARCH_mpc8313e-rdb 	= "ppce300c3"
 FEED_ARCH_mpc8323e-rdb 	= "ppce300c2"
+FEED_ARCH_mpc5125-twr 	= "ppce300c3"
 
 # strongarm machines, no EABI
 
diff --git a/conf/machine/mpc5125-twr.conf b/conf/machine/mpc5125-twr.conf
new file mode 100644
index 0000000..71432cd
--- /dev/null
+++ b/conf/machine/mpc5125-twr.conf
@@ -0,0 +1,27 @@
+#@TYPE: Machine
+#@Name: Freescale MPC5125-TWR
+#@DESCRIPTION: Machine configuration for Freescale MPC5125-TWR 
+
+# Vendor page: http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT
+
+TARGET_ARCH = "powerpc"
+PACKAGE_EXTRA_ARCHS = "ppc"
+MACHINE_FEATURES                = "kernel26 usbhost ext2"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.29"
+PREFERRED_VERSION_linux-libc-headers = "2.6.29"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyPSC0"
+
+IMAGE_FSTYPES += "tar.gz"
+
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "0x0"
+KERNEL_DEVICETREE_mpc5125-twr = "arch/${ARCH}/boot/dts/mpc5125-twr.dts"
+
+# used by opie-collections.inc
+ROOT_FLASH_SIZE = "32"
+
+require conf/machine/include/tune-ppce300c3.inc
diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index ca13ce2..3a0db52 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -112,7 +112,7 @@ case "$arch" in
 	"ppce300c2")
 			machines="mpc8323e-rdb" ;;
 	"ppce300c3")
-			machines="boc01 mpc8313e-rdb mpc8315e-rdb" ;;
+			machines="boc01 mpc5125-twr mpc8313e-rdb mpc8315e-rdb" ;;
 	"ppce500")
 			machines="tqm8540" ;;
 	"ppce500v2")
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index 2b80884..5d4809b 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -22,6 +22,12 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2;name=k
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.6.bz2;apply=yes;name=stablepatch \
            file://defconfig"
 
+# mpc5125-twr uses linux-2.6.29.1
+SRC_URI_mpc5125-twr = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.1.bz2;apply=yes;name=stablepatch1 \
+           file://defconfig \
+           file://mpc5125-twr.patch"
+
 SRC_URI_append_boc01 = "\
 	file://boc01.dts \
 	file://boc01.dts.v1 \
@@ -91,3 +97,6 @@ SRC_URI[kernel.md5sum] = "64921b5ff5cdadbccfcd3820f03be7d8"
 SRC_URI[kernel.sha256sum] = "58a5ea16d499fe06f90fcbf1d687d1235d2cb9bc28bf979867bd3faadf38fc3f"
 SRC_URI[stablepatch.md5sum] = "0317760b52c9ac7a11de997da19a366e"
 SRC_URI[stablepatch.sha256sum] = "0294d475cbbc6cf43db25e64b92616309086cad6be4ee463f7f4b1d16d285c27"
+# linux patch-2.6.29.1
+SRC_URI[stablepatch1.md5sum] = "87c6fbf4096b644d66d4da8bb00641a5"
+SRC_URI[stablepatch1.sha256sum] = "0c44a41816082602f9d2bd45524d85f6e5fa8e4a6a9a15861048ca2aaf068d8f"
-- 
1.7.3.4



