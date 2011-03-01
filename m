Received: from moutng.kundenserver.de ([212.227.126.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1PuPQa-00050u-Cr
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 14:15:48 +0100
Received: from mars.fritz.box (p57B40837.dip0.t-ipconnect.de [87.180.8.55])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0LfWo9-1QN7JH3fPV-00ofrO; Tue, 01 Mar 2011 14:01:43 +0100
From: Jan Kobler <eng1@koblersystems.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 14:01:37 +0100
Message-Id: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
X-Mailer: git-send-email 1.7.3.4
X-Provags-ID: V02:K0:p/eiu3FSvQOp9b2P+dwm2n8eVrysQv1oVGOobrE2cIs
	Oo+y1luf4mf+gMmVxZcwTGlh9gG9MiVs0brG8vi9VYZBsLvdZO
	hcr2108am281UuwsNYNjxXAH/9cxe33ovOza2WchSDP4qQa+dJ
	5rg210eZHy8kECfuMwTZV1LQKWA7+pCgPTr3JTVHQNBQmThOYY
	aIjdGkDnPTvRVfxoZmD7g==
Subject: [pcm043 1/2] New machine pcm043 Phytec phyCORE-i.MX35
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
X-List-Received-Date: Tue, 01 Mar 2011 13:15:48 -0000

The new machine pcm043 is the board Phytec phyCORE-i.MX35.

The machine name pcm043 is chosen, because it is already used in the linux kernel
for this board.
 
BSP is derived from BSP of machine mx31ads.
Linux kernel is based on Phytec Linux BSP for phyCORE-i.MX35 PD 10.1.1

Vendor page: http://www.phytec.com/products/rdk/ARM-XScale/phyCORE-ARM11-i.MX35.html

Tutorial: http://en.gentoo-wiki.com/wiki/Phytec_phyCORE-iMX35/Openembedded

Signed-off-by: Jan Kobler <eng1@koblersystems.de>
---
 MAINTAINERS                              |    5 ++
 conf/distro/include/sane-feed.inc        |    1 +
 conf/machine/pcm043.conf                 |   25 ++++++++
 contrib/angstrom/sort.sh                 |    2 +-
 contrib/feed-browser/includes/config.inc |    5 ++
 recipes/clutter/clutter.inc              |    5 ++
 recipes/images/illume-image.bb           |    1 +
 recipes/linux/linux_2.6.31.bb            |   89 ++++++++++++++++++++++++++++++
 8 files changed, 132 insertions(+), 1 deletions(-)
 create mode 100644 conf/machine/pcm043.conf

diff --git a/MAINTAINERS b/MAINTAINERS
index 096e766..45e92d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -138,6 +138,11 @@ Recipes:    quagga, iputils, ndic6, hping2, lilo-sh, conserver, ipsec-tools,
 Recipes:    lilo-sh, clamav, havp, p3scan, clamsmtp, librsync, rdiff-backup,
 Recipes:    net-snmp, ebtables, ethtool, arpwatch, lib*-perl
 
+Person:     Jan Kobler
+Mail:       eng1@koblersystems.de
+Interests:  embedded systems, powerpc, arm
+Machines:   pcm043
+
 Person:     Jan Luebbe
 Mail:       jluebbe@lasnet.de
 Website:    http://sicherheitsschwankung.de
diff --git a/conf/distro/include/sane-feed.inc b/conf/distro/include/sane-feed.inc
index 873972f..70fc7a9 100644
--- a/conf/distro/include/sane-feed.inc
+++ b/conf/distro/include/sane-feed.inc
@@ -119,6 +119,7 @@ FEED_ARCH_mx31moboard	= "armv6"
 FEED_ARCH_nokia800	= "armv6"
 FEED_ARCH_omap2420h4	= "armv6"
 FEED_ARCH_omap2430sdp   = "armv6"
+FEED_ARCH_pcm043 	= "armv6"
 
 # i486 machines
 FEED_ARCH_geodegx 	= "i486"
diff --git a/conf/machine/pcm043.conf b/conf/machine/pcm043.conf
new file mode 100644
index 0000000..fdf2f0e
--- /dev/null
+++ b/conf/machine/pcm043.conf
@@ -0,0 +1,25 @@
+#@TYPE: Machine
+#@Name: Phytec phyCORE-i.MX35
+#@DESCRIPTION: Machine configuration for Phytec phyCORE-i.MX35 
+
+TARGET_ARCH = "arm"
+
+MACHINE_FEATURES = "kernel26 apm alsa ext2 pcmcia usbhost usbgadget touchscreen"
+
+GUI_MACHINE_CLASS = "smallscreen"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+
+require conf/machine/include/tune-arm1136jf-s.inc
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttymxc0"
+
+# used by opie-collections.inc
+ROOT_FLASH_SIZE = "32"
+
+IMAGE_FSTYPES += "tar.gz"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ENTRYPOINT = "0x80008000"
diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index 893d928..225ca08 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -75,7 +75,7 @@ case "$arch" in
 	"armv5teb")
 			machines="fsg3be ixp4xxbe nslu2be" ;;
 	"armv6")
-			machines="bug iphone mx31ads mx31moboard mini6410 nokia800 omap2420h4 omap2430sdp smartq5 smartqv7 smdk6410" ;;
+			machines="bug iphone mx31ads mx31moboard mini6410 nokia800 omap2420h4 omap2430sdp pcm043 smartq5 smartqv7 smdk6410" ;;
 	"armv6-novfp")
 			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
 	"armv7a")
diff --git a/contrib/feed-browser/includes/config.inc b/contrib/feed-browser/includes/config.inc
index 341ba87..667fcc6 100644
--- a/contrib/feed-browser/includes/config.inc
+++ b/contrib/feed-browser/includes/config.inc
@@ -245,6 +245,11 @@ $feeds = array(
 			),
 
 			array(
+				'name'=>'Phytec phyCORE-i.MX35',
+				'url'=>'armv6/machine/pcm043',
+			),
+
+			array(
 				'name'=>'Tyan thunder K7 s2462 mainboard (guinness)',
 				'url'=>'i686/machine/guinness',
 			),
diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index 7f3324b..b5f630e 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -41,6 +41,11 @@ EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
 PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
 LDFLAGS_append_mx31ads = " -lpvrNULLWSEGL -lstdc++ "
 
+DEPENDS_pcm043 = "${STDDEPENDS} libgles-mx31 tslib"
+EXTRA_OECONF_pcm043 = "${BASE_CONF} --with-flavour=eglnative"
+PACKAGE_ARCH_pcm043 = "${MACHINE_ARCH}"
+LDFLAGS_append_pcm043 = " -lpvrNULLWSEGL -lstdc++ "
+
 INC_PR = "r3"
 
 inherit autotools pkgconfig gtk-doc
diff --git a/recipes/images/illume-image.bb b/recipes/images/illume-image.bb
index 7e16c93..e01ef27 100644
--- a/recipes/images/illume-image.bb
+++ b/recipes/images/illume-image.bb
@@ -122,6 +122,7 @@ GLES_INSTALL_append_omap3evm     = "libgles-omap3"
 #GLES_INSTALL_append_overo        = "libgles-omap3"
 GLES_INSTALL_append_mx31ads      = "libgles-mx31"
 GLES_INSTALL_append_mx31litekit  = "libgles-mx31"
+GLES_INSTALL_append_pcm043      = "libgles-mx31"
 GLES_INSTALL_append_zylonite     = "libgles-zylonite"
 
 # python
diff --git a/recipes/linux/linux_2.6.31.bb b/recipes/linux/linux_2.6.31.bb
index 8dc0f4b..c7448f4 100644
--- a/recipes/linux/linux_2.6.31.bb
+++ b/recipes/linux/linux_2.6.31.bb
@@ -15,6 +15,7 @@ DEFAULT_PREFERENCE_iei-nanogx-466 = "1"
 DEFAULT_PREFERENCE_cm-x300 = "1"
 DEFAULT_PREFERENCE_babbage = "1"
 DEFAULT_PREFERENCE_mx25-3stack = "1"
+DEFAULT_PREFERENCE_pcm043 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.12.bz2;apply=yes;name=stablepatch \
@@ -83,6 +84,94 @@ SRC_URI_append_mx25-3stack = " \
            file://defconfig \
            "
 
+SRC_URI_append_pcm043 = "  \
+	file://0001-spi-add-SPI-driver-for-most-known-i.MX-SoCs.patch \
+	file://0002-mfd-Add-Freescale-MC13783-driver.patch \
+	file://0003-mx3-Add-SSI-pins-to-iomux-table.patch \
+	file://0004-mxc-iomux-v3-remove-resource-handling.patch \
+	file://0005-i.MX31-clock-rename-SSI-clocks-to-driver-name.patch \
+	file://0006-i.MX2-Add-sound-ssi-resources.patch \
+	file://0007-i.MX3-Add-sound-ssi-resources.patch \
+	file://0008-MXC-Add-a-digital-audio-multiplexer-driver.patch \
+	file://0009-MX31-Fix-spi-clock-names.patch \
+	file://0010-i.MX35-Fix-audmux-clock.patch \
+	file://0011-MX31-add-spi-controller-devices-resources.patch \
+	file://0012-i.MX27-clock-rename-spi-clocks-to-match-device.patch \
+	file://0013-add-a-mc13783-codec-driver.patch \
+	file://0014-imx-ssi-sound-driver.patch \
+	file://0015-add-phycore-ac97-sound-support.patch \
+	file://0016-add-phycore-mc13783-sound-support.patch \
+	file://0017-pcm043-add-sound-support.patch \
+	file://0018-pcm038-Add-SPI-MC13783-support.patch \
+	file://0019-mx27-add-support-for-phytec-pca100-phyCARD-s-board.patch \
+	file://0020-MX2-Add-SPI-devices-resources.patch \
+	file://0021-mxc-mx1-mx2-DMA-add-a-possibility-to-create-an-endle.patch \
+	file://0022-ASoC-Allow-32-bit-registers-for-DAPM.patch \
+	file://0023-pca100-add-sound-support.patch \
+	file://0024-pcm038-add-sound-support.patch \
+	file://0025-pcm037-Add-sound-support.patch \
+	file://0026-imx-ssi-Fix-AC97-rates.patch \
+	file://0027-imx-ssi-flush-fifos.patch \
+	file://0028-imx-ssi-Fix-occasional-AC97-reset-failure.patch \
+	file://0021-Early-printk.patch \
+	file://0024-MX31-Clock-updates.patch;striplevel=0 \
+	file://Update-PCM043-board-support.patch \
+	file://0027-Add-EHCI-support-for-MX27-and-MX31-based-boards.patch \
+	file://0029-MX31-Add-USB-platform-devices-and-resources.patch \
+	file://0053-Watchdog-driver-for-IMX-MXC.patch \
+	file://0066-HACK-increase-default-tx_queue_len-to-10000.patch \
+	file://0084-i.MX35-clock-support-Add-USB-clocks.patch \
+	file://0088-ehci-mxc-Fix-clocks.patch \
+	file://0090-mx3x-Fixup-USB-base-addresses.patch \
+	file://0091-mx31-clock-remove-obsolete-FIXME-comment.patch \
+	file://0092-mx35-clock-give-ehci-clocks-names.patch \
+	file://0096-i.MX35-implement-get_rate-for-usb-otg-clock.patch \
+	file://0097-fsl-udc-driver-add-mx35-support.patch \
+	file://0001-mxcv2-nand-driver.patch;striplevel=0 \
+	file://0002-MXC-NFC-Remove-useless-structure-member.patch \
+	file://0003-MXC-NFC-Add-a-real-NAND-flash-data-width-setup-func.patch \
+	file://0004-MXC-NFC-Use-generic-bad-block-detection.patch \
+	file://0005-MXC-NFC-Divide-flash-device-detection-into-two-step.patch \
+	file://0006-MXC-NFC-Reorder-structure-setup-to-use-NAND-informa.patch \
+	file://0007-MXC-NFC-Fix-OOB-layout.patch \
+	file://0008-MXC-NFC-The-i.MX35-CPU-also-uses-a-V2.1-NFC.patch \
+	file://0009-MXC-NFC-Fix-NFC-s-address-area-on-i.MX35.patch;striplevel=0 \
+	file://0010-MXC-NFC-Add-the-clock-resource-to-support-NFC-in-i.patch;striplevel=0 \
+	file://0011-MXC-NFC-Fix-NFC-s-clock-name.patch \
+	file://0012-MXC-NFC-i.MX35-can-work-with-the-v2-not-with-v1-of.patch;striplevel=0 \
+	file://0013-MXC-NFC-Add-the-cpu_is_mx25-macro.patch;striplevel=0 \
+	file://0014-MXC-NFC-Add-NAND-device-to-the-pcm043-platform.patch;striplevel=0 \
+	file://0015-MXC-NFC-unlock_addr-is-only-used-while-__init-pha.patch \
+	file://fix_oob_layout.diff;striplevel=0 \
+	file://0002-mxc_nand-cleanup-eccoob-descriptions.patch \
+	file://0003-mxc_nand-cleanup-initialization.patch \
+	file://0004-mxc_nand-merge-send_read_page-and-send_prog_page.patch \
+	file://0005-mxc_nand-introduce-mxc_do_addr_cycle.patch \
+	file://0006-mxc-nand-remove-debug-param.patch \
+	file://0007-mxc-nand-remove-dead-code.patch \
+	file://0008-mxc-nand-use-resource_size.patch \
+	file://0009-mxc-nand-use-buffers.patch \
+	file://0010-mxc-nand-simplify-command-processing.patch \
+	file://0011-mxc-nand-modify-send_page-to-send-all-pages-not-on.patch \
+	file://0012-mxc_nand-remove-unused-defines.patch \
+	file://0013-mxc_nand-Make-main-spare-areas-runtime-configurable.patch \
+	file://0014-mxc_nand-Get-rid-of-pagesize_2k-flag.patch \
+	file://0015-mxc_nand-Add-NFC-V2-support.patch \
+	file://0016-mxc_nand-disable-sp_en-bit-only-once.patch \
+	file://0017-mxc_nand-Allow-flash-based-bbt.patch \
+	file://0018-mxc_nand-remove-TROP_US_DELAY.patch \
+	file://0019-mxc_nand-use-DRIVER_NAME-where-appropriate.patch \
+	file://linux-2.6.31.6-flexcan.patch \
+	file://fix_owire_clk.patch \
+	file://w1_master.patch \
+	file://add-led-gpio.patch \
+	file://linux-2.6.31.6-spi.patch \
+	file://fix_max7301.patch \
+	file://fix_clock_calc.patch \
+	file://add_mmc.diff;striplevel=0 \
+	file://fix_mmc_for_highspeed.diff \
+	file://fix_can.patch "
+
 do_devicetree_image_append_boc01() {
 	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree.v1 ${KERNEL_DEVICETREE}.v1
 	install -m 0644 devicetree.v1 ${D}/boot/devicetree-${KERNEL_VERSION}.v1
-- 
1.7.3.4



