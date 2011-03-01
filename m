Received: from moutng.kundenserver.de ([212.227.17.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1PuPRo-00051y-K1
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 14:17:06 +0100
Received: from mars.fritz.box (p57B40837.dip0.t-ipconnect.de [87.180.8.55])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0M4DMF-1QCcgG3FND-00rOum; Tue, 01 Mar 2011 14:02:12 +0100
From: Jan Kobler <eng1@koblersystems.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 14:01:38 +0100
Message-Id: <1298984498-27148-2-git-send-email-eng1@koblersystems.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
References: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
MIME-Version: 1.0
X-Provags-ID: V02:K0:c/uZyT9FPzTCJlnJvEYypQBu/4GJIy0kMwoqUyMpsdN
	9/H+qOO8ueT1pPf+wCbBSc6Zjrs+qrp4AoLf5ik8qckSVYwe3C
	ftzbn5B/g/4t4dXMR8h43b5Q9I0mpfgYrmlI6blAyA2qG5yLg+
	vjq6de5gjsPRuat3LrDBbLwE7xP2ICZaqNjqeJxV51WIk/7ru8
	eOOEJCvhTCIsK5DSYpJTA==
Subject: [pcm043 2/2] linux-2.6.31 config and patch files for pcm043
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
X-List-Received-Date: Tue, 01 Mar 2011 13:17:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These config and patch files are from the Phytec Linux BSP for phyCORE-i.MX35 PD10.1.1.
They were taken from the archive
ftp://ftp.phytec.de/pub/Products/phyCORE-iMX350/Linux/PD10.1.1/OSELAS.BSP-Phytec-phyCORE-i.MX35-PD10.1.1.tar.gz

The patch files are from the folder in this archive
OSELAS.BSP-Phytec-phyCORE-i.MX35-PD10.1.1/configs/phyCORE-i.MX35-2010.08.0/patches/linux-2.6.31.6/generic

The patch files have been shipped for linux-2.6.31.6 and are used here on linux-2.6.31.12. Because it seems to work,
pcm043 is added to linux-2.6.31.bb.

The sequence of the patches for pcm043 in linux-2.6.31.bb is derived from the file
OSELAS.BSP-Phytec-phyCORE-i.MX35-PD10.1.1/configs/phyCORE-i.MX35-2010.08.0/patches/linux-2.6.31.6/generic/series

The defconfig file is the file
OSELAS.BSP-Phytec-phyCORE-i.MX35-PD10.1.1/configs/phyCORE-i.MX35-2010.08.0/kernelconfig

These patch files from the folder
OSELAS.BSP-Phytec-phyCORE-i.MX35-PD10.1.1/configs/phyCORE-i.MX35-2010.08.0/patches/linux-2.6.31.6/generic
are NOT used:
0063-add-generic-platform-bus-based-sja1000-driver.patch
0076-mx3fb-pretty-printing-update.patch
0078-sja1000-driver-Fix-net-device-stats.patch
patch-2.6.31.6-rt19.gz
because they are not referenced by the file
OSELAS.BSP-Phytec-phyCORE-i.MX35-PD10.1.1/configs/phyCORE-i.MX35-2010.08.0/patches/linux-2.6.31.6/generic/series

Signed-off-by: Jan Kobler <eng1@koblersystems.de>
---
 .../pcm043/0001-mxcv2-nand-driver.patch            | 1130 ++++++++++
 ...i-add-SPI-driver-for-most-known-i.MX-SoCs.patch | 2337 ++++++++++++++++++++
 ...2-MXC-NFC-Remove-useless-structure-member.patch |   45 +
 .../0002-mfd-Add-Freescale-MC13783-driver.patch    |  984 ++++++++
 ...0002-mxc_nand-cleanup-eccoob-descriptions.patch |  111 +
 ...d-a-real-NAND-flash-data-width-setup-func.patch |   51 +
 .../0003-mx3-Add-SSI-pins-to-iomux-table.patch     |   48 +
 .../0003-mxc_nand-cleanup-initialization.patch     |  124 ++
 ...4-MXC-NFC-Use-generic-bad-block-detection.patch |  148 ++
 ...004-mxc-iomux-v3-remove-resource-handling.patch |  111 +
 ...d-merge-send_read_page-and-send_prog_page.patch |  104 +
 ...vide-flash-device-detection-into-two-step.patch |   48 +
 ...31-clock-rename-SSI-clocks-to-driver-name.patch |   28 +
 ...0005-mxc_nand-introduce-mxc_do_addr_cycle.patch |  122 +
 ...order-structure-setup-to-use-NAND-informa.patch |  129 ++
 .../0006-i.MX2-Add-sound-ssi-resources.patch       |  132 ++
 .../pcm043/0006-mxc-nand-remove-debug-param.patch  |   82 +
 .../pcm043/0007-MXC-NFC-Fix-OOB-layout.patch       |  104 +
 .../0007-i.MX3-Add-sound-ssi-resources.patch       |  101 +
 .../pcm043/0007-mxc-nand-remove-dead-code.patch    |   41 +
 ...XC-Add-a-digital-audio-multiplexer-driver.patch |  281 +++
 ...C-NFC-The-i.MX35-CPU-also-uses-a-V2.1-NFC.patch |   26 +
 .../pcm043/0008-mxc-nand-use-resource_size.patch   |   26 +
 .../pcm043/0009-MX31-Fix-spi-clock-names.patch     |   32 +
 ...-MXC-NFC-Fix-NFC-s-address-area-on-i.MX35.patch |   28 +
 .../pcm043/0009-mxc-nand-use-buffers.patch         |  473 ++++
 ...dd-the-clock-resource-to-support-NFC-in-i.patch |   61 +
 .../pcm043/0010-i.MX35-Fix-audmux-clock.patch      |   52 +
 ...0010-mxc-nand-simplify-command-processing.patch |  143 ++
 ...MX31-add-spi-controller-devices-resources.patch |   97 +
 .../pcm043/0011-MXC-NFC-Fix-NFC-s-clock-name.patch |   28 +
 ...modify-send_page-to-send-all-pages-not-on.patch |   87 +
 ....MX35-can-work-with-the-v2-not-with-v1-of.patch |   34 +
 ...7-clock-rename-spi-clocks-to-match-device.patch |   30 +
 .../0012-mxc_nand-remove-unused-defines.patch      |   31 +
 .../0013-MXC-NFC-Add-the-cpu_is_mx25-macro.patch   |   38 +
 .../pcm043/0013-add-a-mc13783-codec-driver.patch   |  834 +++++++
 ...ake-main-spare-areas-runtime-configurable.patch |  142 ++
 ...FC-Add-NAND-device-to-the-pcm043-platform.patch |   47 +
 .../pcm043/0014-imx-ssi-sound-driver.patch         | 1911 ++++++++++++++++
 ...0014-mxc_nand-Get-rid-of-pagesize_2k-flag.patch |  128 ++
 ...unlock_addr-is-only-used-while-__init-pha.patch |   28 +
 .../0015-add-phycore-ac97-sound-support.patch      |  140 ++
 .../pcm043/0015-mxc_nand-Add-NFC-V2-support.patch  |  191 ++
 .../0016-add-phycore-mc13783-sound-support.patch   |  211 ++
 ...0016-mxc_nand-disable-sp_en-bit-only-once.patch |   66 +
 .../0017-mxc_nand-Allow-flash-based-bbt.patch      |   79 +
 .../pcm043/0017-pcm043-add-sound-support.patch     |  161 ++
 .../0018-mxc_nand-remove-TROP_US_DELAY.patch       |   88 +
 .../0018-pcm038-Add-SPI-MC13783-support.patch      |  146 ++
 ...support-for-phytec-pca100-phyCARD-s-board.patch |  293 +++
 ...xc_nand-use-DRIVER_NAME-where-appropriate.patch |   35 +
 .../0020-MX2-Add-SPI-devices-resources.patch       |   92 +
 .../linux-2.6.31/pcm043/0021-Early-printk.patch    |  106 +
 ...-DMA-add-a-possibility-to-create-an-endle.patch |   50 +
 ...0022-ASoC-Allow-32-bit-registers-for-DAPM.patch |  203 ++
 .../pcm043/0023-pca100-add-sound-support.patch     |   99 +
 .../pcm043/0024-MX31-Clock-updates.patch           |   40 +
 .../pcm043/0024-pcm038-add-sound-support.patch     |   72 +
 .../pcm043/0025-pcm037-Add-sound-support.patch     |  144 ++
 .../pcm043/0026-imx-ssi-Fix-AC97-rates.patch       |   37 +
 ...CI-support-for-MX27-and-MX31-based-boards.patch |  347 +++
 .../pcm043/0027-imx-ssi-flush-fifos.patch          |   29 +
 ...imx-ssi-Fix-occasional-AC97-reset-failure.patch |   37 +
 ...31-Add-USB-platform-devices-and-resources.patch |  100 +
 .../pcm043/0053-Watchdog-driver-for-IMX-MXC.patch  |  490 ++++
 ...CK-increase-default-tx_queue_len-to-10000.patch |   36 +
 .../0084-i.MX35-clock-support-Add-USB-clocks.patch |   30 +
 .../pcm043/0088-ehci-mxc-Fix-clocks.patch          |   33 +
 .../0090-mx3x-Fixup-USB-base-addresses.patch       |   93 +
 ...-mx31-clock-remove-obsolete-FIXME-comment.patch |   25 +
 .../0092-mx35-clock-give-ehci-clocks-names.patch   |   30 +
 ...MX35-implement-get_rate-for-usb-otg-clock.patch |   54 +
 .../0097-fsl-udc-driver-add-mx35-support.patch     |   83 +
 .../pcm043/Update-PCM043-board-support.patch       |  134 ++
 .../linux/linux-2.6.31/pcm043/add-led-gpio.patch   |   17 +
 recipes/linux/linux-2.6.31/pcm043/add_mmc.diff     | 1396 ++++++++++++
 recipes/linux/linux-2.6.31/pcm043/fix_can.patch    |   16 +
 .../linux/linux-2.6.31/pcm043/fix_clock_calc.patch |   27 +
 .../linux/linux-2.6.31/pcm043/fix_max7301.patch    |   28 +
 .../linux-2.6.31/pcm043/fix_mmc_for_highspeed.diff |   63 +
 .../linux/linux-2.6.31/pcm043/fix_oob_layout.diff  |   67 +
 .../linux/linux-2.6.31/pcm043/fix_owire_clk.patch  |   17 +
 .../pcm043/linux-2.6.31.6-flexcan.patch            | 2168 ++++++++++++++++++
 .../linux-2.6.31/pcm043/linux-2.6.31.6-spi.patch   |  116 +
 recipes/linux/linux-2.6.31/pcm043/w1_master.patch  |   26 +
 recipes/linux/linux/pcm043/defconfig               | 1659 ++++++++++++++
 87 files changed, 19911 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0001-mxcv2-nand-driver.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0001-spi-add-SPI-driver-for-most-known-i.MX-SoCs.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0002-MXC-NFC-Remove-useless-structure-member.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0002-mfd-Add-Freescale-MC13783-driver.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0002-mxc_nand-cleanup-eccoob-descriptions.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0003-MXC-NFC-Add-a-real-NAND-flash-data-width-setup-func.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0003-mx3-Add-SSI-pins-to-iomux-table.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0003-mxc_nand-cleanup-initialization.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0004-MXC-NFC-Use-generic-bad-block-detection.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0004-mxc-iomux-v3-remove-resource-handling.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0004-mxc_nand-merge-send_read_page-and-send_prog_page.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0005-MXC-NFC-Divide-flash-device-detection-into-two-step.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0005-i.MX31-clock-rename-SSI-clocks-to-driver-name.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0005-mxc_nand-introduce-mxc_do_addr_cycle.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0006-MXC-NFC-Reorder-structure-setup-to-use-NAND-informa.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0006-i.MX2-Add-sound-ssi-resources.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0006-mxc-nand-remove-debug-param.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0007-MXC-NFC-Fix-OOB-layout.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0007-i.MX3-Add-sound-ssi-resources.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0007-mxc-nand-remove-dead-code.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0008-MXC-Add-a-digital-audio-multiplexer-driver.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0008-MXC-NFC-The-i.MX35-CPU-also-uses-a-V2.1-NFC.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0008-mxc-nand-use-resource_size.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0009-MX31-Fix-spi-clock-names.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0009-MXC-NFC-Fix-NFC-s-address-area-on-i.MX35.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0009-mxc-nand-use-buffers.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0010-MXC-NFC-Add-the-clock-resource-to-support-NFC-in-i.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0010-i.MX35-Fix-audmux-clock.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0010-mxc-nand-simplify-command-processing.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0011-MX31-add-spi-controller-devices-resources.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0011-MXC-NFC-Fix-NFC-s-clock-name.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0011-mxc-nand-modify-send_page-to-send-all-pages-not-on.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0012-MXC-NFC-i.MX35-can-work-with-the-v2-not-with-v1-of.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0012-i.MX27-clock-rename-spi-clocks-to-match-device.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0012-mxc_nand-remove-unused-defines.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0013-MXC-NFC-Add-the-cpu_is_mx25-macro.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0013-add-a-mc13783-codec-driver.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0013-mxc_nand-Make-main-spare-areas-runtime-configurable.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0014-MXC-NFC-Add-NAND-device-to-the-pcm043-platform.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0014-imx-ssi-sound-driver.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0014-mxc_nand-Get-rid-of-pagesize_2k-flag.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0015-MXC-NFC-unlock_addr-is-only-used-while-__init-pha.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0015-add-phycore-ac97-sound-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0015-mxc_nand-Add-NFC-V2-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0016-add-phycore-mc13783-sound-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0016-mxc_nand-disable-sp_en-bit-only-once.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0017-mxc_nand-Allow-flash-based-bbt.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0017-pcm043-add-sound-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0018-mxc_nand-remove-TROP_US_DELAY.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0018-pcm038-Add-SPI-MC13783-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0019-mx27-add-support-for-phytec-pca100-phyCARD-s-board.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0019-mxc_nand-use-DRIVER_NAME-where-appropriate.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0020-MX2-Add-SPI-devices-resources.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0021-Early-printk.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0021-mxc-mx1-mx2-DMA-add-a-possibility-to-create-an-endle.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0022-ASoC-Allow-32-bit-registers-for-DAPM.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0023-pca100-add-sound-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0024-MX31-Clock-updates.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0024-pcm038-add-sound-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0025-pcm037-Add-sound-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0026-imx-ssi-Fix-AC97-rates.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0027-Add-EHCI-support-for-MX27-and-MX31-based-boards.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0027-imx-ssi-flush-fifos.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0028-imx-ssi-Fix-occasional-AC97-reset-failure.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0029-MX31-Add-USB-platform-devices-and-resources.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0053-Watchdog-driver-for-IMX-MXC.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0066-HACK-increase-default-tx_queue_len-to-10000.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0084-i.MX35-clock-support-Add-USB-clocks.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0088-ehci-mxc-Fix-clocks.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0090-mx3x-Fixup-USB-base-addresses.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0091-mx31-clock-remove-obsolete-FIXME-comment.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0092-mx35-clock-give-ehci-clocks-names.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0096-i.MX35-implement-get_rate-for-usb-otg-clock.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/0097-fsl-udc-driver-add-mx35-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/Update-PCM043-board-support.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/add-led-gpio.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/add_mmc.diff
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/fix_can.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/fix_clock_calc.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/fix_max7301.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/fix_mmc_for_highspeed.diff
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/fix_oob_layout.diff
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/fix_owire_clk.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-flexcan.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-spi.patch
 create mode 100644 recipes/linux/linux-2.6.31/pcm043/w1_master.patch
 create mode 100644 recipes/linux/linux/pcm043/defconfig

diff --git a/recipes/linux/linux-2.6.31/pcm043/0001-mxcv2-nand-driver.patch b/recipes/linux/linux-2.6.31/pcm043/0001-mxcv2-nand-driver.patch
new file mode 100644
index 0000000..fbbf023
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0001-mxcv2-nand-driver.patch
@@ -0,0 +1,1130 @@
+From cd56a2552db22ae5464b68074ad35bf0700bb790 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 11:26:22 +0200
+Subject: [PATCH 01/15] mxcv2 nand driver
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ drivers/mtd/nand/Kconfig       |    7 
+ drivers/mtd/nand/Makefile      |    1 
+ drivers/mtd/nand/mxc_nand_v2.c | 1079 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 1087 insertions(+)
+ create mode 100644 drivers/mtd/nand/mxc_nand_v2.c
+
+Index: drivers/mtd/nand/Kconfig
+===================================================================
+--- drivers/mtd/nand/Kconfig.orig	2009-12-08 10:02:55.061888995 +0100
++++ drivers/mtd/nand/Kconfig	2009-12-08 10:02:59.468654404 +0100
+@@ -426,6 +426,13 @@
+ 	  This enables the driver for the NAND flash controller on the
+ 	  MXC processors.
+ 
++config MTD_NAND_MXC_V2
++	tristate "MXC NAND support"
++	depends on ARCH_MX25
++	help
++	  This enables the driver for the NAND flash controller on the
++	  MXC processors.
++
+ config MTD_NAND_SH_FLCTL
+ 	tristate "Support for NAND on Renesas SuperH FLCTL"
+ 	depends on MTD_NAND && SUPERH && CPU_SUBTYPE_SH7723
+Index: drivers/mtd/nand/Makefile
+===================================================================
+--- drivers/mtd/nand/Makefile.orig	2009-12-08 10:02:55.079723657 +0100
++++ drivers/mtd/nand/Makefile	2009-12-08 10:02:59.468654404 +0100
+@@ -38,6 +38,7 @@
+ obj-$(CONFIG_MTD_NAND_FSL_UPM)		+= fsl_upm.o
+ obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
+ obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
++obj-$(CONFIG_MTD_NAND_MXC_V2)		+= mxc_nand_v2.o
+ obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
+ obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
+ 
+Index: drivers/mtd/nand/mxc_nand_v2.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ drivers/mtd/nand/mxc_nand_v2.c	2009-12-08 10:02:59.468654404 +0100
+@@ -0,0 +1,1079 @@
++/*
++ * Copyright 2004-2008 Freescale Semiconductor, Inc. All Rights Reserved.
++ * Copyright 2009 Sascha Hauer, kernel@pengutronix.de
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
++ * MA 02110-1301, USA.
++ */
++
++#include <linux/delay.h>
++#include <linux/slab.h>
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/mtd/mtd.h>
++#include <linux/mtd/nand.h>
++#include <linux/mtd/partitions.h>
++#include <linux/interrupt.h>
++#include <linux/device.h>
++#include <linux/platform_device.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++#include <linux/io.h>
++
++#include <asm/mach/flash.h>
++#include <mach/hardware.h>
++#include <mach/mxc_nand.h>
++
++#define NFC_SET_RBA			0xe04
++#define NFC_FLASH_ADDR			0xe06
++#define NFC_FLASH_CMD			0xe08
++#define NFC_BLS				0xe0a
++#define NFC_ECC_STATUS_RESULT		0xe0c
++#define NFC_V21_SPAS			0xe10
++#define NFC_WR_PROT			0xe12
++
++#define NFC_CONFIG1			0xe1a
++#define NFC_CONFIG2			0xe1c
++
++#define NFC_V21_UNLOCKSTART_BLKADDR  	0xe20
++#define NFC_V21_UNLOCKEND_BLKADDR    	0xe22
++#define NFC_V1_UNLOCKSTART_BLKADDR  	0xe14
++#define NFC_V1_UNLOCKEND_BLKADDR    	0xe16
++
++#define nfc_is_v21()		cpu_is_mx25()
++#define nfc_is_v2x()		cpu_is_mx31()
++
++#define NFC_ECC_EN          		(1 << 3)
++
++#define NFC_WPC_UNLOCK			(1 << 2)
++
++#define NFC_CMD            		(1 << 0)
++#define NFC_ADDR           		(1 << 1)
++#define NFC_INPUT          		(1 << 2)
++#define NFC_OUTPUT         		(1 << 3)
++#define NFC_ID             		(1 << 4)
++#define NFC_STATUS         		(1 << 5)
++
++#define NFC_RBA_SHIFT       		4
++
++#define NFC_INT				(1 << 15)
++
++#define NFC_BLS_RESET			(3 << 16)
++#define NFC_V2_BLS_UNLOCKED		2
++
++#define NFC_V2_SP_EN			(1 << 2)
++
++#define NFC_INT_MSK			(1 << 4)
++
++#define NFMS_NF_DWIDTH 0
++#define NFMS_NF_PG_SZ  1
++#define NFC_SPAS_WIDTH 8
++#define NFC_SPAS_SHIFT 16
++
++#define NFC_V21_SPAS_SHIFT		(0)
++#define NFC_V21_SPAS_MASK	(0xFF00)
++
++struct mxc_nand_host {
++	struct mtd_info		mtd;
++	struct nand_chip	nand;
++	struct mtd_partition	*parts;
++	struct device		*dev;
++
++	int			version;
++	void			*spare0;
++	int			spare_len;
++	int			spare_size;
++	void			*main_area0;
++	void			*main_area1;
++	void __iomem		*base;
++	void __iomem		*regs;
++
++	int			status_request;
++
++	unsigned int		buf_start;
++
++	wait_queue_head_t	irq_waitq;
++	int			g_page_mask;
++
++	struct clk		*clk;
++	int			clk_enabled;
++
++	uint8_t			*data_buf;
++
++	int			irq;
++};
++
++/* Define delays in microsec for NAND device operations */
++#define TROP_US_DELAY   2000
++
++/*
++ * OOB placement block for use with hardware ecc generation
++ */
++static struct nand_ecclayout nand_hw_eccoob_512 = {
++	.eccbytes = 9,
++	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
++	.oobavail = 4,
++	.oobfree = {{0, 4}}
++};
++
++static struct nand_ecclayout nand_hw_eccoob_2k = {
++	.eccbytes = 9,
++	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
++	.oobavail = 4,
++	.oobfree = {{2, 4}}
++};
++
++static struct nand_ecclayout nand_hw_eccoob_4k = {
++	.eccbytes = 9,
++	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
++	.oobavail = 4,
++	.oobfree = {{2, 4}}
++};
++
++#ifdef CONFIG_MTD_PARTITIONS
++static const char *part_probes[] = { "RedBoot", "cmdlinepart", NULL };
++#endif
++
++static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
++{
++	struct mxc_nand_host *host = dev_id;
++
++	uint16_t tmp;
++
++	tmp = readw(host->regs + NFC_CONFIG1);
++	tmp |= NFC_INT_MSK; /* Disable interrupt */
++	writew(tmp, host->regs + NFC_CONFIG1);
++
++	wake_up(&host->irq_waitq);
++
++	return IRQ_HANDLED;
++}
++
++/* This function polls the NANDFC to wait for the basic operation to
++ * complete by checking the INT bit of config2 register.
++ */
++static void wait_op_done(struct mxc_nand_host *host, int max_retries,
++				int useirq)
++{
++	uint32_t tmp;
++
++	if (useirq) {
++		if ((readw(host->regs + NFC_CONFIG2) & NFC_INT) == 0) {
++
++			tmp = readw(host->regs + NFC_CONFIG1);
++			tmp  &= ~NFC_INT_MSK;	/* Enable interrupt */
++			writew(tmp, host->regs + NFC_CONFIG1);
++
++			wait_event(host->irq_waitq,
++				readw(host->regs + NFC_CONFIG2) & NFC_INT);
++
++			tmp = readw(host->regs + NFC_CONFIG2);
++			tmp  &= ~NFC_INT;
++			writew(tmp, host->regs + NFC_CONFIG2);
++		}
++	} else {
++		while (max_retries-- > 0) {
++			if (readw(host->regs + NFC_CONFIG2) & NFC_INT) {
++				tmp = readw(host->regs + NFC_CONFIG2);
++				tmp &= ~NFC_INT;
++				writew(tmp, host->regs + NFC_CONFIG2);
++				break;
++			}
++			udelay(1);
++		}
++		if (max_retries <= 0) {
++			printk("%s timed out: 0x%04x\n", __func__, readw(host->regs + NFC_CONFIG2));
++			BUG();
++		}
++	}
++}
++
++/* This function issues the specified command to the NAND device and
++ * waits for completion. */
++static void send_cmd(struct mxc_nand_host *host, uint16_t cmd, int useirq)
++{
++	DEBUG(MTD_DEBUG_LEVEL3, "send_cmd(host, 0x%x, %d)\n", cmd, useirq);
++
++	writew(cmd, host->regs + NFC_FLASH_CMD);
++	writew(NFC_CMD, host->regs + NFC_CONFIG2);
++
++	/* Wait for operation to complete */
++	wait_op_done(host, TROP_US_DELAY, useirq);
++}
++
++/*
++ * This function sends an address (or partial address) to the
++ * NAND device.  The address is used to select the source/destination for
++ * a NAND command.
++ */
++static void send_addr(struct mxc_nand_host *host, u16 addr)
++{
++	DEBUG(MTD_DEBUG_LEVEL3, "send_addr(0x%x)\n", addr);
++
++	writew(addr, host->regs + NFC_FLASH_ADDR);
++	writew(NFC_ADDR, host->regs + NFC_CONFIG2);
++
++	/* Wait for operation to complete */
++	wait_op_done(host, TROP_US_DELAY, 0);
++}
++
++/*
++ * This function requests the NFC to initate the transfer
++ * of data currently in the NFC RAM buffer to the NAND device.
++ *
++ */
++static void send_page(struct mtd_info *mtd, unsigned int ops)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	int bufs, i;
++
++	if (nfc_is_v2x() && mtd->writesize > 512)
++		bufs = 4;
++	else
++		bufs = 1;
++
++	for (i = 0; i < bufs; i++) {
++
++		/* set ram buffer id */
++		writew(i, host->regs + NFC_SET_RBA);
++
++		/* transfer data from NFC ram to nand */
++		writew(ops, host->regs + NFC_CONFIG2);
++
++		/* Wait for operation to complete */
++		wait_op_done(host, TROP_US_DELAY, false);
++	}
++}
++
++/* This function requests the NANDFC to perform a read of the
++ * NAND device status and returns the current status. */
++static uint16_t get_dev_status(struct mxc_nand_host *host)
++{
++	uint16_t ret;
++
++	/* Set ram buffer id */
++	writew(1, host->regs + NFC_SET_RBA);
++
++	/* Read status into main buffer */
++	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
++
++	/* Wait for operation to complete */
++	wait_op_done(host, TROP_US_DELAY, true);
++
++	/* Status is placed in first word of main buffer */
++	/* get status, then recovery area 1 data */
++	ret = readw(host->main_area1);
++
++	return ret;
++}
++
++static void mxc_nand_hwecc(struct mxc_nand_host *host, int on)
++{
++	unsigned int tmp;
++
++	tmp = readw(host->regs + NFC_CONFIG1);
++
++	if (on)
++		tmp |= NFC_ECC_EN;
++	else
++		tmp &= ~NFC_ECC_EN;
++
++	writew(tmp, host->regs + NFC_CONFIG1);
++}
++
++static void mxc_nand_enable_hwecc(struct mtd_info *mtd, int mode)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	mxc_nand_hwecc(host, 1);
++	return;
++}
++
++/*
++ * Function to correct the detected errors. This NFC corrects all the errors
++ * detected. So this function just return 0.
++ */
++static int mxc_nand_correct_data(struct mtd_info *mtd, u_char * dat,
++				 u_char * read_ecc, u_char * calc_ecc)
++{
++	return 0;
++}
++
++/*
++ * Function to calculate the ECC for the data to be stored in the Nand device.
++ * This NFC has a hardware RS(511,503) ECC engine together with the RS ECC
++ * CONTROL blocks are responsible for detection  and correction of up to
++ * 8 symbols of 9 bits each in 528 byte page.
++ * So this function is just return 0.
++ */
++static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
++				  u_char *ecc_code)
++{
++	return 0;
++}
++
++static uint8_t mxc_nand_read_byte(struct mtd_info *mtd)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	uint8_t ret;
++
++	/* Check for status request */
++	if (host->status_request)
++		return get_dev_status(host) & 0xff;
++
++	ret = *(uint8_t *)(host->data_buf + host->buf_start);
++	host->buf_start++;
++
++	return ret;
++}
++
++static uint16_t mxc_nand_read_word(struct mtd_info *mtd)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++	uint16_t ret;
++
++	ret = *(uint16_t *)(host->data_buf + host->buf_start);
++	host->buf_start += 2;
++
++	return ret;
++}
++
++/* Write data of length len to buffer buf. The data to be
++ * written on NAND Flash is first copied to RAMbuffer. After the Data Input
++ * Operation by the NFC, the data is written to NAND Flash */
++static void mxc_nand_write_buf(struct mtd_info *mtd,
++				const u_char *buf, int len)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++	u16 col = host->buf_start;
++	int n = mtd->oobsize + mtd->writesize - col;
++
++	n = min(n, len);
++
++	memcpy(host->data_buf + col, buf, n);
++
++	host->buf_start += n;
++}
++
++/* Read the data buffer from the NAND Flash. To read the data from NAND
++ * Flash first the data output cycle is initiated by the NFC, which copies
++ * the data to RAMbuffer. This data of length len is then copied to buffer buf.
++ */
++static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++	u16 col = host->buf_start;
++	int n = mtd->oobsize + mtd->writesize - col;
++
++	n = min(n, len);
++
++	memcpy(buf, host->data_buf + col, len);
++
++	host->buf_start += len;
++}
++
++/* Used by the upper layer to verify the data in NAND Flash
++ * with the data in the buf. */
++static int mxc_nand_verify_buf(struct mtd_info *mtd, const uint8_t *buf,
++			       int len)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	return memcmp(buf, host->data_buf, len) ? -EFAULT : 0;
++}
++
++/* This function is used by upper layer for select and
++ * deselect of the NAND chip */
++static void mxc_nand_select_chip(struct mtd_info *mtd, int chip)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++
++	switch (chip) {
++	case -1:
++		if (host->clk_enabled) {
++			clk_disable(host->clk);
++			host->clk_enabled = 0;
++		}
++		break;
++	case 0 ... 7:
++		if (!host->clk_enabled) {
++			clk_enable(host->clk);
++			host->clk_enabled = 1;
++		}
++		break;
++
++	default:
++		break;
++	}
++}
++
++/*
++ * Function to transfer data to/from spare area.
++ */
++static void copy_spare(struct mtd_info *mtd, bool bfrom)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	u16 i, j;
++	u16 n = mtd->writesize >> 9;
++	u8 *d = host->data_buf + mtd->writesize;
++	u8 *s = host->spare0;
++	u16 t = host->spare_len;
++
++	j = (mtd->oobsize / n >> 1) << 1;
++
++	if (bfrom) {
++		for (i = 0; i < n - 1; i++)
++			memcpy(d + i * j, s + i * t, j);
++
++		/* the last section */
++		memcpy(d + i * j, s + i * t, mtd->oobsize - i * j);
++	} else {
++		for (i = 0; i < n - 1; i++)
++			memcpy(&s[i * t], &d[i * j], j);
++
++		/* the last section */
++		memcpy(&s[i * t], &d[i * j], mtd->oobsize - i * j);
++	}
++}
++
++#define NFC_V2_ECC_MODE_4    		 (1 << 0)
++
++#define NFC_SPAS_16			8
++#define NFC_SPAS_64		 	32
++#define NFC_SPAS_128			64
++#define NFC_SPAS_218		 	109
++#define NFC_IPC_CREQ			(1 << 0)
++#define NFC_IPC_ACK			(1 << 1)
++
++/*
++ * Function to perform the address cycles.
++ */
++static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++
++	u32 page_mask = host->g_page_mask;
++
++	if (column != -1) {
++		send_addr(host, column & 0xFF);
++		if (mtd->writesize == 2048) {
++			/* another col addr cycle for 2k page */
++			send_addr(host, (column >> 8) & 0xF);
++		} else if (mtd->writesize == 4096) {
++			/* another col addr cycle for 4k page */
++			send_addr(host, (column >> 8) & 0x1F);
++		}
++	}
++	if (page_addr != -1) {
++		do {
++			send_addr(host, (page_addr & 0xff));
++			page_mask >>= 8;
++			page_addr >>= 8;
++		} while (page_mask != 0);
++	}
++}
++
++/*
++ * Function to record the ECC corrected/uncorrected errors resulted
++ * after a page read. This NFC detects and corrects upto to 4 symbols
++ * of 9-bits each.
++ */
++
++static int mxc_check_ecc_status(struct mtd_info *mtd)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	u32 ecc_stat, err;
++	int no_subpages = 1;
++	int ret = 0, is_4bit_ecc = 0;
++	u8 ecc_bit_mask, err_limit;
++
++	if (nfc_is_v21()) {
++		is_4bit_ecc = readw(host->regs + NFC_CONFIG1) & NFC_V2_ECC_MODE_4;
++		ecc_stat = readw(host->regs + NFC_ECC_STATUS_RESULT);
++	} else if (nfc_is_v2x()) {
++		is_4bit_ecc = 1;
++		ecc_stat = readw(host->regs + NFC_ECC_STATUS_RESULT);
++	} else
++		BUG();
++
++	ecc_bit_mask = is_4bit_ecc ? 0x7 : 0xf;
++	err_limit = is_4bit_ecc ? 0x4 : 0x8;
++
++	no_subpages = mtd->writesize >> 9;
++
++	do {
++		err = ecc_stat & ecc_bit_mask;
++		if (err > err_limit) {
++			mtd->ecc_stats.failed++;
++			printk(KERN_WARNING "uncorrectable RS-ECC Error\n");
++			return -1;
++		} else {
++			ret += err;
++		}
++		ecc_stat >>= 4;
++	} while (--no_subpages);
++
++	mtd->ecc_stats.corrected += ret;
++	pr_debug("%d Symbol Correctable RS-ECC Error\n", ret);
++
++	return ret;
++}
++
++/*
++ * This function reads byte from the NAND Flash
++ *
++ * @param     mtd     MTD structure for the NAND Flash
++ *
++ * @return    data read from the NAND Flash
++ */
++static u_char mxc_nand_read_byte16(struct mtd_info *mtd)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	if (host->status_request)
++		return get_dev_status(host) & 0xff;
++
++	return mxc_nand_read_word(mtd) & 0xff;
++}
++
++/* Used by the upper layer to write command to NAND Flash for
++ * different operations to be carried out on NAND Flash */
++static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
++			     int column, int page_addr)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++
++	DEBUG(MTD_DEBUG_LEVEL3,
++	      "mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
++	      command, column, page_addr);
++
++	/*
++	 * Reset command state information
++	 */
++	host->status_request = false;
++
++	switch (command) {
++
++	case NAND_CMD_STATUS:
++		host->buf_start = 0;
++		host->status_request = true;
++
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++		break;
++
++	case NAND_CMD_READOOB:
++		command = NAND_CMD_READ0;
++		/* Fallthrough */
++
++	case NAND_CMD_READ0:
++		host->buf_start = column;
++
++		send_cmd(host, command, false);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++
++		if (mtd->writesize > 512)
++			/* send read confirm command */
++			send_cmd(host, NAND_CMD_READSTART, true);
++
++		send_page(mtd, NFC_OUTPUT);
++
++		memcpy(host->data_buf, host->main_area0, mtd->writesize);
++		copy_spare(mtd, true);
++
++		break;
++
++	case NAND_CMD_SEQIN:
++
++		/* FIXME: before send SEQIN command for
++		 * partial write,We need read one page out.
++		 * FSL NFC does not support partial write
++		 * It always sends out 512 + ecc + 512 + ecc ...
++		 * for large page nand flash. But for small
++		 * page nand flash, it did support SPARE
++		 * ONLY operation. But to make driver
++		 * simple. We take the same as large page,read
++		 * whole page out and update. As for MLC nand
++		 * NOP(num of operation) = 1. Partial written
++		 * on one programed page is not allowed! We
++		 * can't limit it on the driver, it need the
++		 * upper layer applicaiton take care it
++		 */
++
++		if (column)
++			mxc_nand_command(mtd, NAND_CMD_READ0, 0, page_addr);
++
++		host->buf_start = column;
++		send_cmd(host, command, false);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++		break;
++
++	case NAND_CMD_PAGEPROG:
++		memcpy(host->main_area0, host->data_buf, mtd->writesize);
++		copy_spare(mtd, false);
++
++		send_page(mtd, NFC_INPUT);
++
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++		break;
++
++	case NAND_CMD_ERASE1:
++	case NAND_CMD_ERASE2:
++		send_cmd(host, command, false);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++		break;
++
++	case NAND_CMD_READID:
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++		/* Set RBA bits for BUFFER0 */
++		writew(0, host->regs + NFC_SET_RBA);
++
++		/* Read ID into main buffer */
++		writew(NFC_ID, host->regs + NFC_CONFIG2);
++
++		wait_op_done(host, TROP_US_DELAY, true);
++		host->buf_start = column;
++		memcpy(host->data_buf, host->main_area0, 2048);
++		break;
++
++	case NAND_CMD_RESET:
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++		break;
++	}
++}
++
++static int mxc_nand_read_oob(struct mtd_info *mtd,
++			     struct nand_chip *chip, int page, int sndcmd)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	if (sndcmd) {
++		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0x00, page);
++		sndcmd = 0;
++	}
++
++	memcpy(chip->oob_poi, host->data_buf + mtd->writesize, mtd->oobsize);
++
++	return sndcmd;
++}
++
++static int mxc_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
++			      uint8_t *buf)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	mxc_check_ecc_status(mtd);
++
++	memcpy(buf, host->data_buf, mtd->writesize);
++	memcpy(chip->oob_poi, host->data_buf + mtd->writesize, mtd->oobsize);
++
++	return 0;
++}
++
++static void mxc_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
++				const uint8_t *buf)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	memcpy(host->data_buf, buf, mtd->writesize);
++	memcpy(host->data_buf + mtd->writesize, chip->oob_poi, mtd->oobsize);
++}
++
++/* Define some generic bad / good block scan pattern which are used
++ * while scanning a device for factory marked good / bad blocks. */
++static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
++
++static struct nand_bbt_descr smallpage_memorybased = {
++	.options = NAND_BBT_SCAN2NDPAGE,
++	.offs = 5,
++	.len = 1,
++	.pattern = scan_ff_pattern
++};
++
++static struct nand_bbt_descr largepage_memorybased = {
++	.options = 0,
++	.offs = 0,
++	.len = 2,
++	.pattern = scan_ff_pattern
++};
++
++/* Generic flash bbt decriptors
++*/
++static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
++static uint8_t mirror_pattern[] = { '1', 't', 'b', 'B' };
++
++static struct nand_bbt_descr bbt_main_descr = {
++	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
++	    | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
++	.offs = 0,
++	.len = 4,
++	.veroffs = 4,
++	.maxblocks = 4,
++	.pattern = bbt_pattern
++};
++
++static struct nand_bbt_descr bbt_mirror_descr = {
++	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
++	    | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
++	.offs = 0,
++	.len = 4,
++	.veroffs = 4,
++	.maxblocks = 4,
++	.pattern = mirror_pattern
++};
++
++static void mxc_set_nfms_v21(struct mtd_info *mtd, unsigned int val)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	unsigned int spas, tmp;
++
++//	NFMS |= val; /* FIXME */
++
++	if (val & (1 << NFMS_NF_PG_SZ)) {
++		if (mtd->writesize == 2048)
++			spas = NFC_SPAS_64;
++		else if (mtd->writesize == 4096)
++			spas = NFC_SPAS_128;
++		else
++			spas = NFC_SPAS_16;
++
++		tmp = readw(host->regs + NFC_CONFIG1);
++		tmp |= NFC_V2_ECC_MODE_4;
++		writew(tmp, host->regs + NFC_CONFIG1);
++
++		tmp = readw(host->regs + NFC_V21_SPAS);
++		tmp &= NFC_V21_SPAS_MASK;
++		tmp |= spas << NFC_V21_SPAS_SHIFT;
++		writew(tmp, host->regs + NFC_V21_SPAS);
++	}
++}
++
++static void mxc_set_nfms(struct mtd_info *mtd, unsigned int val)
++{
++	if (nfc_is_v21())
++		mxc_set_nfms_v21(mtd, val);
++}
++
++static int mxc_nand_scan_bbt(struct mtd_info *mtd)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	host->g_page_mask = this->pagemask;
++
++	if (mtd->writesize == 2048) {
++		mxc_set_nfms(mtd, 1 << NFMS_NF_PG_SZ);
++		this->ecc.layout = &nand_hw_eccoob_2k;
++	} else if (mtd->writesize == 4096) {
++		mxc_set_nfms(mtd, 1 << NFMS_NF_PG_SZ);
++		this->ecc.layout = &nand_hw_eccoob_4k;
++	} else {
++		this->ecc.layout = &nand_hw_eccoob_512;
++	}
++
++	/* propagate ecc.layout to mtd_info */
++	mtd->ecclayout = this->ecc.layout;
++
++	/* use flash based bbt */
++	this->bbt_td = &bbt_main_descr;
++	this->bbt_md = &bbt_mirror_descr;
++
++	/* update flash based bbt */
++	this->options |= NAND_USE_FLASH_BBT;
++
++	if (!this->badblock_pattern) {
++		this->badblock_pattern = (mtd->writesize > 512) ?
++		    &largepage_memorybased : &smallpage_memorybased;
++	}
++
++	/* Build bad block table */
++	return nand_scan_bbt(mtd, this->badblock_pattern);
++}
++
++static void unlock_addr(struct mxc_nand_host *host, unsigned int start_addr, unsigned int end_addr)
++{
++	if (nfc_is_v21()) {
++		writew(start_addr, host->regs + NFC_V21_UNLOCKSTART_BLKADDR);
++	        writew(end_addr, host->regs + NFC_V21_UNLOCKEND_BLKADDR);
++	} else if (nfc_is_v2x()) {
++		writew(start_addr, host->regs + NFC_V1_UNLOCKSTART_BLKADDR);
++	        writew(end_addr, host->regs + NFC_V1_UNLOCKEND_BLKADDR);
++	} else
++		BUG();
++}
++
++static int __init mxcnd_probe(struct platform_device *pdev)
++{
++	struct nand_chip *this;
++	struct mtd_info *mtd;
++	struct mxc_nand_platform_data *pdata = pdev->dev.platform_data;
++	struct mxc_nand_host *host;
++	int nr_parts = 0, err = 0;
++	struct resource *res;
++
++	/* Allocate memory for MTD device structure and private data */
++	host = kzalloc(sizeof(*host) + NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE, GFP_KERNEL);
++	if (!host)
++		return -ENOMEM;
++
++	host->data_buf = (uint8_t *)(host + 1);
++
++	host->dev = &pdev->dev;
++
++	this = &host->nand;
++	mtd = &host->mtd;
++	mtd->priv = this;
++	mtd->owner = THIS_MODULE;
++	mtd->name = "mxc_nand";
++
++	this->priv = host;
++	this->cmdfunc = mxc_nand_command;
++	this->select_chip = mxc_nand_select_chip;
++	this->read_byte = mxc_nand_read_byte;
++	this->read_word = mxc_nand_read_word;
++	this->write_buf = mxc_nand_write_buf;
++	this->read_buf = mxc_nand_read_buf;
++	this->verify_buf = mxc_nand_verify_buf;
++	this->scan_bbt = mxc_nand_scan_bbt;
++
++	host->clk = clk_get(&pdev->dev, "nfc_clk");
++	if (IS_ERR(host->clk)) {
++		err = PTR_ERR(host->clk);
++		goto eclk;
++	}
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		err = -ENODEV;
++		goto eres;
++	}
++
++	host->base = ioremap(res->start, resource_size(res));
++	if (!host->base) {
++		err = -EIO;
++		goto eres;
++	}
++
++	host->main_area0 = host->base;
++	host->main_area1 = host->base + 0x200;
++
++	if (nfc_is_v21()) {
++		host->regs = host->base + 0x1000;
++		host->spare0 = host->base + 0x1000;
++		host->spare_size = 64 * 8;
++		host->spare_len = 64;
++	} else if (nfc_is_v2x()) {
++		host->regs = host->base;
++		host->spare0 = host->base + 0x800;
++		host->spare_size = 16 * 4;
++		host->spare_len = 16;
++	} else
++		BUG();
++
++	/* NAND bus width determines access funtions used by upper layer */
++	if (pdata->width == 2) {
++		this->read_byte = mxc_nand_read_byte16;
++		this->options |= NAND_BUSWIDTH_16;
++		mxc_set_nfms(mtd, 1 << NFMS_NF_DWIDTH);
++	}
++
++	init_waitqueue_head(&host->irq_waitq);
++
++	host->irq = platform_get_irq(pdev, 0);
++
++	err = request_irq(host->irq, mxc_nfc_irq, 0, "mxc_nd", host);
++	if (err)
++		goto eirq;
++
++	if (pdata->hw_ecc) {
++		this->ecc.read_page = mxc_nand_read_page;
++		this->ecc.write_page = mxc_nand_write_page;
++		this->ecc.read_oob = mxc_nand_read_oob;
++		this->ecc.layout = &nand_hw_eccoob_512;
++		this->ecc.calculate = mxc_nand_calculate_ecc;
++		this->ecc.hwctl = mxc_nand_enable_hwecc;
++		this->ecc.correct = mxc_nand_correct_data;
++		this->ecc.mode = NAND_ECC_HW;
++		this->ecc.size = 512;
++		this->ecc.bytes = 9;
++		mxc_nand_hwecc(host, 1);
++	} else {
++		this->ecc.mode = NAND_ECC_SOFT;
++		mxc_nand_hwecc(host, 0);
++	}
++
++	clk_enable(host->clk);
++
++	/* Disable interrupt */
++	writew(readw(host->regs + NFC_CONFIG1) | NFC_INT_MSK, host->regs + NFC_CONFIG1);
++
++	/* disable spare enable */
++	writew(readw(host->regs + NFC_CONFIG1) & ~NFC_V2_SP_EN, host->regs + NFC_CONFIG1);
++
++	/* Unlock the internal RAM Buffer */
++	writew(NFC_V2_BLS_UNLOCKED, host->regs + NFC_BLS);
++
++	/* Blocks to be unlocked */
++	unlock_addr(host, 0x0, 0xFFFF);
++
++	/* Unlock Block Command for given address range */
++	writew(NFC_WPC_UNLOCK, host->regs + NFC_WR_PROT);
++
++	clk_disable(host->clk);
++
++	/* Scan to find existence of the device */
++	if (nand_scan(mtd, 1)) {
++		DEBUG(MTD_DEBUG_LEVEL0,
++		      "MXC_ND2: Unable to find any NAND device.\n");
++		err = -ENXIO;
++		goto escan;
++	}
++
++	/* Register the partitions */
++#ifdef CONFIG_MTD_PARTITIONS
++	nr_parts =
++	    parse_mtd_partitions(mtd, part_probes, &host->parts, 0);
++	if (nr_parts > 0)
++		add_mtd_partitions(mtd, host->parts, nr_parts);
++	else
++#endif
++	{
++		pr_info("Registering %s as whole device\n", mtd->name);
++		add_mtd_device(mtd);
++	}
++
++	platform_set_drvdata(pdev, mtd);
++
++	return 0;
++
++escan:
++	free_irq(host->irq, NULL);
++eirq:
++	iounmap(host->regs);
++eres:
++	clk_put(host->clk);
++eclk:
++	kfree(host);
++
++	return err;
++
++}
++
++static int __exit mxcnd_remove(struct platform_device *pdev)
++{
++	struct mtd_info *mtd = platform_get_drvdata(pdev);
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	clk_disable(host->clk);
++	clk_put(host->clk);
++	platform_set_drvdata(pdev, NULL);
++
++	nand_release(mtd);
++	free_irq(host->irq, NULL);
++	kfree(host);
++
++	return 0;
++}
++
++#ifdef CONFIG_PM
++static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
++{
++	struct mtd_info *mtd = platform_get_drvdata(pdev);
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	int ret = 0;
++
++	if (mtd)
++		ret = mtd->suspend(mtd);
++
++	/* Disable the NFC clock */
++	clk_disable(host->clk);
++
++	return ret;
++}
++
++static int mxcnd_resume(struct platform_device *pdev)
++{
++	struct mtd_info *mtd = platform_get_drvdata(pdev);
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++
++	/* Enable the NFC clock */
++	clk_enable(host->clk);
++
++	if (mtd)
++		mtd->resume(mtd);
++
++	return 0;
++}
++
++#else
++#define mxcnd_suspend   NULL
++#define mxcnd_resume    NULL
++#endif				/* CONFIG_PM */
++
++static struct platform_driver mxcnd_driver = {
++	.driver = {
++		   .name = "mxc_nand",
++		   },
++	.probe = mxcnd_probe,
++	.remove = __exit_p(mxcnd_remove),
++	.suspend = mxcnd_suspend,
++	.resume = mxcnd_resume,
++};
++
++static int __init mxc_nd_init(void)
++{
++	/* Register the device driver structure. */
++	pr_info("MXC MTD nand Driver\n");
++	if (platform_driver_register(&mxcnd_driver) != 0) {
++		printk(KERN_ERR "Driver register failed for mxcnd_driver\n");
++		return -ENODEV;
++	}
++	return 0;
++}
++
++static void __exit mxc_nd_cleanup(void)
++{
++	/* Unregister the device structure */
++	platform_driver_unregister(&mxcnd_driver);
++}
++
++module_init(mxc_nd_init);
++module_exit(mxc_nd_cleanup);
++
++MODULE_AUTHOR("Freescale Semiconductor, Inc.");
++MODULE_DESCRIPTION("MXC NAND MTD driver");
++MODULE_LICENSE("GPL");
diff --git a/recipes/linux/linux-2.6.31/pcm043/0001-spi-add-SPI-driver-for-most-known-i.MX-SoCs.patch b/recipes/linux/linux-2.6.31/pcm043/0001-spi-add-SPI-driver-for-most-known-i.MX-SoCs.patch
new file mode 100644
index 0000000..19981d6
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0001-spi-add-SPI-driver-for-most-known-i.MX-SoCs.patch
@@ -0,0 +1,2337 @@
+From 9cb993fcb56f4033b6336c88e3f45bdd990403cd Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Tue, 22 Sep 2009 16:45:56 -0700
+Subject: [PATCH 01/28] spi: add SPI driver for most known i.MX SoCs
+
+This driver has been tested on i.MX1/i.MX27/i.MX35 with an AT25 type
+EEPROM and on i.MX27/i.MX31 with a Freescale MC13783 PMIC.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+Tested-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
+Acked-by: David Brownell <david-b@pacbell.net>
+Cc: Andrea Paterniani <a.paterniani@swapp-eng.it>
+Cc: Russell King <rmk@arm.linux.org.uk>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+---
+ arch/arm/plat-mxc/include/mach/spi.h |   27 +
+ drivers/spi/Kconfig                  |    7 +-
+ drivers/spi/spi_imx.c                | 2060 ++++++++--------------------------
+ 3 files changed, 516 insertions(+), 1578 deletions(-)
+ create mode 100644 arch/arm/plat-mxc/include/mach/spi.h
+
+diff --git a/arch/arm/plat-mxc/include/mach/spi.h b/arch/arm/plat-mxc/include/mach/spi.h
+new file mode 100644
+index 0000000..08be445
+--- /dev/null
++++ b/arch/arm/plat-mxc/include/mach/spi.h
+@@ -0,0 +1,27 @@
++
++#ifndef __MACH_SPI_H_
++#define __MACH_SPI_H_
++
++/*
++ * struct spi_imx_master - device.platform_data for SPI controller devices.
++ * @chipselect: Array of chipselects for this master. Numbers >= 0 mean gpio
++ *              pins, numbers < 0 mean internal CSPI chipselects according
++ *              to MXC_SPI_CS(). Normally you want to use gpio based chip
++ *              selects as the CSPI module tries to be intelligent about
++ *              when to assert the chipselect: The CSPI module deasserts the
++ *              chipselect once it runs out of input data. The other problem
++ *              is that it is not possible to mix between high active and low
++ *              active chipselects on one single bus using the internal
++ *              chipselects. Unfortunately Freescale decided to put some
++ *              chipselects on dedicated pins which are not usable as gpios,
++ *              so we have to support the internal chipselects.
++ * @num_chipselect: ARRAY_SIZE(chipselect)
++ */
++struct spi_imx_master {
++	int	*chipselect;
++	int	num_chipselect;
++};
++
++#define MXC_SPI_CS(no)	((no) - 32)
++
++#endif /* __MACH_SPI_H_*/
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index 2c733c2..885d6c4 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -117,10 +117,11 @@ config SPI_GPIO
+ 	  speed with a custom version of this driver; see the source code.
+ 
+ config SPI_IMX
+-	tristate "Freescale iMX SPI controller"
+-	depends on ARCH_MX1 && EXPERIMENTAL
++	tristate "Freescale i.MX SPI controllers"
++	depends on ARCH_MXC
++	select SPI_BITBANG
+ 	help
+-	  This enables using the Freescale iMX SPI controller in master
++	  This enables using the Freescale i.MX SPI controllers in master
+ 	  mode.
+ 
+ config SPI_LM70_LLP
+diff --git a/drivers/spi/spi_imx.c b/drivers/spi/spi_imx.c
+index c195e45..89c22ef 100644
+--- a/drivers/spi/spi_imx.c
++++ b/drivers/spi/spi_imx.c
+@@ -1,1770 +1,680 @@
+ /*
+- * drivers/spi/spi_imx.c
+- *
+- * Copyright (C) 2006 SWAPP
+- *	Andrea Paterniani <a.paterniani@swapp-eng.it>
+- *
+- * Initial version inspired by:
+- *	linux-2.6.17-rc3-mm1/drivers/spi/pxa2xx_spi.c
+- *
+- * This program is free software; you can redistribute it and/or modify
+- * it under the terms of the GNU General Public License as published by
+- * the Free Software Foundation; either version 2 of the License, or
+- * (at your option) any later version.
++ * Copyright 2004-2007 Freescale Semiconductor, Inc. All Rights Reserved.
++ * Copyright (C) 2008 Juergen Beisert
+  *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
+  * This program is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+  * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the
++ * Free Software Foundation
++ * 51 Franklin Street, Fifth Floor
++ * Boston, MA  02110-1301, USA.
+  */
+ 
++#include <linux/clk.h>
++#include <linux/completion.h>
++#include <linux/delay.h>
++#include <linux/err.h>
++#include <linux/gpio.h>
+ #include <linux/init.h>
+-#include <linux/module.h>
+-#include <linux/device.h>
+-#include <linux/ioport.h>
+-#include <linux/errno.h>
+ #include <linux/interrupt.h>
++#include <linux/io.h>
++#include <linux/irq.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
+ #include <linux/platform_device.h>
+-#include <linux/dma-mapping.h>
+ #include <linux/spi/spi.h>
+-#include <linux/workqueue.h>
+-#include <linux/delay.h>
+-#include <linux/clk.h>
++#include <linux/spi/spi_bitbang.h>
++#include <linux/types.h>
+ 
+-#include <asm/io.h>
+-#include <asm/irq.h>
+-#include <asm/delay.h>
+-
+-#include <mach/hardware.h>
+-#include <mach/imx-dma.h>
+-#include <mach/spi_imx.h>
+-
+-/*-------------------------------------------------------------------------*/
+-/* SPI Registers offsets from peripheral base address */
+-#define SPI_RXDATA		(0x00)
+-#define SPI_TXDATA		(0x04)
+-#define SPI_CONTROL		(0x08)
+-#define SPI_INT_STATUS		(0x0C)
+-#define SPI_TEST		(0x10)
+-#define SPI_PERIOD		(0x14)
+-#define SPI_DMA			(0x18)
+-#define SPI_RESET		(0x1C)
+-
+-/* SPI Control Register Bit Fields & Masks */
+-#define SPI_CONTROL_BITCOUNT_MASK	(0xF)		/* Bit Count Mask */
+-#define SPI_CONTROL_BITCOUNT(n)		(((n) - 1) & SPI_CONTROL_BITCOUNT_MASK)
+-#define SPI_CONTROL_POL			(0x1 << 4)      /* Clock Polarity Mask */
+-#define SPI_CONTROL_POL_ACT_HIGH	(0x0 << 4)      /* Active high pol. (0=idle) */
+-#define SPI_CONTROL_POL_ACT_LOW		(0x1 << 4)      /* Active low pol. (1=idle) */
+-#define SPI_CONTROL_PHA			(0x1 << 5)      /* Clock Phase Mask */
+-#define SPI_CONTROL_PHA_0		(0x0 << 5)      /* Clock Phase 0 */
+-#define SPI_CONTROL_PHA_1		(0x1 << 5)      /* Clock Phase 1 */
+-#define SPI_CONTROL_SSCTL		(0x1 << 6)      /* /SS Waveform Select Mask */
+-#define SPI_CONTROL_SSCTL_0		(0x0 << 6)      /* Master: /SS stays low between SPI burst
+-							   Slave: RXFIFO advanced by BIT_COUNT */
+-#define SPI_CONTROL_SSCTL_1		(0x1 << 6)      /* Master: /SS insert pulse between SPI burst
+-							   Slave: RXFIFO advanced by /SS rising edge */
+-#define SPI_CONTROL_SSPOL		(0x1 << 7)      /* /SS Polarity Select Mask */
+-#define SPI_CONTROL_SSPOL_ACT_LOW	(0x0 << 7)      /* /SS Active low */
+-#define SPI_CONTROL_SSPOL_ACT_HIGH	(0x1 << 7)      /* /SS Active high */
+-#define SPI_CONTROL_XCH			(0x1 << 8)      /* Exchange */
+-#define SPI_CONTROL_SPIEN		(0x1 << 9)      /* SPI Module Enable */
+-#define SPI_CONTROL_MODE		(0x1 << 10)     /* SPI Mode Select Mask */
+-#define SPI_CONTROL_MODE_SLAVE		(0x0 << 10)     /* SPI Mode Slave */
+-#define SPI_CONTROL_MODE_MASTER		(0x1 << 10)     /* SPI Mode Master */
+-#define SPI_CONTROL_DRCTL		(0x3 << 11)     /* /SPI_RDY Control Mask */
+-#define SPI_CONTROL_DRCTL_0		(0x0 << 11)     /* Ignore /SPI_RDY */
+-#define SPI_CONTROL_DRCTL_1		(0x1 << 11)     /* /SPI_RDY falling edge triggers input */
+-#define SPI_CONTROL_DRCTL_2		(0x2 << 11)     /* /SPI_RDY active low level triggers input */
+-#define SPI_CONTROL_DATARATE		(0x7 << 13)     /* Data Rate Mask */
+-#define SPI_PERCLK2_DIV_MIN		(0)		/* PERCLK2:4 */
+-#define SPI_PERCLK2_DIV_MAX		(7)		/* PERCLK2:512 */
+-#define SPI_CONTROL_DATARATE_MIN	(SPI_PERCLK2_DIV_MAX << 13)
+-#define SPI_CONTROL_DATARATE_MAX	(SPI_PERCLK2_DIV_MIN << 13)
+-#define SPI_CONTROL_DATARATE_BAD	(SPI_CONTROL_DATARATE_MIN + 1)
+-
+-/* SPI Interrupt/Status Register Bit Fields & Masks */
+-#define SPI_STATUS_TE	(0x1 << 0)	/* TXFIFO Empty Status */
+-#define SPI_STATUS_TH	(0x1 << 1)      /* TXFIFO Half Status */
+-#define SPI_STATUS_TF	(0x1 << 2)      /* TXFIFO Full Status */
+-#define SPI_STATUS_RR	(0x1 << 3)      /* RXFIFO Data Ready Status */
+-#define SPI_STATUS_RH	(0x1 << 4)      /* RXFIFO Half Status */
+-#define SPI_STATUS_RF	(0x1 << 5)      /* RXFIFO Full Status */
+-#define SPI_STATUS_RO	(0x1 << 6)      /* RXFIFO Overflow */
+-#define SPI_STATUS_BO	(0x1 << 7)      /* Bit Count Overflow */
+-#define SPI_STATUS	(0xFF)		/* SPI Status Mask */
+-#define SPI_INTEN_TE	(0x1 << 8)      /* TXFIFO Empty Interrupt Enable */
+-#define SPI_INTEN_TH	(0x1 << 9)      /* TXFIFO Half Interrupt Enable */
+-#define SPI_INTEN_TF	(0x1 << 10)     /* TXFIFO Full Interrupt Enable */
+-#define SPI_INTEN_RE	(0x1 << 11)     /* RXFIFO Data Ready Interrupt Enable */
+-#define SPI_INTEN_RH	(0x1 << 12)     /* RXFIFO Half Interrupt Enable */
+-#define SPI_INTEN_RF	(0x1 << 13)     /* RXFIFO Full Interrupt Enable */
+-#define SPI_INTEN_RO	(0x1 << 14)     /* RXFIFO Overflow Interrupt Enable */
+-#define SPI_INTEN_BO	(0x1 << 15)     /* Bit Count Overflow Interrupt Enable */
+-#define SPI_INTEN	(0xFF << 8)	/* SPI Interrupt Enable Mask */
+-
+-/* SPI Test Register Bit Fields & Masks */
+-#define SPI_TEST_TXCNT		(0xF << 0)	/* TXFIFO Counter */
+-#define SPI_TEST_RXCNT_LSB	(4)		/* RXFIFO Counter LSB */
+-#define SPI_TEST_RXCNT		(0xF << 4)	/* RXFIFO Counter */
+-#define SPI_TEST_SSTATUS	(0xF << 8)	/* State Machine Status */
+-#define SPI_TEST_LBC		(0x1 << 14)	/* Loop Back Control */
+-
+-/* SPI Period Register Bit Fields & Masks */
+-#define SPI_PERIOD_WAIT		(0x7FFF << 0)	/* Wait Between Transactions */
+-#define SPI_PERIOD_MAX_WAIT	(0x7FFF)	/* Max Wait Between
+-							Transactions */
+-#define SPI_PERIOD_CSRC		(0x1 << 15)	/* Period Clock Source Mask */
+-#define SPI_PERIOD_CSRC_BCLK	(0x0 << 15)	/* Period Clock Source is
+-							Bit Clock */
+-#define SPI_PERIOD_CSRC_32768	(0x1 << 15)	/* Period Clock Source is
+-							32.768 KHz Clock */
+-
+-/* SPI DMA Register Bit Fields & Masks */
+-#define SPI_DMA_RHDMA	(0x1 << 4)	/* RXFIFO Half Status */
+-#define SPI_DMA_RFDMA	(0x1 << 5)      /* RXFIFO Full Status */
+-#define SPI_DMA_TEDMA	(0x1 << 6)      /* TXFIFO Empty Status */
+-#define SPI_DMA_THDMA	(0x1 << 7)      /* TXFIFO Half Status */
+-#define SPI_DMA_RHDEN	(0x1 << 12)	/* RXFIFO Half DMA Request Enable */
+-#define SPI_DMA_RFDEN	(0x1 << 13)     /* RXFIFO Full DMA Request Enable */
+-#define SPI_DMA_TEDEN	(0x1 << 14)     /* TXFIFO Empty DMA Request Enable */
+-#define SPI_DMA_THDEN	(0x1 << 15)     /* TXFIFO Half DMA Request Enable */
+-
+-/* SPI Soft Reset Register Bit Fields & Masks */
+-#define SPI_RESET_START	(0x1)		/* Start */
+-
+-/* Default SPI configuration values */
+-#define SPI_DEFAULT_CONTROL		\
+-(					\
+-	SPI_CONTROL_BITCOUNT(16) | 	\
+-	SPI_CONTROL_POL_ACT_HIGH |	\
+-	SPI_CONTROL_PHA_0 |		\
+-	SPI_CONTROL_SPIEN |		\
+-	SPI_CONTROL_SSCTL_1 |		\
+-	SPI_CONTROL_MODE_MASTER |	\
+-	SPI_CONTROL_DRCTL_0 |		\
+-	SPI_CONTROL_DATARATE_MIN	\
+-)
+-#define SPI_DEFAULT_ENABLE_LOOPBACK	(0)
+-#define SPI_DEFAULT_ENABLE_DMA		(0)
+-#define SPI_DEFAULT_PERIOD_WAIT		(8)
+-/*-------------------------------------------------------------------------*/
+-
+-
+-/*-------------------------------------------------------------------------*/
+-/* TX/RX SPI FIFO size */
+-#define SPI_FIFO_DEPTH			(8)
+-#define SPI_FIFO_BYTE_WIDTH		(2)
+-#define SPI_FIFO_OVERFLOW_MARGIN	(2)
+-
+-/* DMA burst length for half full/empty request trigger */
+-#define SPI_DMA_BLR			(SPI_FIFO_DEPTH * SPI_FIFO_BYTE_WIDTH / 2)
+-
+-/* Dummy char output to achieve reads.
+-   Choosing something different from all zeroes may help pattern recogition
+-   for oscilloscope analysis, but may break some drivers. */
+-#define SPI_DUMMY_u8			0
+-#define SPI_DUMMY_u16			((SPI_DUMMY_u8 << 8) | SPI_DUMMY_u8)
+-#define SPI_DUMMY_u32			((SPI_DUMMY_u16 << 16) | SPI_DUMMY_u16)
+-
+-/**
+- * Macro to change a u32 field:
+- * @r : register to edit
+- * @m : bit mask
+- * @v : new value for the field correctly bit-alligned
+-*/
+-#define u32_EDIT(r, m, v)		r = (r & ~(m)) | (v)
+-
+-/* Message state */
+-#define START_STATE			((void*)0)
+-#define RUNNING_STATE			((void*)1)
+-#define DONE_STATE			((void*)2)
+-#define ERROR_STATE			((void*)-1)
+-
+-/* Queue state */
+-#define QUEUE_RUNNING			(0)
+-#define QUEUE_STOPPED			(1)
+-
+-#define IS_DMA_ALIGNED(x) 		(((u32)(x) & 0x03) == 0)
+-#define DMA_ALIGNMENT			4
+-/*-------------------------------------------------------------------------*/
+-
+-
+-/*-------------------------------------------------------------------------*/
+-/* Driver data structs */
+-
+-/* Context */
+-struct driver_data {
+-	/* Driver model hookup */
+-	struct platform_device *pdev;
+-
+-	/* SPI framework hookup */
+-	struct spi_master *master;
++#include <mach/spi.h>
+ 
+-	/* IMX hookup */
+-	struct spi_imx_master *master_info;
+-
+-	/* Memory resources and SPI regs virtual address */
+-	struct resource *ioarea;
+-	void __iomem *regs;
+-
+-	/* SPI RX_DATA physical address */
+-	dma_addr_t rd_data_phys;
+-
+-	/* Driver message queue */
+-	struct workqueue_struct	*workqueue;
+-	struct work_struct work;
+-	spinlock_t lock;
+-	struct list_head queue;
+-	int busy;
+-	int run;
+-
+-	/* Message Transfer pump */
+-	struct tasklet_struct pump_transfers;
+-
+-	/* Current message, transfer and state */
+-	struct spi_message *cur_msg;
+-	struct spi_transfer *cur_transfer;
+-	struct chip_data *cur_chip;
+-
+-	/* Rd / Wr buffers pointers */
+-	size_t len;
+-	void *tx;
+-	void *tx_end;
+-	void *rx;
+-	void *rx_end;
+-
+-	u8 rd_only;
+-	u8 n_bytes;
+-	int cs_change;
+-
+-	/* Function pointers */
+-	irqreturn_t (*transfer_handler)(struct driver_data *drv_data);
+-	void (*cs_control)(u32 command);
+-
+-	/* DMA setup */
+-	int rx_channel;
+-	int tx_channel;
+-	dma_addr_t rx_dma;
+-	dma_addr_t tx_dma;
+-	int rx_dma_needs_unmap;
+-	int tx_dma_needs_unmap;
+-	size_t tx_map_len;
+-	u32 dummy_dma_buf ____cacheline_aligned;
++#define DRIVER_NAME "spi_imx"
+ 
+-	struct clk *clk;
+-};
++#define MXC_CSPIRXDATA		0x00
++#define MXC_CSPITXDATA		0x04
++#define MXC_CSPICTRL		0x08
++#define MXC_CSPIINT		0x0c
++#define MXC_RESET		0x1c
+ 
+-/* Runtime state */
+-struct chip_data {
+-	u32 control;
+-	u32 period;
+-	u32 test;
++/* generic defines to abstract from the different register layouts */
++#define MXC_INT_RR	(1 << 0) /* Receive data ready interrupt */
++#define MXC_INT_TE	(1 << 1) /* Transmit FIFO empty interrupt */
+ 
+-	u8 enable_dma:1;
+-	u8 bits_per_word;
+-	u8 n_bytes;
+-	u32 max_speed_hz;
+-
+-	void (*cs_control)(u32 command);
++struct spi_imx_config {
++	unsigned int speed_hz;
++	unsigned int bpw;
++	unsigned int mode;
++	int cs;
+ };
+-/*-------------------------------------------------------------------------*/
+-
+ 
+-static void pump_messages(struct work_struct *work);
++struct spi_imx_data {
++	struct spi_bitbang bitbang;
+ 
+-static void flush(struct driver_data *drv_data)
+-{
+-	void __iomem *regs = drv_data->regs;
+-	u32 control;
++	struct completion xfer_done;
++	void *base;
++	int irq;
++	struct clk *clk;
++	unsigned long spi_clk;
++	int *chipselect;
++
++	unsigned int count;
++	void (*tx)(struct spi_imx_data *);
++	void (*rx)(struct spi_imx_data *);
++	void *rx_buf;
++	const void *tx_buf;
++	unsigned int txfifo; /* number of words pushed in tx FIFO */
++
++	/* SoC specific functions */
++	void (*intctrl)(struct spi_imx_data *, int);
++	int (*config)(struct spi_imx_data *, struct spi_imx_config *);
++	void (*trigger)(struct spi_imx_data *);
++	int (*rx_available)(struct spi_imx_data *);
++};
+ 
+-	dev_dbg(&drv_data->pdev->dev, "flush\n");
++#define MXC_SPI_BUF_RX(type)						\
++static void spi_imx_buf_rx_##type(struct spi_imx_data *spi_imx)		\
++{									\
++	unsigned int val = readl(spi_imx->base + MXC_CSPIRXDATA);	\
++									\
++	if (spi_imx->rx_buf) {						\
++		*(type *)spi_imx->rx_buf = val;				\
++		spi_imx->rx_buf += sizeof(type);			\
++	}								\
++}
++
++#define MXC_SPI_BUF_TX(type)						\
++static void spi_imx_buf_tx_##type(struct spi_imx_data *spi_imx)		\
++{									\
++	type val = 0;							\
++									\
++	if (spi_imx->tx_buf) {						\
++		val = *(type *)spi_imx->tx_buf;				\
++		spi_imx->tx_buf += sizeof(type);			\
++	}								\
++									\
++	spi_imx->count -= sizeof(type);					\
++									\
++	writel(val, spi_imx->base + MXC_CSPITXDATA);			\
++}
++
++MXC_SPI_BUF_RX(u8)
++MXC_SPI_BUF_TX(u8)
++MXC_SPI_BUF_RX(u16)
++MXC_SPI_BUF_TX(u16)
++MXC_SPI_BUF_RX(u32)
++MXC_SPI_BUF_TX(u32)
++
++/* First entry is reserved, second entry is valid only if SDHC_SPIEN is set
++ * (which is currently not the case in this driver)
++ */
++static int mxc_clkdivs[] = {0, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192,
++	256, 384, 512, 768, 1024};
+ 
+-	/* Wait for end of transaction */
+-	do {
+-		control = readl(regs + SPI_CONTROL);
+-	} while (control & SPI_CONTROL_XCH);
++/* MX21, MX27 */
++static unsigned int spi_imx_clkdiv_1(unsigned int fin,
++		unsigned int fspi)
++{
++	int i, max;
+ 
+-	/* Release chip select if requested, transfer delays are
+-	   handled in pump_transfers */
+-	if (drv_data->cs_change)
+-		drv_data->cs_control(SPI_CS_DEASSERT);
++	if (cpu_is_mx21())
++		max = 18;
++	else
++		max = 16;
+ 
+-	/* Disable SPI to flush FIFOs */
+-	writel(control & ~SPI_CONTROL_SPIEN, regs + SPI_CONTROL);
+-	writel(control, regs + SPI_CONTROL);
+-}
++	for (i = 2; i < max; i++)
++		if (fspi * mxc_clkdivs[i] >= fin)
++			return i;
+ 
+-static void restore_state(struct driver_data *drv_data)
+-{
+-	void __iomem *regs = drv_data->regs;
+-	struct chip_data *chip = drv_data->cur_chip;
+-
+-	/* Load chip registers */
+-	dev_dbg(&drv_data->pdev->dev,
+-		"restore_state\n"
+-		"    test    = 0x%08X\n"
+-		"    control = 0x%08X\n",
+-		chip->test,
+-		chip->control);
+-	writel(chip->test, regs + SPI_TEST);
+-	writel(chip->period, regs + SPI_PERIOD);
+-	writel(0, regs + SPI_INT_STATUS);
+-	writel(chip->control, regs + SPI_CONTROL);
++	return max;
+ }
+ 
+-static void null_cs_control(u32 command)
++/* MX1, MX31, MX35 */
++static unsigned int spi_imx_clkdiv_2(unsigned int fin,
++		unsigned int fspi)
+ {
+-}
++	int i, div = 4;
+ 
+-static inline u32 data_to_write(struct driver_data *drv_data)
+-{
+-	return ((u32)(drv_data->tx_end - drv_data->tx)) / drv_data->n_bytes;
+-}
++	for (i = 0; i < 7; i++) {
++		if (fspi * div >= fin)
++			return i;
++		div <<= 1;
++	}
+ 
+-static inline u32 data_to_read(struct driver_data *drv_data)
+-{
+-	return ((u32)(drv_data->rx_end - drv_data->rx)) / drv_data->n_bytes;
++	return 7;
+ }
+ 
+-static int write(struct driver_data *drv_data)
+-{
+-	void __iomem *regs = drv_data->regs;
+-	void *tx = drv_data->tx;
+-	void *tx_end = drv_data->tx_end;
+-	u8 n_bytes = drv_data->n_bytes;
+-	u32 remaining_writes;
+-	u32 fifo_avail_space;
+-	u32 n;
+-	u16 d;
+-
+-	/* Compute how many fifo writes to do */
+-	remaining_writes = (u32)(tx_end - tx) / n_bytes;
+-	fifo_avail_space = SPI_FIFO_DEPTH -
+-				(readl(regs + SPI_TEST) & SPI_TEST_TXCNT);
+-	if (drv_data->rx && (fifo_avail_space > SPI_FIFO_OVERFLOW_MARGIN))
+-		/* Fix misunderstood receive overflow */
+-		fifo_avail_space -= SPI_FIFO_OVERFLOW_MARGIN;
+-	n = min(remaining_writes, fifo_avail_space);
+-
+-	dev_dbg(&drv_data->pdev->dev,
+-		"write type %s\n"
+-		"    remaining writes = %d\n"
+-		"    fifo avail space = %d\n"
+-		"    fifo writes      = %d\n",
+-		(n_bytes == 1) ? "u8" : "u16",
+-		remaining_writes,
+-		fifo_avail_space,
+-		n);
+-
+-	if (n > 0) {
+-		/* Fill SPI TXFIFO */
+-		if (drv_data->rd_only) {
+-			tx += n * n_bytes;
+-			while (n--)
+-				writel(SPI_DUMMY_u16, regs + SPI_TXDATA);
+-		} else {
+-			if (n_bytes == 1) {
+-				while (n--) {
+-					d = *(u8*)tx;
+-					writel(d, regs + SPI_TXDATA);
+-					tx += 1;
+-				}
+-			} else {
+-				while (n--) {
+-					d = *(u16*)tx;
+-					writel(d, regs + SPI_TXDATA);
+-					tx += 2;
+-				}
+-			}
+-		}
+-
+-		/* Trigger transfer */
+-		writel(readl(regs + SPI_CONTROL) | SPI_CONTROL_XCH,
+-			regs + SPI_CONTROL);
++#define MX31_INTREG_TEEN	(1 << 0)
++#define MX31_INTREG_RREN	(1 << 3)
+ 
+-		/* Update tx pointer */
+-		drv_data->tx = tx;
+-	}
++#define MX31_CSPICTRL_ENABLE	(1 << 0)
++#define MX31_CSPICTRL_MASTER	(1 << 1)
++#define MX31_CSPICTRL_XCH	(1 << 2)
++#define MX31_CSPICTRL_POL	(1 << 4)
++#define MX31_CSPICTRL_PHA	(1 << 5)
++#define MX31_CSPICTRL_SSCTL	(1 << 6)
++#define MX31_CSPICTRL_SSPOL	(1 << 7)
++#define MX31_CSPICTRL_BC_SHIFT	8
++#define MX35_CSPICTRL_BL_SHIFT	20
++#define MX31_CSPICTRL_CS_SHIFT	24
++#define MX35_CSPICTRL_CS_SHIFT	12
++#define MX31_CSPICTRL_DR_SHIFT	16
+ 
+-	return (tx >= tx_end);
+-}
++#define MX31_CSPISTATUS		0x14
++#define MX31_STATUS_RR		(1 << 3)
+ 
+-static int read(struct driver_data *drv_data)
++/* These functions also work for the i.MX35, but be aware that
++ * the i.MX35 has a slightly different register layout for bits
++ * we do not use here.
++ */
++static void mx31_intctrl(struct spi_imx_data *spi_imx, int enable)
+ {
+-	void __iomem *regs = drv_data->regs;
+-	void *rx = drv_data->rx;
+-	void *rx_end = drv_data->rx_end;
+-	u8 n_bytes = drv_data->n_bytes;
+-	u32 remaining_reads;
+-	u32 fifo_rxcnt;
+-	u32 n;
+-	u16 d;
+-
+-	/* Compute how many fifo reads to do */
+-	remaining_reads = (u32)(rx_end - rx) / n_bytes;
+-	fifo_rxcnt = (readl(regs + SPI_TEST) & SPI_TEST_RXCNT) >>
+-			SPI_TEST_RXCNT_LSB;
+-	n = min(remaining_reads, fifo_rxcnt);
+-
+-	dev_dbg(&drv_data->pdev->dev,
+-		"read type %s\n"
+-		"    remaining reads = %d\n"
+-		"    fifo rx count   = %d\n"
+-		"    fifo reads      = %d\n",
+-		(n_bytes == 1) ? "u8" : "u16",
+-		remaining_reads,
+-		fifo_rxcnt,
+-		n);
+-
+-	if (n > 0) {
+-		/* Read SPI RXFIFO */
+-		if (n_bytes == 1) {
+-			while (n--) {
+-				d = readl(regs + SPI_RXDATA);
+-				*((u8*)rx) = d;
+-				rx += 1;
+-			}
+-		} else {
+-			while (n--) {
+-				d = readl(regs + SPI_RXDATA);
+-				*((u16*)rx) = d;
+-				rx += 2;
+-			}
+-		}
++	unsigned int val = 0;
+ 
+-		/* Update rx pointer */
+-		drv_data->rx = rx;
+-	}
++	if (enable & MXC_INT_TE)
++		val |= MX31_INTREG_TEEN;
++	if (enable & MXC_INT_RR)
++		val |= MX31_INTREG_RREN;
+ 
+-	return (rx >= rx_end);
++	writel(val, spi_imx->base + MXC_CSPIINT);
+ }
+ 
+-static void *next_transfer(struct driver_data *drv_data)
++static void mx31_trigger(struct spi_imx_data *spi_imx)
+ {
+-	struct spi_message *msg = drv_data->cur_msg;
+-	struct spi_transfer *trans = drv_data->cur_transfer;
+-
+-	/* Move to next transfer */
+-	if (trans->transfer_list.next != &msg->transfers) {
+-		drv_data->cur_transfer =
+-			list_entry(trans->transfer_list.next,
+-					struct spi_transfer,
+-					transfer_list);
+-		return RUNNING_STATE;
+-	}
++	unsigned int reg;
+ 
+-	return DONE_STATE;
++	reg = readl(spi_imx->base + MXC_CSPICTRL);
++	reg |= MX31_CSPICTRL_XCH;
++	writel(reg, spi_imx->base + MXC_CSPICTRL);
+ }
+ 
+-static int map_dma_buffers(struct driver_data *drv_data)
++static int mx31_config(struct spi_imx_data *spi_imx,
++		struct spi_imx_config *config)
+ {
+-	struct spi_message *msg;
+-	struct device *dev;
+-	void *buf;
+-
+-	drv_data->rx_dma_needs_unmap = 0;
+-	drv_data->tx_dma_needs_unmap = 0;
+-
+-	if (!drv_data->master_info->enable_dma ||
+-		!drv_data->cur_chip->enable_dma)
+-			return -1;
+-
+-	msg = drv_data->cur_msg;
+-	dev = &msg->spi->dev;
+-	if (msg->is_dma_mapped) {
+-		if (drv_data->tx_dma)
+-			/* The caller provided at least dma and cpu virtual
+-			   address for write; pump_transfers() will consider the
+-			   transfer as write only if cpu rx virtual address is
+-			   NULL */
+-			return 0;
+-
+-		if (drv_data->rx_dma) {
+-			/* The caller provided dma and cpu virtual address to
+-			   performe read only transfer -->
+-			   use drv_data->dummy_dma_buf for dummy writes to
+-			   achive reads */
+-			buf = &drv_data->dummy_dma_buf;
+-			drv_data->tx_map_len = sizeof(drv_data->dummy_dma_buf);
+-			drv_data->tx_dma = dma_map_single(dev,
+-							buf,
+-							drv_data->tx_map_len,
+-							DMA_TO_DEVICE);
+-			if (dma_mapping_error(dev, drv_data->tx_dma))
+-				return -1;
+-
+-			drv_data->tx_dma_needs_unmap = 1;
+-
+-			/* Flags transfer as rd_only for pump_transfers() DMA
+-			   regs programming (should be redundant) */
+-			drv_data->tx = NULL;
+-
+-			return 0;
+-		}
+-	}
++	unsigned int reg = MX31_CSPICTRL_ENABLE | MX31_CSPICTRL_MASTER;
+ 
+-	if (!IS_DMA_ALIGNED(drv_data->rx) || !IS_DMA_ALIGNED(drv_data->tx))
+-		return -1;
+-
+-	if (drv_data->tx == NULL) {
+-		/* Read only message --> use drv_data->dummy_dma_buf for dummy
+-		   writes to achive reads */
+-		buf = &drv_data->dummy_dma_buf;
+-		drv_data->tx_map_len = sizeof(drv_data->dummy_dma_buf);
+-	} else {
+-		buf = drv_data->tx;
+-		drv_data->tx_map_len = drv_data->len;
++	reg |= spi_imx_clkdiv_2(spi_imx->spi_clk, config->speed_hz) <<
++		MX31_CSPICTRL_DR_SHIFT;
++
++	if (cpu_is_mx31())
++		reg |= (config->bpw - 1) << MX31_CSPICTRL_BC_SHIFT;
++	else if (cpu_is_mx35()) {
++		reg |= (config->bpw - 1) << MX35_CSPICTRL_BL_SHIFT;
++		reg |= MX31_CSPICTRL_SSCTL;
+ 	}
+-	drv_data->tx_dma = dma_map_single(dev,
+-					buf,
+-					drv_data->tx_map_len,
+-					DMA_TO_DEVICE);
+-	if (dma_mapping_error(dev, drv_data->tx_dma))
+-		return -1;
+-	drv_data->tx_dma_needs_unmap = 1;
+-
+-	/* NULL rx means write-only transfer and no map needed
+-	 * since rx DMA will not be used */
+-	if (drv_data->rx) {
+-		buf = drv_data->rx;
+-		drv_data->rx_dma = dma_map_single(dev,
+-						buf,
+-						drv_data->len,
+-						DMA_FROM_DEVICE);
+-		if (dma_mapping_error(dev, drv_data->rx_dma)) {
+-			if (drv_data->tx_dma) {
+-				dma_unmap_single(dev,
+-						drv_data->tx_dma,
+-						drv_data->tx_map_len,
+-						DMA_TO_DEVICE);
+-				drv_data->tx_dma_needs_unmap = 0;
+-			}
+-			return -1;
+-		}
+-		drv_data->rx_dma_needs_unmap = 1;
++
++	if (config->mode & SPI_CPHA)
++		reg |= MX31_CSPICTRL_PHA;
++	if (config->mode & SPI_CPOL)
++		reg |= MX31_CSPICTRL_POL;
++	if (config->mode & SPI_CS_HIGH)
++		reg |= MX31_CSPICTRL_SSPOL;
++	if (config->cs < 0) {
++		if (cpu_is_mx31())
++			reg |= (config->cs + 32) << MX31_CSPICTRL_CS_SHIFT;
++		else if (cpu_is_mx35())
++			reg |= (config->cs + 32) << MX35_CSPICTRL_CS_SHIFT;
+ 	}
+ 
++	writel(reg, spi_imx->base + MXC_CSPICTRL);
++
+ 	return 0;
+ }
+ 
+-static void unmap_dma_buffers(struct driver_data *drv_data)
++static int mx31_rx_available(struct spi_imx_data *spi_imx)
+ {
+-	struct spi_message *msg = drv_data->cur_msg;
+-	struct device *dev = &msg->spi->dev;
+-
+-	if (drv_data->rx_dma_needs_unmap) {
+-		dma_unmap_single(dev,
+-				drv_data->rx_dma,
+-				drv_data->len,
+-				DMA_FROM_DEVICE);
+-		drv_data->rx_dma_needs_unmap = 0;
+-	}
+-	if (drv_data->tx_dma_needs_unmap) {
+-		dma_unmap_single(dev,
+-				drv_data->tx_dma,
+-				drv_data->tx_map_len,
+-				DMA_TO_DEVICE);
+-		drv_data->tx_dma_needs_unmap = 0;
+-	}
++	return readl(spi_imx->base + MX31_CSPISTATUS) & MX31_STATUS_RR;
+ }
+ 
+-/* Caller already set message->status (dma is already blocked) */
+-static void giveback(struct spi_message *message, struct driver_data *drv_data)
+-{
+-	void __iomem *regs = drv_data->regs;
+-
+-	/* Bring SPI to sleep; restore_state() and pump_transfer()
+-	   will do new setup */
+-	writel(0, regs + SPI_INT_STATUS);
+-	writel(0, regs + SPI_DMA);
+-
+-	/* Unconditioned deselct */
+-	drv_data->cs_control(SPI_CS_DEASSERT);
++#define MX27_INTREG_RR		(1 << 4)
++#define MX27_INTREG_TEEN	(1 << 9)
++#define MX27_INTREG_RREN	(1 << 13)
+ 
+-	message->state = NULL;
+-	if (message->complete)
+-		message->complete(message->context);
++#define MX27_CSPICTRL_POL	(1 << 5)
++#define MX27_CSPICTRL_PHA	(1 << 6)
++#define MX27_CSPICTRL_SSPOL	(1 << 8)
++#define MX27_CSPICTRL_XCH	(1 << 9)
++#define MX27_CSPICTRL_ENABLE	(1 << 10)
++#define MX27_CSPICTRL_MASTER	(1 << 11)
++#define MX27_CSPICTRL_DR_SHIFT	14
++#define MX27_CSPICTRL_CS_SHIFT	19
+ 
+-	drv_data->cur_msg = NULL;
+-	drv_data->cur_transfer = NULL;
+-	drv_data->cur_chip = NULL;
+-	queue_work(drv_data->workqueue, &drv_data->work);
+-}
+-
+-static void dma_err_handler(int channel, void *data, int errcode)
++static void mx27_intctrl(struct spi_imx_data *spi_imx, int enable)
+ {
+-	struct driver_data *drv_data = data;
+-	struct spi_message *msg = drv_data->cur_msg;
+-
+-	dev_dbg(&drv_data->pdev->dev, "dma_err_handler\n");
+-
+-	/* Disable both rx and tx dma channels */
+-	imx_dma_disable(drv_data->rx_channel);
+-	imx_dma_disable(drv_data->tx_channel);
+-	unmap_dma_buffers(drv_data);
++	unsigned int val = 0;
+ 
+-	flush(drv_data);
++	if (enable & MXC_INT_TE)
++		val |= MX27_INTREG_TEEN;
++	if (enable & MXC_INT_RR)
++		val |= MX27_INTREG_RREN;
+ 
+-	msg->state = ERROR_STATE;
+-	tasklet_schedule(&drv_data->pump_transfers);
++	writel(val, spi_imx->base + MXC_CSPIINT);
+ }
+ 
+-static void dma_tx_handler(int channel, void *data)
++static void mx27_trigger(struct spi_imx_data *spi_imx)
+ {
+-	struct driver_data *drv_data = data;
++	unsigned int reg;
+ 
+-	dev_dbg(&drv_data->pdev->dev, "dma_tx_handler\n");
+-
+-	imx_dma_disable(channel);
+-
+-	/* Now waits for TX FIFO empty */
+-	writel(SPI_INTEN_TE, drv_data->regs + SPI_INT_STATUS);
++	reg = readl(spi_imx->base + MXC_CSPICTRL);
++	reg |= MX27_CSPICTRL_XCH;
++	writel(reg, spi_imx->base + MXC_CSPICTRL);
+ }
+ 
+-static irqreturn_t dma_transfer(struct driver_data *drv_data)
++static int mx27_config(struct spi_imx_data *spi_imx,
++		struct spi_imx_config *config)
+ {
+-	u32 status;
+-	struct spi_message *msg = drv_data->cur_msg;
+-	void __iomem *regs = drv_data->regs;
+-
+-	status = readl(regs + SPI_INT_STATUS);
++	unsigned int reg = MX27_CSPICTRL_ENABLE | MX27_CSPICTRL_MASTER;
+ 
+-	if ((status & (SPI_INTEN_RO | SPI_STATUS_RO))
+-			== (SPI_INTEN_RO | SPI_STATUS_RO)) {
+-		writel(status & ~SPI_INTEN, regs + SPI_INT_STATUS);
++	reg |= spi_imx_clkdiv_1(spi_imx->spi_clk, config->speed_hz) <<
++		MX27_CSPICTRL_DR_SHIFT;
++	reg |= config->bpw - 1;
+ 
+-		imx_dma_disable(drv_data->tx_channel);
+-		imx_dma_disable(drv_data->rx_channel);
+-		unmap_dma_buffers(drv_data);
++	if (config->mode & SPI_CPHA)
++		reg |= MX27_CSPICTRL_PHA;
++	if (config->mode & SPI_CPOL)
++		reg |= MX27_CSPICTRL_POL;
++	if (config->mode & SPI_CS_HIGH)
++		reg |= MX27_CSPICTRL_SSPOL;
++	if (config->cs < 0)
++		reg |= (config->cs + 32) << MX27_CSPICTRL_CS_SHIFT;
+ 
+-		flush(drv_data);
++	writel(reg, spi_imx->base + MXC_CSPICTRL);
+ 
+-		dev_warn(&drv_data->pdev->dev,
+-				"dma_transfer - fifo overun\n");
+-
+-		msg->state = ERROR_STATE;
+-		tasklet_schedule(&drv_data->pump_transfers);
+-
+-		return IRQ_HANDLED;
+-	}
+-
+-	if (status & SPI_STATUS_TE) {
+-		writel(status & ~SPI_INTEN_TE, regs + SPI_INT_STATUS);
+-
+-		if (drv_data->rx) {
+-			/* Wait end of transfer before read trailing data */
+-			while (readl(regs + SPI_CONTROL) & SPI_CONTROL_XCH)
+-				cpu_relax();
+-
+-			imx_dma_disable(drv_data->rx_channel);
+-			unmap_dma_buffers(drv_data);
+-
+-			/* Release chip select if requested, transfer delays are
+-			   handled in pump_transfers() */
+-			if (drv_data->cs_change)
+-				drv_data->cs_control(SPI_CS_DEASSERT);
+-
+-			/* Calculate number of trailing data and read them */
+-			dev_dbg(&drv_data->pdev->dev,
+-				"dma_transfer - test = 0x%08X\n",
+-				readl(regs + SPI_TEST));
+-			drv_data->rx = drv_data->rx_end -
+-					((readl(regs + SPI_TEST) &
+-					SPI_TEST_RXCNT) >>
+-					SPI_TEST_RXCNT_LSB)*drv_data->n_bytes;
+-			read(drv_data);
+-		} else {
+-			/* Write only transfer */
+-			unmap_dma_buffers(drv_data);
+-
+-			flush(drv_data);
+-		}
+-
+-		/* End of transfer, update total byte transfered */
+-		msg->actual_length += drv_data->len;
+-
+-		/* Move to next transfer */
+-		msg->state = next_transfer(drv_data);
+-
+-		/* Schedule transfer tasklet */
+-		tasklet_schedule(&drv_data->pump_transfers);
+-
+-		return IRQ_HANDLED;
+-	}
+-
+-	/* Opps problem detected */
+-	return IRQ_NONE;
++	return 0;
+ }
+ 
+-static irqreturn_t interrupt_wronly_transfer(struct driver_data *drv_data)
++static int mx27_rx_available(struct spi_imx_data *spi_imx)
+ {
+-	struct spi_message *msg = drv_data->cur_msg;
+-	void __iomem *regs = drv_data->regs;
+-	u32 status;
+-	irqreturn_t handled = IRQ_NONE;
+-
+-	status = readl(regs + SPI_INT_STATUS);
+-
+-	if (status & SPI_INTEN_TE) {
+-		/* TXFIFO Empty Interrupt on the last transfered word */
+-		writel(status & ~SPI_INTEN, regs + SPI_INT_STATUS);
+-		dev_dbg(&drv_data->pdev->dev,
+-			"interrupt_wronly_transfer - end of tx\n");
+-
+-		flush(drv_data);
++	return readl(spi_imx->base + MXC_CSPIINT) & MX27_INTREG_RR;
++}
+ 
+-		/* Update total byte transfered */
+-		msg->actual_length += drv_data->len;
++#define MX1_INTREG_RR		(1 << 3)
++#define MX1_INTREG_TEEN		(1 << 8)
++#define MX1_INTREG_RREN		(1 << 11)
+ 
+-		/* Move to next transfer */
+-		msg->state = next_transfer(drv_data);
++#define MX1_CSPICTRL_POL	(1 << 4)
++#define MX1_CSPICTRL_PHA	(1 << 5)
++#define MX1_CSPICTRL_XCH	(1 << 8)
++#define MX1_CSPICTRL_ENABLE	(1 << 9)
++#define MX1_CSPICTRL_MASTER	(1 << 10)
++#define MX1_CSPICTRL_DR_SHIFT	13
+ 
+-		/* Schedule transfer tasklet */
+-		tasklet_schedule(&drv_data->pump_transfers);
++static void mx1_intctrl(struct spi_imx_data *spi_imx, int enable)
++{
++	unsigned int val = 0;
+ 
+-		return IRQ_HANDLED;
+-	} else {
+-		while (status & SPI_STATUS_TH) {
+-			dev_dbg(&drv_data->pdev->dev,
+-				"interrupt_wronly_transfer - status = 0x%08X\n",
+-				status);
+-
+-			/* Pump data */
+-			if (write(drv_data)) {
+-				/* End of TXFIFO writes,
+-				   now wait until TXFIFO is empty */
+-				writel(SPI_INTEN_TE, regs + SPI_INT_STATUS);
+-				return IRQ_HANDLED;
+-			}
+-
+-			status = readl(regs + SPI_INT_STATUS);
+-
+-			/* We did something */
+-			handled = IRQ_HANDLED;
+-		}
+-	}
++	if (enable & MXC_INT_TE)
++		val |= MX1_INTREG_TEEN;
++	if (enable & MXC_INT_RR)
++		val |= MX1_INTREG_RREN;
+ 
+-	return handled;
++	writel(val, spi_imx->base + MXC_CSPIINT);
+ }
+ 
+-static irqreturn_t interrupt_transfer(struct driver_data *drv_data)
++static void mx1_trigger(struct spi_imx_data *spi_imx)
+ {
+-	struct spi_message *msg = drv_data->cur_msg;
+-	void __iomem *regs = drv_data->regs;
+-	u32 status, control;
+-	irqreturn_t handled = IRQ_NONE;
+-	unsigned long limit;
+-
+-	status = readl(regs + SPI_INT_STATUS);
+-
+-	if (status & SPI_INTEN_TE) {
+-		/* TXFIFO Empty Interrupt on the last transfered word */
+-		writel(status & ~SPI_INTEN, regs + SPI_INT_STATUS);
+-		dev_dbg(&drv_data->pdev->dev,
+-			"interrupt_transfer - end of tx\n");
+-
+-		if (msg->state == ERROR_STATE) {
+-			/* RXFIFO overrun was detected and message aborted */
+-			flush(drv_data);
+-		} else {
+-			/* Wait for end of transaction */
+-			do {
+-				control = readl(regs + SPI_CONTROL);
+-			} while (control & SPI_CONTROL_XCH);
+-
+-			/* Release chip select if requested, transfer delays are
+-			   handled in pump_transfers */
+-			if (drv_data->cs_change)
+-				drv_data->cs_control(SPI_CS_DEASSERT);
+-
+-			/* Read trailing bytes */
+-			limit = loops_per_jiffy << 1;
+-			while ((read(drv_data) == 0) && --limit)
+-				cpu_relax();
+-
+-			if (limit == 0)
+-				dev_err(&drv_data->pdev->dev,
+-					"interrupt_transfer - "
+-					"trailing byte read failed\n");
+-			else
+-				dev_dbg(&drv_data->pdev->dev,
+-					"interrupt_transfer - end of rx\n");
+-
+-			/* Update total byte transfered */
+-			msg->actual_length += drv_data->len;
+-
+-			/* Move to next transfer */
+-			msg->state = next_transfer(drv_data);
+-		}
+-
+-		/* Schedule transfer tasklet */
+-		tasklet_schedule(&drv_data->pump_transfers);
++	unsigned int reg;
+ 
+-		return IRQ_HANDLED;
+-	} else {
+-		while (status & (SPI_STATUS_TH | SPI_STATUS_RO)) {
+-			dev_dbg(&drv_data->pdev->dev,
+-				"interrupt_transfer - status = 0x%08X\n",
+-				status);
+-
+-			if (status & SPI_STATUS_RO) {
+-				/* RXFIFO overrun, abort message end wait
+-				   until TXFIFO is empty */
+-				writel(SPI_INTEN_TE, regs + SPI_INT_STATUS);
+-
+-				dev_warn(&drv_data->pdev->dev,
+-					"interrupt_transfer - fifo overun\n"
+-					"    data not yet written = %d\n"
+-					"    data not yet read    = %d\n",
+-					data_to_write(drv_data),
+-					data_to_read(drv_data));
+-
+-				msg->state = ERROR_STATE;
+-
+-				return IRQ_HANDLED;
+-			}
+-
+-			/* Pump data */
+-			read(drv_data);
+-			if (write(drv_data)) {
+-				/* End of TXFIFO writes,
+-				   now wait until TXFIFO is empty */
+-				writel(SPI_INTEN_TE, regs + SPI_INT_STATUS);
+-				return IRQ_HANDLED;
+-			}
+-
+-			status = readl(regs + SPI_INT_STATUS);
+-
+-			/* We did something */
+-			handled = IRQ_HANDLED;
+-		}
+-	}
+-
+-	return handled;
++	reg = readl(spi_imx->base + MXC_CSPICTRL);
++	reg |= MX1_CSPICTRL_XCH;
++	writel(reg, spi_imx->base + MXC_CSPICTRL);
+ }
+ 
+-static irqreturn_t spi_int(int irq, void *dev_id)
++static int mx1_config(struct spi_imx_data *spi_imx,
++		struct spi_imx_config *config)
+ {
+-	struct driver_data *drv_data = (struct driver_data *)dev_id;
++	unsigned int reg = MX1_CSPICTRL_ENABLE | MX1_CSPICTRL_MASTER;
+ 
+-	if (!drv_data->cur_msg) {
+-		dev_err(&drv_data->pdev->dev,
+-			"spi_int - bad message state\n");
+-		/* Never fail */
+-		return IRQ_HANDLED;
+-	}
++	reg |= spi_imx_clkdiv_2(spi_imx->spi_clk, config->speed_hz) <<
++		MX1_CSPICTRL_DR_SHIFT;
++	reg |= config->bpw - 1;
+ 
+-	return drv_data->transfer_handler(drv_data);
+-}
++	if (config->mode & SPI_CPHA)
++		reg |= MX1_CSPICTRL_PHA;
++	if (config->mode & SPI_CPOL)
++		reg |= MX1_CSPICTRL_POL;
+ 
+-static inline u32 spi_speed_hz(struct driver_data *drv_data, u32 data_rate)
+-{
+-	return clk_get_rate(drv_data->clk) / (4 << ((data_rate) >> 13));
++	writel(reg, spi_imx->base + MXC_CSPICTRL);
++
++	return 0;
+ }
+ 
+-static u32 spi_data_rate(struct driver_data *drv_data, u32 speed_hz)
++static int mx1_rx_available(struct spi_imx_data *spi_imx)
+ {
+-	u32 div;
+-	u32 quantized_hz = clk_get_rate(drv_data->clk) >> 2;
+-
+-	for (div = SPI_PERCLK2_DIV_MIN;
+-		div <= SPI_PERCLK2_DIV_MAX;
+-		div++, quantized_hz >>= 1) {
+-			if (quantized_hz <= speed_hz)
+-				/* Max available speed LEQ required speed */
+-				return div << 13;
+-	}
+-	return SPI_CONTROL_DATARATE_BAD;
++	return readl(spi_imx->base + MXC_CSPIINT) & MX1_INTREG_RR;
+ }
+ 
+-static void pump_transfers(unsigned long data)
++static void spi_imx_chipselect(struct spi_device *spi, int is_active)
+ {
+-	struct driver_data *drv_data = (struct driver_data *)data;
+-	struct spi_message *message;
+-	struct spi_transfer *transfer, *previous;
+-	struct chip_data *chip;
+-	void __iomem *regs;
+-	u32 tmp, control;
+-
+-	dev_dbg(&drv_data->pdev->dev, "pump_transfer\n");
++	struct spi_imx_data *spi_imx = spi_master_get_devdata(spi->master);
++	int gpio = spi_imx->chipselect[spi->chip_select];
++	int active = is_active != BITBANG_CS_INACTIVE;
++	int dev_is_lowactive = !(spi->mode & SPI_CS_HIGH);
+ 
+-	message = drv_data->cur_msg;
+-
+-	/* Handle for abort */
+-	if (message->state == ERROR_STATE) {
+-		message->status = -EIO;
+-		giveback(message, drv_data);
+-		return;
+-	}
+-
+-	/* Handle end of message */
+-	if (message->state == DONE_STATE) {
+-		message->status = 0;
+-		giveback(message, drv_data);
++	if (gpio < 0)
+ 		return;
+-	}
+-
+-	chip = drv_data->cur_chip;
+-
+-	/* Delay if requested at end of transfer*/
+-	transfer = drv_data->cur_transfer;
+-	if (message->state == RUNNING_STATE) {
+-		previous = list_entry(transfer->transfer_list.prev,
+-					struct spi_transfer,
+-					transfer_list);
+-		if (previous->delay_usecs)
+-			udelay(previous->delay_usecs);
+-	} else {
+-		/* START_STATE */
+-		message->state = RUNNING_STATE;
+-		drv_data->cs_control = chip->cs_control;
+-	}
+ 
+-	transfer = drv_data->cur_transfer;
+-	drv_data->tx = (void *)transfer->tx_buf;
+-	drv_data->tx_end = drv_data->tx + transfer->len;
+-	drv_data->rx = transfer->rx_buf;
+-	drv_data->rx_end = drv_data->rx + transfer->len;
+-	drv_data->rx_dma = transfer->rx_dma;
+-	drv_data->tx_dma = transfer->tx_dma;
+-	drv_data->len = transfer->len;
+-	drv_data->cs_change = transfer->cs_change;
+-	drv_data->rd_only = (drv_data->tx == NULL);
+-
+-	regs = drv_data->regs;
+-	control = readl(regs + SPI_CONTROL);
+-
+-	/* Bits per word setup */
+-	tmp = transfer->bits_per_word;
+-	if (tmp == 0) {
+-		/* Use device setup */
+-		tmp = chip->bits_per_word;
+-		drv_data->n_bytes = chip->n_bytes;
+-	} else
+-		/* Use per-transfer setup */
+-		drv_data->n_bytes = (tmp <= 8) ? 1 : 2;
+-	u32_EDIT(control, SPI_CONTROL_BITCOUNT_MASK, tmp - 1);
+-
+-	/* Speed setup (surely valid because already checked) */
+-	tmp = transfer->speed_hz;
+-	if (tmp == 0)
+-		tmp = chip->max_speed_hz;
+-	tmp = spi_data_rate(drv_data, tmp);
+-	u32_EDIT(control, SPI_CONTROL_DATARATE, tmp);
+-
+-	writel(control, regs + SPI_CONTROL);
+-
+-	/* Assert device chip-select */
+-	drv_data->cs_control(SPI_CS_ASSERT);
+-
+-	/* DMA cannot read/write SPI FIFOs other than 16 bits at a time; hence
+-	   if bits_per_word is less or equal 8 PIO transfers are performed.
+-	   Moreover DMA is convinient for transfer length bigger than FIFOs
+-	   byte size. */
+-	if ((drv_data->n_bytes == 2) &&
+-		(drv_data->len > SPI_FIFO_DEPTH*SPI_FIFO_BYTE_WIDTH) &&
+-		(map_dma_buffers(drv_data) == 0)) {
+-		dev_dbg(&drv_data->pdev->dev,
+-			"pump dma transfer\n"
+-			"    tx      = %p\n"
+-			"    tx_dma  = %08X\n"
+-			"    rx      = %p\n"
+-			"    rx_dma  = %08X\n"
+-			"    len     = %d\n",
+-			drv_data->tx,
+-			(unsigned int)drv_data->tx_dma,
+-			drv_data->rx,
+-			(unsigned int)drv_data->rx_dma,
+-			drv_data->len);
+-
+-		/* Ensure we have the correct interrupt handler */
+-		drv_data->transfer_handler = dma_transfer;
+-
+-		/* Trigger transfer */
+-		writel(readl(regs + SPI_CONTROL) | SPI_CONTROL_XCH,
+-			regs + SPI_CONTROL);
+-
+-		/* Setup tx DMA */
+-		if (drv_data->tx)
+-			/* Linear source address */
+-			CCR(drv_data->tx_channel) =
+-				CCR_DMOD_FIFO |
+-				CCR_SMOD_LINEAR |
+-				CCR_SSIZ_32 | CCR_DSIZ_16 |
+-				CCR_REN;
+-		else
+-			/* Read only transfer -> fixed source address for
+-			   dummy write to achive read */
+-			CCR(drv_data->tx_channel) =
+-				CCR_DMOD_FIFO |
+-				CCR_SMOD_FIFO |
+-				CCR_SSIZ_32 | CCR_DSIZ_16 |
+-				CCR_REN;
+-
+-		imx_dma_setup_single(
+-			drv_data->tx_channel,
+-			drv_data->tx_dma,
+-			drv_data->len,
+-			drv_data->rd_data_phys + 4,
+-			DMA_MODE_WRITE);
+-
+-		if (drv_data->rx) {
+-			/* Setup rx DMA for linear destination address */
+-			CCR(drv_data->rx_channel) =
+-				CCR_DMOD_LINEAR |
+-				CCR_SMOD_FIFO |
+-				CCR_DSIZ_32 | CCR_SSIZ_16 |
+-				CCR_REN;
+-			imx_dma_setup_single(
+-				drv_data->rx_channel,
+-				drv_data->rx_dma,
+-				drv_data->len,
+-				drv_data->rd_data_phys,
+-				DMA_MODE_READ);
+-			imx_dma_enable(drv_data->rx_channel);
+-
+-			/* Enable SPI interrupt */
+-			writel(SPI_INTEN_RO, regs + SPI_INT_STATUS);
+-
+-			/* Set SPI to request DMA service on both
+-			   Rx and Tx half fifo watermark */
+-			writel(SPI_DMA_RHDEN | SPI_DMA_THDEN, regs + SPI_DMA);
+-		} else
+-			/* Write only access -> set SPI to request DMA
+-			   service on Tx half fifo watermark */
+-			writel(SPI_DMA_THDEN, regs + SPI_DMA);
+-
+-		imx_dma_enable(drv_data->tx_channel);
+-	} else {
+-		dev_dbg(&drv_data->pdev->dev,
+-			"pump pio transfer\n"
+-			"    tx      = %p\n"
+-			"    rx      = %p\n"
+-			"    len     = %d\n",
+-			drv_data->tx,
+-			drv_data->rx,
+-			drv_data->len);
+-
+-		/* Ensure we have the correct interrupt handler	*/
+-		if (drv_data->rx)
+-			drv_data->transfer_handler = interrupt_transfer;
+-		else
+-			drv_data->transfer_handler = interrupt_wronly_transfer;
+-
+-		/* Enable SPI interrupt */
+-		if (drv_data->rx)
+-			writel(SPI_INTEN_TH | SPI_INTEN_RO,
+-				regs + SPI_INT_STATUS);
+-		else
+-			writel(SPI_INTEN_TH, regs + SPI_INT_STATUS);
+-	}
++	gpio_set_value(gpio, dev_is_lowactive ^ active);
+ }
+ 
+-static void pump_messages(struct work_struct *work)
++static void spi_imx_push(struct spi_imx_data *spi_imx)
+ {
+-	struct driver_data *drv_data =
+-				container_of(work, struct driver_data, work);
+-	unsigned long flags;
+-
+-	/* Lock queue and check for queue work */
+-	spin_lock_irqsave(&drv_data->lock, flags);
+-	if (list_empty(&drv_data->queue) || drv_data->run == QUEUE_STOPPED) {
+-		drv_data->busy = 0;
+-		spin_unlock_irqrestore(&drv_data->lock, flags);
+-		return;
+-	}
+-
+-	/* Make sure we are not already running a message */
+-	if (drv_data->cur_msg) {
+-		spin_unlock_irqrestore(&drv_data->lock, flags);
+-		return;
++	while (spi_imx->txfifo < 8) {
++		if (!spi_imx->count)
++			break;
++		spi_imx->tx(spi_imx);
++		spi_imx->txfifo++;
+ 	}
+ 
+-	/* Extract head of queue */
+-	drv_data->cur_msg = list_entry(drv_data->queue.next,
+-					struct spi_message, queue);
+-	list_del_init(&drv_data->cur_msg->queue);
+-	drv_data->busy = 1;
+-	spin_unlock_irqrestore(&drv_data->lock, flags);
+-
+-	/* Initial message state */
+-	drv_data->cur_msg->state = START_STATE;
+-	drv_data->cur_transfer = list_entry(drv_data->cur_msg->transfers.next,
+-						struct spi_transfer,
+-						transfer_list);
+-
+-	/* Setup the SPI using the per chip configuration */
+-	drv_data->cur_chip = spi_get_ctldata(drv_data->cur_msg->spi);
+-	restore_state(drv_data);
+-
+-	/* Mark as busy and launch transfers */
+-	tasklet_schedule(&drv_data->pump_transfers);
++	spi_imx->trigger(spi_imx);
+ }
+ 
+-static int transfer(struct spi_device *spi, struct spi_message *msg)
++static irqreturn_t spi_imx_isr(int irq, void *dev_id)
+ {
+-	struct driver_data *drv_data = spi_master_get_devdata(spi->master);
+-	u32 min_speed_hz, max_speed_hz, tmp;
+-	struct spi_transfer *trans;
+-	unsigned long flags;
+-
+-	msg->actual_length = 0;
+-
+-	/* Per transfer setup check */
+-	min_speed_hz = spi_speed_hz(drv_data, SPI_CONTROL_DATARATE_MIN);
+-	max_speed_hz = spi->max_speed_hz;
+-	list_for_each_entry(trans, &msg->transfers, transfer_list) {
+-		tmp = trans->bits_per_word;
+-		if (tmp > 16) {
+-			dev_err(&drv_data->pdev->dev,
+-				"message rejected : "
+-				"invalid transfer bits_per_word (%d bits)\n",
+-				tmp);
+-			goto msg_rejected;
+-		}
+-		tmp = trans->speed_hz;
+-		if (tmp) {
+-			if (tmp < min_speed_hz) {
+-				dev_err(&drv_data->pdev->dev,
+-					"message rejected : "
+-					"device min speed (%d Hz) exceeds "
+-					"required transfer speed (%d Hz)\n",
+-					min_speed_hz,
+-					tmp);
+-				goto msg_rejected;
+-			} else if (tmp > max_speed_hz) {
+-				dev_err(&drv_data->pdev->dev,
+-					"message rejected : "
+-					"transfer speed (%d Hz) exceeds "
+-					"device max speed (%d Hz)\n",
+-					tmp,
+-					max_speed_hz);
+-				goto msg_rejected;
+-			}
+-		}
+-	}
+-
+-	/* Message accepted */
+-	msg->status = -EINPROGRESS;
+-	msg->state = START_STATE;
++	struct spi_imx_data *spi_imx = dev_id;
+ 
+-	spin_lock_irqsave(&drv_data->lock, flags);
+-	if (drv_data->run == QUEUE_STOPPED) {
+-		spin_unlock_irqrestore(&drv_data->lock, flags);
+-		return -ESHUTDOWN;
++	while (spi_imx->rx_available(spi_imx)) {
++		spi_imx->rx(spi_imx);
++		spi_imx->txfifo--;
+ 	}
+ 
+-	list_add_tail(&msg->queue, &drv_data->queue);
+-	if (drv_data->run == QUEUE_RUNNING && !drv_data->busy)
+-		queue_work(drv_data->workqueue, &drv_data->work);
+-
+-	spin_unlock_irqrestore(&drv_data->lock, flags);
+-	return 0;
+-
+-msg_rejected:
+-	/* Message rejected and not queued */
+-	msg->status = -EINVAL;
+-	msg->state = ERROR_STATE;
+-	if (msg->complete)
+-		msg->complete(msg->context);
+-	return -EINVAL;
+-}
+-
+-/* On first setup bad values must free chip_data memory since will cause
+-   spi_new_device to fail. Bad value setup from protocol driver are simply not
+-   applied and notified to the calling driver. */
+-static int setup(struct spi_device *spi)
+-{
+-	struct driver_data *drv_data = spi_master_get_devdata(spi->master);
+-	struct spi_imx_chip *chip_info;
+-	struct chip_data *chip;
+-	int first_setup = 0;
+-	u32 tmp;
+-	int status = 0;
+-
+-	/* Get controller data */
+-	chip_info = spi->controller_data;
+-
+-	/* Get controller_state */
+-	chip = spi_get_ctldata(spi);
+-	if (chip == NULL) {
+-		first_setup = 1;
+-
+-		chip = kzalloc(sizeof(struct chip_data), GFP_KERNEL);
+-		if (!chip) {
+-			dev_err(&spi->dev,
+-				"setup - cannot allocate controller state\n");
+-			return -ENOMEM;
+-		}
+-		chip->control = SPI_DEFAULT_CONTROL;
+-
+-		if (chip_info == NULL) {
+-			/* spi_board_info.controller_data not is supplied */
+-			chip_info = kzalloc(sizeof(struct spi_imx_chip),
+-						GFP_KERNEL);
+-			if (!chip_info) {
+-				dev_err(&spi->dev,
+-					"setup - "
+-					"cannot allocate controller data\n");
+-				status = -ENOMEM;
+-				goto err_first_setup;
+-			}
+-			/* Set controller data default value */
+-			chip_info->enable_loopback =
+-						SPI_DEFAULT_ENABLE_LOOPBACK;
+-			chip_info->enable_dma = SPI_DEFAULT_ENABLE_DMA;
+-			chip_info->ins_ss_pulse = 1;
+-			chip_info->bclk_wait = SPI_DEFAULT_PERIOD_WAIT;
+-			chip_info->cs_control = null_cs_control;
+-		}
++	if (spi_imx->count) {
++		spi_imx_push(spi_imx);
++		return IRQ_HANDLED;
+ 	}
+ 
+-	/* Now set controller state based on controller data */
+-
+-	if (first_setup) {
+-		/* SPI loopback */
+-		if (chip_info->enable_loopback)
+-			chip->test = SPI_TEST_LBC;
+-		else
+-			chip->test = 0;
+-
+-		/* SPI dma driven */
+-		chip->enable_dma = chip_info->enable_dma;
+-
+-		/* SPI /SS pulse between spi burst */
+-		if (chip_info->ins_ss_pulse)
+-			u32_EDIT(chip->control,
+-				SPI_CONTROL_SSCTL, SPI_CONTROL_SSCTL_1);
+-		else
+-			u32_EDIT(chip->control,
+-				SPI_CONTROL_SSCTL, SPI_CONTROL_SSCTL_0);
+-
+-		/* SPI bclk waits between each bits_per_word spi burst */
+-		if (chip_info->bclk_wait > SPI_PERIOD_MAX_WAIT) {
+-			dev_err(&spi->dev,
+-				"setup - "
+-				"bclk_wait exceeds max allowed (%d)\n",
+-				SPI_PERIOD_MAX_WAIT);
+-			goto err_first_setup;
+-		}
+-		chip->period = SPI_PERIOD_CSRC_BCLK |
+-				(chip_info->bclk_wait & SPI_PERIOD_WAIT);
++	if (spi_imx->txfifo) {
++		/* No data left to push, but still waiting for rx data,
++		 * enable receive data available interrupt.
++		 */
++		spi_imx->intctrl(spi_imx, MXC_INT_RR);
++		return IRQ_HANDLED;
+ 	}
+ 
+-	/* SPI mode */
+-	tmp = spi->mode;
+-	if (tmp & SPI_CS_HIGH) {
+-		u32_EDIT(chip->control,
+-				SPI_CONTROL_SSPOL, SPI_CONTROL_SSPOL_ACT_HIGH);
+-	}
+-	switch (tmp & SPI_MODE_3) {
+-	case SPI_MODE_0:
+-		tmp = 0;
+-		break;
+-	case SPI_MODE_1:
+-		tmp = SPI_CONTROL_PHA_1;
+-		break;
+-	case SPI_MODE_2:
+-		tmp = SPI_CONTROL_POL_ACT_LOW;
+-		break;
+-	default:
+-		/* SPI_MODE_3 */
+-		tmp = SPI_CONTROL_PHA_1 | SPI_CONTROL_POL_ACT_LOW;
+-		break;
+-	}
+-	u32_EDIT(chip->control, SPI_CONTROL_POL | SPI_CONTROL_PHA, tmp);
+-
+-	/* SPI word width */
+-	tmp = spi->bits_per_word;
+-	if (tmp > 16) {
+-		status = -EINVAL;
+-		dev_err(&spi->dev,
+-			"setup - "
+-			"invalid bits_per_word (%d)\n",
+-			tmp);
+-		if (first_setup)
+-			goto err_first_setup;
+-		else {
+-			/* Undo setup using chip as backup copy */
+-			tmp = chip->bits_per_word;
+-			spi->bits_per_word = tmp;
+-		}
+-	}
+-	chip->bits_per_word = tmp;
+-	u32_EDIT(chip->control, SPI_CONTROL_BITCOUNT_MASK, tmp - 1);
+-	chip->n_bytes = (tmp <= 8) ? 1 : 2;
+-
+-	/* SPI datarate */
+-	tmp = spi_data_rate(drv_data, spi->max_speed_hz);
+-	if (tmp == SPI_CONTROL_DATARATE_BAD) {
+-		status = -EINVAL;
+-		dev_err(&spi->dev,
+-			"setup - "
+-			"HW min speed (%d Hz) exceeds required "
+-			"max speed (%d Hz)\n",
+-			spi_speed_hz(drv_data, SPI_CONTROL_DATARATE_MIN),
+-			spi->max_speed_hz);
+-		if (first_setup)
+-			goto err_first_setup;
+-		else
+-			/* Undo setup using chip as backup copy */
+-			spi->max_speed_hz = chip->max_speed_hz;
+-	} else {
+-		u32_EDIT(chip->control, SPI_CONTROL_DATARATE, tmp);
+-		/* Actual rounded max_speed_hz */
+-		tmp = spi_speed_hz(drv_data, tmp);
+-		spi->max_speed_hz = tmp;
+-		chip->max_speed_hz = tmp;
+-	}
++	spi_imx->intctrl(spi_imx, 0);
++	complete(&spi_imx->xfer_done);
+ 
+-	/* SPI chip-select management */
+-	if (chip_info->cs_control)
+-		chip->cs_control = chip_info->cs_control;
+-	else
+-		chip->cs_control = null_cs_control;
+-
+-	/* Save controller_state */
+-	spi_set_ctldata(spi, chip);
+-
+-	/* Summary */
+-	dev_dbg(&spi->dev,
+-		"setup succeded\n"
+-		"    loopback enable   = %s\n"
+-		"    dma enable        = %s\n"
+-		"    insert /ss pulse  = %s\n"
+-		"    period wait       = %d\n"
+-		"    mode              = %d\n"
+-		"    bits per word     = %d\n"
+-		"    min speed         = %d Hz\n"
+-		"    rounded max speed = %d Hz\n",
+-		chip->test & SPI_TEST_LBC ? "Yes" : "No",
+-		chip->enable_dma ? "Yes" : "No",
+-		chip->control & SPI_CONTROL_SSCTL ? "Yes" : "No",
+-		chip->period & SPI_PERIOD_WAIT,
+-		spi->mode,
+-		spi->bits_per_word,
+-		spi_speed_hz(drv_data, SPI_CONTROL_DATARATE_MIN),
+-		spi->max_speed_hz);
+-	return status;
+-
+-err_first_setup:
+-	kfree(chip);
+-	return status;
++	return IRQ_HANDLED;
+ }
+ 
+-static void cleanup(struct spi_device *spi)
++static int spi_imx_setupxfer(struct spi_device *spi,
++				 struct spi_transfer *t)
+ {
+-	kfree(spi_get_ctldata(spi));
+-}
++	struct spi_imx_data *spi_imx = spi_master_get_devdata(spi->master);
++	struct spi_imx_config config;
+ 
+-static int __init init_queue(struct driver_data *drv_data)
+-{
+-	INIT_LIST_HEAD(&drv_data->queue);
+-	spin_lock_init(&drv_data->lock);
++	config.bpw = t ? t->bits_per_word : spi->bits_per_word;
++	config.speed_hz  = t ? t->speed_hz : spi->max_speed_hz;
++	config.mode = spi->mode;
++	config.cs = spi_imx->chipselect[spi->chip_select];
+ 
+-	drv_data->run = QUEUE_STOPPED;
+-	drv_data->busy = 0;
++	if (!config.speed_hz)
++		config.speed_hz = spi->max_speed_hz;
++	if (!config.bpw)
++		config.bpw = spi->bits_per_word;
++	if (!config.speed_hz)
++		config.speed_hz = spi->max_speed_hz;
+ 
+-	tasklet_init(&drv_data->pump_transfers,
+-			pump_transfers,	(unsigned long)drv_data);
++	/* Initialize the functions for transfer */
++	if (config.bpw <= 8) {
++		spi_imx->rx = spi_imx_buf_rx_u8;
++		spi_imx->tx = spi_imx_buf_tx_u8;
++	} else if (config.bpw <= 16) {
++		spi_imx->rx = spi_imx_buf_rx_u16;
++		spi_imx->tx = spi_imx_buf_tx_u16;
++	} else if (config.bpw <= 32) {
++		spi_imx->rx = spi_imx_buf_rx_u32;
++		spi_imx->tx = spi_imx_buf_tx_u32;
++	} else
++		BUG();
+ 
+-	INIT_WORK(&drv_data->work, pump_messages);
+-	drv_data->workqueue = create_singlethread_workqueue(
+-				dev_name(drv_data->master->dev.parent));
+-	if (drv_data->workqueue == NULL)
+-		return -EBUSY;
++	spi_imx->config(spi_imx, &config);
+ 
+ 	return 0;
+ }
+ 
+-static int start_queue(struct driver_data *drv_data)
++static int spi_imx_transfer(struct spi_device *spi,
++				struct spi_transfer *transfer)
+ {
+-	unsigned long flags;
++	struct spi_imx_data *spi_imx = spi_master_get_devdata(spi->master);
+ 
+-	spin_lock_irqsave(&drv_data->lock, flags);
++	spi_imx->tx_buf = transfer->tx_buf;
++	spi_imx->rx_buf = transfer->rx_buf;
++	spi_imx->count = transfer->len;
++	spi_imx->txfifo = 0;
+ 
+-	if (drv_data->run == QUEUE_RUNNING || drv_data->busy) {
+-		spin_unlock_irqrestore(&drv_data->lock, flags);
+-		return -EBUSY;
+-	}
++	init_completion(&spi_imx->xfer_done);
+ 
+-	drv_data->run = QUEUE_RUNNING;
+-	drv_data->cur_msg = NULL;
+-	drv_data->cur_transfer = NULL;
+-	drv_data->cur_chip = NULL;
+-	spin_unlock_irqrestore(&drv_data->lock, flags);
++	spi_imx_push(spi_imx);
+ 
+-	queue_work(drv_data->workqueue, &drv_data->work);
++	spi_imx->intctrl(spi_imx, MXC_INT_TE);
+ 
+-	return 0;
++	wait_for_completion(&spi_imx->xfer_done);
++
++	return transfer->len;
+ }
+ 
+-static int stop_queue(struct driver_data *drv_data)
++static int spi_imx_setup(struct spi_device *spi)
+ {
+-	unsigned long flags;
+-	unsigned limit = 500;
+-	int status = 0;
+-
+-	spin_lock_irqsave(&drv_data->lock, flags);
+-
+-	/* This is a bit lame, but is optimized for the common execution path.
+-	 * A wait_queue on the drv_data->busy could be used, but then the common
+-	 * execution path (pump_messages) would be required to call wake_up or
+-	 * friends on every SPI message. Do this instead */
+-	drv_data->run = QUEUE_STOPPED;
+-	while (!list_empty(&drv_data->queue) && drv_data->busy && limit--) {
+-		spin_unlock_irqrestore(&drv_data->lock, flags);
+-		msleep(10);
+-		spin_lock_irqsave(&drv_data->lock, flags);
+-	}
++	struct spi_imx_data *spi_imx = spi_master_get_devdata(spi->master);
++	int gpio = spi_imx->chipselect[spi->chip_select];
++
++	pr_debug("%s: mode %d, %u bpw, %d hz\n", __func__,
++		 spi->mode, spi->bits_per_word, spi->max_speed_hz);
+ 
+-	if (!list_empty(&drv_data->queue) || drv_data->busy)
+-		status = -EBUSY;
++	if (gpio >= 0)
++		gpio_direction_output(gpio, spi->mode & SPI_CS_HIGH ? 0 : 1);
+ 
+-	spin_unlock_irqrestore(&drv_data->lock, flags);
++	spi_imx_chipselect(spi, BITBANG_CS_INACTIVE);
+ 
+-	return status;
++	return 0;
+ }
+ 
+-static int destroy_queue(struct driver_data *drv_data)
++static void spi_imx_cleanup(struct spi_device *spi)
+ {
+-	int status;
+-
+-	status = stop_queue(drv_data);
+-	if (status != 0)
+-		return status;
+-
+-	if (drv_data->workqueue)
+-		destroy_workqueue(drv_data->workqueue);
+-
+-	return 0;
+ }
+ 
+ static int __init spi_imx_probe(struct platform_device *pdev)
+ {
+-	struct device *dev = &pdev->dev;
+-	struct spi_imx_master *platform_info;
++	struct spi_imx_master *mxc_platform_info;
+ 	struct spi_master *master;
+-	struct driver_data *drv_data;
++	struct spi_imx_data *spi_imx;
+ 	struct resource *res;
+-	int irq, status = 0;
++	int i, ret;
+ 
+-	platform_info = dev->platform_data;
+-	if (platform_info == NULL) {
+-		dev_err(&pdev->dev, "probe - no platform data supplied\n");
+-		status = -ENODEV;
+-		goto err_no_pdata;
++	mxc_platform_info = (struct spi_imx_master *)pdev->dev.platform_data;
++	if (!mxc_platform_info) {
++		dev_err(&pdev->dev, "can't get the platform data\n");
++		return -EINVAL;
+ 	}
+ 
+-	/* Allocate master with space for drv_data */
+-	master = spi_alloc_master(dev, sizeof(struct driver_data));
+-	if (!master) {
+-		dev_err(&pdev->dev, "probe - cannot alloc spi_master\n");
+-		status = -ENOMEM;
+-		goto err_no_mem;
+-	}
+-	drv_data = spi_master_get_devdata(master);
+-	drv_data->master = master;
+-	drv_data->master_info = platform_info;
+-	drv_data->pdev = pdev;
++	master = spi_alloc_master(&pdev->dev, sizeof(struct spi_imx_data));
++	if (!master)
++		return -ENOMEM;
+ 
+-	/* the spi->mode bits understood by this driver: */
+-	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
++	platform_set_drvdata(pdev, master);
+ 
+ 	master->bus_num = pdev->id;
+-	master->num_chipselect = platform_info->num_chipselect;
+-	master->dma_alignment = DMA_ALIGNMENT;
+-	master->cleanup = cleanup;
+-	master->setup = setup;
+-	master->transfer = transfer;
+-
+-	drv_data->dummy_dma_buf = SPI_DUMMY_u32;
+-
+-	drv_data->clk = clk_get(&pdev->dev, "perclk2");
+-	if (IS_ERR(drv_data->clk)) {
+-		dev_err(&pdev->dev, "probe - cannot get clock\n");
+-		status = PTR_ERR(drv_data->clk);
+-		goto err_no_clk;
+-	}
+-	clk_enable(drv_data->clk);
+-
+-	/* Find and map resources */
+-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	if (!res) {
+-		dev_err(&pdev->dev, "probe - MEM resources not defined\n");
+-		status = -ENODEV;
+-		goto err_no_iores;
+-	}
+-	drv_data->ioarea = request_mem_region(res->start,
+-						res->end - res->start + 1,
+-						pdev->name);
+-	if (drv_data->ioarea == NULL) {
+-		dev_err(&pdev->dev, "probe - cannot reserve region\n");
+-		status = -ENXIO;
+-		goto err_no_iores;
+-	}
+-	drv_data->regs = ioremap(res->start, res->end - res->start + 1);
+-	if (drv_data->regs == NULL) {
+-		dev_err(&pdev->dev, "probe - cannot map IO\n");
+-		status = -ENXIO;
+-		goto err_no_iomap;
+-	}
+-	drv_data->rd_data_phys = (dma_addr_t)res->start;
+-
+-	/* Attach to IRQ */
+-	irq = platform_get_irq(pdev, 0);
+-	if (irq < 0) {
+-		dev_err(&pdev->dev, "probe - IRQ resource not defined\n");
+-		status = -ENODEV;
+-		goto err_no_irqres;
+-	}
+-	status = request_irq(irq, spi_int, IRQF_DISABLED,
+-			     dev_name(dev), drv_data);
+-	if (status < 0) {
+-		dev_err(&pdev->dev, "probe - cannot get IRQ (%d)\n", status);
+-		goto err_no_irqres;
+-	}
+-
+-	/* Setup DMA if requested */
+-	drv_data->tx_channel = -1;
+-	drv_data->rx_channel = -1;
+-	if (platform_info->enable_dma) {
+-		/* Get rx DMA channel */
+-		drv_data->rx_channel = imx_dma_request_by_prio("spi_imx_rx",
+-							       DMA_PRIO_HIGH);
+-		if (drv_data->rx_channel < 0) {
+-			dev_err(dev,
+-				"probe - problem (%d) requesting rx channel\n",
+-				drv_data->rx_channel);
+-			goto err_no_rxdma;
+-		} else
+-			imx_dma_setup_handlers(drv_data->rx_channel, NULL,
+-						dma_err_handler, drv_data);
+-
+-		/* Get tx DMA channel */
+-		drv_data->tx_channel = imx_dma_request_by_prio("spi_imx_tx",
+-							       DMA_PRIO_MEDIUM);
+-		if (drv_data->tx_channel < 0) {
+-			dev_err(dev,
+-				"probe - problem (%d) requesting tx channel\n",
+-				drv_data->tx_channel);
+-			imx_dma_free(drv_data->rx_channel);
+-			goto err_no_txdma;
+-		} else
+-			imx_dma_setup_handlers(drv_data->tx_channel,
+-						dma_tx_handler, dma_err_handler,
+-						drv_data);
+-
+-		/* Set request source and burst length for allocated channels */
+-		switch (drv_data->pdev->id) {
+-		case 1:
+-			/* Using SPI1 */
+-			RSSR(drv_data->rx_channel) = DMA_REQ_SPI1_R;
+-			RSSR(drv_data->tx_channel) = DMA_REQ_SPI1_T;
+-			break;
+-		case 2:
+-			/* Using SPI2 */
+-			RSSR(drv_data->rx_channel) = DMA_REQ_SPI2_R;
+-			RSSR(drv_data->tx_channel) = DMA_REQ_SPI2_T;
+-			break;
+-		default:
+-			dev_err(dev, "probe - bad SPI Id\n");
+-			imx_dma_free(drv_data->rx_channel);
+-			imx_dma_free(drv_data->tx_channel);
+-			status = -ENODEV;
+-			goto err_no_devid;
++	master->num_chipselect = mxc_platform_info->num_chipselect;
++
++	spi_imx = spi_master_get_devdata(master);
++	spi_imx->bitbang.master = spi_master_get(master);
++	spi_imx->chipselect = mxc_platform_info->chipselect;
++
++	for (i = 0; i < master->num_chipselect; i++) {
++		if (spi_imx->chipselect[i] < 0)
++			continue;
++		ret = gpio_request(spi_imx->chipselect[i], DRIVER_NAME);
++		if (ret) {
++			i--;
++			while (i > 0)
++				if (spi_imx->chipselect[i] >= 0)
++					gpio_free(spi_imx->chipselect[i--]);
++			dev_err(&pdev->dev, "can't get cs gpios");
++			goto out_master_put;
+ 		}
+-		BLR(drv_data->rx_channel) = SPI_DMA_BLR;
+-		BLR(drv_data->tx_channel) = SPI_DMA_BLR;
+ 	}
+ 
+-	/* Load default SPI configuration */
+-	writel(SPI_RESET_START, drv_data->regs + SPI_RESET);
+-	writel(0, drv_data->regs + SPI_RESET);
+-	writel(SPI_DEFAULT_CONTROL, drv_data->regs + SPI_CONTROL);
++	spi_imx->bitbang.chipselect = spi_imx_chipselect;
++	spi_imx->bitbang.setup_transfer = spi_imx_setupxfer;
++	spi_imx->bitbang.txrx_bufs = spi_imx_transfer;
++	spi_imx->bitbang.master->setup = spi_imx_setup;
++	spi_imx->bitbang.master->cleanup = spi_imx_cleanup;
++	spi_imx->bitbang.master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
+ 
+-	/* Initial and start queue */
+-	status = init_queue(drv_data);
+-	if (status != 0) {
+-		dev_err(&pdev->dev, "probe - problem initializing queue\n");
+-		goto err_init_queue;
+-	}
+-	status = start_queue(drv_data);
+-	if (status != 0) {
+-		dev_err(&pdev->dev, "probe - problem starting queue\n");
+-		goto err_start_queue;
+-	}
++	init_completion(&spi_imx->xfer_done);
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "can't get platform resource\n");
++		ret = -ENOMEM;
++		goto out_gpio_free;
++	}
++
++	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
++		dev_err(&pdev->dev, "request_mem_region failed\n");
++		ret = -EBUSY;
++		goto out_gpio_free;
++	}
++
++	spi_imx->base = ioremap(res->start, resource_size(res));
++	if (!spi_imx->base) {
++		ret = -EINVAL;
++		goto out_release_mem;
++	}
++
++	spi_imx->irq = platform_get_irq(pdev, 0);
++	if (!spi_imx->irq) {
++		ret = -EINVAL;
++		goto out_iounmap;
++	}
++
++	ret = request_irq(spi_imx->irq, spi_imx_isr, 0, DRIVER_NAME, spi_imx);
++	if (ret) {
++		dev_err(&pdev->dev, "can't get irq%d: %d\n", spi_imx->irq, ret);
++		goto out_iounmap;
++	}
++
++	if (cpu_is_mx31() || cpu_is_mx35()) {
++		spi_imx->intctrl = mx31_intctrl;
++		spi_imx->config = mx31_config;
++		spi_imx->trigger = mx31_trigger;
++		spi_imx->rx_available = mx31_rx_available;
++	} else  if (cpu_is_mx27() || cpu_is_mx21()) {
++		spi_imx->intctrl = mx27_intctrl;
++		spi_imx->config = mx27_config;
++		spi_imx->trigger = mx27_trigger;
++		spi_imx->rx_available = mx27_rx_available;
++	} else if (cpu_is_mx1()) {
++		spi_imx->intctrl = mx1_intctrl;
++		spi_imx->config = mx1_config;
++		spi_imx->trigger = mx1_trigger;
++		spi_imx->rx_available = mx1_rx_available;
++	} else
++		BUG();
+ 
+-	/* Register with the SPI framework */
+-	platform_set_drvdata(pdev, drv_data);
+-	status = spi_register_master(master);
+-	if (status != 0) {
+-		dev_err(&pdev->dev, "probe - problem registering spi master\n");
+-		goto err_spi_register;
++	spi_imx->clk = clk_get(&pdev->dev, NULL);
++	if (IS_ERR(spi_imx->clk)) {
++		dev_err(&pdev->dev, "unable to get clock\n");
++		ret = PTR_ERR(spi_imx->clk);
++		goto out_free_irq;
+ 	}
+ 
+-	dev_dbg(dev, "probe succeded\n");
+-	return 0;
++	clk_enable(spi_imx->clk);
++	spi_imx->spi_clk = clk_get_rate(spi_imx->clk);
+ 
+-err_init_queue:
+-err_start_queue:
+-err_spi_register:
+-	destroy_queue(drv_data);
++	if (!cpu_is_mx31() || !cpu_is_mx35())
++		writel(1, spi_imx->base + MXC_RESET);
+ 
+-err_no_rxdma:
+-err_no_txdma:
+-err_no_devid:
+-	free_irq(irq, drv_data);
++	spi_imx->intctrl(spi_imx, 0);
+ 
+-err_no_irqres:
+-	iounmap(drv_data->regs);
++	ret = spi_bitbang_start(&spi_imx->bitbang);
++	if (ret) {
++		dev_err(&pdev->dev, "bitbang start failed with %d\n", ret);
++		goto out_clk_put;
++	}
+ 
+-err_no_iomap:
+-	release_resource(drv_data->ioarea);
+-	kfree(drv_data->ioarea);
++	dev_info(&pdev->dev, "probed\n");
+ 
+-err_no_iores:
+-	clk_disable(drv_data->clk);
+-	clk_put(drv_data->clk);
++	return ret;
+ 
+-err_no_clk:
++out_clk_put:
++	clk_disable(spi_imx->clk);
++	clk_put(spi_imx->clk);
++out_free_irq:
++	free_irq(spi_imx->irq, spi_imx);
++out_iounmap:
++	iounmap(spi_imx->base);
++out_release_mem:
++	release_mem_region(res->start, resource_size(res));
++out_gpio_free:
++	for (i = 0; i < master->num_chipselect; i++)
++		if (spi_imx->chipselect[i] >= 0)
++			gpio_free(spi_imx->chipselect[i]);
++out_master_put:
+ 	spi_master_put(master);
+-
+-err_no_pdata:
+-err_no_mem:
+-	return status;
++	kfree(master);
++	platform_set_drvdata(pdev, NULL);
++	return ret;
+ }
+ 
+ static int __exit spi_imx_remove(struct platform_device *pdev)
+ {
+-	struct driver_data *drv_data = platform_get_drvdata(pdev);
+-	int irq;
+-	int status = 0;
+-
+-	if (!drv_data)
+-		return 0;
+-
+-	tasklet_kill(&drv_data->pump_transfers);
++	struct spi_master *master = platform_get_drvdata(pdev);
++	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	struct spi_imx_data *spi_imx = spi_master_get_devdata(master);
++	int i;
+ 
+-	/* Remove the queue */
+-	status = destroy_queue(drv_data);
+-	if (status != 0) {
+-		dev_err(&pdev->dev, "queue remove failed (%d)\n", status);
+-		return status;
+-	}
+-
+-	/* Reset SPI */
+-	writel(SPI_RESET_START, drv_data->regs + SPI_RESET);
+-	writel(0, drv_data->regs + SPI_RESET);
+-
+-	/* Release DMA */
+-	if (drv_data->master_info->enable_dma) {
+-		RSSR(drv_data->rx_channel) = 0;
+-		RSSR(drv_data->tx_channel) = 0;
+-		imx_dma_free(drv_data->tx_channel);
+-		imx_dma_free(drv_data->rx_channel);
+-	}
++	spi_bitbang_stop(&spi_imx->bitbang);
+ 
+-	/* Release IRQ */
+-	irq = platform_get_irq(pdev, 0);
+-	if (irq >= 0)
+-		free_irq(irq, drv_data);
++	writel(0, spi_imx->base + MXC_CSPICTRL);
++	clk_disable(spi_imx->clk);
++	clk_put(spi_imx->clk);
++	free_irq(spi_imx->irq, spi_imx);
++	iounmap(spi_imx->base);
+ 
+-	clk_disable(drv_data->clk);
+-	clk_put(drv_data->clk);
++	for (i = 0; i < master->num_chipselect; i++)
++		if (spi_imx->chipselect[i] >= 0)
++			gpio_free(spi_imx->chipselect[i]);
+ 
+-	/* Release map resources */
+-	iounmap(drv_data->regs);
+-	release_resource(drv_data->ioarea);
+-	kfree(drv_data->ioarea);
++	spi_master_put(master);
+ 
+-	/* Disconnect from the SPI framework */
+-	spi_unregister_master(drv_data->master);
+-	spi_master_put(drv_data->master);
++	release_mem_region(res->start, resource_size(res));
+ 
+-	/* Prevent double remove */
+ 	platform_set_drvdata(pdev, NULL);
+ 
+-	dev_dbg(&pdev->dev, "remove succeded\n");
+-
+ 	return 0;
+ }
+ 
+-static void spi_imx_shutdown(struct platform_device *pdev)
+-{
+-	struct driver_data *drv_data = platform_get_drvdata(pdev);
+-
+-	/* Reset SPI */
+-	writel(SPI_RESET_START, drv_data->regs + SPI_RESET);
+-	writel(0, drv_data->regs + SPI_RESET);
+-
+-	dev_dbg(&pdev->dev, "shutdown succeded\n");
+-}
+-
+-#ifdef CONFIG_PM
+-
+-static int spi_imx_suspend(struct platform_device *pdev, pm_message_t state)
+-{
+-	struct driver_data *drv_data = platform_get_drvdata(pdev);
+-	int status = 0;
+-
+-	status = stop_queue(drv_data);
+-	if (status != 0) {
+-		dev_warn(&pdev->dev, "suspend cannot stop queue\n");
+-		return status;
+-	}
+-
+-	dev_dbg(&pdev->dev, "suspended\n");
+-
+-	return 0;
+-}
+-
+-static int spi_imx_resume(struct platform_device *pdev)
+-{
+-	struct driver_data *drv_data = platform_get_drvdata(pdev);
+-	int status = 0;
+-
+-	/* Start the queue running */
+-	status = start_queue(drv_data);
+-	if (status != 0)
+-		dev_err(&pdev->dev, "problem starting queue (%d)\n", status);
+-	else
+-		dev_dbg(&pdev->dev, "resumed\n");
+-
+-	return status;
+-}
+-#else
+-#define spi_imx_suspend NULL
+-#define spi_imx_resume NULL
+-#endif /* CONFIG_PM */
+-
+-/* work with hotplug and coldplug */
+-MODULE_ALIAS("platform:spi_imx");
+-
+-static struct platform_driver driver = {
++static struct platform_driver spi_imx_driver = {
+ 	.driver = {
+-		.name = "spi_imx",
+-		.owner = THIS_MODULE,
+-	},
++		   .name = DRIVER_NAME,
++		   .owner = THIS_MODULE,
++		   },
++	.probe = spi_imx_probe,
+ 	.remove = __exit_p(spi_imx_remove),
+-	.shutdown = spi_imx_shutdown,
+-	.suspend = spi_imx_suspend,
+-	.resume = spi_imx_resume,
+ };
+ 
+ static int __init spi_imx_init(void)
+ {
+-	return platform_driver_probe(&driver, spi_imx_probe);
++	return platform_driver_register(&spi_imx_driver);
+ }
+-module_init(spi_imx_init);
+ 
+ static void __exit spi_imx_exit(void)
+ {
+-	platform_driver_unregister(&driver);
++	platform_driver_unregister(&spi_imx_driver);
+ }
++
++module_init(spi_imx_init);
+ module_exit(spi_imx_exit);
+ 
+-MODULE_AUTHOR("Andrea Paterniani, <a.paterniani@swapp-eng.it>");
+-MODULE_DESCRIPTION("iMX SPI Controller Driver");
++MODULE_DESCRIPTION("SPI Master Controller driver");
++MODULE_AUTHOR("Sascha Hauer, Pengutronix");
+ MODULE_LICENSE("GPL");
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0002-MXC-NFC-Remove-useless-structure-member.patch b/recipes/linux/linux-2.6.31/pcm043/0002-MXC-NFC-Remove-useless-structure-member.patch
new file mode 100644
index 0000000..1cad5b5
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0002-MXC-NFC-Remove-useless-structure-member.patch
@@ -0,0 +1,45 @@
+From ec0217a98d38662cc058dcc6124c5a1e7a6bc8db Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 13:51:19 +0200
+Subject: [PATCH 02/15] MXC NFC: Remove useless structure member
+
+Remove a local copy of a value always present in other structures.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |    5 +----
+ 1 files changed, 1 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index b7ae2e0..3483e7d 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -104,7 +104,6 @@ struct mxc_nand_host {
+ 	unsigned int		buf_start;
+ 
+ 	wait_queue_head_t	irq_waitq;
+-	int			g_page_mask;
+ 
+ 	struct clk		*clk;
+ 	int			clk_enabled;
+@@ -473,7 +472,7 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+ 
+-	u32 page_mask = host->g_page_mask;
++	u32 page_mask = nand_chip->pagemask;
+ 
+ 	if (column != -1) {
+ 		send_addr(host, column & 0xFF);
+@@ -790,8 +789,6 @@ static int mxc_nand_scan_bbt(struct mtd_info *mtd)
+ 	struct nand_chip *this = mtd->priv;
+ 	struct mxc_nand_host *host = this->priv;
+ 
+-	host->g_page_mask = this->pagemask;
+-
+ 	if (mtd->writesize == 2048) {
+ 		mxc_set_nfms(mtd, 1 << NFMS_NF_PG_SZ);
+ 		this->ecc.layout = &nand_hw_eccoob_2k;
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0002-mfd-Add-Freescale-MC13783-driver.patch b/recipes/linux/linux-2.6.31/pcm043/0002-mfd-Add-Freescale-MC13783-driver.patch
new file mode 100644
index 0000000..c975666
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0002-mfd-Add-Freescale-MC13783-driver.patch
@@ -0,0 +1,984 @@
+From b7f6a24d9c7f9715845cc910000618f2c658ea27 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 19 Aug 2009 01:40:28 +0200
+Subject: [PATCH 02/28] mfd: Add Freescale MC13783 driver
+
+This driver provides the core Freescale MC13783 support. It
+registers the client platform_devices and provides access
+to the A/D converter.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
+---
+ drivers/mfd/Kconfig                 |   10 +
+ drivers/mfd/Makefile                |    2 +
+ drivers/mfd/mc13783-core.c          |  427 +++++++++++++++++++++++++++++++++++
+ include/linux/mfd/mc13783-private.h |  396 ++++++++++++++++++++++++++++++++
+ include/linux/mfd/mc13783.h         |   84 +++++++
+ 5 files changed, 919 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/mfd/mc13783-core.c
+ create mode 100644 include/linux/mfd/mc13783-private.h
+ create mode 100644 include/linux/mfd/mc13783.h
+
+diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
+index 491ac0f..c9aa085 100644
+--- a/drivers/mfd/Kconfig
++++ b/drivers/mfd/Kconfig
+@@ -228,6 +228,16 @@ config MFD_PCF50633
+ 	  facilities, and registers devices for the various functions
+ 	  so that function-specific drivers can bind to them.
+ 
++config MFD_MC13783
++	tristate "Support Freescale MC13783"
++	depends on SPI_MASTER
++	select MFD_CORE
++	help
++	  Support for the Freescale (Atlas) MC13783 PMIC and audio CODEC.
++	  This driver provides common support for accessing  the device,
++	  additional drivers must be enabled in order to use the
++	  functionality of the device.
++
+ config PCF50633_ADC
+ 	tristate "Support for NXP PCF50633 ADC"
+ 	depends on MFD_PCF50633
+diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
+index 6f8a9a1..7262822 100644
+--- a/drivers/mfd/Makefile
++++ b/drivers/mfd/Makefile
+@@ -24,6 +24,8 @@ obj-$(CONFIG_MENELAUS)		+= menelaus.o
+ 
+ obj-$(CONFIG_TWL4030_CORE)	+= twl4030-core.o twl4030-irq.o
+ 
++obj-$(CONFIG_MFD_MC13783)	+= mc13783-core.o
++
+ obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
+ 
+ obj-$(CONFIG_EZX_PCAP)		+= ezx-pcap.o
+diff --git a/drivers/mfd/mc13783-core.c b/drivers/mfd/mc13783-core.c
+new file mode 100644
+index 0000000..e354d29
+--- /dev/null
++++ b/drivers/mfd/mc13783-core.c
+@@ -0,0 +1,427 @@
++/*
++ * Copyright 2009 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This code is in parts based on wm8350-core.c and pcf50633-core.c
++ *
++ * Initial development of this code was funded by
++ * Phytec Messtechnik GmbH, http://www.phytec.de
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#include <linux/mfd/mc13783-private.h>
++#include <linux/platform_device.h>
++#include <linux/mfd/mc13783.h>
++#include <linux/completion.h>
++#include <linux/interrupt.h>
++#include <linux/mfd/core.h>
++#include <linux/spi/spi.h>
++#include <linux/uaccess.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/slab.h>
++#include <linux/irq.h>
++
++#define MC13783_MAX_REG_NUM	0x3f
++#define MC13783_FRAME_MASK	0x00ffffff
++#define MC13783_MAX_REG_NUM	0x3f
++#define MC13783_REG_NUM_SHIFT	0x19
++#define MC13783_WRITE_BIT_SHIFT	31
++
++static inline int spi_rw(struct spi_device *spi, u8 * buf, size_t len)
++{
++	struct spi_transfer t = {
++		.tx_buf = (const void *)buf,
++		.rx_buf = buf,
++		.len = len,
++		.cs_change = 0,
++		.delay_usecs = 0,
++	};
++	struct spi_message m;
++
++	spi_message_init(&m);
++	spi_message_add_tail(&t, &m);
++	if (spi_sync(spi, &m) != 0 || m.status != 0)
++		return -EINVAL;
++	return len - m.actual_length;
++}
++
++static int mc13783_read(struct mc13783 *mc13783, int reg_num, u32 *reg_val)
++{
++	unsigned int frame = 0;
++	int ret = 0;
++
++	if (reg_num > MC13783_MAX_REG_NUM)
++		return -EINVAL;
++
++	frame |= reg_num << MC13783_REG_NUM_SHIFT;
++
++	ret = spi_rw(mc13783->spi_device, (u8 *)&frame, 4);
++
++	*reg_val = frame & MC13783_FRAME_MASK;
++
++	return ret;
++}
++
++static int mc13783_write(struct mc13783 *mc13783, int reg_num, u32 reg_val)
++{
++	unsigned int frame = 0;
++
++	if (reg_num > MC13783_MAX_REG_NUM)
++		return -EINVAL;
++
++	frame |= (1 << MC13783_WRITE_BIT_SHIFT);
++	frame |= reg_num << MC13783_REG_NUM_SHIFT;
++	frame |= reg_val & MC13783_FRAME_MASK;
++
++	return spi_rw(mc13783->spi_device, (u8 *)&frame, 4);
++}
++
++int mc13783_reg_read(struct mc13783 *mc13783, int reg_num, u32 *reg_val)
++{
++	int ret;
++
++	mutex_lock(&mc13783->io_lock);
++	ret = mc13783_read(mc13783, reg_num, reg_val);
++	mutex_unlock(&mc13783->io_lock);
++
++	return ret;
++}
++EXPORT_SYMBOL_GPL(mc13783_reg_read);
++
++int mc13783_reg_write(struct mc13783 *mc13783, int reg_num, u32 reg_val)
++{
++	int ret;
++
++	mutex_lock(&mc13783->io_lock);
++	ret = mc13783_write(mc13783, reg_num, reg_val);
++	mutex_unlock(&mc13783->io_lock);
++
++	return ret;
++}
++EXPORT_SYMBOL_GPL(mc13783_reg_write);
++
++/**
++ * mc13783_set_bits - Bitmask write
++ *
++ * @mc13783: Pointer to mc13783 control structure
++ * @reg:    Register to access
++ * @mask:   Mask of bits to change
++ * @val:    Value to set for masked bits
++ */
++int mc13783_set_bits(struct mc13783 *mc13783, int reg, u32 mask, u32 val)
++{
++	u32 tmp;
++	int ret;
++
++	mutex_lock(&mc13783->io_lock);
++
++	ret = mc13783_read(mc13783, reg, &tmp);
++	tmp = (tmp & ~mask) | val;
++	if (ret == 0)
++		ret = mc13783_write(mc13783, reg, tmp);
++
++	mutex_unlock(&mc13783->io_lock);
++
++	return ret;
++}
++EXPORT_SYMBOL_GPL(mc13783_set_bits);
++
++int mc13783_register_irq(struct mc13783 *mc13783, int irq,
++		void (*handler) (int, void *), void *data)
++{
++	if (irq < 0 || irq > MC13783_NUM_IRQ || !handler)
++		return -EINVAL;
++
++	if (WARN_ON(mc13783->irq_handler[irq].handler))
++		return -EBUSY;
++
++	mutex_lock(&mc13783->io_lock);
++	mc13783->irq_handler[irq].handler = handler;
++	mc13783->irq_handler[irq].data = data;
++	mutex_unlock(&mc13783->io_lock);
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(mc13783_register_irq);
++
++int mc13783_free_irq(struct mc13783 *mc13783, int irq)
++{
++	if (irq < 0 || irq > MC13783_NUM_IRQ)
++		return -EINVAL;
++
++	mutex_lock(&mc13783->io_lock);
++	mc13783->irq_handler[irq].handler = NULL;
++	mutex_unlock(&mc13783->io_lock);
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(mc13783_free_irq);
++
++static void mc13783_irq_work(struct work_struct *work)
++{
++	struct mc13783 *mc13783 = container_of(work, struct mc13783, work);
++	int i;
++	unsigned int adc_sts;
++
++	/* check if the adc has finished any completion */
++	mc13783_reg_read(mc13783, MC13783_REG_INTERRUPT_STATUS_0, &adc_sts);
++	mc13783_reg_write(mc13783, MC13783_REG_INTERRUPT_STATUS_0,
++			adc_sts & MC13783_INT_STAT_ADCDONEI);
++
++	if (adc_sts & MC13783_INT_STAT_ADCDONEI)
++		complete_all(&mc13783->adc_done);
++
++	for (i = 0; i < MC13783_NUM_IRQ; i++)
++		if (mc13783->irq_handler[i].handler)
++			mc13783->irq_handler[i].handler(i,
++					mc13783->irq_handler[i].data);
++	enable_irq(mc13783->irq);
++}
++
++static irqreturn_t mc13783_interrupt(int irq, void *dev_id)
++{
++	struct mc13783 *mc13783 = dev_id;
++
++	disable_irq_nosync(irq);
++
++	schedule_work(&mc13783->work);
++	return IRQ_HANDLED;
++}
++
++/* set adc to ts interrupt mode, which generates touchscreen wakeup interrupt */
++static inline void mc13783_adc_set_ts_irq_mode(struct mc13783 *mc13783)
++{
++	unsigned int reg_adc0, reg_adc1;
++
++	reg_adc0 = MC13783_ADC0_ADREFEN | MC13783_ADC0_ADREFMODE
++			| MC13783_ADC0_TSMOD0;
++	reg_adc1 = MC13783_ADC1_ADEN | MC13783_ADC1_ADTRIGIGN;
++
++	mc13783_reg_write(mc13783, MC13783_REG_ADC_0, reg_adc0);
++	mc13783_reg_write(mc13783, MC13783_REG_ADC_1, reg_adc1);
++}
++
++int mc13783_adc_do_conversion(struct mc13783 *mc13783, unsigned int mode,
++		unsigned int channel, unsigned int *sample)
++{
++	unsigned int reg_adc0, reg_adc1;
++	int i;
++
++	mutex_lock(&mc13783->adc_conv_lock);
++
++	/* set up auto incrementing anyway to make quick read */
++	reg_adc0 =  MC13783_ADC0_ADINC1 | MC13783_ADC0_ADINC2;
++	/* enable the adc, ignore external triggering and set ASC to trigger
++	 * conversion */
++	reg_adc1 =  MC13783_ADC1_ADEN | MC13783_ADC1_ADTRIGIGN
++		| MC13783_ADC1_ASC;
++
++	/* setup channel number */
++	if (channel > 7)
++		reg_adc1 |= MC13783_ADC1_ADSEL;
++
++	switch (mode) {
++	case MC13783_ADC_MODE_TS:
++		/* enables touch screen reference mode and set touchscreen mode
++		 * to position mode */
++		reg_adc0 |= MC13783_ADC0_ADREFEN | MC13783_ADC0_ADREFMODE
++			| MC13783_ADC0_TSMOD0 | MC13783_ADC0_TSMOD1;
++		reg_adc1 |= 4 << MC13783_ADC1_CHAN1_SHIFT;
++		break;
++	case MC13783_ADC_MODE_SINGLE_CHAN:
++		reg_adc1 |= (channel & 0x7) << MC13783_ADC1_CHAN0_SHIFT;
++		reg_adc1 |= MC13783_ADC1_RAND;
++		break;
++	case MC13783_ADC_MODE_MULT_CHAN:
++		reg_adc1 |= 4 << MC13783_ADC1_CHAN1_SHIFT;
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	mc13783_reg_write(mc13783, MC13783_REG_ADC_0, reg_adc0);
++	mc13783_reg_write(mc13783, MC13783_REG_ADC_1, reg_adc1);
++
++	wait_for_completion_interruptible(&mc13783->adc_done);
++
++	for (i = 0; i < 4; i++)
++		mc13783_reg_read(mc13783, MC13783_REG_ADC_2, &sample[i]);
++
++	if (mc13783->ts_active)
++		mc13783_adc_set_ts_irq_mode(mc13783);
++
++	mutex_unlock(&mc13783->adc_conv_lock);
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(mc13783_adc_do_conversion);
++
++void mc13783_adc_set_ts_status(struct mc13783 *mc13783, unsigned int status)
++{
++	mc13783->ts_active = status;
++}
++EXPORT_SYMBOL_GPL(mc13783_adc_set_ts_status);
++
++static int mc13783_check_revision(struct mc13783 *mc13783)
++{
++	u32 rev_id, rev1, rev2, finid, icid;
++
++	mc13783_read(mc13783, MC13783_REG_REVISION, &rev_id);
++
++	rev1 = (rev_id & 0x018) >> 3;
++	rev2 = (rev_id & 0x007);
++	icid = (rev_id & 0x01C0) >> 6;
++	finid = (rev_id & 0x01E00) >> 9;
++
++	/* Ver 0.2 is actually 3.2a.  Report as 3.2 */
++	if ((rev1 == 0) && (rev2 == 2))
++		rev1 = 3;
++
++	if (rev1 == 0 || icid != 2) {
++		dev_err(mc13783->dev, "No MC13783 detected.\n");
++		return -ENODEV;
++	}
++
++	mc13783->revision = ((rev1 * 10) + rev2);
++	dev_info(mc13783->dev, "MC13783 Rev %d.%d FinVer %x detected\n", rev1,
++	       rev2, finid);
++
++	return 0;
++}
++
++/*
++ * Register a client device.  This is non-fatal since there is no need to
++ * fail the entire device init due to a single platform device failing.
++ */
++static void mc13783_client_dev_register(struct mc13783 *mc13783,
++				       const char *name)
++{
++	struct mfd_cell cell = {};
++
++	cell.name = name;
++
++	mfd_add_devices(mc13783->dev, -1, &cell, 1, NULL, 0);
++}
++
++static int __devinit mc13783_probe(struct spi_device *spi)
++{
++	struct mc13783 *mc13783;
++	struct mc13783_platform_data *pdata = spi->dev.platform_data;
++	int ret;
++
++	mc13783 = kzalloc(sizeof(struct mc13783), GFP_KERNEL);
++	if (!mc13783)
++		return -ENOMEM;
++
++	dev_set_drvdata(&spi->dev, mc13783);
++	spi->mode = SPI_MODE_0 | SPI_CS_HIGH;
++	spi->bits_per_word = 32;
++	spi_setup(spi);
++
++	mc13783->spi_device = spi;
++	mc13783->dev = &spi->dev;
++	mc13783->irq = spi->irq;
++
++	INIT_WORK(&mc13783->work, mc13783_irq_work);
++	mutex_init(&mc13783->io_lock);
++	mutex_init(&mc13783->adc_conv_lock);
++	init_completion(&mc13783->adc_done);
++
++	if (pdata) {
++		mc13783->flags = pdata->flags;
++		mc13783->regulators = pdata->regulators;
++		mc13783->num_regulators = pdata->num_regulators;
++	}
++
++	if (mc13783_check_revision(mc13783)) {
++		ret = -ENODEV;
++		goto err_out;
++	}
++
++	/* clear and mask all interrupts */
++	mc13783_reg_write(mc13783, MC13783_REG_INTERRUPT_STATUS_0, 0x00ffffff);
++	mc13783_reg_write(mc13783, MC13783_REG_INTERRUPT_MASK_0, 0x00ffffff);
++	mc13783_reg_write(mc13783, MC13783_REG_INTERRUPT_STATUS_1, 0x00ffffff);
++	mc13783_reg_write(mc13783, MC13783_REG_INTERRUPT_MASK_1, 0x00ffffff);
++
++	/* unmask adcdone interrupts */
++	mc13783_set_bits(mc13783, MC13783_REG_INTERRUPT_MASK_0,
++			MC13783_INT_MASK_ADCDONEM, 0);
++
++	ret = request_irq(mc13783->irq, mc13783_interrupt,
++			IRQF_DISABLED | IRQF_TRIGGER_HIGH, "mc13783",
++			mc13783);
++	if (ret)
++		goto err_out;
++
++	if (mc13783->flags & MC13783_USE_CODEC)
++		mc13783_client_dev_register(mc13783, "mc13783-codec");
++	if (mc13783->flags & MC13783_USE_ADC)
++		mc13783_client_dev_register(mc13783, "mc13783-adc");
++	if (mc13783->flags & MC13783_USE_RTC)
++		mc13783_client_dev_register(mc13783, "mc13783-rtc");
++	if (mc13783->flags & MC13783_USE_REGULATOR)
++		mc13783_client_dev_register(mc13783, "mc13783-regulator");
++	if (mc13783->flags & MC13783_USE_TOUCHSCREEN)
++		mc13783_client_dev_register(mc13783, "mc13783-ts");
++
++	return 0;
++
++err_out:
++	kfree(mc13783);
++	return ret;
++}
++
++static int __devexit mc13783_remove(struct spi_device *spi)
++{
++	struct mc13783 *mc13783;
++
++	mc13783 = dev_get_drvdata(&spi->dev);
++
++	free_irq(mc13783->irq, mc13783);
++
++	mfd_remove_devices(&spi->dev);
++
++	return 0;
++}
++
++static struct spi_driver pmic_driver = {
++	.driver = {
++		   .name = "mc13783",
++		   .bus = &spi_bus_type,
++		   .owner = THIS_MODULE,
++	},
++	.probe = mc13783_probe,
++	.remove = __devexit_p(mc13783_remove),
++};
++
++static int __init pmic_init(void)
++{
++	return spi_register_driver(&pmic_driver);
++}
++subsys_initcall(pmic_init);
++
++static void __exit pmic_exit(void)
++{
++	spi_unregister_driver(&pmic_driver);
++}
++module_exit(pmic_exit);
++
++MODULE_DESCRIPTION("Core/Protocol driver for Freescale MC13783 PMIC");
++MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
++MODULE_LICENSE("GPL");
++
+diff --git a/include/linux/mfd/mc13783-private.h b/include/linux/mfd/mc13783-private.h
+new file mode 100644
+index 0000000..47e698c
+--- /dev/null
++++ b/include/linux/mfd/mc13783-private.h
+@@ -0,0 +1,396 @@
++/*
++ * Copyright 2009 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * Initial development of this code was funded by
++ * Phytec Messtechnik GmbH, http://www.phytec.de
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __LINUX_MFD_MC13783_PRIV_H
++#define __LINUX_MFD_MC13783_PRIV_H
++
++#include <linux/platform_device.h>
++#include <linux/mfd/mc13783.h>
++#include <linux/workqueue.h>
++#include <linux/mutex.h>
++
++struct mc13783_irq {
++	void (*handler)(int, void *);
++	void *data;
++};
++
++#define MC13783_NUM_IRQ		2
++#define MC13783_IRQ_TS		0
++#define MC13783_IRQ_REGULATOR	1
++
++#define MC13783_ADC_MODE_TS		1
++#define MC13783_ADC_MODE_SINGLE_CHAN	2
++#define MC13783_ADC_MODE_MULT_CHAN	3
++
++struct mc13783 {
++	int revision;
++	struct device *dev;
++	struct spi_device *spi_device;
++
++	int (*read_dev)(void *data, char reg, int count, u32 *dst);
++	int (*write_dev)(void *data, char reg, int count, const u32 *src);
++
++	struct mutex io_lock;
++	void *io_data;
++	int irq;
++	unsigned int flags;
++
++	struct mc13783_irq irq_handler[MC13783_NUM_IRQ];
++	struct work_struct work;
++	struct completion adc_done;
++	unsigned int ts_active;
++	struct mutex adc_conv_lock;
++
++	struct mc13783_regulator_init_data *regulators;
++	int num_regulators;
++};
++
++int mc13783_reg_read(struct mc13783 *, int reg_num, u32 *);
++int mc13783_reg_write(struct mc13783 *, int, u32);
++int mc13783_set_bits(struct mc13783 *, int, u32, u32);
++int mc13783_free_irq(struct mc13783 *mc13783, int irq);
++int mc13783_register_irq(struct mc13783 *mc13783, int irq,
++		void (*handler) (int, void *), void *data);
++
++#define MC13783_REG_INTERRUPT_STATUS_0		 0
++#define MC13783_REG_INTERRUPT_MASK_0		 1
++#define MC13783_REG_INTERRUPT_SENSE_0		 2
++#define MC13783_REG_INTERRUPT_STATUS_1		 3
++#define MC13783_REG_INTERRUPT_MASK_1		 4
++#define MC13783_REG_INTERRUPT_SENSE_1		 5
++#define MC13783_REG_POWER_UP_MODE_SENSE		 6
++#define MC13783_REG_REVISION			 7
++#define MC13783_REG_SEMAPHORE			 8
++#define MC13783_REG_ARBITRATION_PERIPHERAL_AUDIO 9
++#define MC13783_REG_ARBITRATION_SWITCHERS	10
++#define MC13783_REG_ARBITRATION_REGULATORS_0	11
++#define MC13783_REG_ARBITRATION_REGULATORS_1	12
++#define MC13783_REG_POWER_CONTROL_0		13
++#define MC13783_REG_POWER_CONTROL_1		14
++#define MC13783_REG_POWER_CONTROL_2		15
++#define MC13783_REG_REGEN_ASSIGNMENT		16
++#define MC13783_REG_CONTROL_SPARE		17
++#define MC13783_REG_MEMORY_A			18
++#define MC13783_REG_MEMORY_B			19
++#define MC13783_REG_RTC_TIME			20
++#define MC13783_REG_RTC_ALARM			21
++#define MC13783_REG_RTC_DAY			22
++#define MC13783_REG_RTC_DAY_ALARM		23
++#define MC13783_REG_SWITCHERS_0			24
++#define MC13783_REG_SWITCHERS_1			25
++#define MC13783_REG_SWITCHERS_2			26
++#define MC13783_REG_SWITCHERS_3			27
++#define MC13783_REG_SWITCHERS_4			28
++#define MC13783_REG_SWITCHERS_5			29
++#define MC13783_REG_REGULATOR_SETTING_0		30
++#define MC13783_REG_REGULATOR_SETTING_1		31
++#define MC13783_REG_REGULATOR_MODE_0		32
++#define MC13783_REG_REGULATOR_MODE_1		33
++#define MC13783_REG_POWER_MISCELLANEOUS		34
++#define MC13783_REG_POWER_SPARE			35
++#define MC13783_REG_AUDIO_RX_0			36
++#define MC13783_REG_AUDIO_RX_1			37
++#define MC13783_REG_AUDIO_TX			38
++#define MC13783_REG_AUDIO_SSI_NETWORK		39
++#define MC13783_REG_AUDIO_CODEC			40
++#define MC13783_REG_AUDIO_STEREO_DAC		41
++#define MC13783_REG_AUDIO_SPARE			42
++#define MC13783_REG_ADC_0			43
++#define MC13783_REG_ADC_1			44
++#define MC13783_REG_ADC_2			45
++#define MC13783_REG_ADC_3			46
++#define MC13783_REG_ADC_4			47
++#define MC13783_REG_CHARGER			48
++#define MC13783_REG_USB				49
++#define MC13783_REG_CHARGE_USB_SPARE		50
++#define MC13783_REG_LED_CONTROL_0		51
++#define MC13783_REG_LED_CONTROL_1		52
++#define MC13783_REG_LED_CONTROL_2		53
++#define MC13783_REG_LED_CONTROL_3		54
++#define MC13783_REG_LED_CONTROL_4		55
++#define MC13783_REG_LED_CONTROL_5		56
++#define MC13783_REG_SPARE			57
++#define MC13783_REG_TRIM_0			58
++#define MC13783_REG_TRIM_1			59
++#define MC13783_REG_TEST_0			60
++#define MC13783_REG_TEST_1			61
++#define MC13783_REG_TEST_2			62
++#define MC13783_REG_TEST_3			63
++#define MC13783_REG_NB				64
++
++
++/*
++ * Interrupt Status
++ */
++#define MC13783_INT_STAT_ADCDONEI	(1 << 0)
++#define MC13783_INT_STAT_ADCBISDONEI	(1 << 1)
++#define MC13783_INT_STAT_TSI		(1 << 2)
++#define MC13783_INT_STAT_WHIGHI		(1 << 3)
++#define MC13783_INT_STAT_WLOWI		(1 << 4)
++#define MC13783_INT_STAT_CHGDETI	(1 << 6)
++#define MC13783_INT_STAT_CHGOVI		(1 << 7)
++#define MC13783_INT_STAT_CHGREVI	(1 << 8)
++#define MC13783_INT_STAT_CHGSHORTI	(1 << 9)
++#define MC13783_INT_STAT_CCCVI		(1 << 10)
++#define MC13783_INT_STAT_CHGCURRI	(1 << 11)
++#define MC13783_INT_STAT_BPONI		(1 << 12)
++#define MC13783_INT_STAT_LOBATLI	(1 << 13)
++#define MC13783_INT_STAT_LOBATHI	(1 << 14)
++#define MC13783_INT_STAT_UDPI		(1 << 15)
++#define MC13783_INT_STAT_USBI		(1 << 16)
++#define MC13783_INT_STAT_IDI		(1 << 19)
++#define MC13783_INT_STAT_Unused		(1 << 20)
++#define MC13783_INT_STAT_SE1I		(1 << 21)
++#define MC13783_INT_STAT_CKDETI		(1 << 22)
++#define MC13783_INT_STAT_UDMI		(1 << 23)
++
++/*
++ * Interrupt Mask
++ */
++#define MC13783_INT_MASK_ADCDONEM	(1 << 0)
++#define MC13783_INT_MASK_ADCBISDONEM	(1 << 1)
++#define MC13783_INT_MASK_TSM		(1 << 2)
++#define MC13783_INT_MASK_WHIGHM		(1 << 3)
++#define MC13783_INT_MASK_WLOWM		(1 << 4)
++#define MC13783_INT_MASK_CHGDETM	(1 << 6)
++#define MC13783_INT_MASK_CHGOVM		(1 << 7)
++#define MC13783_INT_MASK_CHGREVM	(1 << 8)
++#define MC13783_INT_MASK_CHGSHORTM	(1 << 9)
++#define MC13783_INT_MASK_CCCVM		(1 << 10)
++#define MC13783_INT_MASK_CHGCURRM	(1 << 11)
++#define MC13783_INT_MASK_BPONM		(1 << 12)
++#define MC13783_INT_MASK_LOBATLM	(1 << 13)
++#define MC13783_INT_MASK_LOBATHM	(1 << 14)
++#define MC13783_INT_MASK_UDPM		(1 << 15)
++#define MC13783_INT_MASK_USBM		(1 << 16)
++#define MC13783_INT_MASK_IDM		(1 << 19)
++#define MC13783_INT_MASK_SE1M		(1 << 21)
++#define MC13783_INT_MASK_CKDETM		(1 << 22)
++
++/*
++ * Reg Regulator Mode 0
++ */
++#define MC13783_REGCTRL_VAUDIO_EN	(1 << 0)
++#define MC13783_REGCTRL_VAUDIO_STBY	(1 << 1)
++#define MC13783_REGCTRL_VAUDIO_MODE	(1 << 2)
++#define MC13783_REGCTRL_VIOHI_EN	(1 << 3)
++#define MC13783_REGCTRL_VIOHI_STBY	(1 << 4)
++#define MC13783_REGCTRL_VIOHI_MODE	(1 << 5)
++#define MC13783_REGCTRL_VIOLO_EN	(1 << 6)
++#define MC13783_REGCTRL_VIOLO_STBY 	(1 << 7)
++#define MC13783_REGCTRL_VIOLO_MODE	(1 << 8)
++#define MC13783_REGCTRL_VDIG_EN		(1 << 9)
++#define MC13783_REGCTRL_VDIG_STBY	(1 << 10)
++#define MC13783_REGCTRL_VDIG_MODE	(1 << 11)
++#define MC13783_REGCTRL_VGEN_EN		(1 << 12)
++#define MC13783_REGCTRL_VGEN_STBY	(1 << 13)
++#define MC13783_REGCTRL_VGEN_MODE	(1 << 14)
++#define MC13783_REGCTRL_VRFDIG_EN	(1 << 15)
++#define MC13783_REGCTRL_VRFDIG_STBY	(1 << 16)
++#define MC13783_REGCTRL_VRFDIG_MODE	(1 << 17)
++#define MC13783_REGCTRL_VRFREF_EN	(1 << 18)
++#define MC13783_REGCTRL_VRFREF_STBY	(1 << 19)
++#define MC13783_REGCTRL_VRFREF_MODE	(1 << 20)
++#define MC13783_REGCTRL_VRFCP_EN	(1 << 21)
++#define MC13783_REGCTRL_VRFCP_STBY	(1 << 22)
++#define MC13783_REGCTRL_VRFCP_MODE	(1 << 23)
++
++/*
++ * Reg Regulator Mode 1
++ */
++#define MC13783_REGCTRL_VSIM_EN		(1 << 0)
++#define MC13783_REGCTRL_VSIM_STBY	(1 << 1)
++#define MC13783_REGCTRL_VSIM_MODE	(1 << 2)
++#define MC13783_REGCTRL_VESIM_EN	(1 << 3)
++#define MC13783_REGCTRL_VESIM_STBY	(1 << 4)
++#define MC13783_REGCTRL_VESIM_MODE	(1 << 5)
++#define MC13783_REGCTRL_VCAM_EN		(1 << 6)
++#define MC13783_REGCTRL_VCAM_STBY	(1 << 7)
++#define MC13783_REGCTRL_VCAM_MODE	(1 << 8)
++#define	MC13783_REGCTRL_VRFBG_EN	(1 << 9)
++#define MC13783_REGCTRL_VRFBG_STBY	(1 << 10)
++#define MC13783_REGCTRL_VVIB_EN		(1 << 11)
++#define MC13783_REGCTRL_VRF1_EN		(1 << 12)
++#define MC13783_REGCTRL_VRF1_STBY	(1 << 13)
++#define MC13783_REGCTRL_VRF1_MODE	(1 << 14)
++#define MC13783_REGCTRL_VRF2_EN		(1 << 15)
++#define MC13783_REGCTRL_VRF2_STBY	(1 << 16)
++#define MC13783_REGCTRL_VRF2_MODE	(1 << 17)
++#define MC13783_REGCTRL_VMMC1_EN	(1 << 18)
++#define MC13783_REGCTRL_VMMC1_STBY	(1 << 19)
++#define MC13783_REGCTRL_VMMC1_MODE	(1 << 20)
++#define MC13783_REGCTRL_VMMC2_EN	(1 << 21)
++#define MC13783_REGCTRL_VMMC2_STBY	(1 << 22)
++#define MC13783_REGCTRL_VMMC2_MODE	(1 << 23)
++
++/*
++ * Reg Regulator Misc.
++ */
++#define MC13783_REGCTRL_GPO1_EN		(1 << 6)
++#define MC13783_REGCTRL_GPO2_EN		(1 << 8)
++#define MC13783_REGCTRL_GPO3_EN		(1 << 10)
++#define MC13783_REGCTRL_GPO4_EN		(1 << 12)
++#define MC13783_REGCTRL_VIBPINCTRL	(1 << 14)
++
++/*
++ * Reg Switcher 4
++ */
++#define MC13783_SWCTRL_SW1A_MODE	(1 << 0)
++#define MC13783_SWCTRL_SW1A_STBY_MODE	(1 << 2)
++#define MC13783_SWCTRL_SW1A_DVS_SPEED	(1 << 6)
++#define MC13783_SWCTRL_SW1A_PANIC_MODE	(1 << 8)
++#define MC13783_SWCTRL_SW1A_SOFTSTART	(1 << 9)
++#define MC13783_SWCTRL_SW1B_MODE	(1 << 10)
++#define MC13783_SWCTRL_SW1B_STBY_MODE	(1 << 12)
++#define MC13783_SWCTRL_SW1B_DVS_SPEED	(1 << 14)
++#define MC13783_SWCTRL_SW1B_PANIC_MODE	(1 << 16)
++#define MC13783_SWCTRL_SW1B_SOFTSTART	(1 << 17)
++#define MC13783_SWCTRL_PLL_EN		(1 << 18)
++#define MC13783_SWCTRL_PLL_FACTOR	(1 << 19)
++
++/*
++ * Reg Switcher 5
++ */
++#define MC13783_SWCTRL_SW2A_MODE	(1 << 0)
++#define MC13783_SWCTRL_SW2A_STBY_MODE	(1 << 2)
++#define MC13783_SWCTRL_SW2A_DVS_SPEED	(1 << 6)
++#define MC13783_SWCTRL_SW2A_PANIC_MODE	(1 << 8)
++#define MC13783_SWCTRL_SW2A_SOFTSTART	(1 << 9)
++#define MC13783_SWCTRL_SW2B_MODE	(1 << 10)
++#define MC13783_SWCTRL_SW2B_STBY_MODE	(1 << 12)
++#define MC13783_SWCTRL_SW2B_DVS_SPEED	(1 << 14)
++#define MC13783_SWCTRL_SW2B_PANIC_MODE	(1 << 16)
++#define MC13783_SWCTRL_SW2B_SOFTSTART	(1 << 17)
++#define MC13783_SWSET_SW3		(1 << 18)
++#define MC13783_SWCTRL_SW3_EN		(1 << 20)
++#define MC13783_SWCTRL_SW3_STBY		(1 << 21)
++#define MC13783_SWCTRL_SW3_MODE		(1 << 22)
++
++/*
++ * ADC/Touch
++ */
++#define MC13783_ADC0_LICELLCON		(1 << 0)
++#define MC13783_ADC0_CHRGICON		(1 << 1)
++#define MC13783_ADC0_BATICON		(1 << 2)
++#define MC13783_ADC0_RTHEN 		(1 << 3)
++#define MC13783_ADC0_DTHEN		(1 << 4)
++#define MC13783_ADC0_UIDEN		(1 << 5)
++#define MC13783_ADC0_ADOUTEN 		(1 << 6)
++#define MC13783_ADC0_ADOUTPER		(1 << 7)
++#define MC13783_ADC0_ADREFEN		(1 << 10)
++#define MC13783_ADC0_ADREFMODE		(1 << 11)
++#define MC13783_ADC0_TSMOD0		(1 << 12)
++#define MC13783_ADC0_TSMOD1		(1 << 13)
++#define MC13783_ADC0_TSMOD2		(1 << 14)
++#define MC13783_ADC0_CHRGRAWDIV		(1 << 15)
++#define MC13783_ADC0_ADINC1		(1 << 16)
++#define MC13783_ADC0_ADINC2		(1 << 17)
++#define MC13783_ADC0_WCOMP		(1 << 18)
++#define MC13783_ADC0_ADCBIS0		(1 << 23)
++
++#define MC13783_ADC1_ADEN		(1 << 0)
++#define MC13783_ADC1_RAND		(1 << 1)
++#define MC13783_ADC1_ADSEL		(1 << 3)
++#define MC13783_ADC1_TRIGMASK		(1 << 4)
++#define MC13783_ADC1_ADA10		(1 << 5)
++#define MC13783_ADC1_ADA11		(1 << 6)
++#define MC13783_ADC1_ADA12		(1 << 7)
++#define MC13783_ADC1_ADA20		(1 << 8)
++#define MC13783_ADC1_ADA21		(1 << 9)
++#define MC13783_ADC1_ADA22		(1 << 10)
++#define MC13783_ADC1_ATO0		(1 << 11)
++#define MC13783_ADC1_ATO1		(1 << 12)
++#define MC13783_ADC1_ATO2		(1 << 13)
++#define MC13783_ADC1_ATO3		(1 << 14)
++#define MC13783_ADC1_ATO4		(1 << 15)
++#define MC13783_ADC1_ATO5		(1 << 16)
++#define MC13783_ADC1_ATO6		(1 << 17)
++#define MC13783_ADC1_ATO7		(1 << 18)
++#define MC13783_ADC1_ATOX		(1 << 19)
++#define MC13783_ADC1_ASC		(1 << 20)
++#define MC13783_ADC1_ADTRIGIGN		(1 << 21)
++#define MC13783_ADC1_ADONESHOT		(1 << 22)
++#define MC13783_ADC1_ADCBIS1		(1 << 23)
++
++#define MC13783_ADC1_CHAN0_SHIFT	5
++#define MC13783_ADC1_CHAN1_SHIFT	8
++
++#define MC13783_ADC2_ADD10		(1 << 2)
++#define MC13783_ADC2_ADD11		(1 << 3)
++#define MC13783_ADC2_ADD12		(1 << 4)
++#define MC13783_ADC2_ADD13		(1 << 5)
++#define MC13783_ADC2_ADD14		(1 << 6)
++#define MC13783_ADC2_ADD15		(1 << 7)
++#define MC13783_ADC2_ADD16		(1 << 8)
++#define MC13783_ADC2_ADD17		(1 << 9)
++#define MC13783_ADC2_ADD18		(1 << 10)
++#define MC13783_ADC2_ADD19		(1 << 11)
++#define MC13783_ADC2_ADD20		(1 << 14)
++#define MC13783_ADC2_ADD21		(1 << 15)
++#define MC13783_ADC2_ADD22		(1 << 16)
++#define MC13783_ADC2_ADD23		(1 << 17)
++#define MC13783_ADC2_ADD24		(1 << 18)
++#define MC13783_ADC2_ADD25		(1 << 19)
++#define MC13783_ADC2_ADD26		(1 << 20)
++#define MC13783_ADC2_ADD27		(1 << 21)
++#define MC13783_ADC2_ADD28		(1 << 22)
++#define MC13783_ADC2_ADD29		(1 << 23)
++
++#define MC13783_ADC3_WHIGH0		(1 << 0)
++#define MC13783_ADC3_WHIGH1		(1 << 1)
++#define MC13783_ADC3_WHIGH2		(1 << 2)
++#define MC13783_ADC3_WHIGH3		(1 << 3)
++#define MC13783_ADC3_WHIGH4		(1 << 4)
++#define MC13783_ADC3_WHIGH5		(1 << 5)
++#define MC13783_ADC3_ICID0		(1 << 6)
++#define MC13783_ADC3_ICID1		(1 << 7)
++#define MC13783_ADC3_ICID2		(1 << 8)
++#define MC13783_ADC3_WLOW0		(1 << 9)
++#define MC13783_ADC3_WLOW1		(1 << 10)
++#define MC13783_ADC3_WLOW2		(1 << 11)
++#define MC13783_ADC3_WLOW3		(1 << 12)
++#define MC13783_ADC3_WLOW4		(1 << 13)
++#define MC13783_ADC3_WLOW5		(1 << 14)
++#define MC13783_ADC3_ADCBIS2		(1 << 23)
++
++#define MC13783_ADC4_ADDBIS10		(1 << 2)
++#define MC13783_ADC4_ADDBIS11		(1 << 3)
++#define MC13783_ADC4_ADDBIS12		(1 << 4)
++#define MC13783_ADC4_ADDBIS13		(1 << 5)
++#define MC13783_ADC4_ADDBIS14		(1 << 6)
++#define MC13783_ADC4_ADDBIS15		(1 << 7)
++#define MC13783_ADC4_ADDBIS16		(1 << 8)
++#define MC13783_ADC4_ADDBIS17		(1 << 9)
++#define MC13783_ADC4_ADDBIS18		(1 << 10)
++#define MC13783_ADC4_ADDBIS19		(1 << 11)
++#define MC13783_ADC4_ADDBIS20		(1 << 14)
++#define MC13783_ADC4_ADDBIS21		(1 << 15)
++#define MC13783_ADC4_ADDBIS22		(1 << 16)
++#define MC13783_ADC4_ADDBIS23		(1 << 17)
++#define MC13783_ADC4_ADDBIS24		(1 << 18)
++#define MC13783_ADC4_ADDBIS25		(1 << 19)
++#define MC13783_ADC4_ADDBIS26		(1 << 20)
++#define MC13783_ADC4_ADDBIS27		(1 << 21)
++#define MC13783_ADC4_ADDBIS28		(1 << 22)
++#define MC13783_ADC4_ADDBIS29		(1 << 23)
++
++#endif /* __LINUX_MFD_MC13783_PRIV_H */
++
+diff --git a/include/linux/mfd/mc13783.h b/include/linux/mfd/mc13783.h
+new file mode 100644
+index 0000000..b3a2a72
+--- /dev/null
++++ b/include/linux/mfd/mc13783.h
+@@ -0,0 +1,84 @@
++/*
++ * Copyright 2009 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * Initial development of this code was funded by
++ * Phytec Messtechnik GmbH, http://www.phytec.de
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __INCLUDE_LINUX_MFD_MC13783_H
++#define __INCLUDE_LINUX_MFD_MC13783_H
++
++struct mc13783;
++struct regulator_init_data;
++
++struct mc13783_regulator_init_data {
++	int id;
++	struct regulator_init_data *init_data;
++};
++
++struct mc13783_platform_data {
++	struct mc13783_regulator_init_data *regulators;
++	int num_regulators;
++	unsigned int flags;
++};
++
++/* mc13783_platform_data flags */
++#define MC13783_USE_TOUCHSCREEN (1 << 0)
++#define MC13783_USE_CODEC	(1 << 1)
++#define MC13783_USE_ADC		(1 << 2)
++#define MC13783_USE_RTC		(1 << 3)
++#define MC13783_USE_REGULATOR	(1 << 4)
++
++int mc13783_adc_do_conversion(struct mc13783 *mc13783, unsigned int mode,
++		unsigned int channel, unsigned int *sample);
++
++void mc13783_adc_set_ts_status(struct mc13783 *mc13783, unsigned int status);
++
++#define	MC13783_SW_SW1A		0
++#define	MC13783_SW_SW1B		1
++#define	MC13783_SW_SW2A		2
++#define	MC13783_SW_SW2B		3
++#define	MC13783_SW_SW3		4
++#define	MC13783_SW_PLL		5
++#define	MC13783_REGU_VAUDIO	6
++#define	MC13783_REGU_VIOHI	7
++#define	MC13783_REGU_VIOLO	8
++#define	MC13783_REGU_VDIG	9
++#define	MC13783_REGU_VGEN	10
++#define	MC13783_REGU_VRFDIG	11
++#define	MC13783_REGU_VRFREF	12
++#define	MC13783_REGU_VRFCP	13
++#define	MC13783_REGU_VSIM	14
++#define	MC13783_REGU_VESIM	15
++#define	MC13783_REGU_VCAM	16
++#define	MC13783_REGU_VRFBG	17
++#define	MC13783_REGU_VVIB	18
++#define	MC13783_REGU_VRF1	19
++#define	MC13783_REGU_VRF2	20
++#define	MC13783_REGU_VMMC1	21
++#define	MC13783_REGU_VMMC2	22
++#define	MC13783_REGU_GPO1	23
++#define	MC13783_REGU_GPO2	24
++#define	MC13783_REGU_GPO3	25
++#define	MC13783_REGU_GPO4	26
++#define	MC13783_REGU_V1		27
++#define	MC13783_REGU_V2		28
++#define	MC13783_REGU_V3		29
++#define	MC13783_REGU_V4		30
++
++#endif /* __INCLUDE_LINUX_MFD_MC13783_H */
++
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0002-mxc_nand-cleanup-eccoob-descriptions.patch b/recipes/linux/linux-2.6.31/pcm043/0002-mxc_nand-cleanup-eccoob-descriptions.patch
new file mode 100644
index 0000000..f8258ac
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0002-mxc_nand-cleanup-eccoob-descriptions.patch
@@ -0,0 +1,111 @@
+From 6092478fe41d7b58212bc20808dd94ce6170f35b Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 21 Oct 2009 10:22:01 +0200
+Subject: [PATCH] mxc_nand: cleanup eccoob descriptions
+
+The original Freescale driver used to have eccoob descriptions like
+this:
+
+static struct nand_ecclayout nand_hw_eccoob_8 = {
+	.eccbytes = 5,
+	.eccpos = {6, 7, 8, 9, 10},
+	.oobfree = {{0, 5}, {11, 5}}
+};
+
+static struct nand_ecclayout nand_hw_eccoob_16 = {
+	.eccbytes = 5,
+	.eccpos = {6, 7, 8, 9, 10},
+	.oobfree = {{0, 6}, {12, 4}}
+};
+
+The former was used for 8bit flashes and the latter for 16bit flashes.
+They honored the fact that the bad block marker on 8bit flashes is on byte 5
+while on 16bit flashes it is on byte 11.
+In the Kernel driver this was copied wrong and we ended up with two identical
+descriptions.
+
+Change it so that we have only one description which leaves byte 5 and byte
+11 unspecified so that it won't be used by others.
+
+Also, rename the descriptions to nand_hw_eccoob_smallpage and
+nand_hw_eccoob_largepage so that it can't be confused with Nand chip bus
+widths (what actually happened in this driver)
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   24 +++++++++---------------
+ 1 files changed, 9 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 76beea4..7a34679 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -129,19 +129,13 @@ struct mxc_nand_host {
+ #define SPARE_SINGLEBIT_ERROR 0x1
+ 
+ /* OOB placement block for use with hardware ecc generation */
+-static struct nand_ecclayout nand_hw_eccoob_8 = {
++static struct nand_ecclayout nand_hw_eccoob_smallpage = {
+ 	.eccbytes = 5,
+ 	.eccpos = {6, 7, 8, 9, 10},
+-	.oobfree = {{0, 5}, {11, 5}, }
++	.oobfree = {{0, 5}, {12, 4}, }
+ };
+ 
+-static struct nand_ecclayout nand_hw_eccoob_16 = {
+-	.eccbytes = 5,
+-	.eccpos = {6, 7, 8, 9, 10},
+-	.oobfree = {{0, 5}, {11, 5}, }
+-};
+-
+-static struct nand_ecclayout nand_hw_eccoob_64 = {
++static struct nand_ecclayout nand_hw_eccoob_largepage = {
+ 	.eccbytes = 20,
+ 	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
+ 		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
+@@ -940,7 +934,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	} else {
+ 		this->ecc.size = 512;
+ 		this->ecc.bytes = 3;
+-		this->ecc.layout = &nand_hw_eccoob_8;
++		this->ecc.layout = &nand_hw_eccoob_smallpage;
+ 		this->ecc.mode = NAND_ECC_SOFT;
+ 		tmp = readw(host->regs + NFC_CONFIG1);
+ 		tmp &= ~NFC_ECC_EN;
+@@ -964,7 +958,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	/* NAND bus width determines access funtions used by upper layer */
+ 	if (pdata->width == 2) {
+ 		this->options |= NAND_BUSWIDTH_16;
+-		this->ecc.layout = &nand_hw_eccoob_16;
++		this->ecc.layout = &nand_hw_eccoob_smallpage;
+ 	}
+ 
+ 	/* first scan to find the device and get the page size */
+@@ -978,20 +972,20 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	if (this->ecc.mode == NAND_ECC_HW) {
+ 		switch (mtd->oobsize) {
+ 		case 8:
+-			this->ecc.layout = &nand_hw_eccoob_8;
++			this->ecc.layout = &nand_hw_eccoob_smallpage;
+ 			break;
+ 		case 16:
+-			this->ecc.layout = &nand_hw_eccoob_16;
++			this->ecc.layout = &nand_hw_eccoob_smallpage;
+ 			break;
+ 		case 64:
+-			this->ecc.layout = &nand_hw_eccoob_64;
++			this->ecc.layout = &nand_hw_eccoob_largepage;
+ 			break;
+ 		default:
+ 			/* page size not handled by HW ECC */
+ 			/* switching back to soft ECC */
+ 			this->ecc.size = 512;
+ 			this->ecc.bytes = 3;
+-			this->ecc.layout = &nand_hw_eccoob_8;
++			this->ecc.layout = &nand_hw_eccoob_smallpage;
+ 			this->ecc.mode = NAND_ECC_SOFT;
+ 			this->ecc.calculate = NULL;
+ 			this->ecc.correct = NULL;
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0003-MXC-NFC-Add-a-real-NAND-flash-data-width-setup-func.patch b/recipes/linux/linux-2.6.31/pcm043/0003-MXC-NFC-Add-a-real-NAND-flash-data-width-setup-func.patch
new file mode 100644
index 0000000..5a526fa
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0003-MXC-NFC-Add-a-real-NAND-flash-data-width-setup-func.patch
@@ -0,0 +1,51 @@
+From e31e8120d5552c200785a6e2f1958d7f7643a675 Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 14:55:47 +0200
+Subject: [PATCH 03/15] MXC NFC: Add a real NAND flash data width setup function
+
+Provide a real subfunction to setup the NAND flash data width.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |   15 ++++++++++++---
+ 1 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index 3483e7d..03d1ba4 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -830,6 +830,14 @@ static void unlock_addr(struct mxc_nand_host *host, unsigned int start_addr, uns
+ 		BUG();
+ }
+ 
++static void __init mxc_data_width(struct mxc_nand_host *host, unsigned width)
++{
++	if ((width != 8) && (width != 16)) {
++		BUG();
++	}
++	/* TODO */
++}
++
+ static int __init mxcnd_probe(struct platform_device *pdev)
+ {
+ 	struct nand_chip *this;
+@@ -898,12 +906,13 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	} else
+ 		BUG();
+ 
+-	/* NAND bus width determines access funtions used by upper layer */
++	/* NAND bus width determines access functions used by upper layer */
+ 	if (pdata->width == 2) {
+ 		this->read_byte = mxc_nand_read_byte16;
+ 		this->options |= NAND_BUSWIDTH_16;
+-		mxc_set_nfms(mtd, 1 << NFMS_NF_DWIDTH);
+-	}
++		mxc_data_width(host, 16);
++	} else
++		mxc_data_width(host, 8);
+ 
+ 	init_waitqueue_head(&host->irq_waitq);
+ 
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0003-mx3-Add-SSI-pins-to-iomux-table.patch b/recipes/linux/linux-2.6.31/pcm043/0003-mx3-Add-SSI-pins-to-iomux-table.patch
new file mode 100644
index 0000000..c1e9ab0
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0003-mx3-Add-SSI-pins-to-iomux-table.patch
@@ -0,0 +1,48 @@
+From f1f19d863e177c09ca93ee960aa615701649dc9b Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 12 Nov 2009 14:02:22 +0100
+Subject: [PATCH 03/28] mx3: Add SSI pins to iomux table
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/plat-mxc/include/mach/iomux-mx3.h |   24 ++++++++++++++++++++++++
+ 1 files changed, 24 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/plat-mxc/include/mach/iomux-mx3.h b/arch/arm/plat-mxc/include/mach/iomux-mx3.h
+index 2eb182f..0fb1ad5 100644
+--- a/arch/arm/plat-mxc/include/mach/iomux-mx3.h
++++ b/arch/arm/plat-mxc/include/mach/iomux-mx3.h
+@@ -669,6 +669,30 @@ enum iomux_pins {
+ #define MX31_PIN_GPIO3_0__GPIO3_0	IOMUX_MODE(MX31_PIN_GPIO3_0, IOMUX_CONFIG_GPIO)
+ #define MX31_PIN_GPIO3_1__GPIO3_1	IOMUX_MODE(MX31_PIN_GPIO3_1, IOMUX_CONFIG_GPIO)
+ #define MX31_PIN_TXD2__GPIO1_28		IOMUX_MODE(MX31_PIN_TXD2, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_GPIO1_0__GPIO1_0	IOMUX_MODE(MX31_PIN_GPIO1_0, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_SVEN0__GPIO2_0		IOMUX_MODE(MX31_PIN_SVEN0, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_STX0__GPIO2_1		IOMUX_MODE(MX31_PIN_STX0, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_SRX0__GPIO2_2		IOMUX_MODE(MX31_PIN_SRX0, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_SIMPD0__GPIO2_3	IOMUX_MODE(MX31_PIN_SIMPD0, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_DTR_DCE1__GPIO2_8	IOMUX_MODE(MX31_PIN_DTR_DCE1, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_DSR_DCE1__GPIO2_9	IOMUX_MODE(MX31_PIN_DSR_DCE1, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_RI_DCE1__GPIO2_10	IOMUX_MODE(MX31_PIN_RI_DCE1, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_DCD_DCE1__GPIO2_11	IOMUX_MODE(MX31_PIN_DCD_DCE1, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_STXD5__GPIO1_21       IOMUX_MODE(MX31_PIN_STXD5, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_SRXD5__GPIO1_22       IOMUX_MODE(MX31_PIN_SRXD5, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_GPIO1_3__GPIO1_3	IOMUX_MODE(MX31_PIN_GPIO1_3, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_CSPI2_SS1__CSPI3_SS1	IOMUX_MODE(MX31_PIN_CSPI2_SS1, IOMUX_CONFIG_ALT1)
++#define MX31_PIN_RTS1__GPIO2_6		IOMUX_MODE(MX31_PIN_RTS1, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_CTS1__GPIO2_7		IOMUX_MODE(MX31_PIN_CTS1, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_LCS0__GPIO3_23		IOMUX_MODE(MX31_PIN_LCS0, IOMUX_CONFIG_GPIO)
++#define MX31_PIN_STXD4__STXD4		IOMUX_MODE(MX31_PIN_STXD4, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_SRXD4__SRXD4		IOMUX_MODE(MX31_PIN_SRXD4, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_SCK4__SCK4		IOMUX_MODE(MX31_PIN_SCK4, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_SFS4__SFS4		IOMUX_MODE(MX31_PIN_SFS4, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_STXD5__STXD5		IOMUX_MODE(MX31_PIN_STXD5, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_SRXD5__SRXD5		IOMUX_MODE(MX31_PIN_SRXD5, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_SCK5__SCK5		IOMUX_MODE(MX31_PIN_SCK5, IOMUX_CONFIG_FUNC)
++#define MX31_PIN_SFS5__SFS5		IOMUX_MODE(MX31_PIN_SFS5, IOMUX_CONFIG_FUNC)
+ 
+ /*XXX: The SS0, SS1, SS2, SS3 lines of spi3 are multiplexed by cspi2_ss0, cspi2_ss1, cspi1_ss0
+  * cspi1_ss1*/
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0003-mxc_nand-cleanup-initialization.patch b/recipes/linux/linux-2.6.31/pcm043/0003-mxc_nand-cleanup-initialization.patch
new file mode 100644
index 0000000..f437724
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0003-mxc_nand-cleanup-initialization.patch
@@ -0,0 +1,124 @@
+From 4521787dcf7e16910e5a0e0ac817283b14e5f11b Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 21 Oct 2009 10:39:05 +0200
+Subject: [PATCH] mxc_nand: cleanup initialization
+
+The oob layout was initialized several times. Instead, use
+a smallpage layout by default and switch to a largepage
+afterwards if necessary.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   72 +++++++++++++-----------------------------
+ 1 files changed, 22 insertions(+), 50 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 7a34679..b28e5f9 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -921,45 +921,42 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	if (err)
+ 		goto eirq;
+ 
++	/* Reset NAND */
++	this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
++
++	/* preset operation */
++	/* Unlock the internal RAM Buffer */
++	writew(0x2, host->regs + NFC_CONFIG);
++
++	/* Blocks to be unlocked */
++	writew(0x0, host->regs + NFC_UNLOCKSTART_BLKADDR);
++	writew(0x4000, host->regs + NFC_UNLOCKEND_BLKADDR);
++
++	/* Unlock Block Command for given address range */
++	writew(0x4, host->regs + NFC_WRPROT);
++
++	this->ecc.size = 512;
++	this->ecc.bytes = 3;
++	this->ecc.layout = &nand_hw_eccoob_smallpage;
++
+ 	if (pdata->hw_ecc) {
+ 		this->ecc.calculate = mxc_nand_calculate_ecc;
+ 		this->ecc.hwctl = mxc_nand_enable_hwecc;
+ 		this->ecc.correct = mxc_nand_correct_data;
+ 		this->ecc.mode = NAND_ECC_HW;
+-		this->ecc.size = 512;
+-		this->ecc.bytes = 3;
+ 		tmp = readw(host->regs + NFC_CONFIG1);
+ 		tmp |= NFC_ECC_EN;
+ 		writew(tmp, host->regs + NFC_CONFIG1);
+ 	} else {
+-		this->ecc.size = 512;
+-		this->ecc.bytes = 3;
+-		this->ecc.layout = &nand_hw_eccoob_smallpage;
+ 		this->ecc.mode = NAND_ECC_SOFT;
+ 		tmp = readw(host->regs + NFC_CONFIG1);
+ 		tmp &= ~NFC_ECC_EN;
+ 		writew(tmp, host->regs + NFC_CONFIG1);
+ 	}
+ 
+-	/* Reset NAND */
+-	this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+-
+-	/* preset operation */
+-	/* Unlock the internal RAM Buffer */
+-	writew(0x2, host->regs + NFC_CONFIG);
+-
+-	/* Blocks to be unlocked */
+-	writew(0x0, host->regs + NFC_UNLOCKSTART_BLKADDR);
+-	writew(0x4000, host->regs + NFC_UNLOCKEND_BLKADDR);
+-
+-	/* Unlock Block Command for given address range */
+-	writew(0x4, host->regs + NFC_WRPROT);
+-
+ 	/* NAND bus width determines access funtions used by upper layer */
+-	if (pdata->width == 2) {
++	if (pdata->width == 2)
+ 		this->options |= NAND_BUSWIDTH_16;
+-		this->ecc.layout = &nand_hw_eccoob_smallpage;
+-	}
+ 
+ 	/* first scan to find the device and get the page size */
+ 	if (nand_scan_ident(mtd, 1)) {
+@@ -967,34 +964,9 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 		goto escan;
+ 	}
+ 
+-	host->pagesize_2k = (mtd->writesize == 2048) ? 1 : 0;
+-
+-	if (this->ecc.mode == NAND_ECC_HW) {
+-		switch (mtd->oobsize) {
+-		case 8:
+-			this->ecc.layout = &nand_hw_eccoob_smallpage;
+-			break;
+-		case 16:
+-			this->ecc.layout = &nand_hw_eccoob_smallpage;
+-			break;
+-		case 64:
+-			this->ecc.layout = &nand_hw_eccoob_largepage;
+-			break;
+-		default:
+-			/* page size not handled by HW ECC */
+-			/* switching back to soft ECC */
+-			this->ecc.size = 512;
+-			this->ecc.bytes = 3;
+-			this->ecc.layout = &nand_hw_eccoob_smallpage;
+-			this->ecc.mode = NAND_ECC_SOFT;
+-			this->ecc.calculate = NULL;
+-			this->ecc.correct = NULL;
+-			this->ecc.hwctl = NULL;
+-			tmp = readw(host->regs + NFC_CONFIG1);
+-			tmp &= ~NFC_ECC_EN;
+-			writew(tmp, host->regs + NFC_CONFIG1);
+-			break;
+-		}
++	if (mtd->writesize == 2048) {
++		host->pagesize_2k = 1;
++		this->ecc.layout = &nand_hw_eccoob_largepage;
+ 	}
+ 
+ 	/* second phase scan */
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0004-MXC-NFC-Use-generic-bad-block-detection.patch b/recipes/linux/linux-2.6.31/pcm043/0004-MXC-NFC-Use-generic-bad-block-detection.patch
new file mode 100644
index 0000000..2c5c37f
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0004-MXC-NFC-Use-generic-bad-block-detection.patch
@@ -0,0 +1,148 @@
+From 344bc7de5f142e95a524fe2019b51344d9aa3ea7 Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:04:11 +0200
+Subject: [PATCH 04/15] MXC NFC: Use generic bad block detection
+
+There is no need to provide a local bad block detection. The generic
+one does a correct job. Due to hardware based ECC we must provide
+a local nand_bbt_descr structure, because the generic one conflicts
+with our ECC sum byte locations.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |   98 ++++-----------------------------------
+ 1 files changed, 10 insertions(+), 88 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index 03d1ba4..6b1eeb9 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -708,26 +708,10 @@ static void mxc_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+ 	memcpy(host->data_buf + mtd->writesize, chip->oob_poi, mtd->oobsize);
+ }
+ 
+-/* Define some generic bad / good block scan pattern which are used
+- * while scanning a device for factory marked good / bad blocks. */
+-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+-
+-static struct nand_bbt_descr smallpage_memorybased = {
+-	.options = NAND_BBT_SCAN2NDPAGE,
+-	.offs = 5,
+-	.len = 1,
+-	.pattern = scan_ff_pattern
+-};
+-
+-static struct nand_bbt_descr largepage_memorybased = {
+-	.options = 0,
+-	.offs = 0,
+-	.len = 2,
+-	.pattern = scan_ff_pattern
+-};
+-
+-/* Generic flash bbt decriptors
+-*/
++/*
++ * We must provide a private bbt decriptor, because the settings from
++ * the generic one collide with our ECC hardware.
++ */
+ static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
+ static uint8_t mirror_pattern[] = { '1', 't', 'b', 'B' };
+ 
+@@ -751,73 +735,6 @@ static struct nand_bbt_descr bbt_mirror_descr = {
+ 	.pattern = mirror_pattern
+ };
+ 
+-static void mxc_set_nfms_v21(struct mtd_info *mtd, unsigned int val)
+-{
+-	struct nand_chip *this = mtd->priv;
+-	struct mxc_nand_host *host = this->priv;
+-	unsigned int spas, tmp;
+-
+-//	NFMS |= val; /* FIXME */
+-
+-	if (val & (1 << NFMS_NF_PG_SZ)) {
+-		if (mtd->writesize == 2048)
+-			spas = NFC_SPAS_64;
+-		else if (mtd->writesize == 4096)
+-			spas = NFC_SPAS_128;
+-		else
+-			spas = NFC_SPAS_16;
+-
+-		tmp = readw(host->regs + NFC_CONFIG1);
+-		tmp |= NFC_V2_ECC_MODE_4;
+-		writew(tmp, host->regs + NFC_CONFIG1);
+-
+-		tmp = readw(host->regs + NFC_V21_SPAS);
+-		tmp &= NFC_V21_SPAS_MASK;
+-		tmp |= spas << NFC_V21_SPAS_SHIFT;
+-		writew(tmp, host->regs + NFC_V21_SPAS);
+-	}
+-}
+-
+-static void mxc_set_nfms(struct mtd_info *mtd, unsigned int val)
+-{
+-	if (nfc_is_v21())
+-		mxc_set_nfms_v21(mtd, val);
+-}
+-
+-static int mxc_nand_scan_bbt(struct mtd_info *mtd)
+-{
+-	struct nand_chip *this = mtd->priv;
+-	struct mxc_nand_host *host = this->priv;
+-
+-	if (mtd->writesize == 2048) {
+-		mxc_set_nfms(mtd, 1 << NFMS_NF_PG_SZ);
+-		this->ecc.layout = &nand_hw_eccoob_2k;
+-	} else if (mtd->writesize == 4096) {
+-		mxc_set_nfms(mtd, 1 << NFMS_NF_PG_SZ);
+-		this->ecc.layout = &nand_hw_eccoob_4k;
+-	} else {
+-		this->ecc.layout = &nand_hw_eccoob_512;
+-	}
+-
+-	/* propagate ecc.layout to mtd_info */
+-	mtd->ecclayout = this->ecc.layout;
+-
+-	/* use flash based bbt */
+-	this->bbt_td = &bbt_main_descr;
+-	this->bbt_md = &bbt_mirror_descr;
+-
+-	/* update flash based bbt */
+-	this->options |= NAND_USE_FLASH_BBT;
+-
+-	if (!this->badblock_pattern) {
+-		this->badblock_pattern = (mtd->writesize > 512) ?
+-		    &largepage_memorybased : &smallpage_memorybased;
+-	}
+-
+-	/* Build bad block table */
+-	return nand_scan_bbt(mtd, this->badblock_pattern);
+-}
+-
+ static void unlock_addr(struct mxc_nand_host *host, unsigned int start_addr, unsigned int end_addr)
+ {
+ 	if (nfc_is_v21()) {
+@@ -870,7 +787,6 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	this->write_buf = mxc_nand_write_buf;
+ 	this->read_buf = mxc_nand_read_buf;
+ 	this->verify_buf = mxc_nand_verify_buf;
+-	this->scan_bbt = mxc_nand_scan_bbt;
+ 
+ 	host->clk = clk_get(&pdev->dev, "nfc_clk");
+ 	if (IS_ERR(host->clk)) {
+@@ -958,6 +874,12 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 
+ 	clk_disable(host->clk);
+ 
++	/* use flash based bbt */
++	this->bbt_td = &bbt_main_descr;
++	this->bbt_md = &bbt_mirror_descr;
++	/* update flash based bbt */
++	this->options |= NAND_USE_FLASH_BBT;
++
+ 	/* Scan to find existence of the device */
+ 	if (nand_scan(mtd, 1)) {
+ 		DEBUG(MTD_DEBUG_LEVEL0,
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0004-mxc-iomux-v3-remove-resource-handling.patch b/recipes/linux/linux-2.6.31/pcm043/0004-mxc-iomux-v3-remove-resource-handling.patch
new file mode 100644
index 0000000..5f04c34
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0004-mxc-iomux-v3-remove-resource-handling.patch
@@ -0,0 +1,111 @@
+From 88a85f7b168d6ee042ea2634414f2ffd43a99cff Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 29 Oct 2009 17:18:02 +0100
+Subject: [PATCH 04/28] mxc: iomux v3: remove resource handling
+
+The current model does not allow to put a pad into different modes
+once a pins is allocated. Remove the resource handling.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/plat-mxc/include/mach/iomux-v3.h |   17 +-------------
+ arch/arm/plat-mxc/iomux-v3.c              |   35 +---------------------------
+ 2 files changed, 3 insertions(+), 49 deletions(-)
+
+diff --git a/arch/arm/plat-mxc/include/mach/iomux-v3.h b/arch/arm/plat-mxc/include/mach/iomux-v3.h
+index 7cd8454..f23e579 100644
+--- a/arch/arm/plat-mxc/include/mach/iomux-v3.h
++++ b/arch/arm/plat-mxc/include/mach/iomux-v3.h
+@@ -92,9 +92,7 @@ struct pad_desc {
+ #define PAD_CTL_SLEW_RATE_FAST		1
+ 
+ /*
+- * setups a single pad:
+- * 	- reserves the pad so that it is not claimed by another driver
+- * 	- setups the iomux according to the configuration
++ * setups a single pad in the iomuxer
+  */
+ int mxc_iomux_v3_setup_pad(struct pad_desc *pad);
+ 
+@@ -104,18 +102,5 @@ int mxc_iomux_v3_setup_pad(struct pad_desc *pad);
+  */
+ int mxc_iomux_v3_setup_multiple_pads(struct pad_desc *pad_list, unsigned count);
+ 
+-/*
+- * releases a single pad:
+- * 	- make it available for a future use by another driver
+- * 	- DOES NOT reconfigure the IOMUX in its reset state
+- */
+-void mxc_iomux_v3_release_pad(struct pad_desc *pad);
+-
+-/*
+- * releases multiple pads
+- * convenvient way to call the above function with tables
+- */
+-void mxc_iomux_v3_release_multiple_pads(struct pad_desc *pad_list, int count);
+-
+ #endif /* __MACH_IOMUX_V3_H__*/
+ 
+diff --git a/arch/arm/plat-mxc/iomux-v3.c b/arch/arm/plat-mxc/iomux-v3.c
+index 77a078f..4f0e7fc 100644
+--- a/arch/arm/plat-mxc/iomux-v3.c
++++ b/arch/arm/plat-mxc/iomux-v3.c
+@@ -31,19 +31,11 @@
+ 
+ #define IOMUX_BASE	IO_ADDRESS(IOMUXC_BASE_ADDR)
+ 
+-static unsigned long iomux_v3_pad_alloc_map[0x200 / BITS_PER_LONG];
+-
+ /*
+- * setups a single pin:
+- * 	- reserves the pin so that it is not claimed by another driver
+- * 	- setups the iomux according to the configuration
++ * setups a single pad in the iomuxer
+  */
+ int mxc_iomux_v3_setup_pad(struct pad_desc *pad)
+ {
+-	unsigned int pad_ofs = pad->pad_ctrl_ofs;
+-
+-	if (test_and_set_bit(pad_ofs >> 2, iomux_v3_pad_alloc_map))
+-		return -EBUSY;
+ 	if (pad->mux_ctrl_ofs)
+ 		__raw_writel(pad->mux_mode, IOMUX_BASE + pad->mux_ctrl_ofs);
+ 
+@@ -66,33 +58,10 @@ int mxc_iomux_v3_setup_multiple_pads(struct pad_desc *pad_list, unsigned count)
+ 	for (i = 0; i < count; i++) {
+ 		ret = mxc_iomux_v3_setup_pad(p);
+ 		if (ret)
+-			goto setup_error;
++			return ret;
+ 		p++;
+ 	}
+ 	return 0;
+-
+-setup_error:
+-	mxc_iomux_v3_release_multiple_pads(pad_list, i);
+-	return ret;
+ }
+ EXPORT_SYMBOL(mxc_iomux_v3_setup_multiple_pads);
+ 
+-void mxc_iomux_v3_release_pad(struct pad_desc *pad)
+-{
+-	unsigned int pad_ofs = pad->pad_ctrl_ofs;
+-
+-	clear_bit(pad_ofs >> 2, iomux_v3_pad_alloc_map);
+-}
+-EXPORT_SYMBOL(mxc_iomux_v3_release_pad);
+-
+-void mxc_iomux_v3_release_multiple_pads(struct pad_desc *pad_list, int count)
+-{
+-	struct pad_desc *p = pad_list;
+-	int i;
+-
+-	for (i = 0; i < count; i++) {
+-		mxc_iomux_v3_release_pad(p);
+-		p++;
+-	}
+-}
+-EXPORT_SYMBOL(mxc_iomux_v3_release_multiple_pads);
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0004-mxc_nand-merge-send_read_page-and-send_prog_page.patch b/recipes/linux/linux-2.6.31/pcm043/0004-mxc_nand-merge-send_read_page-and-send_prog_page.patch
new file mode 100644
index 0000000..656e680
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0004-mxc_nand-merge-send_read_page-and-send_prog_page.patch
@@ -0,0 +1,104 @@
+From 9d8a47b34ec9f2a75aefa3ea6e6bc3fa70888cda Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Tue, 2 Jun 2009 11:37:53 +0200
+Subject: [PATCH] mxc_nand: merge send_read_page and send_prog_page
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   54 ++++++++++--------------------------------
+ 1 files changed, 13 insertions(+), 41 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index b28e5f9..56db5ac 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -226,12 +226,10 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
+ 	wait_op_done(host, TROP_US_DELAY, addr, islast);
+ }
+ 
+-/* This function requests the NANDFC to initate the transfer
+- * of data currently in the NANDFC RAM buffer to the NAND device. */
+-static void send_prog_page(struct mxc_nand_host *host, uint8_t buf_id,
+-			int spare_only)
++static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
++			int spare_only, unsigned int ops)
+ {
+-	DEBUG(MTD_DEBUG_LEVEL3, "send_prog_page (%d)\n", spare_only);
++	DEBUG(MTD_DEBUG_LEVEL3, "send_page (%d)\n", spare_only);
+ 
+ 	/* NANDFC buffer 0 is used for page read/write */
+ 	writew(buf_id, host->regs + NFC_BUF_ADDR);
+@@ -246,33 +244,7 @@ static void send_prog_page(struct mxc_nand_host *host, uint8_t buf_id,
+ 		writew(config1, host->regs + NFC_CONFIG1);
+ 	}
+ 
+-	writew(NFC_INPUT, host->regs + NFC_CONFIG2);
+-
+-	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, spare_only, true);
+-}
+-
+-/* Requests NANDFC to initated the transfer of data from the
+- * NAND device into in the NANDFC ram buffer. */
+-static void send_read_page(struct mxc_nand_host *host, uint8_t buf_id,
+-		int spare_only)
+-{
+-	DEBUG(MTD_DEBUG_LEVEL3, "send_read_page (%d)\n", spare_only);
+-
+-	/* NANDFC buffer 0 is used for page read/write */
+-	writew(buf_id, host->regs + NFC_BUF_ADDR);
+-
+-	/* Configure spare or page+spare access */
+-	if (!host->pagesize_2k) {
+-		uint32_t config1 = readw(host->regs + NFC_CONFIG1);
+-		if (spare_only)
+-			config1 |= NFC_SP_EN;
+-		else
+-			config1 &= ~NFC_SP_EN;
+-		writew(config1, host->regs + NFC_CONFIG1);
+-	}
+-
+-	writew(NFC_OUTPUT, host->regs + NFC_CONFIG2);
++	writew(ops, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+ 	wait_op_done(host, TROP_US_DELAY, spare_only, true);
+@@ -756,13 +728,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 		break;
+ 
+ 	case NAND_CMD_PAGEPROG:
+-		send_prog_page(host, 0, host->spare_only);
++		send_page(host, 0, host->spare_only, NFC_INPUT);
+ 
+ 		if (host->pagesize_2k) {
+ 			/* data in 4 areas datas */
+-			send_prog_page(host, 1, host->spare_only);
+-			send_prog_page(host, 2, host->spare_only);
+-			send_prog_page(host, 3, host->spare_only);
++			send_page(host, 1, host->spare_only, NFC_INPUT);
++			send_page(host, 2, host->spare_only, NFC_INPUT);
++			send_page(host, 3, host->spare_only, NFC_INPUT);
+ 		}
+ 
+ 		break;
+@@ -827,12 +799,12 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 			/* send read confirm command */
+ 			send_cmd(host, NAND_CMD_READSTART, true);
+ 			/* read for each AREA */
+-			send_read_page(host, 0, host->spare_only);
+-			send_read_page(host, 1, host->spare_only);
+-			send_read_page(host, 2, host->spare_only);
+-			send_read_page(host, 3, host->spare_only);
++			send_page(host, 0, host->spare_only, NFC_OUTPUT);
++			send_page(host, 1, host->spare_only, NFC_OUTPUT);
++			send_page(host, 2, host->spare_only, NFC_OUTPUT);
++			send_page(host, 3, host->spare_only, NFC_OUTPUT);
+ 		} else
+-			send_read_page(host, 0, host->spare_only);
++			send_page(host, 0, host->spare_only, NFC_OUTPUT);
+ 		break;
+ 
+ 	case NAND_CMD_READID:
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0005-MXC-NFC-Divide-flash-device-detection-into-two-step.patch b/recipes/linux/linux-2.6.31/pcm043/0005-MXC-NFC-Divide-flash-device-detection-into-two-step.patch
new file mode 100644
index 0000000..2a6d110
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0005-MXC-NFC-Divide-flash-device-detection-into-two-step.patch
@@ -0,0 +1,48 @@
+From a3906c7f2019dbcb2aa6b9a356947ea91ade60b8 Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:10:03 +0200
+Subject: [PATCH 05/15] MXC NFC: Divide flash device detection into two steps
+
+To be able to setup the NFC hardware in accordance to the connected
+NAND device, we must detect some information about the NAND first.
+After that we are able to setup the NFC in a correct manner. The last
+step is to continue NAND device handling by the framework.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |   13 +++++++++----
+ 1 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index 6b1eeb9..2ddd6f5 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -874,16 +874,21 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 
+ 	clk_disable(host->clk);
+ 
++	/* detect the device data prio setting up the ECC hardware */
++	if (nand_scan_ident(mtd, 1)) {
++		err = -ENXIO;
++		pr_err("Unable to find any NAND device\n");
++		goto escan;
++	}
++
+ 	/* use flash based bbt */
+ 	this->bbt_td = &bbt_main_descr;
+ 	this->bbt_md = &bbt_mirror_descr;
+ 	/* update flash based bbt */
+ 	this->options |= NAND_USE_FLASH_BBT;
+ 
+-	/* Scan to find existence of the device */
+-	if (nand_scan(mtd, 1)) {
+-		DEBUG(MTD_DEBUG_LEVEL0,
+-		      "MXC_ND2: Unable to find any NAND device.\n");
++	/* second phase scan */
++	if (nand_scan_tail(mtd)) {
+ 		err = -ENXIO;
+ 		goto escan;
+ 	}
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0005-i.MX31-clock-rename-SSI-clocks-to-driver-name.patch b/recipes/linux/linux-2.6.31/pcm043/0005-i.MX31-clock-rename-SSI-clocks-to-driver-name.patch
new file mode 100644
index 0000000..dce0282
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0005-i.MX31-clock-rename-SSI-clocks-to-driver-name.patch
@@ -0,0 +1,28 @@
+From 04683e53f18930db4f5a9e40a65fea91b949ce21 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 12 Nov 2009 14:09:39 +0100
+Subject: [PATCH 05/28] i.MX31 clock: rename SSI clocks to driver name
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/clock.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/clock.c b/arch/arm/mach-mx3/clock.c
+index 8b14239..f25e8be 100644
+--- a/arch/arm/mach-mx3/clock.c
++++ b/arch/arm/mach-mx3/clock.c
+@@ -545,8 +545,8 @@ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK("mxc_w1.0", NULL, owire_clk)
+ 	_REGISTER_CLOCK("mxc-mmc.0", NULL, sdhc1_clk)
+ 	_REGISTER_CLOCK("mxc-mmc.1", NULL, sdhc2_clk)
+-	_REGISTER_CLOCK(NULL, "ssi", ssi1_clk)
+-	_REGISTER_CLOCK(NULL, "ssi", ssi2_clk)
++	_REGISTER_CLOCK("imx-ssi.0", NULL, ssi1_clk)
++	_REGISTER_CLOCK("imx-ssi.1", NULL, ssi2_clk)
+ 	_REGISTER_CLOCK(NULL, "firi", firi_clk)
+ 	_REGISTER_CLOCK(NULL, "ata", ata_clk)
+ 	_REGISTER_CLOCK(NULL, "rtic", rtic_clk)
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0005-mxc_nand-introduce-mxc_do_addr_cycle.patch b/recipes/linux/linux-2.6.31/pcm043/0005-mxc_nand-introduce-mxc_do_addr_cycle.patch
new file mode 100644
index 0000000..539408e
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0005-mxc_nand-introduce-mxc_do_addr_cycle.patch
@@ -0,0 +1,122 @@
+From ded30b9d4cee1890d2b76956102828c6fb009b6b Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Tue, 2 Jun 2009 11:47:59 +0200
+Subject: [PATCH] mxc_nand: introduce mxc_do_addr_cycle
+
+This factors the address cycle to a seperate function. This
+becomes useful in a later patch where we can simplify the
+command processing by making use of this function.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   87 +++++++++++++++++++++++--------------------
+ 1 files changed, 47 insertions(+), 40 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 56db5ac..325c5be 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -658,6 +658,52 @@ static void mxc_nand_select_chip(struct mtd_info *mtd, int chip)
+ 	}
+ }
+ 
++static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
++{
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
++
++	/* Write out column address, if necessary */
++	if (column != -1) {
++		/*
++		 * MXC NANDFC can only perform full page+spare or
++		 * spare-only read/write.  When the upper layers
++		 * layers perform a read/write buf operation,
++		 * we will used the saved column adress to index into
++		 * the full page.
++		 */
++		send_addr(host, 0, page_addr == -1);
++		if (host->pagesize_2k)
++			/* another col addr cycle for 2k page */
++			send_addr(host, 0, false);
++	}
++
++	/* Write out page address, if necessary */
++	if (page_addr != -1) {
++		/* paddr_0 - p_addr_7 */
++		send_addr(host, (page_addr & 0xff), false);
++
++		if (host->pagesize_2k) {
++			if (mtd->size >= 0x10000000) {
++				/* paddr_8 - paddr_15 */
++				send_addr(host, (page_addr >> 8) & 0xff, false);
++				send_addr(host, (page_addr >> 16) & 0xff, true);
++			} else
++				/* paddr_8 - paddr_15 */
++				send_addr(host, (page_addr >> 8) & 0xff, true);
++		} else {
++			/* One more address cycle for higher density devices */
++			if (mtd->size >= 0x4000000) {
++				/* paddr_8 - paddr_15 */
++				send_addr(host, (page_addr >> 8) & 0xff, false);
++				send_addr(host, (page_addr >> 16) & 0xff, true);
++			} else
++				/* paddr_8 - paddr_15 */
++				send_addr(host, (page_addr >> 8) & 0xff, true);
++		}
++	}
++}
++
+ /* Used by the upper layer to write command to NAND Flash for
+  * different operations to be carried out on NAND Flash */
+ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+@@ -746,46 +792,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 
+ 	/* Write out the command to the device. */
+ 	send_cmd(host, command, useirq);
+-
+-	/* Write out column address, if necessary */
+-	if (column != -1) {
+-		/*
+-		 * MXC NANDFC can only perform full page+spare or
+-		 * spare-only read/write.  When the upper layers
+-		 * layers perform a read/write buf operation,
+-		 * we will used the saved column adress to index into
+-		 * the full page.
+-		 */
+-		send_addr(host, 0, page_addr == -1);
+-		if (host->pagesize_2k)
+-			/* another col addr cycle for 2k page */
+-			send_addr(host, 0, false);
+-	}
+-
+-	/* Write out page address, if necessary */
+-	if (page_addr != -1) {
+-		/* paddr_0 - p_addr_7 */
+-		send_addr(host, (page_addr & 0xff), false);
+-
+-		if (host->pagesize_2k) {
+-			if (mtd->size >= 0x10000000) {
+-				/* paddr_8 - paddr_15 */
+-				send_addr(host, (page_addr >> 8) & 0xff, false);
+-				send_addr(host, (page_addr >> 16) & 0xff, true);
+-			} else
+-				/* paddr_8 - paddr_15 */
+-				send_addr(host, (page_addr >> 8) & 0xff, true);
+-		} else {
+-			/* One more address cycle for higher density devices */
+-			if (mtd->size >= 0x4000000) {
+-				/* paddr_8 - paddr_15 */
+-				send_addr(host, (page_addr >> 8) & 0xff, false);
+-				send_addr(host, (page_addr >> 16) & 0xff, true);
+-			} else
+-				/* paddr_8 - paddr_15 */
+-				send_addr(host, (page_addr >> 8) & 0xff, true);
+-		}
+-	}
++	mxc_do_addr_cycle(mtd, column, page_addr);
+ 
+ 	/* Command post-processing step */
+ 	switch (command) {
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0006-MXC-NFC-Reorder-structure-setup-to-use-NAND-informa.patch b/recipes/linux/linux-2.6.31/pcm043/0006-MXC-NFC-Reorder-structure-setup-to-use-NAND-informa.patch
new file mode 100644
index 0000000..ba75986
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0006-MXC-NFC-Reorder-structure-setup-to-use-NAND-informa.patch
@@ -0,0 +1,129 @@
+From 91457e95796520ecf21937c3b2578ccfe21e054f Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:21:44 +0200
+Subject: [PATCH 06/15] MXC NFC: Reorder structure setup to use NAND information
+
+Reorder some structure and NFC setup to use detected NAND information.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |   82 +++++++++++++++++++++++++++++++--------
+ 1 files changed, 65 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index 2ddd6f5..3b1011c 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -84,6 +84,10 @@
+ #define NFC_V21_SPAS_SHIFT		(0)
+ #define NFC_V21_SPAS_MASK	(0xFF00)
+ 
++/* some NFCs are able to handle different ECC sizes */
++#define MXC_SMALL_ECC 0
++#define MXC_BIG_ECC 1
++
+ struct mxc_nand_host {
+ 	struct mtd_info		mtd;
+ 	struct nand_chip	nand;
+@@ -747,6 +751,30 @@ static void unlock_addr(struct mxc_nand_host *host, unsigned int start_addr, uns
+ 		BUG();
+ }
+ 
++static void __init mxc_spare_size(struct mxc_nand_host *host, unsigned size_code)
++{
++	u16 tmp;
++
++	if (nfc_is_v21()) {
++		tmp = readw(host->regs + NFC_V21_SPAS);
++		tmp &= NFC_V21_SPAS_MASK;
++		tmp |= size_code << NFC_V21_SPAS_SHIFT;
++		writew(tmp, host->regs + NFC_V21_SPAS);
++	}
++}
++
++/* ignore mode in a first step */
++static void __init mxc_ecc_mode(struct mxc_nand_host *host, int mode)
++{
++	u16 tmp;
++
++	if (nfc_is_v21()) {
++		tmp = readw(host->regs + NFC_CONFIG1);
++		tmp |= NFC_V2_ECC_MODE_4;
++		writew(tmp, host->regs + NFC_CONFIG1);
++	}
++}
++
+ static void __init mxc_data_width(struct mxc_nand_host *host, unsigned width)
+ {
+ 	if ((width != 8) && (width != 16)) {
+@@ -838,23 +866,6 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	if (err)
+ 		goto eirq;
+ 
+-	if (pdata->hw_ecc) {
+-		this->ecc.read_page = mxc_nand_read_page;
+-		this->ecc.write_page = mxc_nand_write_page;
+-		this->ecc.read_oob = mxc_nand_read_oob;
+-		this->ecc.layout = &nand_hw_eccoob_512;
+-		this->ecc.calculate = mxc_nand_calculate_ecc;
+-		this->ecc.hwctl = mxc_nand_enable_hwecc;
+-		this->ecc.correct = mxc_nand_correct_data;
+-		this->ecc.mode = NAND_ECC_HW;
+-		this->ecc.size = 512;
+-		this->ecc.bytes = 9;
+-		mxc_nand_hwecc(host, 1);
+-	} else {
+-		this->ecc.mode = NAND_ECC_SOFT;
+-		mxc_nand_hwecc(host, 0);
+-	}
+-
+ 	clk_enable(host->clk);
+ 
+ 	/* Disable interrupt */
+@@ -887,6 +898,43 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	/* update flash based bbt */
+ 	this->options |= NAND_USE_FLASH_BBT;
+ 
++	this->ecc.mode = NAND_ECC_SOFT;	/* start with a default */
++
++	/* Note: ECC needs at least 16 bytes oob per 512 bytes pagesize */
++	if (pdata->hw_ecc && (mtd->oobsize >= 16)) {
++		if (mtd->writesize == 512) {
++			this->ecc.mode = NAND_ECC_HW;
++			this->ecc.layout = &nand_hw_eccoob_512;
++			mxc_spare_size(host, NFC_SPAS_16);
++		}
++		if ((mtd->writesize == 2048) && (mtd->oobsize >= 64)) {
++			this->ecc.mode = NAND_ECC_HW;
++			this->ecc.layout = &nand_hw_eccoob_2k;
++			mxc_spare_size(host, NFC_SPAS_64);
++		}
++		if ((mtd->writesize == 4096) && (mtd->oobsize >= 128)) {
++			this->ecc.mode = NAND_ECC_HW;
++			this->ecc.layout = &nand_hw_eccoob_4k;
++			mxc_spare_size(host, NFC_SPAS_128);
++		}
++		/* can we use hardware ECC? */
++		if (this->ecc.mode == NAND_ECC_HW) {
++			this->ecc.read_page = mxc_nand_read_page;
++			this->ecc.write_page = mxc_nand_write_page;
++			this->ecc.read_oob = mxc_nand_read_oob;
++			this->ecc.calculate = mxc_nand_calculate_ecc;
++			this->ecc.hwctl = mxc_nand_enable_hwecc;
++			this->ecc.correct = mxc_nand_correct_data;
++			this->ecc.size = 512;
++			this->ecc.bytes = 9;
++			mxc_ecc_mode(host, MXC_SMALL_ECC);
++			mxc_nand_hwecc(host, 1);
++		}
++	}
++
++	if (this->ecc.mode == NAND_ECC_SOFT)
++		mxc_nand_hwecc(host, 0);
++
+ 	/* second phase scan */
+ 	if (nand_scan_tail(mtd)) {
+ 		err = -ENXIO;
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0006-i.MX2-Add-sound-ssi-resources.patch b/recipes/linux/linux-2.6.31/pcm043/0006-i.MX2-Add-sound-ssi-resources.patch
new file mode 100644
index 0000000..9de57cf
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0006-i.MX2-Add-sound-ssi-resources.patch
@@ -0,0 +1,132 @@
+From 4bdc922cba4f392af2adf57c9aa86c0d2241ac88 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 22 Oct 2009 14:50:33 +0200
+Subject: [PATCH 06/28] i.MX2: Add sound (ssi) resources
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/clock_imx27.c |    4 +-
+ arch/arm/mach-mx2/devices.c     |   78 +++++++++++++++++++++++++++++++++++++++
+ arch/arm/mach-mx2/devices.h     |    5 ++
+ 3 files changed, 85 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-mx2/clock_imx27.c b/arch/arm/mach-mx2/clock_imx27.c
+index 2c97144..5abb763 100644
+--- a/arch/arm/mach-mx2/clock_imx27.c
++++ b/arch/arm/mach-mx2/clock_imx27.c
+@@ -644,8 +644,8 @@ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK("imx-fb.0", NULL, lcdc_clk)
+ 	_REGISTER_CLOCK(NULL, "csi", csi_clk)
+ 	_REGISTER_CLOCK(NULL, "usb", usb_clk)
+-	_REGISTER_CLOCK(NULL, "ssi1", ssi1_clk)
+-	_REGISTER_CLOCK(NULL, "ssi2", ssi2_clk)
++	_REGISTER_CLOCK("imx-ssi.0", NULL, ssi1_clk)
++	_REGISTER_CLOCK("imx-ssi.1", NULL, ssi2_clk)
+ 	_REGISTER_CLOCK("mxc_nand.0", NULL, nfc_clk)
+ 	_REGISTER_CLOCK(NULL, "vpu", vpu_clk)
+ 	_REGISTER_CLOCK(NULL, "dma", dma_clk)
+diff --git a/arch/arm/mach-mx2/devices.c b/arch/arm/mach-mx2/devices.c
+index a0f1b36..f877baa 100644
+--- a/arch/arm/mach-mx2/devices.c
++++ b/arch/arm/mach-mx2/devices.c
+@@ -407,6 +407,84 @@ struct platform_device mxc_sdhc_device1 = {
+        .resource       = mxc_sdhc2_resources,
+ };
+ 
++static struct resource imx_ssi_resources0[] = {
++	{
++		.start	= SSI1_BASE_ADDR,
++		.end	= SSI1_BASE_ADDR + 0x6F,
++		.flags	= IORESOURCE_MEM,
++	}, {
++		.start	= MXC_INT_SSI1,
++		.end	= MXC_INT_SSI1,
++		.flags	= IORESOURCE_IRQ,
++	}, {
++		.name	= "tx0",
++		.start	= DMA_REQ_SSI1_TX0,
++		.end	= DMA_REQ_SSI1_TX0,
++		.flags	= IORESOURCE_DMA,
++	}, {
++		.name	= "rx0",
++		.start	= DMA_REQ_SSI1_RX0,
++		.end	= DMA_REQ_SSI1_RX0,
++		.flags	= IORESOURCE_DMA,
++	}, {
++		.name	= "tx1",
++		.start	= DMA_REQ_SSI1_TX1,
++		.end	= DMA_REQ_SSI1_TX1,
++		.flags	= IORESOURCE_DMA,
++	}, {
++		.name	= "rx1",
++		.start	= DMA_REQ_SSI1_RX1,
++		.end	= DMA_REQ_SSI1_RX1,
++		.flags	= IORESOURCE_DMA,
++	},
++};
++
++static struct resource imx_ssi_resources1[] = {
++	{
++		.start	= SSI2_BASE_ADDR,
++		.end	= SSI2_BASE_ADDR + 0x6F,
++		.flags	= IORESOURCE_MEM,
++	}, {
++		.start	= MXC_INT_SSI2,
++		.end	= MXC_INT_SSI2,
++		.flags	= IORESOURCE_IRQ,
++	}, {
++		.name	= "tx0",
++		.start	= DMA_REQ_SSI2_TX0,
++		.end	= DMA_REQ_SSI2_TX0,
++		.flags	= IORESOURCE_DMA,
++	}, {
++		.name	= "rx0",
++		.start	= DMA_REQ_SSI2_RX0,
++		.end	= DMA_REQ_SSI2_RX0,
++		.flags	= IORESOURCE_DMA,
++	}, {
++		.name	= "tx1",
++		.start	= DMA_REQ_SSI2_TX1,
++		.end	= DMA_REQ_SSI2_TX1,
++		.flags	= IORESOURCE_DMA,
++	}, {
++		.name	= "rx1",
++		.start	= DMA_REQ_SSI2_RX1,
++		.end	= DMA_REQ_SSI2_RX1,
++		.flags	= IORESOURCE_DMA,
++	},
++};
++
++struct platform_device imx_ssi_device0 = {
++	.name = "imx-ssi",
++	.id = 0,
++	.num_resources = ARRAY_SIZE(imx_ssi_resources0),
++	.resource = imx_ssi_resources0,
++};
++
++struct platform_device imx_ssi_device1 = {
++	.name = "imx-ssi",
++	.id = 1,
++	.num_resources = ARRAY_SIZE(imx_ssi_resources1),
++	.resource = imx_ssi_resources1,
++};
++
+ /* GPIO port description */
+ static struct mxc_gpio_port imx_gpio_ports[] = {
+ 	[0] = {
+diff --git a/arch/arm/mach-mx2/devices.h b/arch/arm/mach-mx2/devices.h
+index 049005b..0c1f14d 100644
+--- a/arch/arm/mach-mx2/devices.h
++++ b/arch/arm/mach-mx2/devices.h
+@@ -20,3 +20,8 @@ extern struct platform_device mxc_i2c_device0;
+ extern struct platform_device mxc_i2c_device1;
+ extern struct platform_device mxc_sdhc_device0;
+ extern struct platform_device mxc_sdhc_device1;
++extern struct platform_device mxc_spi_device0;
++extern struct platform_device mxc_spi_device1;
++extern struct platform_device mxc_spi_device2;
++extern struct platform_device imx_ssi_device0;
++extern struct platform_device imx_ssi_device1;
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0006-mxc-nand-remove-debug-param.patch b/recipes/linux/linux-2.6.31/pcm043/0006-mxc-nand-remove-debug-param.patch
new file mode 100644
index 0000000..0829ae0
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0006-mxc-nand-remove-debug-param.patch
@@ -0,0 +1,82 @@
+From 74689944a8d49bcfd0acdaabe1952d368a889eae Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 15:57:20 +0200
+Subject: [PATCH] mxc nand: remove debug param
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   16 ++++++++--------
+ 1 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 325c5be..cd09196 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -165,7 +165,7 @@ static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
+  * complete by checking the INT bit of config2 register.
+  */
+ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
+-				uint16_t param, int useirq)
++				int useirq)
+ {
+ 	uint32_t tmp;
+ 
+@@ -194,8 +194,8 @@ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
+ 			udelay(1);
+ 		}
+ 		if (max_retries < 0)
+-			DEBUG(MTD_DEBUG_LEVEL0, "%s(%d): INT not set\n",
+-			      __func__, param);
++			DEBUG(MTD_DEBUG_LEVEL0, "%s: INT not set\n",
++			      __func__);
+ 	}
+ }
+ 
+@@ -209,7 +209,7 @@ static void send_cmd(struct mxc_nand_host *host, uint16_t cmd, int useirq)
+ 	writew(NFC_CMD, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, cmd, useirq);
++	wait_op_done(host, TROP_US_DELAY, useirq);
+ }
+ 
+ /* This function sends an address (or partial address) to the
+@@ -223,7 +223,7 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
+ 	writew(NFC_ADDR, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, addr, islast);
++	wait_op_done(host, TROP_US_DELAY, islast);
+ }
+ 
+ static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
+@@ -247,7 +247,7 @@ static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
+ 	writew(ops, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, spare_only, true);
++	wait_op_done(host, TROP_US_DELAY, true);
+ }
+ 
+ /* Request the NANDFC to perform a read of the NAND device ID. */
+@@ -267,7 +267,7 @@ static void send_read_id(struct mxc_nand_host *host)
+ 	writew(NFC_ID, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, 0, true);
++	wait_op_done(host, TROP_US_DELAY, true);
+ 
+ 	if (this->options & NAND_BUSWIDTH_16) {
+ 		void __iomem *main_buf = host->regs + MAIN_AREA0;
+@@ -303,7 +303,7 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
+ 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, 0, true);
++	wait_op_done(host, TROP_US_DELAY, true);
+ 
+ 	/* Status is placed in first word of main buffer */
+ 	/* get status, then recovery area 1 data */
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0007-MXC-NFC-Fix-OOB-layout.patch b/recipes/linux/linux-2.6.31/pcm043/0007-MXC-NFC-Fix-OOB-layout.patch
new file mode 100644
index 0000000..0aa5cc6
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0007-MXC-NFC-Fix-OOB-layout.patch
@@ -0,0 +1,104 @@
+From 1b05f0fbf96df288d1ee6d0bf4175e99b7d04730 Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:28:21 +0200
+Subject: [PATCH 07/15] MXC NFC: Fix OOB layout
+
+This data is not from the datasheet because the datasheet conceals these
+facts. Its collected from other sources and some hints from the datasheet.
+Hope its documentation is useful.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |   68 ++++++++++++++++++++++++++++++++-------
+ 1 files changed, 55 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index 3b1011c..c1cbb05 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -121,27 +121,69 @@ struct mxc_nand_host {
+ #define TROP_US_DELAY   2000
+ 
+ /*
+- * OOB placement block for use with hardware ecc generation
++ * ECC data seems organized in 16 byte planes in this hardware.
++ * 7 bytes can be used for user's purpose, and 9 bytes are used
++ * for the ECC sum.
++ *
++ *  0 1 2 3 4 5 6 7 8 9 A B C D E F
++ *  |<----------->|<------------->|
++ *      User             ECC
++ *
++ * For pages larger than 512 bytes, n structures of this type will be used.
+  */
++
++/* OOB description for 512 byte pages with 16 byte OOB */
+ static struct nand_ecclayout nand_hw_eccoob_512 = {
+-	.eccbytes = 9,
+-	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
+-	.oobavail = 4,
+-	.oobfree = {{0, 4}}
++	.eccbytes = 1 * 9,
++	.eccpos = {
++		 7,  8,  9, 10, 11, 12, 13, 14, 15
++	},
++	.oobfree = {
++		{.offset = 0, .length = 7}
++	}
+ };
+ 
++/* OOB description for 2048 byte pages with 64 byte OOB */
+ static struct nand_ecclayout nand_hw_eccoob_2k = {
+-	.eccbytes = 9,
+-	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
+-	.oobavail = 4,
+-	.oobfree = {{2, 4}}
++	.eccbytes = 4 * 9,
++	.eccpos = {
++		 7,  8,  9, 10, 11, 12, 13, 14, 15,
++		23, 24, 25, 26, 27, 28, 29, 30, 31,
++		39, 40, 41, 42, 43, 44, 45, 46, 47,
++		55, 56, 57, 58, 59, 60, 61, 62, 63
++	},
++	.oobfree = {
++		{.offset = 0, .length = 7},
++		{.offset = 16, .length = 7},
++		{.offset = 32, .length = 7},
++		{.offset = 48, .length = 7}
++	}
+ };
+ 
++/* OOB description for 4096 byte pages with 128 byte OOB */
+ static struct nand_ecclayout nand_hw_eccoob_4k = {
+-	.eccbytes = 9,
+-	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
+-	.oobavail = 4,
+-	.oobfree = {{2, 4}}
++	.eccbytes = 8 * 9,
++	.eccpos = {
++		 7,  8,  9, 10, 11, 12, 13, 14, 15,
++		23, 24, 25, 26, 27, 28, 29, 30, 31,
++		39, 40, 41, 42, 43, 44, 45, 46, 47,
++		55, 56, 57, 58, 59, 60, 61, 62, 63,
++		71, 72, 73, 74, 75, 76, 77, 78, 79,
++		87, 88, 89, 90, 91, 92, 93, 94, 95,
++		103, 104, 105, 106, 107, 108, 109, 110, 111,
++/* ouch, only 64 entries allowed */
++/*		119, 120, 121, 122, 123, 124, 125, 126, 127 */
++	},
++	.oobfree = {
++		{.offset = 0, .length = 7},
++		{.offset = 16, .length = 7},
++		{.offset = 32, .length = 7},
++		{.offset = 48, .length = 7},
++		{.offset = 64, .length = 7},
++		{.offset = 80, .length = 7},
++		{.offset = 96, .length = 7},
++		{.offset = 112, .length = 7}
++	}
+ };
+ 
+ #ifdef CONFIG_MTD_PARTITIONS
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0007-i.MX3-Add-sound-ssi-resources.patch b/recipes/linux/linux-2.6.31/pcm043/0007-i.MX3-Add-sound-ssi-resources.patch
new file mode 100644
index 0000000..10eb2dc
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0007-i.MX3-Add-sound-ssi-resources.patch
@@ -0,0 +1,101 @@
+From cd733f49a7e0fd82164138933157bbdbb9937f2c Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 29 Oct 2009 17:17:42 +0100
+Subject: [PATCH 07/28] i.MX3: Add sound (ssi) resources
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/clock-imx35.c |    4 +-
+ arch/arm/mach-mx3/devices.c     |   42 +++++++++++++++++++++++++++++++++++++++
+ arch/arm/mach-mx3/devices.h     |    3 +-
+ 3 files changed, 46 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/clock-imx35.c b/arch/arm/mach-mx3/clock-imx35.c
+index 577ee83..02b2507 100644
+--- a/arch/arm/mach-mx3/clock-imx35.c
++++ b/arch/arm/mach-mx3/clock-imx35.c
+@@ -421,8 +421,8 @@ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK(NULL, "sdma", sdma_clk)
+ 	_REGISTER_CLOCK(NULL, "spba", spba_clk)
+ 	_REGISTER_CLOCK(NULL, "spdif", spdif_clk)
+-	_REGISTER_CLOCK(NULL, "ssi", ssi1_clk)
+-	_REGISTER_CLOCK(NULL, "ssi", ssi2_clk)
++	_REGISTER_CLOCK("imx-ssi.0", NULL, ssi1_clk)
++	_REGISTER_CLOCK("imx-ssi.1", NULL, ssi2_clk)
+ 	_REGISTER_CLOCK("imx-uart.0", NULL, uart1_clk)
+ 	_REGISTER_CLOCK("imx-uart.1", NULL, uart2_clk)
+ 	_REGISTER_CLOCK("imx-uart.2", NULL, uart3_clk)
+diff --git a/arch/arm/mach-mx3/devices.c b/arch/arm/mach-mx3/devices.c
+index 9e87e08..06dab5f 100644
+--- a/arch/arm/mach-mx3/devices.c
++++ b/arch/arm/mach-mx3/devices.c
+@@ -416,6 +416,44 @@ struct platform_device mxc_fec_device = {
+ };
+ #endif
+ 
++static struct resource imx_ssi_resources0[] = {
++	{
++		.start	= SSI1_BASE_ADDR,
++		.end	= SSI1_BASE_ADDR + 0xfff,
++		.flags	= IORESOURCE_MEM,
++	}, {
++		.start	= MX31_INT_SSI1,
++		.end	= MX31_INT_SSI1,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct resource imx_ssi_resources1[] = {
++	{
++		.start	= SSI2_BASE_ADDR,
++		.end	= SSI2_BASE_ADDR + 0xfff,
++		.flags	= IORESOURCE_MEM
++	}, {
++		.start	= MX31_INT_SSI2,
++		.end	= MX31_INT_SSI2,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++struct platform_device imx_ssi_device0 = {
++	.name = "imx-ssi",
++	.id = 0,
++	.num_resources = ARRAY_SIZE(imx_ssi_resources0),
++	.resource = imx_ssi_resources0,
++};
++
++struct platform_device imx_ssi_device1 = {
++	.name = "imx-ssi",
++	.id = 1,
++	.num_resources = ARRAY_SIZE(imx_ssi_resources1),
++	.resource = imx_ssi_resources1,
++};
++
+ static int mx3_devices_init(void)
+ {
+ 	if (cpu_is_mx31()) {
+@@ -426,6 +464,10 @@ static int mx3_devices_init(void)
+ 	if (cpu_is_mx35()) {
+ 		mxc_nand_resources[0].start = MX35_NFC_BASE_ADDR;
+ 		mxc_nand_resources[0].end = MX35_NFC_BASE_ADDR + 0xfff;
++		imx_ssi_resources0[1].start = MX35_INT_SSI1;
++		imx_ssi_resources0[1].end = MX35_INT_SSI1;
++		imx_ssi_resources1[1].start = MX35_INT_SSI2;
++		imx_ssi_resources1[1].end = MX35_INT_SSI2;
+ 	}
+ 
+ 	return 0;
+diff --git a/arch/arm/mach-mx3/devices.h b/arch/arm/mach-mx3/devices.h
+index ffd494d..224c2eb 100644
+--- a/arch/arm/mach-mx3/devices.h
++++ b/arch/arm/mach-mx3/devices.h
+@@ -17,4 +17,5 @@ extern struct platform_device mxcsdhc_device0;
+ extern struct platform_device mxcsdhc_device1;
+ extern struct platform_device mxc_otg_udc_device;
+ extern struct platform_device mxc_rnga_device;
+-
++extern struct platform_device imx_ssi_device0;
++extern struct platform_device imx_ssi_device1;
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0007-mxc-nand-remove-dead-code.patch b/recipes/linux/linux-2.6.31/pcm043/0007-mxc-nand-remove-dead-code.patch
new file mode 100644
index 0000000..218b103
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0007-mxc-nand-remove-dead-code.patch
@@ -0,0 +1,41 @@
+From 406ec8e7472d4435f6f862cd2e8179ee8dddb57e Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 16:12:40 +0200
+Subject: [PATCH] mxc nand: remove dead code
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   17 -----------------
+ 1 files changed, 0 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index cd09196..74c5dbc 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -620,23 +620,6 @@ static void mxc_nand_select_chip(struct mtd_info *mtd, int chip)
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+ 
+-#ifdef CONFIG_MTD_NAND_MXC_FORCE_CE
+-	if (chip > 0) {
+-		DEBUG(MTD_DEBUG_LEVEL0,
+-		      "ERROR:  Illegal chip select (chip = %d)\n", chip);
+-		return;
+-	}
+-
+-	if (chip == -1) {
+-		writew(readw(host->regs + NFC_CONFIG1) & ~NFC_CE,
+-				host->regs + NFC_CONFIG1);
+-		return;
+-	}
+-
+-	writew(readw(host->regs + NFC_CONFIG1) | NFC_CE,
+-			host->regs + NFC_CONFIG1);
+-#endif
+-
+ 	switch (chip) {
+ 	case -1:
+ 		/* Disable the NFC clock */
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0008-MXC-Add-a-digital-audio-multiplexer-driver.patch b/recipes/linux/linux-2.6.31/pcm043/0008-MXC-Add-a-digital-audio-multiplexer-driver.patch
new file mode 100644
index 0000000..65c7339
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0008-MXC-Add-a-digital-audio-multiplexer-driver.patch
@@ -0,0 +1,281 @@
+From 2ff993c8bed5670aab72ef1d7901fe87e753aa54 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 29 Oct 2009 17:12:39 +0100
+Subject: [PATCH 08/28] MXC: Add a digital audio multiplexer driver
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/Kconfig               |    2 +
+ arch/arm/mach-mx3/Kconfig               |    2 +
+ arch/arm/plat-mxc/Kconfig               |    7 +++
+ arch/arm/plat-mxc/Makefile              |    2 +
+ arch/arm/plat-mxc/audmux-v1.c           |   53 ++++++++++++++++++++++
+ arch/arm/plat-mxc/audmux-v2.c           |   74 +++++++++++++++++++++++++++++++
+ arch/arm/plat-mxc/include/mach/audmux.h |   52 +++++++++++++++++++++
+ 7 files changed, 192 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/plat-mxc/audmux-v1.c
+ create mode 100644 arch/arm/plat-mxc/audmux-v2.c
+ create mode 100644 arch/arm/plat-mxc/include/mach/audmux.h
+
+diff --git a/arch/arm/mach-mx2/Kconfig b/arch/arm/mach-mx2/Kconfig
+index c77da58..0d08c34 100644
+--- a/arch/arm/mach-mx2/Kconfig
++++ b/arch/arm/mach-mx2/Kconfig
+@@ -6,11 +6,13 @@ choice
+ 
+ config MACH_MX21
+ 	bool "i.MX21 support"
++	select ARCH_MXC_AUDMUX_V1
+ 	help
+ 	  This enables support for Freescale's MX2 based i.MX21 processor.
+ 
+ config MACH_MX27
+ 	bool "i.MX27 support"
++	select ARCH_MXC_AUDMUX_V1
+ 	help
+ 	  This enables support for Freescale's MX2 based i.MX27 processor.
+ 
+diff --git a/arch/arm/mach-mx3/Kconfig b/arch/arm/mach-mx3/Kconfig
+index 851f245..ffdd211 100644
+--- a/arch/arm/mach-mx3/Kconfig
++++ b/arch/arm/mach-mx3/Kconfig
+@@ -2,11 +2,13 @@ if ARCH_MX3
+ 
+ config ARCH_MX31
+ 	select ARCH_HAS_RNGA
++	select ARCH_MXC_AUDMUX_V2
+ 	bool
+ 
+ config ARCH_MX35
+ 	bool
+ 	select ARCH_MXC_IOMUX_V3
++	select ARCH_MXC_AUDMUX_V2
+ 
+ comment "MX3 platforms:"
+ 
+diff --git a/arch/arm/plat-mxc/Kconfig b/arch/arm/plat-mxc/Kconfig
+index 8986b74..995c357 100644
+--- a/arch/arm/plat-mxc/Kconfig
++++ b/arch/arm/plat-mxc/Kconfig
+@@ -58,4 +58,11 @@ config ARCH_HAS_RNGA
+ 
+ config ARCH_MXC_IOMUX_V3
+ 	bool
++
++config ARCH_MXC_AUDMUX_V1
++	bool
++
++config ARCH_MXC_AUDMUX_V2
++	bool
++
+ endif
+diff --git a/arch/arm/plat-mxc/Makefile b/arch/arm/plat-mxc/Makefile
+index e3212c8..92fc8b2 100644
+--- a/arch/arm/plat-mxc/Makefile
++++ b/arch/arm/plat-mxc/Makefile
+@@ -9,3 +9,5 @@ obj-$(CONFIG_ARCH_MX1) += iomux-mx1-mx2.o dma-mx1-mx2.o
+ obj-$(CONFIG_ARCH_MX2) += iomux-mx1-mx2.o dma-mx1-mx2.o
+ obj-$(CONFIG_ARCH_MXC_IOMUX_V3) += iomux-v3.o
+ obj-$(CONFIG_MXC_PWM)  += pwm.o
++obj-$(CONFIG_ARCH_MXC_AUDMUX_V1) += audmux-v1.o
++obj-$(CONFIG_ARCH_MXC_AUDMUX_V2) += audmux-v2.o
+diff --git a/arch/arm/plat-mxc/audmux-v1.c b/arch/arm/plat-mxc/audmux-v1.c
+new file mode 100644
+index 0000000..70ab5af
+--- /dev/null
++++ b/arch/arm/plat-mxc/audmux-v1.c
+@@ -0,0 +1,53 @@
++/*
++ * Copyright 2009 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * Initial development of this code was funded by
++ * Phytec Messtechnik GmbH, http://www.phytec.de
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#include <linux/module.h>
++#include <linux/err.h>
++#include <linux/io.h>
++#include <linux/clk.h>
++#include <mach/audmux.h>
++#include <mach/hardware.h>
++
++static void __iomem *audmux_base;
++
++#define MXC_AUDMUX_V1_PCR(x)	((x) * 4)
++
++int mxc_audmux_v1_configure_port(unsigned int port, unsigned int pcr)
++{
++	if (!audmux_base) {
++		printk("%s: not configured\n", __func__);
++		return -ENOSYS;
++	}
++
++	writel(pcr, audmux_base + MXC_AUDMUX_V1_PCR(port));
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(mxc_audmux_v1_configure_port);
++
++static int mxc_audmux_v1_init(void)
++{
++	if (cpu_is_mx27() || cpu_is_mx21())
++		audmux_base = IO_ADDRESS(AUDMUX_BASE_ADDR);
++	return 0;
++}
++
++postcore_initcall(mxc_audmux_v1_init);
+diff --git a/arch/arm/plat-mxc/audmux-v2.c b/arch/arm/plat-mxc/audmux-v2.c
+new file mode 100644
+index 0000000..6f21096
+--- /dev/null
++++ b/arch/arm/plat-mxc/audmux-v2.c
+@@ -0,0 +1,74 @@
++/*
++ * Copyright 2009 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * Initial development of this code was funded by
++ * Phytec Messtechnik GmbH, http://www.phytec.de
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#include <linux/module.h>
++#include <linux/err.h>
++#include <linux/io.h>
++#include <linux/clk.h>
++#include <mach/audmux.h>
++#include <mach/hardware.h>
++
++static struct clk *audmux_clk;
++static void __iomem *audmux_base;
++
++#define MXC_AUDMUX_V2_PTCR(x)		((x) * 8)
++#define MXC_AUDMUX_V2_PDCR(x)		((x) * 8 + 4)
++
++int mxc_audmux_v2_configure_port(unsigned int port, unsigned int ptcr,
++		unsigned int pdcr)
++{
++	if (!audmux_base)
++		return -ENOSYS;
++
++	if (audmux_clk)
++		clk_enable(audmux_clk);
++
++	writel(ptcr, audmux_base + MXC_AUDMUX_V2_PTCR(port));
++	writel(pdcr, audmux_base + MXC_AUDMUX_V2_PDCR(port));
++
++	if (audmux_clk)
++		clk_disable(audmux_clk);
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(mxc_audmux_v2_configure_port);
++
++static int mxc_audmux_v2_init(void)
++{
++	int ret;
++
++	if (cpu_is_mx35()) {
++		audmux_clk = clk_get(NULL, "audmux");
++		if (IS_ERR(audmux_clk)) {
++			ret = PTR_ERR(audmux_clk);
++			printk(KERN_ERR "%s: cannot get clock: %d\n", __func__,
++					ret);
++			return ret;
++		}
++	}
++
++	if (cpu_is_mx31() || cpu_is_mx35())
++		audmux_base = IO_ADDRESS(AUDMUX_BASE_ADDR);
++
++	return 0;
++}
++
++postcore_initcall(mxc_audmux_v2_init);
+diff --git a/arch/arm/plat-mxc/include/mach/audmux.h b/arch/arm/plat-mxc/include/mach/audmux.h
+new file mode 100644
+index 0000000..5cd6466
+--- /dev/null
++++ b/arch/arm/plat-mxc/include/mach/audmux.h
+@@ -0,0 +1,52 @@
++#ifndef __MACH_AUDMUX_H
++#define __MACH_AUDMUX_H
++
++#define MX27_AUDMUX_HPCR1_SSI0		0
++#define MX27_AUDMUX_HPCR2_SSI1		1
++#define MX27_AUDMUX_HPCR3_SSI_PINS_4	2
++#define MX27_AUDMUX_PPCR1_SSI_PINS_1	3
++#define MX27_AUDMUX_PPCR2_SSI_PINS_2	4
++#define MX27_AUDMUX_PPCR3_SSI_PINS_3	5
++
++#define MX31_AUDMUX_PORT1_SSI0		0
++#define MX31_AUDMUX_PORT2_SSI1		1
++#define MX31_AUDMUX_PORT3_SSI_PINS_3	2
++#define MX31_AUDMUX_PORT4_SSI_PINS_4	3
++#define MX31_AUDMUX_PORT5_SSI_PINS_5	4
++#define MX31_AUDMUX_PORT6_SSI_PINS_6	5
++
++/* Register definitions for the i.MX21/27 Digital Audio Multiplexer */
++#define MXC_AUDMUX_V1_PCR_INMMASK(x)	((x) & 0xff)
++#define MXC_AUDMUX_V1_PCR_INMEN		(1 << 8)
++#define MXC_AUDMUX_V1_PCR_TXRXEN	(1 << 10)
++#define MXC_AUDMUX_V1_PCR_SYN		(1 << 12)
++#define MXC_AUDMUX_V1_PCR_RXDSEL(x)	(((x) & 0x7) << 13)
++#define MXC_AUDMUX_V1_PCR_RFCSEL(x)	(((x) & 0xf) << 20)
++#define MXC_AUDMUX_V1_PCR_RCLKDIR	(1 << 24)
++#define MXC_AUDMUX_V1_PCR_RFSDIR	(1 << 25)
++#define MXC_AUDMUX_V1_PCR_TFCSEL(x)	(((x) & 0xf) << 26)
++#define MXC_AUDMUX_V1_PCR_TCLKDIR	(1 << 30)
++#define MXC_AUDMUX_V1_PCR_TFSDIR	(1 << 31)
++
++/* Register definitions for the i.MX25/31/35 Digital Audio Multiplexer */
++#define MXC_AUDMUX_V2_PTCR_TFSDIR	(1 << 31)
++#define MXC_AUDMUX_V2_PTCR_TFSEL(x)	(((x) & 0xf) << 27)
++#define MXC_AUDMUX_V2_PTCR_TCLKDIR	(1 << 26)
++#define MXC_AUDMUX_V2_PTCR_TCSEL(x)	(((x) & 0xf) << 22)
++#define MXC_AUDMUX_V2_PTCR_RFSDIR	(1 << 21)
++#define MXC_AUDMUX_V2_PTCR_RFSEL(x)	(((x) & 0xf) << 17)
++#define MXC_AUDMUX_V2_PTCR_RCLKDIR	(1 << 16)
++#define MXC_AUDMUX_V2_PTCR_RCSEL(x)	(((x) & 0xf) << 12)
++#define MXC_AUDMUX_V2_PTCR_SYN		(1 << 11)
++
++#define MXC_AUDMUX_V2_PDCR_RXDSEL(x)	(((x) & 0x7) << 13)
++#define MXC_AUDMUX_V2_PDCR_TXRXEN	(1 << 12)
++#define MXC_AUDMUX_V2_PDCR_MODE(x)	(((x) & 0x3) << 8)
++#define MXC_AUDMUX_V2_PDCR_INMMASK(x)	((x) & 0xff)
++
++int mxc_audmux_v1_configure_port(unsigned int port, unsigned int pcr);
++
++int mxc_audmux_v2_configure_port(unsigned int port, unsigned int ptcr,
++		unsigned int pdcr);
++
++#endif /* __MACH_AUDMUX_H */
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0008-MXC-NFC-The-i.MX35-CPU-also-uses-a-V2.1-NFC.patch b/recipes/linux/linux-2.6.31/pcm043/0008-MXC-NFC-The-i.MX35-CPU-also-uses-a-V2.1-NFC.patch
new file mode 100644
index 0000000..8d2a3c7
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0008-MXC-NFC-The-i.MX35-CPU-also-uses-a-V2.1-NFC.patch
@@ -0,0 +1,26 @@
+From b319bc5f9a9733e534a57b6725b94f438a1e406e Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:31:18 +0200
+Subject: [PATCH 08/15] MXC NFC: The i.MX35 CPU also uses a V2.1 NFC
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index c1cbb05..3891d9a 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -51,7 +51,7 @@
+ #define NFC_V1_UNLOCKSTART_BLKADDR  	0xe14
+ #define NFC_V1_UNLOCKEND_BLKADDR    	0xe16
+ 
+-#define nfc_is_v21()		cpu_is_mx25()
++#define nfc_is_v21()		(cpu_is_mx25() || cpu_is_mx35())
+ #define nfc_is_v2x()		cpu_is_mx31()
+ 
+ #define NFC_ECC_EN          		(1 << 3)
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0008-mxc-nand-use-resource_size.patch b/recipes/linux/linux-2.6.31/pcm043/0008-mxc-nand-use-resource_size.patch
new file mode 100644
index 0000000..ab3b1a3
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0008-mxc-nand-use-resource_size.patch
@@ -0,0 +1,26 @@
+From de6d94479735ef944c1463f42ed6192b1b226395 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 16:16:01 +0200
+Subject: [PATCH] mxc nand: use resource_size()
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 74c5dbc..127e0b7 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -865,7 +865,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 		goto eres;
+ 	}
+ 
+-	host->regs = ioremap(res->start, res->end - res->start + 1);
++	host->regs = ioremap(res->start, resource_size(res));
+ 	if (!host->regs) {
+ 		err = -ENOMEM;
+ 		goto eres;
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0009-MX31-Fix-spi-clock-names.patch b/recipes/linux/linux-2.6.31/pcm043/0009-MX31-Fix-spi-clock-names.patch
new file mode 100644
index 0000000..f59d127
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0009-MX31-Fix-spi-clock-names.patch
@@ -0,0 +1,32 @@
+From 6e58f781f2d5bedae9ff6991ac378212a392b723 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 20 Mar 2009 19:25:01 +0100
+Subject: [PATCH 09/28] MX31 Fix spi clock names
+
+Fix the SPI clock names to match the device names.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/clock.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/clock.c b/arch/arm/mach-mx3/clock.c
+index f25e8be..664148c 100644
+--- a/arch/arm/mach-mx3/clock.c
++++ b/arch/arm/mach-mx3/clock.c
+@@ -518,9 +518,9 @@ DEFINE_CLOCK(ipg_clk,     0, NULL,          0, ipg_get_rate, NULL, &ahb_clk);
+ 
+ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK(NULL, "emi", emi_clk)
+-	_REGISTER_CLOCK(NULL, "cspi", cspi1_clk)
+-	_REGISTER_CLOCK(NULL, "cspi", cspi2_clk)
+-	_REGISTER_CLOCK(NULL, "cspi", cspi3_clk)
++	_REGISTER_CLOCK("spi_imx.0", NULL, cspi1_clk)
++	_REGISTER_CLOCK("spi_imx.1", NULL, cspi2_clk)
++	_REGISTER_CLOCK("spi_imx.2", NULL, cspi3_clk)
+ 	_REGISTER_CLOCK(NULL, "gpt", gpt_clk)
+ 	_REGISTER_CLOCK(NULL, "pwm", pwm_clk)
+ 	_REGISTER_CLOCK(NULL, "wdog", wdog_clk)
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0009-MXC-NFC-Fix-NFC-s-address-area-on-i.MX35.patch b/recipes/linux/linux-2.6.31/pcm043/0009-MXC-NFC-Fix-NFC-s-address-area-on-i.MX35.patch
new file mode 100644
index 0000000..18096a4
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0009-MXC-NFC-Fix-NFC-s-address-area-on-i.MX35.patch
@@ -0,0 +1,28 @@
+From aa20693d5b25d2ed31a31265687a66b29d51737b Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:37:47 +0200
+Subject: [PATCH 09/15] MXC NFC: Fix NFC's address area on i.MX35
+
+The address area of the NFS in the i.MX35 silicon is much larger than 4k.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/devices.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: arch/arm/mach-mx3/devices.c
+===================================================================
+--- arch/arm/mach-mx3/devices.c.orig	2009-12-10 13:38:53.334702610 +0100
++++ arch/arm/mach-mx3/devices.c	2009-12-10 13:39:18.186144277 +0100
+@@ -585,7 +585,7 @@
+ 	}
+ 	if (cpu_is_mx35()) {
+ 		mxc_nand_resources[0].start = MX35_NFC_BASE_ADDR;
+-		mxc_nand_resources[0].end = MX35_NFC_BASE_ADDR + 0xfff;
++		mxc_nand_resources[0].end = MX35_NFC_BASE_ADDR + 0x1fff;
+ 		otg_resources[0].start = MX35_OTG_BASE_ADDR;
+ 		otg_resources[0].end = MX35_OTG_BASE_ADDR + 0x1ff;
+ 		otg_resources[1].start = MXC_INT_USBOTG;
diff --git a/recipes/linux/linux-2.6.31/pcm043/0009-mxc-nand-use-buffers.patch b/recipes/linux/linux-2.6.31/pcm043/0009-mxc-nand-use-buffers.patch
new file mode 100644
index 0000000..e48ff64
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0009-mxc-nand-use-buffers.patch
@@ -0,0 +1,473 @@
+From 714bcc0f142a1f44fb6e15ad7505b9d234e8f914 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 17:12:26 +0200
+Subject: [PATCH] mxc nand: use buffers
+
+The NAND controller has some limitations how to access the
+internal buffers. It only allows 32 bit accesses. The driver
+used to work around this by having special alignment aware
+copy routines.
+We now copy the whole page to a buffer in memory and let the
+access functions use this buffer. This simplifies the driver.
+A bonnie++ test showed that this has no negative performance
+impact on the driver.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |  310 +++++++++++--------------------------------
+ 1 files changed, 77 insertions(+), 233 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 127e0b7..4c338ae 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -107,15 +107,17 @@ struct mxc_nand_host {
+ 	struct device		*dev;
+ 
+ 	void __iomem		*regs;
+-	int			spare_only;
+ 	int			status_request;
+ 	int			pagesize_2k;
+-	uint16_t		col_addr;
+ 	struct clk		*clk;
+ 	int			clk_act;
+ 	int			irq;
+ 
+ 	wait_queue_head_t	irq_waitq;
++
++	uint8_t			*data_buf;
++	unsigned int		buf_start;
++	int			spare_len;
+ };
+ 
+ /* Define delays in microsec for NAND device operations */
+@@ -227,23 +229,11 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
+ }
+ 
+ static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
+-			int spare_only, unsigned int ops)
++		unsigned int ops)
+ {
+-	DEBUG(MTD_DEBUG_LEVEL3, "send_page (%d)\n", spare_only);
+-
+ 	/* NANDFC buffer 0 is used for page read/write */
+ 	writew(buf_id, host->regs + NFC_BUF_ADDR);
+ 
+-	/* Configure spare or page+spare access */
+-	if (!host->pagesize_2k) {
+-		uint16_t config1 = readw(host->regs + NFC_CONFIG1);
+-		if (spare_only)
+-			config1 |= NFC_SP_EN;
+-		else
+-			config1 &= ~(NFC_SP_EN);
+-		writew(config1, host->regs + NFC_CONFIG1);
+-	}
+-
+ 	writew(ops, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+@@ -278,6 +268,7 @@ static void send_read_id(struct mxc_nand_host *host)
+ 		writeb(readb(main_buf + 8), main_buf + 4);
+ 		writeb(readb(main_buf + 10), main_buf + 5);
+ 	}
++	memcpy(host->data_buf, host->regs + MAIN_AREA0, 16);
+ }
+ 
+ /* This function requests the NANDFC to perform a read of the
+@@ -363,32 +354,14 @@ static u_char mxc_nand_read_byte(struct mtd_info *mtd)
+ {
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+-	uint8_t ret = 0;
+-	uint16_t col, rd_word;
+-	uint16_t __iomem *main_buf = host->regs + MAIN_AREA0;
+-	uint16_t __iomem *spare_buf = host->regs + SPARE_AREA0;
++	uint8_t ret;
+ 
+ 	/* Check for status request */
+ 	if (host->status_request)
+ 		return get_dev_status(host) & 0xFF;
+ 
+-	/* Get column for 16-bit access */
+-	col = host->col_addr >> 1;
+-
+-	/* If we are accessing the spare region */
+-	if (host->spare_only)
+-		rd_word = readw(&spare_buf[col]);
+-	else
+-		rd_word = readw(&main_buf[col]);
+-
+-	/* Pick upper/lower byte of word from RAM buffer */
+-	if (host->col_addr & 0x1)
+-		ret = (rd_word >> 8) & 0xFF;
+-	else
+-		ret = rd_word & 0xFF;
+-
+-	/* Update saved column address */
+-	host->col_addr++;
++	ret = *(uint8_t *)(host->data_buf + host->buf_start);
++	host->buf_start++;
+ 
+ 	return ret;
+ }
+@@ -397,33 +370,10 @@ static uint16_t mxc_nand_read_word(struct mtd_info *mtd)
+ {
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+-	uint16_t col, rd_word, ret;
+-	uint16_t __iomem *p;
++	uint16_t ret;
+ 
+-	DEBUG(MTD_DEBUG_LEVEL3,
+-	      "mxc_nand_read_word(col = %d)\n", host->col_addr);
+-
+-	col = host->col_addr;
+-	/* Adjust saved column address */
+-	if (col < mtd->writesize && host->spare_only)
+-		col += mtd->writesize;
+-
+-	if (col < mtd->writesize)
+-		p = (host->regs + MAIN_AREA0) + (col >> 1);
+-	else
+-		p = (host->regs + SPARE_AREA0) + ((col - mtd->writesize) >> 1);
+-
+-	if (col & 1) {
+-		rd_word = readw(p);
+-		ret = (rd_word >> 8) & 0xff;
+-		rd_word = readw(&p[1]);
+-		ret |= (rd_word << 8) & 0xff00;
+-
+-	} else
+-		ret = readw(p);
+-
+-	/* Update saved column address */
+-	host->col_addr = col + 2;
++	ret = *(uint16_t *)(host->data_buf + host->buf_start);
++	host->buf_start += 2;
+ 
+ 	return ret;
+ }
+@@ -436,94 +386,14 @@ static void mxc_nand_write_buf(struct mtd_info *mtd,
+ {
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+-	int n, col, i = 0;
+-
+-	DEBUG(MTD_DEBUG_LEVEL3,
+-	      "mxc_nand_write_buf(col = %d, len = %d)\n", host->col_addr,
+-	      len);
+-
+-	col = host->col_addr;
+-
+-	/* Adjust saved column address */
+-	if (col < mtd->writesize && host->spare_only)
+-		col += mtd->writesize;
+-
+-	n = mtd->writesize + mtd->oobsize - col;
+-	n = min(len, n);
+-
+-	DEBUG(MTD_DEBUG_LEVEL3,
+-	      "%s:%d: col = %d, n = %d\n", __func__, __LINE__, col, n);
+-
+-	while (n) {
+-		void __iomem *p;
+-
+-		if (col < mtd->writesize)
+-			p = host->regs + MAIN_AREA0 + (col & ~3);
+-		else
+-			p = host->regs + SPARE_AREA0 -
+-						mtd->writesize + (col & ~3);
+-
+-		DEBUG(MTD_DEBUG_LEVEL3, "%s:%d: p = %p\n", __func__,
+-		      __LINE__, p);
+-
+-		if (((col | (int)&buf[i]) & 3) || n < 16) {
+-			uint32_t data = 0;
+-
+-			if (col & 3 || n < 4)
+-				data = readl(p);
+-
+-			switch (col & 3) {
+-			case 0:
+-				if (n) {
+-					data = (data & 0xffffff00) |
+-					    (buf[i++] << 0);
+-					n--;
+-					col++;
+-				}
+-			case 1:
+-				if (n) {
+-					data = (data & 0xffff00ff) |
+-					    (buf[i++] << 8);
+-					n--;
+-					col++;
+-				}
+-			case 2:
+-				if (n) {
+-					data = (data & 0xff00ffff) |
+-					    (buf[i++] << 16);
+-					n--;
+-					col++;
+-				}
+-			case 3:
+-				if (n) {
+-					data = (data & 0x00ffffff) |
+-					    (buf[i++] << 24);
+-					n--;
+-					col++;
+-				}
+-			}
+-
+-			writel(data, p);
+-		} else {
+-			int m = mtd->writesize - col;
++	u16 col = host->buf_start;
++	int n = mtd->oobsize + mtd->writesize - col;
+ 
+-			if (col >= mtd->writesize)
+-				m += mtd->oobsize;
++	n = min(n, len);
+ 
+-			m = min(n, m) & ~3;
++	memcpy(host->data_buf + col, buf, n);
+ 
+-			DEBUG(MTD_DEBUG_LEVEL3,
+-			      "%s:%d: n = %d, m = %d, i = %d, col = %d\n",
+-			      __func__,  __LINE__, n, m, i, col);
+-
+-			memcpy(p, &buf[i], m);
+-			col += m;
+-			i += m;
+-			n -= m;
+-		}
+-	}
+-	/* Update saved column address */
+-	host->col_addr = col;
++	host->buf_start += n;
+ }
+ 
+ /* Read the data buffer from the NAND Flash. To read the data from NAND
+@@ -534,75 +404,14 @@ static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+ {
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+-	int n, col, i = 0;
++	u16 col = host->buf_start;
++	int n = mtd->oobsize + mtd->writesize - col;
+ 
+-	DEBUG(MTD_DEBUG_LEVEL3,
+-	      "mxc_nand_read_buf(col = %d, len = %d)\n", host->col_addr, len);
+-
+-	col = host->col_addr;
+-
+-	/* Adjust saved column address */
+-	if (col < mtd->writesize && host->spare_only)
+-		col += mtd->writesize;
+-
+-	n = mtd->writesize + mtd->oobsize - col;
+-	n = min(len, n);
+-
+-	while (n) {
+-		void __iomem *p;
+-
+-		if (col < mtd->writesize)
+-			p = host->regs + MAIN_AREA0 + (col & ~3);
+-		else
+-			p = host->regs + SPARE_AREA0 -
+-					mtd->writesize + (col & ~3);
+-
+-		if (((col | (int)&buf[i]) & 3) || n < 16) {
+-			uint32_t data;
+-
+-			data = readl(p);
+-			switch (col & 3) {
+-			case 0:
+-				if (n) {
+-					buf[i++] = (uint8_t) (data);
+-					n--;
+-					col++;
+-				}
+-			case 1:
+-				if (n) {
+-					buf[i++] = (uint8_t) (data >> 8);
+-					n--;
+-					col++;
+-				}
+-			case 2:
+-				if (n) {
+-					buf[i++] = (uint8_t) (data >> 16);
+-					n--;
+-					col++;
+-				}
+-			case 3:
+-				if (n) {
+-					buf[i++] = (uint8_t) (data >> 24);
+-					n--;
+-					col++;
+-				}
+-			}
+-		} else {
+-			int m = mtd->writesize - col;
++	n = min(n, len);
+ 
+-			if (col >= mtd->writesize)
+-				m += mtd->oobsize;
+-
+-			m = min(n, m) & ~3;
+-			memcpy(&buf[i], p, m);
+-			col += m;
+-			i += m;
+-			n -= m;
+-		}
+-	}
+-	/* Update saved column address */
+-	host->col_addr = col;
++	memcpy(buf, host->data_buf + col, len);
+ 
++	host->buf_start += len;
+ }
+ 
+ /* Used by the upper layer to verify the data in NAND Flash
+@@ -641,6 +450,36 @@ static void mxc_nand_select_chip(struct mtd_info *mtd, int chip)
+ 	}
+ }
+ 
++/*
++ * Function to transfer data to/from spare area.
++ */
++static void copy_spare(struct mtd_info *mtd, bool bfrom)
++{
++	struct nand_chip *this = mtd->priv;
++	struct mxc_nand_host *host = this->priv;
++	u16 i, j;
++	u16 n = mtd->writesize >> 9;
++	u8 *d = host->data_buf + mtd->writesize;
++	u8 *s = host->regs + SPARE_AREA0;
++	u16 t = host->spare_len;
++
++	j = (mtd->oobsize / n >> 1) << 1;
++
++	if (bfrom) {
++		for (i = 0; i < n - 1; i++)
++			memcpy(d + i * j, s + i * t, j);
++
++		/* the last section */
++		memcpy(d + i * j, s + i * t, mtd->oobsize - i * j);
++	} else {
++		for (i = 0; i < n - 1; i++)
++			memcpy(&s[i * t], &d[i * j], j);
++
++		/* the last section */
++		memcpy(&s[i * t], &d[i * j], mtd->oobsize - i * j);
++	}
++}
++
+ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
+ {
+ 	struct nand_chip *nand_chip = mtd->priv;
+@@ -707,19 +546,18 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 	switch (command) {
+ 
+ 	case NAND_CMD_STATUS:
+-		host->col_addr = 0;
++		host->buf_start = 0;
+ 		host->status_request = true;
+ 		break;
+ 
+ 	case NAND_CMD_READ0:
+-		host->col_addr = column;
+-		host->spare_only = false;
++		host->buf_start = column;
+ 		useirq = false;
+ 		break;
+ 
+ 	case NAND_CMD_READOOB:
+-		host->col_addr = column;
+-		host->spare_only = true;
++		host->buf_start = column + mtd->writesize;
++
+ 		useirq = false;
+ 		if (host->pagesize_2k)
+ 			command = NAND_CMD_READ0; /* only READ0 is valid */
+@@ -739,15 +577,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 				mxc_nand_command(mtd, NAND_CMD_READ0, 0,
+ 						page_addr);
+ 
+-			host->col_addr = column - mtd->writesize;
+-			host->spare_only = true;
++			host->buf_start = column;
+ 
+ 			/* Set program pointer to spare region */
+ 			if (!host->pagesize_2k)
+ 				send_cmd(host, NAND_CMD_READOOB, false);
+ 		} else {
+-			host->spare_only = false;
+-			host->col_addr = column;
++			host->buf_start = column;
+ 
+ 			/* Set program pointer to page start */
+ 			if (!host->pagesize_2k)
+@@ -757,13 +593,15 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 		break;
+ 
+ 	case NAND_CMD_PAGEPROG:
+-		send_page(host, 0, host->spare_only, NFC_INPUT);
++		memcpy(host->regs + MAIN_AREA0, host->data_buf, mtd->writesize);
++		copy_spare(mtd, false);
++		send_page(host, 0, NFC_INPUT);
+ 
+ 		if (host->pagesize_2k) {
+ 			/* data in 4 areas datas */
+-			send_page(host, 1, host->spare_only, NFC_INPUT);
+-			send_page(host, 2, host->spare_only, NFC_INPUT);
+-			send_page(host, 3, host->spare_only, NFC_INPUT);
++			send_page(host, 1, NFC_INPUT);
++			send_page(host, 2, NFC_INPUT);
++			send_page(host, 3, NFC_INPUT);
+ 		}
+ 
+ 		break;
+@@ -789,16 +627,18 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 			/* send read confirm command */
+ 			send_cmd(host, NAND_CMD_READSTART, true);
+ 			/* read for each AREA */
+-			send_page(host, 0, host->spare_only, NFC_OUTPUT);
+-			send_page(host, 1, host->spare_only, NFC_OUTPUT);
+-			send_page(host, 2, host->spare_only, NFC_OUTPUT);
+-			send_page(host, 3, host->spare_only, NFC_OUTPUT);
++			send_page(host, 0, NFC_OUTPUT);
++			send_page(host, 1, NFC_OUTPUT);
++			send_page(host, 2, NFC_OUTPUT);
++			send_page(host, 3, NFC_OUTPUT);
+ 		} else
+-			send_page(host, 0, host->spare_only, NFC_OUTPUT);
++			send_page(host, 0, NFC_OUTPUT);
++
++		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
++		copy_spare(mtd, true);
+ 		break;
+ 
+ 	case NAND_CMD_READID:
+-		host->col_addr = 0;
+ 		send_read_id(host);
+ 		break;
+ 
+@@ -824,10 +664,14 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	int err = 0, nr_parts = 0;
+ 
+ 	/* Allocate memory for MTD device structure and private data */
+-	host = kzalloc(sizeof(struct mxc_nand_host), GFP_KERNEL);
++	host = kzalloc(sizeof(struct mxc_nand_host) + NAND_MAX_PAGESIZE +
++			NAND_MAX_OOBSIZE, GFP_KERNEL);
+ 	if (!host)
+ 		return -ENOMEM;
+ 
++	host->data_buf = (uint8_t *)(host + 1);
++	host->spare_len = 16;
++
+ 	host->dev = &pdev->dev;
+ 	/* structures must be linked */
+ 	this = &host->nand;
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0010-MXC-NFC-Add-the-clock-resource-to-support-NFC-in-i.patch b/recipes/linux/linux-2.6.31/pcm043/0010-MXC-NFC-Add-the-clock-resource-to-support-NFC-in-i.patch
new file mode 100644
index 0000000..294acbc
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0010-MXC-NFC-Add-the-clock-resource-to-support-NFC-in-i.patch
@@ -0,0 +1,61 @@
+From db1d93750d22c87b588ade0c8e083f8d94ddf88b Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:44:00 +0200
+Subject: [PATCH 10/15] MXC NFC: Add the clock resource to support NFC in i.MX35
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/clock-imx35.c |   30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+Index: arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- arch/arm/mach-mx3/clock-imx35.c.orig	2009-12-08 11:03:44.248614597 +0100
++++ arch/arm/mach-mx3/clock-imx35.c	2009-12-08 11:04:48.958686514 +0100
+@@ -387,6 +387,35 @@
+ DEFINE_CLOCK(iim_clk,    0, CCM_CGR3,  2, NULL, NULL);
+ DEFINE_CLOCK(gpu2d_clk,  0, CCM_CGR3,  4, NULL, NULL);
+ 
++static int clk_dummy_enable(struct clk *clk)
++{
++	return 0;
++}
++
++static void clk_dummy_disable(struct clk *clk)
++{
++}
++
++static unsigned long get_rate_nfc(struct clk *clk)
++{
++	unsigned long div1;
++
++	div1 = (__raw_readl(CCM_BASE + CCM_PDR4) >> 28) + 1;
++
++	return get_rate_ahb(NULL) / div1;
++}
++
++/* NAND Controller: It seems it can't be disabled */
++static struct clk nfc_clk = {
++	.id		= 0,
++	.enable_reg	= 0,
++	.enable_shift	= 0,
++	.get_rate	= get_rate_nfc,
++	.set_rate	= NULL, /* set_rate_nfc, */
++	.enable		= clk_dummy_enable,
++	.disable	= clk_dummy_disable
++};
++
+ #define _REGISTER_CLOCK(d, n, c)	\
+ 	{				\
+ 		.dev_id = d,		\
+@@ -448,6 +477,7 @@
+ 	_REGISTER_CLOCK(NULL, "csi", csi_clk)
+ 	_REGISTER_CLOCK(NULL, "iim", iim_clk)
+ 	_REGISTER_CLOCK(NULL, "gpu2d", gpu2d_clk)
++	_REGISTER_CLOCK("mxc_nand.0", NULL, nfc_clk)
+ };
+ 
+ int __init mx35_clocks_init()
diff --git a/recipes/linux/linux-2.6.31/pcm043/0010-i.MX35-Fix-audmux-clock.patch b/recipes/linux/linux-2.6.31/pcm043/0010-i.MX35-Fix-audmux-clock.patch
new file mode 100644
index 0000000..765c783
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0010-i.MX35-Fix-audmux-clock.patch
@@ -0,0 +1,52 @@
+From 4e3f4ad37028ae59f910cff4cf9ce2f1acc62d66 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Mon, 2 Nov 2009 09:49:41 +0100
+Subject: [PATCH 10/28] i.MX35: Fix audmux clock
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/clock-imx35.c |    7 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/clock-imx35.c b/arch/arm/mach-mx3/clock-imx35.c
+index 02b2507..9c0ec17 100644
+--- a/arch/arm/mach-mx3/clock-imx35.c
++++ b/arch/arm/mach-mx3/clock-imx35.c
+@@ -322,7 +322,7 @@ static void clk_cgr_disable(struct clk *clk)
+ 
+ DEFINE_CLOCK(asrc_clk,   0, CCM_CGR0,  0, NULL, NULL);
+ DEFINE_CLOCK(ata_clk,    0, CCM_CGR0,  2, get_rate_ipg, NULL);
+-DEFINE_CLOCK(audmux_clk, 0, CCM_CGR0,  4, NULL, NULL);
++/* DEFINE_CLOCK(audmux_clk, 0, CCM_CGR0,  4, NULL, NULL); */
+ DEFINE_CLOCK(can1_clk,   0, CCM_CGR0,  6, get_rate_ipg, NULL);
+ DEFINE_CLOCK(can2_clk,   1, CCM_CGR0,  8, get_rate_ipg, NULL);
+ DEFINE_CLOCK(cspi1_clk,  0, CCM_CGR0, 10, get_rate_ipg, NULL);
+@@ -368,7 +368,7 @@ DEFINE_CLOCK(uart3_clk,  2, CCM_CGR2, 20, get_rate_uart, NULL);
+ DEFINE_CLOCK(usbotg_clk, 0, CCM_CGR2, 22, NULL, NULL);
+ DEFINE_CLOCK(wdog_clk,   0, CCM_CGR2, 24, NULL, NULL);
+ DEFINE_CLOCK(max_clk,    0, CCM_CGR2, 26, NULL, NULL);
+-DEFINE_CLOCK(admux_clk,  0, CCM_CGR2, 30, NULL, NULL);
++DEFINE_CLOCK(audmux_clk, 0, CCM_CGR2, 30, NULL, NULL);
+ 
+ DEFINE_CLOCK(csi_clk,    0, CCM_CGR3,  0, get_rate_csi, NULL);
+ DEFINE_CLOCK(iim_clk,    0, CCM_CGR3,  2, NULL, NULL);
+@@ -384,7 +384,6 @@ DEFINE_CLOCK(gpu2d_clk,  0, CCM_CGR3,  4, NULL, NULL);
+ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK(NULL, "asrc", asrc_clk)
+ 	_REGISTER_CLOCK(NULL, "ata", ata_clk)
+-	_REGISTER_CLOCK(NULL, "audmux", audmux_clk)
+ 	_REGISTER_CLOCK(NULL, "can", can1_clk)
+ 	_REGISTER_CLOCK(NULL, "can", can2_clk)
+ 	_REGISTER_CLOCK("spi_imx.0", NULL, cspi1_clk)
+@@ -429,7 +428,7 @@ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK(NULL, "usbotg", usbotg_clk)
+ 	_REGISTER_CLOCK("mxc_wdt.0", NULL, wdog_clk)
+ 	_REGISTER_CLOCK(NULL, "max", max_clk)
+-	_REGISTER_CLOCK(NULL, "admux", admux_clk)
++	_REGISTER_CLOCK(NULL, "audmux", audmux_clk)
+ 	_REGISTER_CLOCK(NULL, "csi", csi_clk)
+ 	_REGISTER_CLOCK(NULL, "iim", iim_clk)
+ 	_REGISTER_CLOCK(NULL, "gpu2d", gpu2d_clk)
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0010-mxc-nand-simplify-command-processing.patch b/recipes/linux/linux-2.6.31/pcm043/0010-mxc-nand-simplify-command-processing.patch
new file mode 100644
index 0000000..a7d5cda
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0010-mxc-nand-simplify-command-processing.patch
@@ -0,0 +1,143 @@
+From c1aef45fdb7e5281904ea25c035025d6cc19eff6 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 17:18:01 +0200
+Subject: [PATCH] mxc nand: simplify command processing
+
+Instead of having two switch/case with other operations
+in between, use only one switch/case
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   81 ++++++++++++++++++------------------------
+ 1 files changed, 35 insertions(+), 46 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 4c338ae..e5de71a 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -533,7 +533,6 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ {
+ 	struct nand_chip *nand_chip = mtd->priv;
+ 	struct mxc_nand_host *host = nand_chip->priv;
+-	int useirq = true;
+ 
+ 	DEBUG(MTD_DEBUG_LEVEL3,
+ 	      "mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
+@@ -548,19 +547,37 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 	case NAND_CMD_STATUS:
+ 		host->buf_start = 0;
+ 		host->status_request = true;
+-		break;
+ 
+-	case NAND_CMD_READ0:
+-		host->buf_start = column;
+-		useirq = false;
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		break;
+ 
++	case NAND_CMD_READ0:
+ 	case NAND_CMD_READOOB:
+-		host->buf_start = column + mtd->writesize;
++		if (command == NAND_CMD_READ0)
++			host->buf_start = column;
++		else
++			host->buf_start = column + mtd->writesize;
+ 
+-		useirq = false;
+ 		if (host->pagesize_2k)
+ 			command = NAND_CMD_READ0; /* only READ0 is valid */
++
++		send_cmd(host, command, false);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++
++		if (host->pagesize_2k) {
++			/* send read confirm command */
++			send_cmd(host, NAND_CMD_READSTART, true);
++			/* read for each AREA */
++			send_page(host, 0, NFC_OUTPUT);
++			send_page(host, 1, NFC_OUTPUT);
++			send_page(host, 2, NFC_OUTPUT);
++			send_page(host, 3, NFC_OUTPUT);
++		} else
++			send_page(host, 0, NFC_OUTPUT);
++
++		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
++		copy_spare(mtd, true);
+ 		break;
+ 
+ 	case NAND_CMD_SEQIN:
+@@ -589,7 +606,9 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 			if (!host->pagesize_2k)
+ 				send_cmd(host, NAND_CMD_READ0, false);
+ 		}
+-		useirq = false;
++
++		send_cmd(host, command, false);
++		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		break;
+ 
+ 	case NAND_CMD_PAGEPROG:
+@@ -604,51 +623,21 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 			send_page(host, 3, NFC_INPUT);
+ 		}
+ 
+-		break;
+-
+-	case NAND_CMD_ERASE1:
+-		useirq = false;
+-		break;
+-	}
+-
+-	/* Write out the command to the device. */
+-	send_cmd(host, command, useirq);
+-	mxc_do_addr_cycle(mtd, column, page_addr);
+-
+-	/* Command post-processing step */
+-	switch (command) {
+-
+-	case NAND_CMD_RESET:
+-		break;
+-
+-	case NAND_CMD_READOOB:
+-	case NAND_CMD_READ0:
+-		if (host->pagesize_2k) {
+-			/* send read confirm command */
+-			send_cmd(host, NAND_CMD_READSTART, true);
+-			/* read for each AREA */
+-			send_page(host, 0, NFC_OUTPUT);
+-			send_page(host, 1, NFC_OUTPUT);
+-			send_page(host, 2, NFC_OUTPUT);
+-			send_page(host, 3, NFC_OUTPUT);
+-		} else
+-			send_page(host, 0, NFC_OUTPUT);
+-
+-		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
+-		copy_spare(mtd, true);
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		break;
+ 
+ 	case NAND_CMD_READID:
++		send_cmd(host, command, true);
++		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		send_read_id(host);
+ 		break;
+ 
+-	case NAND_CMD_PAGEPROG:
+-		break;
+-
+-	case NAND_CMD_STATUS:
+-		break;
+-
++	case NAND_CMD_ERASE1:
+ 	case NAND_CMD_ERASE2:
++		send_cmd(host, command, false);
++		mxc_do_addr_cycle(mtd, column, page_addr);
++
+ 		break;
+ 	}
+ }
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0011-MX31-add-spi-controller-devices-resources.patch b/recipes/linux/linux-2.6.31/pcm043/0011-MX31-add-spi-controller-devices-resources.patch
new file mode 100644
index 0000000..66e425b
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0011-MX31-add-spi-controller-devices-resources.patch
@@ -0,0 +1,97 @@
+From 5a3ba6a98a5822698ad4552a4af47b3230807952 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 19 Dec 2008 14:32:15 +0100
+Subject: [PATCH 11/28] MX31: add spi controller devices/resources
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/devices.c |   61 +++++++++++++++++++++++++++++++++++++++++++
+ arch/arm/mach-mx3/devices.h |    3 ++
+ 2 files changed, 64 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/devices.c b/arch/arm/mach-mx3/devices.c
+index 06dab5f..c32049a 100644
+--- a/arch/arm/mach-mx3/devices.c
++++ b/arch/arm/mach-mx3/devices.c
+@@ -454,6 +454,67 @@ struct platform_device imx_ssi_device1 = {
+ 	.resource = imx_ssi_resources1,
+ };
+ 
++/*
++ * SPI master controller
++ * 3 channels
++ */
++static struct resource imx_spi_0_resources[] = {
++	{
++	       .start = CSPI1_BASE_ADDR,
++	       .end = CSPI1_BASE_ADDR + SZ_4K - 1,
++	       .flags = IORESOURCE_MEM,
++	}, {
++	       .start = MXC_INT_CSPI1,
++	       .end = MXC_INT_CSPI1,
++	       .flags = IORESOURCE_IRQ,
++	},
++};
++
++static struct resource imx_spi_1_resources[] = {
++	{
++		.start = CSPI2_BASE_ADDR,
++		.end = CSPI2_BASE_ADDR + SZ_4K - 1,
++		.flags = IORESOURCE_MEM,
++	}, {
++		.start = MXC_INT_CSPI2,
++		.end = MXC_INT_CSPI2,
++		.flags = IORESOURCE_IRQ,
++	},
++};
++
++static struct resource imx_spi_2_resources[] = {
++	{
++		.start = CSPI3_BASE_ADDR,
++		.end = CSPI3_BASE_ADDR + SZ_4K - 1,
++		.flags = IORESOURCE_MEM,
++	}, {
++		.start = MXC_INT_CSPI3,
++		.end = MXC_INT_CSPI3,
++		.flags = IORESOURCE_IRQ,
++	},
++};
++
++struct platform_device imx_spi_device0 = {
++	.name = "spi_imx",
++	.id = 0,
++	.num_resources = ARRAY_SIZE(imx_spi_0_resources),
++	.resource = imx_spi_0_resources,
++};
++
++struct platform_device imx_spi_device1 = {
++	.name = "spi_imx",
++	.id = 1,
++	.num_resources = ARRAY_SIZE(imx_spi_1_resources),
++	.resource = imx_spi_1_resources,
++};
++
++struct platform_device imx_spi_device2 = {
++	.name = "spi_imx",
++	.id = 2,
++	.num_resources = ARRAY_SIZE(imx_spi_2_resources),
++	.resource = imx_spi_2_resources,
++};
++
+ static int mx3_devices_init(void)
+ {
+ 	if (cpu_is_mx31()) {
+diff --git a/arch/arm/mach-mx3/devices.h b/arch/arm/mach-mx3/devices.h
+index 224c2eb..402b60e 100644
+--- a/arch/arm/mach-mx3/devices.h
++++ b/arch/arm/mach-mx3/devices.h
+@@ -19,3 +19,6 @@ extern struct platform_device mxc_otg_udc_device;
+ extern struct platform_device mxc_rnga_device;
+ extern struct platform_device imx_ssi_device0;
+ extern struct platform_device imx_ssi_device1;
++extern struct platform_device imx_spi_device0;
++extern struct platform_device imx_spi_device1;
++extern struct platform_device imx_spi_device2;
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0011-MXC-NFC-Fix-NFC-s-clock-name.patch b/recipes/linux/linux-2.6.31/pcm043/0011-MXC-NFC-Fix-NFC-s-clock-name.patch
new file mode 100644
index 0000000..a2e1d28
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0011-MXC-NFC-Fix-NFC-s-clock-name.patch
@@ -0,0 +1,28 @@
+From 3a28735748fbdeb6c8036f8f64998a4d44ab9228 Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:47:34 +0200
+Subject: [PATCH 11/15] MXC NFC: Fix NFC's clock name
+
+Use a name in a style like all other clocks.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index 3891d9a..bab3712 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -858,7 +858,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	this->read_buf = mxc_nand_read_buf;
+ 	this->verify_buf = mxc_nand_verify_buf;
+ 
+-	host->clk = clk_get(&pdev->dev, "nfc_clk");
++	host->clk = clk_get(&pdev->dev, NULL);
+ 	if (IS_ERR(host->clk)) {
+ 		err = PTR_ERR(host->clk);
+ 		goto eclk;
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0011-mxc-nand-modify-send_page-to-send-all-pages-not-on.patch b/recipes/linux/linux-2.6.31/pcm043/0011-mxc-nand-modify-send_page-to-send-all-pages-not-on.patch
new file mode 100644
index 0000000..80979a8
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0011-mxc-nand-modify-send_page-to-send-all-pages-not-on.patch
@@ -0,0 +1,87 @@
+From 19cd65a26dafcb725b0b3c99b0a0d79534c8c460 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 4 Jun 2009 17:25:53 +0200
+Subject: [PATCH] mxc nand: modify send_page to send all pages, not only one
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   45 +++++++++++++++++++-----------------------
+ 1 files changed, 20 insertions(+), 25 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index e5de71a..04b2bf2 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -228,16 +228,25 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
+ 	wait_op_done(host, TROP_US_DELAY, islast);
+ }
+ 
+-static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
+-		unsigned int ops)
++static void send_page(struct mxc_nand_host *host, unsigned int ops)
+ {
+-	/* NANDFC buffer 0 is used for page read/write */
+-	writew(buf_id, host->regs + NFC_BUF_ADDR);
++	int bufs, i;
+ 
+-	writew(ops, host->regs + NFC_CONFIG2);
++	if (host->pagesize_2k)
++		bufs = 4;
++	else
++		bufs = 1;
+ 
+-	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, true);
++	for (i = 0; i < bufs; i++) {
++
++		/* NANDFC buffer 0 is used for page read/write */
++		writew(i, host->regs + NFC_BUF_ADDR);
++
++		writew(ops, host->regs + NFC_CONFIG2);
++
++		/* Wait for operation to complete */
++		wait_op_done(host, TROP_US_DELAY, true);
++	}
+ }
+ 
+ /* Request the NANDFC to perform a read of the NAND device ID. */
+@@ -565,16 +574,10 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 		send_cmd(host, command, false);
+ 		mxc_do_addr_cycle(mtd, column, page_addr);
+ 
+-		if (host->pagesize_2k) {
+-			/* send read confirm command */
++		if (host->pagesize_2k)
+ 			send_cmd(host, NAND_CMD_READSTART, true);
+-			/* read for each AREA */
+-			send_page(host, 0, NFC_OUTPUT);
+-			send_page(host, 1, NFC_OUTPUT);
+-			send_page(host, 2, NFC_OUTPUT);
+-			send_page(host, 3, NFC_OUTPUT);
+-		} else
+-			send_page(host, 0, NFC_OUTPUT);
++
++		send_page(host, NFC_OUTPUT);
+ 
+ 		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
+ 		copy_spare(mtd, true);
+@@ -614,15 +617,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 	case NAND_CMD_PAGEPROG:
+ 		memcpy(host->regs + MAIN_AREA0, host->data_buf, mtd->writesize);
+ 		copy_spare(mtd, false);
+-		send_page(host, 0, NFC_INPUT);
+-
+-		if (host->pagesize_2k) {
+-			/* data in 4 areas datas */
+-			send_page(host, 1, NFC_INPUT);
+-			send_page(host, 2, NFC_INPUT);
+-			send_page(host, 3, NFC_INPUT);
+-		}
+-
++		send_page(host, NFC_INPUT);
+ 		send_cmd(host, command, true);
+ 		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		break;
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0012-MXC-NFC-i.MX35-can-work-with-the-v2-not-with-v1-of.patch b/recipes/linux/linux-2.6.31/pcm043/0012-MXC-NFC-i.MX35-can-work-with-the-v2-not-with-v1-of.patch
new file mode 100644
index 0000000..9a88af0
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0012-MXC-NFC-i.MX35-can-work-with-the-v2-not-with-v1-of.patch
@@ -0,0 +1,34 @@
+From 0013249e16bc7527bf63b483486ead97ea59839e Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 15:49:52 +0200
+Subject: [PATCH 12/15] MXC NFC: i.MX35 can work with the v2, not with v1 of this driver
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ drivers/mtd/nand/Kconfig |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: drivers/mtd/nand/Kconfig
+===================================================================
+--- drivers/mtd/nand/Kconfig.orig	2009-12-08 10:02:59.468654404 +0100
++++ drivers/mtd/nand/Kconfig	2009-12-08 10:03:38.130073936 +0100
+@@ -421,14 +421,14 @@
+ 
+ config MTD_NAND_MXC
+ 	tristate "MXC NAND support"
+-	depends on ARCH_MX2 || ARCH_MX3
++	depends on ARCH_MX2 || (ARCH_MX3 && !ARCH_MX35)
+ 	help
+ 	  This enables the driver for the NAND flash controller on the
+ 	  MXC processors.
+ 
+ config MTD_NAND_MXC_V2
+ 	tristate "MXC NAND support"
+-	depends on ARCH_MX25
++	depends on ARCH_MX25 || ARCH_MX35
+ 	help
+ 	  This enables the driver for the NAND flash controller on the
+ 	  MXC processors.
diff --git a/recipes/linux/linux-2.6.31/pcm043/0012-i.MX27-clock-rename-spi-clocks-to-match-device.patch b/recipes/linux/linux-2.6.31/pcm043/0012-i.MX27-clock-rename-spi-clocks-to-match-device.patch
new file mode 100644
index 0000000..db2474c
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0012-i.MX27-clock-rename-spi-clocks-to-match-device.patch
@@ -0,0 +1,30 @@
+From 3e3ef3c8c617d291bb674488cd2920ad9088451e Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 24 Sep 2009 09:58:52 +0200
+Subject: [PATCH 12/28] i.MX27 clock: rename spi clocks to match device
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/clock_imx27.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-mx2/clock_imx27.c b/arch/arm/mach-mx2/clock_imx27.c
+index 5abb763..1e9d608 100644
+--- a/arch/arm/mach-mx2/clock_imx27.c
++++ b/arch/arm/mach-mx2/clock_imx27.c
+@@ -638,9 +638,9 @@ static struct clk_lookup lookups[] = {
+ 	_REGISTER_CLOCK("mxc-mmc.0", NULL, sdhc1_clk)
+ 	_REGISTER_CLOCK("mxc-mmc.1", NULL, sdhc2_clk)
+ 	_REGISTER_CLOCK("mxc-mmc.2", NULL, sdhc3_clk)
+-	_REGISTER_CLOCK(NULL, "cspi1", cspi1_clk)
+-	_REGISTER_CLOCK(NULL, "cspi2", cspi2_clk)
+-	_REGISTER_CLOCK(NULL, "cspi3", cspi3_clk)
++	_REGISTER_CLOCK("spi_imx.0", NULL, cspi1_clk)
++	_REGISTER_CLOCK("spi_imx.1", NULL, cspi2_clk)
++	_REGISTER_CLOCK("spi_imx.2", NULL, cspi3_clk)
+ 	_REGISTER_CLOCK("imx-fb.0", NULL, lcdc_clk)
+ 	_REGISTER_CLOCK(NULL, "csi", csi_clk)
+ 	_REGISTER_CLOCK(NULL, "usb", usb_clk)
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0012-mxc_nand-remove-unused-defines.patch b/recipes/linux/linux-2.6.31/pcm043/0012-mxc_nand-remove-unused-defines.patch
new file mode 100644
index 0000000..8b4a438
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0012-mxc_nand-remove-unused-defines.patch
@@ -0,0 +1,31 @@
+From cf903eff4c30f2eca4a67951f5b66e961f0ba542 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 5 Jun 2009 10:55:32 +0200
+Subject: [PATCH] mxc_nand: remove unused defines
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |    7 -------
+ 1 files changed, 0 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 04b2bf2..2988f1d 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -122,13 +122,6 @@ struct mxc_nand_host {
+ 
+ /* Define delays in microsec for NAND device operations */
+ #define TROP_US_DELAY   2000
+-/* Macros to get byte and bit positions of ECC */
+-#define COLPOS(x)  ((x) >> 3)
+-#define BITPOS(x) ((x) & 0xf)
+-
+-/* Define single bit Error positions in Main & Spare area */
+-#define MAIN_SINGLEBIT_ERROR 0x4
+-#define SPARE_SINGLEBIT_ERROR 0x1
+ 
+ /* OOB placement block for use with hardware ecc generation */
+ static struct nand_ecclayout nand_hw_eccoob_smallpage = {
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0013-MXC-NFC-Add-the-cpu_is_mx25-macro.patch b/recipes/linux/linux-2.6.31/pcm043/0013-MXC-NFC-Add-the-cpu_is_mx25-macro.patch
new file mode 100644
index 0000000..9fec47b
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0013-MXC-NFC-Add-the-cpu_is_mx25-macro.patch
@@ -0,0 +1,38 @@
+From 6b82a298e085e6bc47d1c241871578d66208ee0f Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 16:10:55 +0200
+Subject: [PATCH 13/15] MXC NFC: Add the cpu_is_mx25 macro
+
+To be able to compile this NFC driver we need all CPU macros to
+distinguish the different revisions of the NFC.
+Note: This macro is untested for the i.MX25 case. Tested for a
+i.MX35 case only.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ arch/arm/plat-mxc/include/mach/mxc.h |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+Index: arch/arm/plat-mxc/include/mach/mxc.h
+===================================================================
+--- arch/arm/plat-mxc/include/mach/mxc.h.orig
++++ arch/arm/plat-mxc/include/mach/mxc.h
+@@ -58,6 +58,18 @@ extern unsigned int __mxc_cpu_type;
+ # define cpu_is_mx21()		(0)
+ #endif
+ 
++#ifdef CONFIG_MACH_MX25
++# ifdef mxc_cpu_type
++#  undef mxc_cpu_type
++#  define mxc_cpu_type __mxc_cpu_type
++# else
++#  define mxc_cpu_type MXC_CPU_MX25
++# endif
++# define cpu_is_mx25()		(mxc_cpu_type == MXC_CPU_MX25)
++#else
++# define cpu_is_mx25()		(0)
++#endif
++
+ #ifdef CONFIG_MACH_MX27
+ # ifdef mxc_cpu_type
+ #  undef mxc_cpu_type
diff --git a/recipes/linux/linux-2.6.31/pcm043/0013-add-a-mc13783-codec-driver.patch b/recipes/linux/linux-2.6.31/pcm043/0013-add-a-mc13783-codec-driver.patch
new file mode 100644
index 0000000..c89b83d
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0013-add-a-mc13783-codec-driver.patch
@@ -0,0 +1,834 @@
+From a0437114fe666815acb9f7573acdcdc36dc45203 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 22 Oct 2009 14:10:14 +0200
+Subject: [PATCH 13/28] add a mc13783 codec driver
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ sound/soc/codecs/Kconfig   |    4 +
+ sound/soc/codecs/Makefile  |    2 +
+ sound/soc/codecs/mc13783.c |  730 ++++++++++++++++++++++++++++++++++++++++++++
+ sound/soc/codecs/mc13783.h |   32 ++
+ 4 files changed, 768 insertions(+), 0 deletions(-)
+ create mode 100644 sound/soc/codecs/mc13783.c
+ create mode 100644 sound/soc/codecs/mc13783.h
+
+diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
+index bbc97fd..34f5c94 100644
+--- a/sound/soc/codecs/Kconfig
++++ b/sound/soc/codecs/Kconfig
+@@ -17,6 +17,7 @@ config SND_SOC_ALL_CODECS
+ 	select SND_SOC_AK4104 if SPI_MASTER
+ 	select SND_SOC_AK4535 if I2C
+ 	select SND_SOC_CS4270 if I2C
++	select SND_SOC_MC13783 if SPI
+ 	select SND_SOC_PCM3008
+ 	select SND_SOC_SPDIF
+ 	select SND_SOC_SSM2602 if I2C
+@@ -89,6 +90,9 @@ config SND_SOC_CS4270_VD33_ERRATA
+ config SND_SOC_L3
+        tristate
+ 
++config SND_SOC_MC13783
++	tristate
++
+ config SND_SOC_PCM3008
+        tristate
+ 
+diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
+index 8b75305..0d3dbc7 100644
+--- a/sound/soc/codecs/Makefile
++++ b/sound/soc/codecs/Makefile
+@@ -5,6 +5,7 @@ snd-soc-ak4104-objs := ak4104.o
+ snd-soc-ak4535-objs := ak4535.o
+ snd-soc-cs4270-objs := cs4270.o
+ snd-soc-l3-objs := l3.o
++snd-soc-mc13783-objs := mc13783.o
+ snd-soc-pcm3008-objs := pcm3008.o
+ snd-soc-spdif-objs := spdif_transciever.o
+ snd-soc-ssm2602-objs := ssm2602.o
+@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_AK4104)	+= snd-soc-ak4104.o
+ obj-$(CONFIG_SND_SOC_AK4535)	+= snd-soc-ak4535.o
+ obj-$(CONFIG_SND_SOC_CS4270)	+= snd-soc-cs4270.o
+ obj-$(CONFIG_SND_SOC_L3)	+= snd-soc-l3.o
++obj-$(CONFIG_SND_SOC_MC13783)	+= snd-soc-mc13783.o
+ obj-$(CONFIG_SND_SOC_PCM3008)	+= snd-soc-pcm3008.o
+ obj-$(CONFIG_SND_SOC_SPDIF)	+= snd-soc-spdif.o
+ obj-$(CONFIG_SND_SOC_SSM2602)	+= snd-soc-ssm2602.o
+diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
+new file mode 100644
+index 0000000..5a7b4e9
+--- /dev/null
++++ b/sound/soc/codecs/mc13783.c
+@@ -0,0 +1,730 @@
++/*
++ * Copyright 2008 Juergen Beisert, kernel@pengutronix.de
++ * Copyright 2009 Sascha Hauer, s.hauer@pengutronix.de
++ *
++ * Initial development of this code was funded by
++ * Phytec Messtechnik GmbH, http://www.phytec.de
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
++ * MA  02110-1301, USA.
++ */
++#include <linux/device.h>
++#include <linux/mfd/mc13783-private.h>
++#include <sound/core.h>
++#include <sound/control.h>
++#include <sound/pcm.h>
++#include <sound/soc.h>
++#include <sound/initval.h>
++#include <sound/soc-dapm.h>
++
++#include "mc13783.h"
++
++#define PMIC_AUDIO_RX_0		36
++#define PMIC_AUDIO_RX_1		37
++#define PMIC_AUDIO_TX		38
++#define PMIC_SSI_NETWORK	39
++#define PMIC_AUDIO_CODEC	40
++#define PMIC_AUDIO_DAC		41
++
++#define SSI_NETWORK_CDCTXRXSLOT(x)	(((x) & 0x3) << 2)
++#define SSI_NETWORK_CDCTXSECSLOT(x)	(((x) & 0x3) << 4)
++#define SSI_NETWORK_CDCRXSECSLOT(x)	(((x) & 0x3) << 6)
++#define SSI_NETWORK_CDCRXSECGAIN(x)	(((x) & 0x3) << 8)
++#define SSI_NETWORK_CDCSUMGAIN(x)	(1 << 10)
++#define SSI_NETWORK_CDCFSDLY(x)		(1 << 11)
++#define SSI_NETWORK_STDCSLOT(x)		(((x) & 0x3) << 12)
++#define SSI_NETWORK_STDCRXSLOT(x)	(((x) & 0x3) << 14)
++#define SSI_NETWORK_STDCRXSECSLOT(x)	(((x) & 0x3) << 16)
++#define SSI_NETWORK_STDCRXSECGAIN(x)	(((x) & 0x3) << 18)
++#define SSI_NETWORK_STDCSUMGAIN		(1 << 20)
++
++#define STEREO_DAC_STD_SSI_SEL		(1 << 0)
++#define STEREO_DAC_STD_CLK_SEL		(1 << 1)
++#define STEREO_DAC_STD_CSM		(1 << 2)
++#define STEREO_DAC_STD_BCL_INV		(1 << 3)
++#define STEREO_DAC_STD_CFS_INV		(1 << 4)
++#define STEREO_DAC_STD_CFS(x)		(((x) & 0x3) << 5)
++#define STEREO_DAC_STD_CLK(x)		(((x) & 0x7) << 7)
++#define STEREO_DAC_STD_CFS_DLY_B	(1 << 10)
++#define STEREO_DAC_STD_C_EN		(1 << 11)
++#define STEREO_DAC_STD_C_CLK_EN		(1 << 12)
++#define STEREO_DAC_STD_C_RESET		(1 << 15)
++#define STEREO_DAC_SPDIF		(1 << 16)
++#define STEREO_DAC_SR(x)		(((x) & 0xf) << 17)
++
++static struct mc13783 *mc13783;
++
++struct mc13783_priv {
++	struct snd_soc_codec codec;
++
++	u32 reg_cache[42];
++
++	int mc13783_asp_val;
++	int mc13783_alsp_val;
++};
++
++static unsigned int mc13783_read(struct snd_soc_codec *codec,
++	unsigned int reg)
++{
++	struct mc13783_priv *priv = codec->private_data;
++
++	return priv->reg_cache[reg];
++}
++
++static int mc13783_write(struct snd_soc_codec *codec,
++	unsigned int reg, unsigned int value)
++{
++	struct mc13783_priv *priv = codec->private_data;
++
++	priv->reg_cache[reg] = value;
++
++	return mc13783_reg_write(mc13783, reg, value);
++}
++
++/* Mapping between sample rates and register value */
++static unsigned int mc13783_rates[] = {
++	8000, 11025, 12000, 16000,
++	22050, 24000, 32000, 44100,
++	48000, 64000, 96000
++};
++
++static int mc13783_pcm_hw_params(struct snd_pcm_substream *substream,
++				struct snd_pcm_hw_params *params,
++				struct snd_soc_dai *dai)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct snd_soc_device *socdev = rtd->socdev;
++	struct snd_soc_codec *codec = socdev->card->codec;
++	unsigned int rate = params_rate(params);
++	int i;
++	unsigned int reg;
++
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		for (i = 0; i < ARRAY_SIZE(mc13783_rates); i++) {
++			if (rate == mc13783_rates[i]) {
++				snd_soc_update_bits(codec, PMIC_AUDIO_DAC,
++						0xf << 17, i << 17);
++				return 0;
++			}
++		}
++	} else {
++		if (rate == 8000)
++			reg = 0;
++		else
++			reg = (1 << 10);
++
++		snd_soc_update_bits(codec, PMIC_AUDIO_CODEC,
++				0x1 << 10, reg);
++
++		return 0;
++	}
++
++	return -EINVAL;
++}
++
++static int mc13783_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
++{
++	struct snd_soc_codec *codec = dai->codec;
++	unsigned int reg;
++
++	if (dai->id == MC13783_ID_STEREO_DAC)
++		reg = mc13783_read(codec, PMIC_AUDIO_DAC);
++	else
++		reg = mc13783_read(codec, PMIC_AUDIO_CODEC);
++
++	reg &= ~STEREO_DAC_STD_CFS(3);
++	reg &= ~STEREO_DAC_STD_BCL_INV;
++	reg &= ~STEREO_DAC_STD_CFS_INV;
++	reg &= ~STEREO_DAC_STD_CSM;
++	reg &= ~STEREO_DAC_STD_C_CLK_EN;
++
++	/* DAI mode */
++	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
++	case SND_SOC_DAIFMT_I2S:
++		reg |= STEREO_DAC_STD_CFS(2);
++		break;
++	case SND_SOC_DAIFMT_DSP_A:
++		reg |= STEREO_DAC_STD_CFS(1);
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	/* DAI clock inversion */
++	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
++	case SND_SOC_DAIFMT_NB_NF:
++		reg |= STEREO_DAC_STD_BCL_INV;
++		break;
++	case SND_SOC_DAIFMT_NB_IF:
++		reg |= STEREO_DAC_STD_BCL_INV;
++		reg |= STEREO_DAC_STD_CFS_INV;
++		break;
++	case SND_SOC_DAIFMT_IB_NF:
++		break;
++	case SND_SOC_DAIFMT_IB_IF:
++		reg |= STEREO_DAC_STD_CFS_INV;
++		break;
++	}
++
++	/* DAI clock master masks */
++	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
++	case SND_SOC_DAIFMT_CBM_CFM:
++		reg |= STEREO_DAC_STD_C_CLK_EN;
++		break;
++	case SND_SOC_DAIFMT_CBS_CFS:
++		reg |= STEREO_DAC_STD_CSM;
++	case SND_SOC_DAIFMT_CBM_CFS:
++	case SND_SOC_DAIFMT_CBS_CFM:
++		return -EINVAL;
++	}
++
++	reg |= STEREO_DAC_STD_C_EN;	/* DAC power up */
++	reg |= STEREO_DAC_STD_C_RESET;	/* reset filter */
++
++	if (dai->id == MC13783_ID_STEREO_DAC)
++		mc13783_write(codec, PMIC_AUDIO_DAC, reg);
++	else
++		mc13783_write(codec, PMIC_AUDIO_CODEC, reg);
++
++	return 0;
++}
++
++static int mc13783_set_sysclk(struct snd_soc_dai *dai,
++				  int clk_id, unsigned int freq, int dir)
++{
++	struct snd_soc_codec *codec = dai->codec;
++	int clk;
++	unsigned int reg;
++
++	if (dai->id == MC13783_ID_STEREO_DAC)
++		reg = mc13783_read(codec, PMIC_AUDIO_DAC);
++	else
++		reg = mc13783_read(codec, PMIC_AUDIO_CODEC);
++
++	reg &= ~STEREO_DAC_STD_CLK(0x7);
++	reg &= ~STEREO_DAC_STD_CLK_SEL;
++
++	switch (freq) {
++	case 13000000:
++		clk = 0;
++		break;
++	case 15360000:
++		clk = 1;
++		break;
++	case 16800000:
++		clk = 2;
++		break;
++	case 26000000:
++		clk = 4;
++		break;
++	case 12000000:
++		clk = 5;
++		break;
++	case  3686400:
++		clk = 6;
++		break;
++	case 33600000:
++		clk = 7;
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	if (clk_id == MC13783_CLK_CLIB)
++		reg |= STEREO_DAC_STD_CLK_SEL;
++
++	reg |= STEREO_DAC_STD_CLK(clk);
++
++	if (dai->id == MC13783_ID_STEREO_DAC)
++		mc13783_write(codec, PMIC_AUDIO_DAC, reg);
++	else
++		mc13783_write(codec, PMIC_AUDIO_CODEC, reg);
++
++	return 0;
++}
++
++static int mc13783_set_tdm_slot_codec(struct snd_soc_dai *dai,
++	unsigned int mask, int slots)
++{
++	struct snd_soc_codec *codec = dai->codec;
++	unsigned int reg;
++
++	if (slots != 4)
++		return -EINVAL;
++
++	reg = mc13783_read(codec, PMIC_SSI_NETWORK);
++
++	reg &= ~(0xfff << 0);
++	reg |= (0x00 << 2);	/* primary timeslot RX/TX(?) is 0 */
++	reg |= (0x01 << 4);	/* secondary timeslot TX is 1 */
++	reg |= (0x01 << 6);	/* secondary timeslot RX is 1 */
++
++	mc13783_write(codec, PMIC_SSI_NETWORK, reg);
++
++	return 0;
++}
++
++static int mc13783_get_alsp(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
++	struct mc13783_priv *priv = codec->private_data;
++
++	ucontrol->value.integer.value[0] = priv->mc13783_alsp_val;
++
++	return 0;
++}
++
++static int mc13783_put_alsp(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec =  snd_kcontrol_chip(kcontrol);
++	struct mc13783_priv *priv = codec->private_data;
++	unsigned int reg;
++
++	priv->mc13783_alsp_val = ucontrol->value.integer.value[0];
++
++	reg = mc13783_read(codec, PMIC_AUDIO_RX_0);
++
++	reg &= ~((1 << 5) | (1 << 7));
++
++	if (priv->mc13783_alsp_val)
++		reg |= 1 << 5;
++
++	if (priv->mc13783_alsp_val == 2)
++		reg |= 1 << 7;
++
++	mc13783_write(codec, PMIC_AUDIO_RX_0, reg);
++
++	return 0;
++}
++
++static int mc13783_pcm_get(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec =  snd_kcontrol_chip(kcontrol);
++	int val;
++
++	val = mc13783_read(codec, PMIC_AUDIO_RX_0);
++	ucontrol->value.enumerated.item[0] = (val >> 22) & 1;
++
++	return 0;
++}
++
++static int mc13783_pcm_put(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec =  snd_kcontrol_chip(kcontrol);
++	unsigned int r36, r37;
++
++	r36 = mc13783_read(codec, PMIC_AUDIO_RX_0);
++	r37 = mc13783_read(codec, PMIC_AUDIO_RX_1);
++
++	r36 &= ~(1 << 22);
++	r37 &= ~(1 << 5);
++
++	if (ucontrol->value.enumerated.item[0]) {
++		r36 |= (1 << 22);
++		r37 |= (1 << 5);
++	} else {
++		r36 &= ~(1 << 22);
++		r37 &= ~(1 << 5);
++	}
++
++	mc13783_write(codec, PMIC_AUDIO_RX_0, r36);
++	mc13783_write(codec, PMIC_AUDIO_RX_1, r37);
++
++	return 0;
++}
++
++static int mc13783_linein_get(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec =  snd_kcontrol_chip(kcontrol);
++	int val;
++
++	val = mc13783_read(codec, PMIC_AUDIO_RX_0);
++	ucontrol->value.enumerated.item[0] = (val >> 23) & 1;
++
++	return 0;
++}
++
++static int mc13783_linein_put(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec =  snd_kcontrol_chip(kcontrol);
++	unsigned int r36, r37;
++
++	r36 = mc13783_read(codec, PMIC_AUDIO_RX_0);
++	r37 = mc13783_read(codec, PMIC_AUDIO_RX_1);
++
++	r36 &= ~(1 << 23);
++	r37 &= ~(1 << 10);
++
++	if (ucontrol->value.enumerated.item[0]) {
++		r36 |= (1 << 23);
++		r37 |= (1 << 10);
++	} else {
++		r36 &= ~(1 << 23);
++		r37 &= ~(1 << 10);
++	}
++
++	mc13783_write(codec, PMIC_AUDIO_RX_0, r36);
++	mc13783_write(codec, PMIC_AUDIO_RX_1, r37);
++
++	return 0;
++}
++
++static int mc13783_capure_cache;
++
++static int mc13783_get_capture(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.enumerated.item[0] = mc13783_capure_cache;
++	return 0;
++}
++
++#define AMC1REN (1 << 5)
++#define AMC2EN  (1 << 9)
++#define ATXINEN (1 << 11)
++#define RXINREC (1 << 13)
++#define AMC1LEN (1 << 7)
++
++static int mc13783_put_capture(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec =  snd_kcontrol_chip(kcontrol);
++	unsigned int r38, change;
++
++	r38 = mc13783_read(codec, PMIC_AUDIO_TX);
++
++	change = (mc13783_capure_cache != ucontrol->value.enumerated.item[0]);
++	mc13783_capure_cache = ucontrol->value.enumerated.item[0];
++	r38 &= ~(AMC1REN | AMC2EN | ATXINEN | RXINREC | AMC1LEN);
++
++	switch (mc13783_capure_cache) {
++	case 0:
++		break;
++	case 1:
++		r38 |= RXINREC;
++		break;
++	case 2:
++		r38 |= AMC1REN | AMC1LEN;
++		break;
++	case 3:
++		r38 |= AMC1REN;
++		break;
++	case 4:
++		r38 |= AMC2EN;
++		break;
++	case 5:
++		r38 |= AMC1LEN | AMC2EN;
++		break;
++	case 6:
++		r38 |= ATXINEN;
++		break;
++	case 7:
++		r38 |= AMC1LEN | ATXINEN;
++		break;
++	case 8:
++		r38 |= AMC1LEN | RXINREC;
++		break;
++	case 9:
++		r38 |= AMC1LEN;
++		break;
++	default:
++		break;
++	}
++
++	mc13783_write(codec, PMIC_AUDIO_TX, r38);
++
++	return change;
++}
++
++static const char *mc13783_asp[] = {"Off", "Codec", "Right"};
++static const char *mc13783_alsp[] = {"Off", "Codec", "Right"};
++
++static const char *mc13783_ahs[] = {"Codec", "Mixer"};
++
++static const char *mc13783_arxout[] = {"Codec", "Mixer"};
++
++static const char *mc13783_capture[] = {"off/off", "rxinl/rxinr",
++	"mc1lin/mc1rin", "off/mc1rin", "off/mc2in", "mc1lin/mc2in",
++	"off/txin", "mc1lin/txin", "mc1lin/rxinr", "mc1lin/off"};
++
++static const char *mc13783_3d_mixer[] =	{"Stereo", "Phase Mix",
++	"Mono", "Mono Mix"};
++
++static const struct soc_enum mc13783_enum_asp =
++	SOC_ENUM_SINGLE(PMIC_AUDIO_RX_0, 3, ARRAY_SIZE(mc13783_asp), mc13783_asp);
++
++static const struct soc_enum mc13783_enum_alsp =
++	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mc13783_alsp), mc13783_alsp);
++
++static const struct soc_enum mc13783_enum_ahs =
++	SOC_ENUM_SINGLE(PMIC_AUDIO_RX_0, 11, ARRAY_SIZE(mc13783_ahs),
++			mc13783_ahs);
++
++static const struct soc_enum mc13783_enum_arxout =
++	SOC_ENUM_SINGLE(PMIC_AUDIO_RX_0, 17, ARRAY_SIZE(mc13783_arxout),
++			mc13783_arxout);
++
++static const struct soc_enum mc13783_enum_capture =
++	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mc13783_capture), mc13783_capture);
++
++static const struct soc_enum mc13783_enum_3d_mixer =
++	SOC_ENUM_SINGLE(PMIC_AUDIO_RX_1, 16, ARRAY_SIZE(mc13783_3d_mixer),
++			mc13783_3d_mixer);
++
++static struct snd_kcontrol_new mc13783_control_list[] = {
++	/* Output Routing */
++	SOC_ENUM("Asp Source", mc13783_enum_asp),
++	SOC_ENUM_EXT("Alsp Source", mc13783_enum_alsp, mc13783_get_alsp,
++			mc13783_put_alsp),
++	SOC_ENUM("Ahs Source", mc13783_enum_ahs),
++	SOC_SINGLE("Ahsr enable", PMIC_AUDIO_RX_0, 9, 1, 0),
++	SOC_SINGLE("Ahsl enable", PMIC_AUDIO_RX_0, 10, 1, 0),
++	SOC_ENUM("Arxout Source", mc13783_enum_arxout),
++	SOC_SINGLE("ArxoutR enable", PMIC_AUDIO_RX_0, 16, 1, 0),
++	SOC_SINGLE("ArxoutL enable", PMIC_AUDIO_RX_0, 15, 1, 0),
++	SOC_SINGLE_EXT("PCM Playback Switch", 0, 0, 1, 0, mc13783_pcm_get,
++			mc13783_pcm_put),
++	SOC_SINGLE("PCM Playback Volume", PMIC_AUDIO_RX_1, 6, 15, 0),
++	SOC_SINGLE_EXT("Line in Switch", 0, 0, 1, 0, mc13783_linein_get,
++			mc13783_linein_put),
++	SOC_SINGLE("Line in Volume", PMIC_AUDIO_RX_1, 12, 15, 0),
++	SOC_ENUM_EXT("Capture Source", mc13783_enum_capture, mc13783_get_capture,
++			mc13783_put_capture),
++	SOC_DOUBLE("PCM Capture Volume", PMIC_AUDIO_TX, 19, 14, 31, 0),
++	SOC_ENUM("3D Control", mc13783_enum_3d_mixer),
++};
++
++static struct snd_soc_codec *mc13783_codec;
++
++static int mc13783_probe(struct platform_device *pdev)
++{
++	struct snd_soc_device *socdev = platform_get_drvdata(pdev);
++	struct snd_soc_codec *codec = mc13783_codec;
++	struct mc13783_priv *priv = codec->private_data;
++	int i, ret = 0;
++
++	if (!mc13783_codec) {
++		dev_err(&pdev->dev, "Codec device not registered\n");
++		return -ENODEV;
++	}
++
++	/* these are the reset values */
++	priv->reg_cache[PMIC_AUDIO_RX_0]  = 0x001000;
++	priv->reg_cache[PMIC_AUDIO_RX_1]  = 0x00d35A;
++	priv->reg_cache[PMIC_AUDIO_TX]    = 0x420000;
++	priv->reg_cache[PMIC_SSI_NETWORK] = 0x013060;
++	priv->reg_cache[PMIC_AUDIO_CODEC] = 0x180027;
++	priv->reg_cache[PMIC_AUDIO_DAC]   = 0x0e0004;
++
++	/* VAUDIOON -> supply audio part, BIAS enable */
++	priv->reg_cache[PMIC_AUDIO_RX_0] |= 0x3;
++
++	for (i = 36; i < 42; i++)
++		mc13783_write(codec, i, priv->reg_cache[i]);
++
++	socdev->card->codec = mc13783_codec;
++
++	/* register pcms */
++	ret = snd_soc_new_pcms(socdev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1);
++	if (ret < 0) {
++		dev_err(codec->dev, "failed to create pcms: %d\n", ret);
++		goto pcm_err;
++	}
++
++	snd_soc_add_controls(codec, mc13783_control_list,
++			     ARRAY_SIZE(mc13783_control_list));
++	ret = snd_soc_init_card(socdev);
++	if (ret < 0) {
++		dev_err(codec->dev, "failed to register card: %d\n", ret);
++		goto card_err;
++	}
++
++	return ret;
++
++card_err:
++	snd_soc_free_pcms(socdev);
++	snd_soc_dapm_free(socdev);
++pcm_err:
++	return ret;
++}
++
++static int mc13783_remove(struct platform_device *pdev)
++{
++	struct snd_soc_device *socdev = platform_get_drvdata(pdev);
++	struct snd_soc_codec *codec = mc13783_codec;
++	unsigned int reg;
++
++	reg = mc13783_read(codec, PMIC_AUDIO_RX_0);
++
++	/* VAUDIOON -> switch off audio part, BIAS disable */
++	reg &= ~0x3;
++
++	mc13783_write(codec, PMIC_AUDIO_RX_0, reg);
++
++	snd_soc_free_pcms(socdev);
++	snd_soc_dapm_free(socdev);
++
++	return 0;
++}
++
++#define MC13783_RATES_RECORD (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000)
++
++#define MC13783_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
++	SNDRV_PCM_FMTBIT_S24_LE)
++
++static struct snd_soc_dai_ops mc13783_ops_dac = {
++	.hw_params	= mc13783_pcm_hw_params,
++	.set_fmt	= mc13783_set_fmt,
++	.set_sysclk	= mc13783_set_sysclk,
++};
++
++static struct snd_soc_dai_ops mc13783_ops_voice_codec = {
++	.hw_params	= mc13783_pcm_hw_params,
++	.set_fmt	= mc13783_set_fmt,
++	.set_sysclk	= mc13783_set_sysclk,
++	.set_tdm_slot	= mc13783_set_tdm_slot_codec,
++};
++
++struct snd_soc_dai mc13783_dai[] = {
++	{
++		.name	= "MC13783 Playback",
++		.id	= MC13783_ID_STEREO_DAC,
++		.playback = {
++			.stream_name	= "Playback",
++			.channels_min	= 1,
++			.channels_max	= 2,
++			.rates		= SNDRV_PCM_RATE_8000_96000,
++			.formats	= MC13783_FORMATS,
++		},
++		.ops	= &mc13783_ops_dac,
++	}, {
++		.name	= "MC13783 Capture",
++		.id	= MC13783_ID_STEREO_CODEC,
++		.capture = {
++			.stream_name	= "Capture",
++			.channels_min	= 1,
++			.channels_max	= 2,
++			.rates		= MC13783_RATES_RECORD,
++			.formats	= MC13783_FORMATS,
++		},
++		.ops	= &mc13783_ops_voice_codec,
++	},
++};
++EXPORT_SYMBOL_GPL(mc13783_dai);
++
++struct snd_soc_codec_device soc_codec_dev_mc13783 = {
++	.probe = 	mc13783_probe,
++	.remove = 	mc13783_remove,
++};
++EXPORT_SYMBOL_GPL(soc_codec_dev_mc13783);
++
++/*
++ * OK, this stinks. We currently only can support one MC13783.
++ * Lets take it as an intermediate to turn this stuff into SoC
++ * Audio.
++ */
++static int mc13783_codec_probe(struct platform_device *pdev)
++{
++	struct mc13783_priv *priv;
++	struct snd_soc_codec *codec;
++	int ret;
++
++	if (mc13783)
++		return -EBUSY;
++
++	mc13783 = dev_get_drvdata(pdev->dev.parent);
++
++	priv = kzalloc(sizeof(struct mc13783_priv), GFP_KERNEL);
++	if (priv == NULL)
++		return -ENOMEM;
++
++	codec = &priv->codec;
++	codec->private_data = priv;
++	mc13783_codec = codec;
++
++	mutex_init(&codec->mutex);
++	INIT_LIST_HEAD(&codec->dapm_widgets);
++	INIT_LIST_HEAD(&codec->dapm_paths);
++
++	codec->name = "mc13783";
++	codec->owner = THIS_MODULE;
++	codec->read = mc13783_read;
++	codec->write = mc13783_write;
++	codec->dai = mc13783_dai;
++	codec->num_dai = ARRAY_SIZE(mc13783_dai);
++	codec->control_data = priv;
++	codec->dev = &pdev->dev;
++
++	mc13783_dai[0].dev = codec->dev;
++	mc13783_dai[1].dev = codec->dev;
++
++	ret = snd_soc_register_codec(codec);
++	if (ret)
++		goto err_register_codec;
++
++	ret = snd_soc_register_dais(mc13783_dai, ARRAY_SIZE(mc13783_dai));
++	if (ret)
++		goto err_register_dais;
++
++	return 0;
++
++err_register_dais:
++	snd_soc_unregister_codec(codec);
++err_register_codec:
++	dev_err(&pdev->dev, "register codec failed with %d\n", ret);
++	kfree(priv);
++
++	return ret;
++}
++
++static int mc13783_codec_remove(struct platform_device *pdev)
++{
++	snd_soc_unregister_codec(mc13783_codec);
++	snd_soc_unregister_dais(mc13783_dai, ARRAY_SIZE(mc13783_dai));
++
++	mc13783 = NULL;
++
++	return 0;
++}
++
++static struct platform_driver mc13783_codec_driver = {
++	.driver = {
++		   .name = "mc13783-codec",
++		   .owner = THIS_MODULE,
++		   },
++	.probe = mc13783_codec_probe,
++	.remove = __devexit_p(mc13783_codec_remove),
++};
++
++static __init int mc13783_init(void)
++{
++	return platform_driver_register(&mc13783_codec_driver);
++}
++
++static __exit void mc13783_exit(void)
++{
++	platform_driver_unregister(&mc13783_codec_driver);
++}
++
++module_init(mc13783_init);
++module_exit(mc13783_exit);
++
++MODULE_DESCRIPTION("ASoC MC13783 driver");
++MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
++MODULE_LICENSE("GPL");
+diff --git a/sound/soc/codecs/mc13783.h b/sound/soc/codecs/mc13783.h
+new file mode 100644
+index 0000000..b28dbef
+--- /dev/null
++++ b/sound/soc/codecs/mc13783.h
+@@ -0,0 +1,32 @@
++/*
++ * Copyright 2008 Juergen Beisert, kernel@pengutronix.de
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
++ */
++
++#ifndef MC13783_MIXER_H
++#define MC13783_MIXER_H
++
++extern int mc13783_add_ctl(struct snd_card*, void *);
++
++extern struct snd_soc_dai mc13783_dai[];
++extern struct snd_soc_codec_device soc_codec_dev_mc13783;
++
++#define MC13783_CLK_CLIA	1
++#define MC13783_CLK_CLIB	2
++
++#define MC13783_ID_STEREO_DAC	1
++#define MC13783_ID_STEREO_CODEC	2
++
++#endif /* MC13783_MIXER_H */
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0013-mxc_nand-Make-main-spare-areas-runtime-configurable.patch b/recipes/linux/linux-2.6.31/pcm043/0013-mxc_nand-Make-main-spare-areas-runtime-configurable.patch
new file mode 100644
index 0000000..96d2586
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0013-mxc_nand-Make-main-spare-areas-runtime-configurable.patch
@@ -0,0 +1,142 @@
+From cd3ee0eef0eba058bc5a7a6d42536bc35059ecf9 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Mon, 5 Oct 2009 11:14:35 +0200
+Subject: [PATCH] mxc_nand: Make main/spare areas runtime configurable
+
+The main/spare areas are on different addresses on later versions
+of the controller, so make them configurable.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   42 ++++++++++++++++++++----------------------
+ 1 files changed, 20 insertions(+), 22 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 2988f1d..450db4e 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -52,18 +52,6 @@
+ #define NFC_CONFIG1		0xE1A
+ #define NFC_CONFIG2		0xE1C
+ 
+-/* Addresses for NFC RAM BUFFER Main area 0 */
+-#define MAIN_AREA0		0x000
+-#define MAIN_AREA1		0x200
+-#define MAIN_AREA2		0x400
+-#define MAIN_AREA3		0x600
+-
+-/* Addresses for NFC SPARE BUFFER Spare area 0 */
+-#define SPARE_AREA0		0x800
+-#define SPARE_AREA1		0x810
+-#define SPARE_AREA2		0x820
+-#define SPARE_AREA3		0x830
+-
+ /* Set INT to 0, FCMD to 1, rest to 0 in NFC_CONFIG2 Register
+  * for Command operation */
+ #define NFC_CMD            0x1
+@@ -106,6 +94,11 @@ struct mxc_nand_host {
+ 	struct mtd_partition	*parts;
+ 	struct device		*dev;
+ 
++	void			*spare0;
++	void			*main_area0;
++	void			*main_area1;
++
++	void __iomem		*base;
+ 	void __iomem		*regs;
+ 	int			status_request;
+ 	int			pagesize_2k;
+@@ -262,7 +255,7 @@ static void send_read_id(struct mxc_nand_host *host)
+ 	wait_op_done(host, TROP_US_DELAY, true);
+ 
+ 	if (this->options & NAND_BUSWIDTH_16) {
+-		void __iomem *main_buf = host->regs + MAIN_AREA0;
++		void __iomem *main_buf = host->main_area0;
+ 		/* compress the ID info */
+ 		writeb(readb(main_buf + 2), main_buf + 1);
+ 		writeb(readb(main_buf + 4), main_buf + 2);
+@@ -270,14 +263,14 @@ static void send_read_id(struct mxc_nand_host *host)
+ 		writeb(readb(main_buf + 8), main_buf + 4);
+ 		writeb(readb(main_buf + 10), main_buf + 5);
+ 	}
+-	memcpy(host->data_buf, host->regs + MAIN_AREA0, 16);
++	memcpy(host->data_buf, host->main_area0, 16);
+ }
+ 
+ /* This function requests the NANDFC to perform a read of the
+  * NAND device status and returns the current status. */
+ static uint16_t get_dev_status(struct mxc_nand_host *host)
+ {
+-	void __iomem *main_buf = host->regs + MAIN_AREA1;
++	void __iomem *main_buf = host->main_area1;
+ 	uint32_t store;
+ 	uint16_t ret, tmp;
+ 	/* Issue status request to NAND device */
+@@ -462,7 +455,7 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
+ 	u16 i, j;
+ 	u16 n = mtd->writesize >> 9;
+ 	u8 *d = host->data_buf + mtd->writesize;
+-	u8 *s = host->regs + SPARE_AREA0;
++	u8 *s = host->spare0;
+ 	u16 t = host->spare_len;
+ 
+ 	j = (mtd->oobsize / n >> 1) << 1;
+@@ -572,7 +565,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 
+ 		send_page(host, NFC_OUTPUT);
+ 
+-		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
++		memcpy(host->data_buf, host->main_area0, mtd->writesize);
+ 		copy_spare(mtd, true);
+ 		break;
+ 
+@@ -608,7 +601,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 		break;
+ 
+ 	case NAND_CMD_PAGEPROG:
+-		memcpy(host->regs + MAIN_AREA0, host->data_buf, mtd->writesize);
++		memcpy(host->main_area0, host->data_buf, mtd->writesize);
+ 		copy_spare(mtd, false);
+ 		send_page(host, NFC_INPUT);
+ 		send_cmd(host, command, true);
+@@ -686,12 +679,17 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 		goto eres;
+ 	}
+ 
+-	host->regs = ioremap(res->start, resource_size(res));
+-	if (!host->regs) {
++	host->base = ioremap(res->start, resource_size(res));
++	if (!host->base) {
+ 		err = -ENOMEM;
+ 		goto eres;
+ 	}
+ 
++	host->regs = host->base;
++	host->main_area0 = host->base;
++	host->main_area1 = host->base + 0x200;
++	host->spare0 = host->base + 0x800;
++
+ 	tmp = readw(host->regs + NFC_CONFIG1);
+ 	tmp |= NFC_INT_MSK;
+ 	writew(tmp, host->regs + NFC_CONFIG1);
+@@ -778,7 +776,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ escan:
+ 	free_irq(host->irq, host);
+ eirq:
+-	iounmap(host->regs);
++	iounmap(host->base);
+ eres:
+ 	clk_put(host->clk);
+ eclk:
+@@ -797,7 +795,7 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
+ 
+ 	nand_release(&host->mtd);
+ 	free_irq(host->irq, host);
+-	iounmap(host->regs);
++	iounmap(host->base);
+ 	kfree(host);
+ 
+ 	return 0;
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0014-MXC-NFC-Add-NAND-device-to-the-pcm043-platform.patch b/recipes/linux/linux-2.6.31/pcm043/0014-MXC-NFC-Add-NAND-device-to-the-pcm043-platform.patch
new file mode 100644
index 0000000..967b3ba
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0014-MXC-NFC-Add-NAND-device-to-the-pcm043-platform.patch
@@ -0,0 +1,47 @@
+From cb9f37d106e5ac9672291f0ce5df5dd955d61d5d Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Tue, 29 Sep 2009 17:00:18 +0200
+Subject: [PATCH 14/15] MXC NFC: Add NAND device to the pcm043 platform
+
+Phytec's PCM043 is equipped with a 1 GiB NAND.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/pcm043.c |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+Index: arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- arch/arm/mach-mx3/pcm043.c.orig	2009-12-10 11:34:30.754671808 +0100
++++ arch/arm/mach-mx3/pcm043.c	2009-12-10 11:34:35.157145682 +0100
+@@ -48,6 +48,7 @@
+ #include <mach/mxc_ehci.h>
+ #include <mach/audmux.h>
+ #include <mach/ssi.h>
++#include <mach/mxc_nand.h>
+ 
+ #include "devices.h"
+ 
+@@ -359,6 +360,11 @@
+ 	.flags = IMX_SSI_USE_AC97,
+ };
+ 
++static struct mxc_nand_platform_data pcm043_nand_board_info = {
++	.width = 1,
++	.hw_ecc = 1,
++};
++
+ /*
+  * Board specific initialization.
+  */
+@@ -394,6 +400,7 @@
+ 	mxc_register_device(&mxc_i2c_device0, &pcm043_i2c_1_data);
+ #endif
+ 
++	mxc_register_device(&mxc_nand_device, &pcm043_nand_board_info);
+ 	mxc_register_device(&mx3_ipu, &mx3_ipu_data);
+ 	mxc_register_device(&mx3_fb, &mx3fb_pdata);
+ 
diff --git a/recipes/linux/linux-2.6.31/pcm043/0014-imx-ssi-sound-driver.patch b/recipes/linux/linux-2.6.31/pcm043/0014-imx-ssi-sound-driver.patch
new file mode 100644
index 0000000..3b935c9
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0014-imx-ssi-sound-driver.patch
@@ -0,0 +1,1911 @@
+From 7947679ebf067e88b61b9185c19d625d975e315c Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 12 Nov 2009 15:00:08 +0100
+Subject: [PATCH 14/28] imx-ssi sound driver
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/plat-mxc/Makefile           |    4 +
+ arch/arm/plat-mxc/include/mach/ssi.h |   17 +
+ arch/arm/plat-mxc/ssi-fiq-ksym.c     |   20 +
+ arch/arm/plat-mxc/ssi-fiq.S          |  134 ++++++
+ sound/soc/Kconfig                    |    1 +
+ sound/soc/Makefile                   |    1 +
+ sound/soc/imx/Kconfig                |   13 +
+ sound/soc/imx/Makefile               |   10 +
+ sound/soc/imx/imx-pcm-dma-mx2.c      |  313 ++++++++++++++
+ sound/soc/imx/imx-pcm-fiq.c          |  277 ++++++++++++
+ sound/soc/imx/imx-ssi.c              |  766 ++++++++++++++++++++++++++++++++++
+ sound/soc/imx/imx-ssi.h              |  238 +++++++++++
+ 12 files changed, 1794 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/plat-mxc/include/mach/ssi.h
+ create mode 100644 arch/arm/plat-mxc/ssi-fiq-ksym.c
+ create mode 100644 arch/arm/plat-mxc/ssi-fiq.S
+ create mode 100644 sound/soc/imx/Kconfig
+ create mode 100644 sound/soc/imx/Makefile
+ create mode 100644 sound/soc/imx/imx-pcm-dma-mx2.c
+ create mode 100644 sound/soc/imx/imx-pcm-fiq.c
+ create mode 100644 sound/soc/imx/imx-ssi.c
+ create mode 100644 sound/soc/imx/imx-ssi.h
+
+diff --git a/arch/arm/plat-mxc/Makefile b/arch/arm/plat-mxc/Makefile
+index 92fc8b2..b0b9fc3 100644
+--- a/arch/arm/plat-mxc/Makefile
++++ b/arch/arm/plat-mxc/Makefile
+@@ -11,3 +11,7 @@ obj-$(CONFIG_ARCH_MXC_IOMUX_V3) += iomux-v3.o
+ obj-$(CONFIG_MXC_PWM)  += pwm.o
+ obj-$(CONFIG_ARCH_MXC_AUDMUX_V1) += audmux-v1.o
+ obj-$(CONFIG_ARCH_MXC_AUDMUX_V2) += audmux-v2.o
++ifdef CONFIG_SND_IMX_SOC
++obj-y += ssi-fiq.o
++obj-y += ssi-fiq-ksym.o
++endif
+diff --git a/arch/arm/plat-mxc/include/mach/ssi.h b/arch/arm/plat-mxc/include/mach/ssi.h
+new file mode 100644
+index 0000000..144a2ac
+--- /dev/null
++++ b/arch/arm/plat-mxc/include/mach/ssi.h
+@@ -0,0 +1,17 @@
++#ifndef __MACH_SSI_H
++#define __MACH_SSI_H
++
++struct snd_ac97;
++
++extern unsigned char imx_ssi_fiq_start, imx_ssi_fiq_end;
++extern unsigned long imx_ssi_fiq_base, imx_ssi_fiq_tx_buffer, imx_ssi_fiq_rx_buffer;
++
++struct imx_ssi_platform_data {
++	unsigned int flags;
++#define IMX_SSI_DMA		(1 << 0)
++#define IMX_SSI_USE_AC97	(1 << 1)
++	void (*ac97_reset) (struct snd_ac97 *ac97);
++	void (*ac97_warm_reset)(struct snd_ac97 *ac97);
++};
++
++#endif /* __MACH_SSI_H */
+diff --git a/arch/arm/plat-mxc/ssi-fiq-ksym.c b/arch/arm/plat-mxc/ssi-fiq-ksym.c
+new file mode 100644
+index 0000000..b5fad45
+--- /dev/null
++++ b/arch/arm/plat-mxc/ssi-fiq-ksym.c
+@@ -0,0 +1,20 @@
++/*
++ * Exported ksyms for the SSI FIQ handler
++ *
++ * Copyright (C) 2009, Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/module.h>
++
++#include <mach/ssi.h>
++
++EXPORT_SYMBOL(imx_ssi_fiq_tx_buffer);
++EXPORT_SYMBOL(imx_ssi_fiq_rx_buffer);
++EXPORT_SYMBOL(imx_ssi_fiq_start);
++EXPORT_SYMBOL(imx_ssi_fiq_end);
++EXPORT_SYMBOL(imx_ssi_fiq_base);
++
+diff --git a/arch/arm/plat-mxc/ssi-fiq.S b/arch/arm/plat-mxc/ssi-fiq.S
+new file mode 100644
+index 0000000..4ddce56
+--- /dev/null
++++ b/arch/arm/plat-mxc/ssi-fiq.S
+@@ -0,0 +1,134 @@
++/*
++ *  Copyright (C) 2009 Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/linkage.h>
++#include <asm/assembler.h>
++
++/*
++ * r8  = bit 0-15: tx offset, bit 16-31: tx buffer size
++ * r9  = bit 0-15: rx offset, bit 16-31: rx buffer size
++ */
++
++#define SSI_STX0	0x00
++#define SSI_SRX0	0x08
++#define SSI_SISR	0x14
++#define SSI_SIER	0x18
++#define SSI_SACNT	0x38
++
++#define SSI_SACNT_AC97EN	(1 << 0)
++
++#define SSI_SIER_TFE0_EN	(1 << 0)
++#define SSI_SISR_TFE0		(1 << 0)
++#define SSI_SISR_RFF0		(1 << 2)
++#define SSI_SIER_RFF0_EN	(1 << 2)
++
++		.text
++		.global	imx_ssi_fiq_start
++		.global	imx_ssi_fiq_end
++		.global imx_ssi_fiq_base
++		.global imx_ssi_fiq_rx_buffer
++		.global imx_ssi_fiq_tx_buffer
++
++imx_ssi_fiq_start:
++		ldr r12, imx_ssi_fiq_base
++
++		/* TX */
++		ldr r11, imx_ssi_fiq_tx_buffer
++
++		/* shall we send? */
++		ldr r13, [r12, #SSI_SIER]
++		tst r13, #SSI_SIER_TFE0_EN
++		beq 1f
++
++		/* TX FIFO empty? */
++		ldr r13, [r12, #SSI_SISR]
++		tst r13, #SSI_SISR_TFE0
++		beq 1f
++
++		mov r10, #0x10000
++		sub r10, #1
++		and r10, r10, r8	/* r10: current buffer offset */
++
++		add r11, r11, r10
++
++		ldrh r13, [r11]
++		strh r13, [r12, #SSI_STX0]
++
++		ldrh r13, [r11, #2]
++		strh r13, [r12, #SSI_STX0]
++
++		ldrh r13, [r11, #4]
++		strh r13, [r12, #SSI_STX0]
++
++		ldrh r13, [r11, #6]
++		strh r13, [r12, #SSI_STX0]
++
++		add r10, #8
++		lsr r13, r8, #16	/* r13: buffer size */
++		cmp r10, r13
++		lslgt r8, r13, #16
++		addle r8, #8
++1:
++		/* RX */
++
++		/* shall we receive? */
++		ldr r13, [r12, #SSI_SIER]
++		tst r13, #SSI_SIER_RFF0_EN
++		beq 1f
++
++		/* RX FIFO full? */
++		ldr r13, [r12, #SSI_SISR]
++		tst r13, #SSI_SISR_RFF0
++		beq 1f
++
++		ldr r11, imx_ssi_fiq_rx_buffer
++
++		mov r10, #0x10000
++		sub r10, #1
++		and r10, r10, r9	/* r10: current buffer offset */
++
++		add r11, r11, r10
++
++		ldr r13, [r12, #SSI_SACNT]
++		tst r13, #SSI_SACNT_AC97EN
++
++		ldr r13, [r12, #SSI_SRX0]
++		strh r13, [r11]
++
++		ldr r13, [r12, #SSI_SRX0]
++		strh r13, [r11, #2]
++
++		/* dummy read to skip slot 12 */
++		ldrne r13, [r12, #SSI_SRX0]
++
++		ldr r13, [r12, #SSI_SRX0]
++		strh r13, [r11, #4]
++
++		ldr r13, [r12, #SSI_SRX0]
++		strh r13, [r11, #6]
++
++		/* dummy read to skip slot 12 */
++		ldrne r13, [r12, #SSI_SRX0]
++
++		add r10, #8
++		lsr r13, r9, #16	/* r13: buffer size */
++		cmp r10, r13
++		lslgt r9, r13, #16
++		addle r9, #8
++
++1:
++		@ return from FIQ
++		subs	pc, lr, #4
++imx_ssi_fiq_base:
++		.word 0x0
++imx_ssi_fiq_rx_buffer:
++		.word 0x0
++imx_ssi_fiq_tx_buffer:
++		.word 0x0
++imx_ssi_fiq_end:
++
+diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
+index d3e786a..d57e571 100644
+--- a/sound/soc/Kconfig
++++ b/sound/soc/Kconfig
+@@ -35,6 +35,7 @@ source "sound/soc/s3c24xx/Kconfig"
+ source "sound/soc/s6000/Kconfig"
+ source "sound/soc/sh/Kconfig"
+ source "sound/soc/txx9/Kconfig"
++source "sound/soc/imx/Kconfig"
+ 
+ # Supported codecs
+ source "sound/soc/codecs/Kconfig"
+diff --git a/sound/soc/Makefile b/sound/soc/Makefile
+index 6f1e28d..6bcb7f7 100644
+--- a/sound/soc/Makefile
++++ b/sound/soc/Makefile
+@@ -8,6 +8,7 @@ obj-$(CONFIG_SND_SOC)	+= blackfin/
+ obj-$(CONFIG_SND_SOC)	+= davinci/
+ obj-$(CONFIG_SND_SOC)	+= fsl/
+ obj-$(CONFIG_SND_SOC)	+= omap/
++obj-$(CONFIG_SND_SOC)	+= imx/
+ obj-$(CONFIG_SND_SOC)	+= pxa/
+ obj-$(CONFIG_SND_SOC)	+= s3c24xx/
+ obj-$(CONFIG_SND_SOC)	+= s6000/
+diff --git a/sound/soc/imx/Kconfig b/sound/soc/imx/Kconfig
+new file mode 100644
+index 0000000..84a25e6
+--- /dev/null
++++ b/sound/soc/imx/Kconfig
+@@ -0,0 +1,13 @@
++config SND_IMX_SOC
++	tristate "SoC Audio for Freecale i.MX CPUs"
++	depends on ARCH_MXC
++	select SND_PCM
++	select FIQ
++	select SND_SOC_AC97_BUS
++	help
++	  Say Y or M if you want to add support for codecs attached to
++	  the i.MX SSI interface.
++
++config SND_MXC_SOC_SSI
++	tristate
++
+diff --git a/sound/soc/imx/Makefile b/sound/soc/imx/Makefile
+new file mode 100644
+index 0000000..d05cc95
+--- /dev/null
++++ b/sound/soc/imx/Makefile
+@@ -0,0 +1,10 @@
++# i.MX Platform Support
++snd-soc-imx-objs := imx-ssi.o imx-pcm-fiq.o
++
++ifdef CONFIG_MACH_MX27
++snd-soc-imx-objs += imx-pcm-dma-mx2.o
++endif
++
++obj-$(CONFIG_SND_IMX_SOC) += snd-soc-imx.o
++
++# i.MX Machine Support
+diff --git a/sound/soc/imx/imx-pcm-dma-mx2.c b/sound/soc/imx/imx-pcm-dma-mx2.c
+new file mode 100644
+index 0000000..19452e4
+--- /dev/null
++++ b/sound/soc/imx/imx-pcm-dma-mx2.c
+@@ -0,0 +1,313 @@
++/*
++ * imx-pcm-dma-mx2.c  --  ALSA Soc Audio Layer
++ *
++ * Copyright 2009 Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This code is based on code copyrighted by Freescale,
++ * Liam Girdwood, Javier Martin and probably others.
++ *
++ *  This program is free software; you can redistribute  it and/or modify it
++ *  under  the terms of  the GNU General  Public License as published by the
++ *  Free Software Foundation;  either version 2 of the  License, or (at your
++ *  option) any later version.
++ */
++#include <linux/clk.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/dma-mapping.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++
++#include <sound/core.h>
++#include <sound/initval.h>
++#include <sound/pcm.h>
++#include <sound/pcm_params.h>
++#include <sound/soc.h>
++
++#include <mach/dma-mx1-mx2.h>
++
++#include "imx-ssi.h"
++
++struct imx_pcm_runtime_data {
++	int sg_count;
++	struct scatterlist *sg_list;
++	int period;
++	int periods;
++	unsigned long dma_addr;
++	int dma;
++	struct snd_pcm_substream *substream;
++	unsigned long offset;
++	unsigned long size;
++	unsigned long period_cnt;
++	void *buf;
++	int period_time;
++};
++
++/* Called by the DMA framework when a period has elapsed */
++static void imx_ssi_dma_progression(int channel, void *data,
++					struct scatterlist *sg)
++{
++	struct snd_pcm_substream *substream = data;
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	if (!sg)
++		return;
++
++	runtime = iprtd->substream->runtime;
++
++	iprtd->offset = sg->dma_address - runtime->dma_addr;
++
++	snd_pcm_period_elapsed(iprtd->substream);
++}
++
++static void imx_ssi_dma_callback(int channel, void *data)
++{
++	pr_err("%s shouldn't be called\n", __func__);
++}
++
++static void snd_imx_dma_err_callback(int channel, void *data, int err)
++{
++	pr_err("DMA error callback called\n");
++
++	pr_err("DMA timeout on channel %d -%s%s%s%s\n",
++		 channel,
++		 err & IMX_DMA_ERR_BURST ?    " burst" : "",
++		 err & IMX_DMA_ERR_REQUEST ?  " request" : "",
++		 err & IMX_DMA_ERR_TRANSFER ? " transfer" : "",
++		 err & IMX_DMA_ERR_BUFFER ?   " buffer" : "");
++}
++
++static int imx_ssi_dma_alloc(struct snd_pcm_substream *substream)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct imx_pcm_dma_params *dma_params = rtd->dai->cpu_dai->dma_data;
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++	int ret;
++
++	iprtd->dma = imx_dma_request_by_prio(DRV_NAME, DMA_PRIO_HIGH);
++	if (iprtd->dma < 0) {
++		pr_err("Failed to claim the audio DMA\n");
++		return -ENODEV;
++	}
++
++	ret = imx_dma_setup_handlers(iprtd->dma,
++				imx_ssi_dma_callback,
++				snd_imx_dma_err_callback, substream);
++	if (ret)
++		goto out;
++
++	ret = imx_dma_setup_progression_handler(iprtd->dma,
++			imx_ssi_dma_progression);
++	if (ret) {
++		pr_err("Failed to setup the DMA handler\n");
++		goto out;
++	}
++
++	ret = imx_dma_config_channel(iprtd->dma,
++			IMX_DMA_MEMSIZE_16 | IMX_DMA_TYPE_FIFO,
++			IMX_DMA_MEMSIZE_32 | IMX_DMA_TYPE_LINEAR,
++			dma_params->dma, 1);
++	if (ret < 0) {
++		pr_err("Cannot configure DMA channel: %d\n", ret);
++		goto out;
++	}
++
++	imx_dma_config_burstlen(iprtd->dma, dma_params->burstsize * 2);
++
++	return 0;
++out:
++	imx_dma_free(iprtd->dma);
++	return ret;
++}
++
++static int snd_imx_pcm_hw_params(struct snd_pcm_substream *substream,
++				struct snd_pcm_hw_params *params)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++	int i;
++	unsigned long dma_addr;
++
++	imx_ssi_dma_alloc(substream);
++
++	iprtd->size = params_buffer_bytes(params);
++	iprtd->periods = params_periods(params);
++	iprtd->period = params_period_bytes(params);
++	iprtd->offset = 0;
++	iprtd->period_time = HZ / (params_rate(params) /
++			params_period_size(params));
++
++	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
++
++	if (iprtd->sg_count != iprtd->periods) {
++		kfree(iprtd->sg_list);
++
++		iprtd->sg_list = kcalloc(iprtd->periods + 1,
++				sizeof(struct scatterlist), GFP_KERNEL);
++		if (!iprtd->sg_list)
++			return -ENOMEM;
++		iprtd->sg_count = iprtd->periods + 1;
++	}
++
++	sg_init_table(iprtd->sg_list, iprtd->sg_count);
++	dma_addr = runtime->dma_addr;
++
++	for (i = 0; i < iprtd->periods; i++) {
++		iprtd->sg_list[i].page_link = 0;
++		iprtd->sg_list[i].offset = 0;
++		iprtd->sg_list[i].dma_address = dma_addr;
++		iprtd->sg_list[i].length = iprtd->period;
++		dma_addr += iprtd->period;
++	}
++
++	/* close the loop */
++	iprtd->sg_list[iprtd->sg_count - 1].offset = 0;
++	iprtd->sg_list[iprtd->sg_count - 1].length = 0;
++	iprtd->sg_list[iprtd->sg_count - 1].page_link =
++			((unsigned long) iprtd->sg_list | 0x01) & ~0x02;
++	return 0;
++}
++
++static int snd_imx_pcm_hw_free(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	if (iprtd->dma >= 0) {
++		imx_dma_free(iprtd->dma);
++		iprtd->dma = -EINVAL;
++	}
++
++	kfree(iprtd->sg_list);
++	iprtd->sg_list = NULL;
++
++	return 0;
++}
++
++static int snd_imx_pcm_prepare(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct imx_pcm_dma_params *dma_params = rtd->dai->cpu_dai->dma_data;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++	int err;
++
++	iprtd->substream = substream;
++	iprtd->buf = (unsigned int *)substream->dma_buffer.area;
++	iprtd->period_cnt = 0;
++
++	pr_debug("%s: buf: %p period: %d periods: %d\n",
++			__func__, iprtd->buf, iprtd->period, iprtd->periods);
++
++	err = imx_dma_setup_sg(iprtd->dma, iprtd->sg_list, iprtd->sg_count,
++			IMX_DMA_LENGTH_LOOP, dma_params->dma_addr,
++			substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
++			DMA_MODE_WRITE : DMA_MODE_READ);
++	if (err)
++		return err;
++
++	return 0;
++}
++
++static int snd_imx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++	case SNDRV_PCM_TRIGGER_RESUME:
++	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
++		imx_dma_enable(iprtd->dma);
++
++		break;
++
++	case SNDRV_PCM_TRIGGER_STOP:
++	case SNDRV_PCM_TRIGGER_SUSPEND:
++	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
++		imx_dma_disable(iprtd->dma);
++
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	return 0;
++}
++
++static snd_pcm_uframes_t snd_imx_pcm_pointer(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	return bytes_to_frames(substream->runtime, iprtd->offset);
++}
++
++static struct snd_pcm_hardware snd_imx_hardware = {
++	.info = SNDRV_PCM_INFO_INTERLEAVED |
++		SNDRV_PCM_INFO_BLOCK_TRANSFER |
++		SNDRV_PCM_INFO_MMAP |
++		SNDRV_PCM_INFO_MMAP_VALID |
++		SNDRV_PCM_INFO_PAUSE |
++		SNDRV_PCM_INFO_RESUME,
++	.formats = SNDRV_PCM_FMTBIT_S16_LE,
++	.rate_min = 8000,
++	.channels_min = 2,
++	.channels_max = 2,
++	.buffer_bytes_max = IMX_SSI_DMABUF_SIZE,
++	.period_bytes_min = 128,
++	.period_bytes_max = 16 * 1024,
++	.periods_min = 2,
++	.periods_max = 255,
++	.fifo_size = 0,
++};
++
++static int snd_imx_open(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd;
++	int ret;
++
++	iprtd = kzalloc(sizeof(*iprtd), GFP_KERNEL);
++	runtime->private_data = iprtd;
++
++	ret = snd_pcm_hw_constraint_integer(substream->runtime,
++			SNDRV_PCM_HW_PARAM_PERIODS);
++	if (ret < 0)
++		return ret;
++
++	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
++	return 0;
++}
++
++static struct snd_pcm_ops imx_pcm_ops = {
++	.open		= snd_imx_open,
++	.ioctl		= snd_pcm_lib_ioctl,
++	.hw_params	= snd_imx_pcm_hw_params,
++	.hw_free	= snd_imx_pcm_hw_free,
++	.prepare	= snd_imx_pcm_prepare,
++	.trigger	= snd_imx_pcm_trigger,
++	.pointer	= snd_imx_pcm_pointer,
++	.mmap		= snd_imx_pcm_mmap,
++};
++
++static struct snd_soc_platform imx_soc_platform_dma = {
++	.name		= "imx-audio",
++	.pcm_ops 	= &imx_pcm_ops,
++	.pcm_new	= imx_pcm_new,
++	.pcm_free	= imx_pcm_free,
++};
++
++struct snd_soc_platform *imx_ssi_dma_mx2_init(struct platform_device *pdev,
++		struct imx_ssi *ssi)
++{
++	ssi->dma_params_tx.burstsize = DMA_TXFIFO_BURST;
++	ssi->dma_params_rx.burstsize = DMA_RXFIFO_BURST;
++
++	return &imx_soc_platform_dma;
++}
++
+diff --git a/sound/soc/imx/imx-pcm-fiq.c b/sound/soc/imx/imx-pcm-fiq.c
+new file mode 100644
+index 0000000..5532579
+--- /dev/null
++++ b/sound/soc/imx/imx-pcm-fiq.c
+@@ -0,0 +1,277 @@
++/*
++ * imx-pcm-fiq.c  --  ALSA Soc Audio Layer
++ *
++ * Copyright 2009 Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This code is based on code copyrighted by Freescale,
++ * Liam Girdwood, Javier Martin and probably others.
++ *
++ *  This program is free software; you can redistribute  it and/or modify it
++ *  under  the terms of  the GNU General  Public License as published by the
++ *  Free Software Foundation;  either version 2 of the  License, or (at your
++ *  option) any later version.
++ */
++#include <linux/clk.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/dma-mapping.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++
++#include <sound/core.h>
++#include <sound/initval.h>
++#include <sound/pcm.h>
++#include <sound/pcm_params.h>
++#include <sound/soc.h>
++
++#include <asm/fiq.h>
++
++#include <mach/ssi.h>
++
++#include "imx-ssi.h"
++
++struct imx_pcm_runtime_data {
++	int period;
++	int periods;
++	unsigned long dma_addr;
++	int dma;
++	unsigned long offset;
++	unsigned long size;
++	unsigned long period_cnt;
++	void *buf;
++	struct timer_list timer;
++	int period_time;
++};
++
++static void imx_ssi_timer_callback(unsigned long data)
++{
++	struct snd_pcm_substream *substream = (void *)data;
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++	struct pt_regs regs;
++
++	get_fiq_regs(&regs);
++
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
++		iprtd->offset = regs.ARM_r8 & 0xffff;
++	else
++		iprtd->offset = regs.ARM_r9 & 0xffff;
++
++	iprtd->timer.expires = jiffies + iprtd->period_time;
++	add_timer(&iprtd->timer);
++	snd_pcm_period_elapsed(substream);
++}
++
++static struct fiq_handler fh = {
++	.name		= DRV_NAME,
++};
++
++static int snd_imx_pcm_hw_params(struct snd_pcm_substream *substream,
++				struct snd_pcm_hw_params *params)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	iprtd->size = params_buffer_bytes(params);
++	iprtd->periods = params_periods(params);
++	iprtd->period = params_period_bytes(params);
++	iprtd->offset = 0;
++	iprtd->period_time = HZ / (params_rate(params) / params_period_size(params));
++
++	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
++
++	return 0;
++}
++
++static int snd_imx_pcm_prepare(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++	struct pt_regs regs;
++
++	get_fiq_regs(&regs);
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
++		regs.ARM_r8 = (iprtd->period * iprtd->periods - 1) << 16;
++	else
++		regs.ARM_r9 = (iprtd->period * iprtd->periods - 1) << 16;
++
++	set_fiq_regs(&regs);
++
++	return 0;
++}
++
++static int fiq_enable;
++static int imx_pcm_fiq;
++
++static int snd_imx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++	case SNDRV_PCM_TRIGGER_RESUME:
++	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
++		iprtd->timer.expires = jiffies + iprtd->period_time;
++		add_timer(&iprtd->timer);
++		if (++fiq_enable == 1)
++			enable_fiq(imx_pcm_fiq);
++
++		break;
++
++	case SNDRV_PCM_TRIGGER_STOP:
++	case SNDRV_PCM_TRIGGER_SUSPEND:
++	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
++		del_timer(&iprtd->timer);
++		if (--fiq_enable == 0)
++			disable_fiq(imx_pcm_fiq);
++
++
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	return 0;
++}
++
++static snd_pcm_uframes_t snd_imx_pcm_pointer(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	return bytes_to_frames(substream->runtime, iprtd->offset);
++}
++
++static struct snd_pcm_hardware snd_imx_hardware = {
++	.info = SNDRV_PCM_INFO_INTERLEAVED |
++		SNDRV_PCM_INFO_BLOCK_TRANSFER |
++		SNDRV_PCM_INFO_MMAP |
++		SNDRV_PCM_INFO_MMAP_VALID |
++		SNDRV_PCM_INFO_PAUSE |
++		SNDRV_PCM_INFO_RESUME,
++	.formats = SNDRV_PCM_FMTBIT_S16_LE,
++	.rate_min = 8000,
++	.channels_min = 2,
++	.channels_max = 2,
++	.buffer_bytes_max = IMX_SSI_DMABUF_SIZE,
++	.period_bytes_min = 128,
++	.period_bytes_max = 16 * 1024,
++	.periods_min = 2,
++	.periods_max = 255,
++	.fifo_size = 0,
++};
++
++static int snd_imx_open(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd;
++	int ret;
++
++	iprtd = kzalloc(sizeof(*iprtd), GFP_KERNEL);
++	runtime->private_data = iprtd;
++
++	init_timer(&iprtd->timer);
++	iprtd->timer.data = (unsigned long)substream;
++	iprtd->timer.function = imx_ssi_timer_callback;
++
++	ret = snd_pcm_hw_constraint_integer(substream->runtime,
++			SNDRV_PCM_HW_PARAM_PERIODS);
++	if (ret < 0)
++		return ret;
++
++	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
++	return 0;
++}
++
++static int snd_imx_close(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
++
++	del_timer_sync(&iprtd->timer);
++	kfree(iprtd);
++
++	return 0;
++}
++
++static struct snd_pcm_ops imx_pcm_ops = {
++	.open		= snd_imx_open,
++	.close		= snd_imx_close,
++	.ioctl		= snd_pcm_lib_ioctl,
++	.hw_params	= snd_imx_pcm_hw_params,
++	.prepare	= snd_imx_pcm_prepare,
++	.trigger	= snd_imx_pcm_trigger,
++	.pointer	= snd_imx_pcm_pointer,
++	.mmap		= snd_imx_pcm_mmap,
++};
++
++static int imx_pcm_fiq_new(struct snd_card *card, struct snd_soc_dai *dai,
++	struct snd_pcm *pcm)
++{
++	int ret;
++
++	ret = imx_pcm_new(card, dai, pcm);
++	if (ret)
++		return ret;
++
++	if (dai->playback.channels_min) {
++		struct snd_pcm_substream *substream =
++			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
++		struct snd_dma_buffer *buf = &substream->dma_buffer;
++
++		imx_ssi_fiq_tx_buffer = (unsigned long)buf->area;
++	}
++
++	if (dai->capture.channels_min) {
++		struct snd_pcm_substream *substream =
++			pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
++		struct snd_dma_buffer *buf = &substream->dma_buffer;
++
++		imx_ssi_fiq_rx_buffer = (unsigned long)buf->area;
++	}
++
++	set_fiq_handler(&imx_ssi_fiq_start,
++		&imx_ssi_fiq_end - &imx_ssi_fiq_start);
++
++	return 0;
++}
++
++static struct snd_soc_platform imx_soc_platform_fiq = {
++	.pcm_ops 	= &imx_pcm_ops,
++	.pcm_new	= imx_pcm_fiq_new,
++	.pcm_free	= imx_pcm_free,
++};
++
++struct snd_soc_platform *imx_ssi_fiq_init(struct platform_device *pdev,
++		struct imx_ssi *ssi)
++{
++	int ret = 0;
++
++	ret = claim_fiq(&fh);
++	if (ret) {
++		dev_err(&pdev->dev, "failed to claim fiq: %d", ret);
++		return ERR_PTR(ret);
++	}
++
++	mxc_set_irq_fiq(ssi->irq, 1);
++
++	imx_pcm_fiq = ssi->irq;
++
++	imx_ssi_fiq_base = (unsigned long)ssi->base;
++
++	ssi->dma_params_tx.burstsize = 4;
++	ssi->dma_params_rx.burstsize = 6;
++
++	return &imx_soc_platform_fiq;
++}
++
++void imx_ssi_fiq_exit(struct platform_device *pdev,
++		struct imx_ssi *ssi)
++{
++	mxc_set_irq_fiq(ssi->irq, 0);
++	release_fiq(&fh);
++}
++
+diff --git a/sound/soc/imx/imx-ssi.c b/sound/soc/imx/imx-ssi.c
+new file mode 100644
+index 0000000..9823425
+--- /dev/null
++++ b/sound/soc/imx/imx-ssi.c
+@@ -0,0 +1,766 @@
++/*
++ * imx-ssi.c  --  ALSA Soc Audio Layer
++ *
++ * Copyright 2009 Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This code is based on code copyrighted by Freescale,
++ * Liam Girdwood, Javier Martin and probably others.
++ *
++ *  This program is free software; you can redistribute  it and/or modify it
++ *  under  the terms of  the GNU General  Public License as published by the
++ *  Free Software Foundation;  either version 2 of the  License, or (at your
++ *  option) any later version.
++ *
++ *
++ * The i.MX SSI core has some nasty limitations in AC97 mode. While most
++ * sane processor vendors have a FIFO per AC97 slot, the i.MX has only
++ * one FIFO which combines all valid receive slots. We cannot even select
++ * which slots we want to receive. The WM9712 with which this driver
++ * was developped with always sends GPIO status data in slot 12 which
++ * we receive in our (PCM-) data stream. The only chance we have is to
++ * manually skip this data in the FIQ handler. With sampling rates different
++ * from 48000Hz not every frame has valid receive data, so the ratio
++ * between pcm data and GPIO status data changes. Our FIQ handler is not
++ * able to handle this, hence this driver only works with 48000Hz sampling
++ * rate.
++ * Reading and writing AC97 registers is another challange. The core
++ * provides us status bits when the read register is updated with *another*
++ * value. When we read the same register two times (and the register still
++ * contains the same value) these status bits are not set. We work
++ * around this by not polling these bits but only wait a fixed delay.
++ * 
++ */
++
++#include <linux/clk.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/dma-mapping.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++
++#include <sound/core.h>
++#include <sound/initval.h>
++#include <sound/pcm.h>
++#include <sound/pcm_params.h>
++#include <sound/soc.h>
++
++#include <mach/ssi.h>
++#include <mach/hardware.h>
++
++#include "imx-ssi.h"
++
++#define SSI_SACNT_DEFAULT (SSI_SACNT_AC97EN | SSI_SACNT_FV)
++
++/*
++ * SSI Network Mode or TDM slots configuration.
++ * Should only be called when port is inactive (i.e. SSIEN = 0).
++ */
++static int imx_ssi_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai,
++	unsigned int mask, int slots)
++{
++	struct imx_ssi *ssi = container_of(cpu_dai, struct imx_ssi, dai);
++	u32 sccr;
++
++	sccr = readl(ssi->base + SSI_STCCR);
++	sccr &= ~SSI_STCCR_DC_MASK;
++	sccr |= SSI_STCCR_DC(slots - 1);
++	writel(sccr, ssi->base + SSI_STCCR);
++
++	sccr = readl(ssi->base + SSI_SRCCR);
++	sccr &= ~SSI_STCCR_DC_MASK;
++	sccr |= SSI_STCCR_DC(slots - 1);
++	writel(sccr, ssi->base + SSI_SRCCR);
++
++	writel(0, ssi->base + SSI_STMSK);
++
++	writel(mask, ssi->base + SSI_SRMSK);
++
++	return 0;
++}
++
++/*
++ * SSI DAI format configuration.
++ * Should only be called when port is inactive (i.e. SSIEN = 0).
++ * Note: We don't use the I2S modes but instead manually configure the
++ * SSI for I2S because the I2S mode is only a register preset.
++ */
++static int imx_ssi_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
++{
++	struct imx_ssi *ssi = container_of(cpu_dai, struct imx_ssi, dai);
++	u32 strcr = 0, scr;
++
++	scr = readl(ssi->base + SSI_SCR) & ~(SSI_SCR_SYN | SSI_SCR_NET);
++
++	/* DAI mode */
++	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
++	case SND_SOC_DAIFMT_I2S:
++		/* data on rising edge of bclk, frame low 1clk before data */
++		strcr |= SSI_STCR_TFSI | SSI_STCR_TEFS | SSI_STCR_TXBIT0;
++		scr |= SSI_SCR_NET;
++		break;
++	case SND_SOC_DAIFMT_LEFT_J:
++		/* data on rising edge of bclk, frame high with data */
++		strcr |= SSI_STCR_TXBIT0;
++		break;
++	case SND_SOC_DAIFMT_DSP_B:
++		/* data on rising edge of bclk, frame high with data */
++		strcr |= SSI_STCR_TFSL;
++		break;
++	case SND_SOC_DAIFMT_DSP_A:
++		/* data on rising edge of bclk, frame high 1clk before data */
++		strcr |= SSI_STCR_TFSL | SSI_STCR_TEFS;
++		break;
++	}
++
++	/* DAI clock inversion */
++	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
++	case SND_SOC_DAIFMT_IB_IF:
++		strcr &= ~(SSI_STCR_TSCKP | SSI_STCR_TFSI);
++		break;
++	case SND_SOC_DAIFMT_IB_NF:
++		strcr |= SSI_STCR_TFSI;
++		strcr &= ~SSI_STCR_TSCKP;
++		break;
++	case SND_SOC_DAIFMT_NB_IF:
++		strcr |= SSI_STCR_TSCKP;
++		strcr &= ~SSI_STCR_TFSI;
++		break;
++	case SND_SOC_DAIFMT_NB_NF:
++		strcr |= SSI_STCR_TFSI | SSI_STCR_TSCKP;
++		break;
++	}
++
++	/* DAI clock master masks */
++	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
++	case SND_SOC_DAIFMT_CBS_CFS:
++		strcr |= SSI_STCR_TFDIR | SSI_STCR_TXDIR;
++		break;
++	case SND_SOC_DAIFMT_CBM_CFS:
++		strcr |= SSI_STCR_TFDIR;
++		break;
++	case SND_SOC_DAIFMT_CBS_CFM:
++		strcr |= SSI_STCR_TXDIR;
++		break;
++	case SND_SOC_DAIFMT_CBM_CFM:
++		strcr &= ~(SSI_STCR_TFDIR | SSI_STCR_TXDIR);
++		break;
++	}
++
++	strcr |= SSI_STCR_TFEN0;
++
++	writel(strcr, ssi->base + SSI_STCR);
++	writel(strcr, ssi->base + SSI_SRCR);
++	writel(scr, ssi->base + SSI_SCR);
++
++	return 0;
++}
++
++/*
++ * SSI system clock configuration.
++ * Should only be called when port is inactive (i.e. SSIEN = 0).
++ */
++static int imx_ssi_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
++				  int clk_id, unsigned int freq, int dir)
++{
++	struct imx_ssi *ssi = container_of(cpu_dai, struct imx_ssi, dai);
++	u32 scr;
++
++	scr = readl(ssi->base + SSI_SCR);
++
++	switch (clk_id) {
++	case IMX_SSP_SYS_CLK:
++		if (dir == SND_SOC_CLOCK_OUT)
++			scr |= SSI_SCR_SYS_CLK_EN;
++		else
++			scr &= ~SSI_SCR_SYS_CLK_EN;
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	writel(scr, ssi->base + SSI_SCR);
++
++	return 0;
++}
++
++/*
++ * SSI Clock dividers
++ * Should only be called when port is inactive (i.e. SSIEN = 0).
++ */
++static int imx_ssi_set_dai_clkdiv(struct snd_soc_dai *cpu_dai,
++				  int div_id, int div)
++{
++	struct imx_ssi *ssi = container_of(cpu_dai, struct imx_ssi, dai);
++	u32 stccr, srccr;
++
++	stccr = readl(ssi->base + SSI_STCCR);
++	srccr = readl(ssi->base + SSI_SRCCR);
++
++	switch (div_id) {
++	case IMX_SSI_TX_DIV_2:
++		stccr &= ~SSI_STCCR_DIV2;
++		stccr |= div;
++		break;
++	case IMX_SSI_TX_DIV_PSR:
++		stccr &= ~SSI_STCCR_PSR;
++		stccr |= div;
++		break;
++	case IMX_SSI_TX_DIV_PM:
++		stccr &= ~0xff;
++		stccr |= SSI_STCCR_PM(div);
++		break;
++	case IMX_SSI_RX_DIV_2:
++		stccr &= ~SSI_STCCR_DIV2;
++		stccr |= div;
++		break;
++	case IMX_SSI_RX_DIV_PSR:
++		stccr &= ~SSI_STCCR_PSR;
++		stccr |= div;
++		break;
++	case IMX_SSI_RX_DIV_PM:
++		stccr &= ~0xff;
++		stccr |= SSI_STCCR_PM(div);
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	writel(stccr, ssi->base + SSI_STCCR);
++	writel(srccr, ssi->base + SSI_SRCCR);
++
++	return 0;
++}
++
++/*
++ * Should only be called when port is inactive (i.e. SSIEN = 0),
++ * although can be called multiple times by upper layers.
++ */
++static int imx_ssi_hw_params(struct snd_pcm_substream *substream,
++			     struct snd_pcm_hw_params *params,
++			     struct snd_soc_dai *cpu_dai)
++{
++	struct imx_ssi *ssi = container_of(cpu_dai, struct imx_ssi, dai);
++	u32 reg, sccr;
++
++	/* Tx/Rx config */
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		reg = SSI_STCCR;
++		cpu_dai->dma_data = &ssi->dma_params_tx;
++	} else {
++		reg = SSI_SRCCR;
++		cpu_dai->dma_data = &ssi->dma_params_rx;
++	}
++
++	sccr = readl(ssi->base + reg) & ~SSI_STCCR_WL_MASK;
++
++	/* DAI data (word) size */
++	switch (params_format(params)) {
++	case SNDRV_PCM_FORMAT_S16_LE:
++		sccr |= SSI_SRCCR_WL(16);
++		break;
++	case SNDRV_PCM_FORMAT_S20_3LE:
++		sccr |= SSI_SRCCR_WL(20);
++		break;
++	case SNDRV_PCM_FORMAT_S24_LE:
++		sccr |= SSI_SRCCR_WL(24);
++		break;
++	}
++
++	writel(sccr, ssi->base + reg);
++
++	return 0;
++}
++
++static int imx_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
++		struct snd_soc_dai *dai)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct snd_soc_dai *cpu_dai = rtd->dai->cpu_dai;
++	struct imx_ssi *ssi = container_of(cpu_dai, struct imx_ssi, dai);
++	unsigned int sier_bits, sier;
++	unsigned int scr;
++
++	scr = readl(ssi->base + SSI_SCR);
++	sier = readl(ssi->base + SSI_SIER);
++
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		if (ssi->flags & IMX_SSI_DMA)
++			sier_bits = SSI_SIER_TDMAE;
++		else
++			sier_bits = SSI_SIER_TIE | SSI_SIER_TFE0_EN;
++	} else {
++		if (ssi->flags & IMX_SSI_DMA)
++			sier_bits = SSI_SIER_RDMAE;
++		else
++			sier_bits = SSI_SIER_RIE | SSI_SIER_RFF0_EN;
++	}
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++	case SNDRV_PCM_TRIGGER_RESUME:
++	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
++		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
++			scr |= SSI_SCR_TE;
++		else
++			scr |= SSI_SCR_RE;
++		sier |= sier_bits;
++
++		if (++ssi->enabled == 1)
++			scr |= SSI_SCR_SSIEN;
++
++		break;
++
++	case SNDRV_PCM_TRIGGER_STOP:
++	case SNDRV_PCM_TRIGGER_SUSPEND:
++	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
++		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
++			scr &= ~SSI_SCR_TE;
++		else
++			scr &= ~SSI_SCR_RE;
++		sier &= ~sier_bits;
++
++		if (--ssi->enabled == 0)
++			scr &= ~SSI_SCR_SSIEN;
++
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	if (!(ssi->flags & IMX_SSI_USE_AC97))
++		/* rx/tx are always enabled to access ac97 registers */
++		writel(scr, ssi->base + SSI_SCR);
++
++	writel(sier, ssi->base + SSI_SIER);
++
++	return 0;
++}
++
++static struct snd_soc_dai_ops imx_ssi_pcm_dai_ops = {
++	.hw_params	= imx_ssi_hw_params,
++	.set_fmt	= imx_ssi_set_dai_fmt,
++	.set_clkdiv	= imx_ssi_set_dai_clkdiv,
++	.set_sysclk	= imx_ssi_set_dai_sysclk,
++	.set_tdm_slot	= imx_ssi_set_dai_tdm_slot,
++	.trigger	= imx_ssi_trigger,
++};
++
++static struct snd_soc_dai imx_ssi_dai = {
++	.playback = {
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = SNDRV_PCM_RATE_8000_96000,
++		.formats = SNDRV_PCM_FMTBIT_S16_LE,
++	},
++	.capture = {
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = SNDRV_PCM_RATE_8000_96000,
++		.formats = SNDRV_PCM_FMTBIT_S16_LE,
++	},
++	.ops = &imx_ssi_pcm_dai_ops,
++};
++
++int snd_imx_pcm_mmap(struct snd_pcm_substream *substream,
++		struct vm_area_struct *vma)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	int ret;
++
++	ret = dma_mmap_coherent(NULL, vma, runtime->dma_area,
++			runtime->dma_addr, runtime->dma_bytes);
++
++	pr_debug("%s: ret: %d %p 0x%08x 0x%08x\n", __func__, ret,
++			runtime->dma_area,
++			runtime->dma_addr,
++			runtime->dma_bytes);
++	return ret;
++}
++
++static int imx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
++{
++	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
++	struct snd_dma_buffer *buf = &substream->dma_buffer;
++	size_t size = IMX_SSI_DMABUF_SIZE;
++
++	buf->dev.type = SNDRV_DMA_TYPE_DEV;
++	buf->dev.dev = pcm->card->dev;
++	buf->private_data = NULL;
++	buf->area = dma_alloc_writecombine(pcm->card->dev, size,
++					   &buf->addr, GFP_KERNEL);
++	if (!buf->area)
++		return -ENOMEM;
++	buf->bytes = size;
++
++	return 0;
++}
++
++static u64 imx_pcm_dmamask = DMA_BIT_MASK(32);
++
++int imx_pcm_new(struct snd_card *card, struct snd_soc_dai *dai,
++	struct snd_pcm *pcm)
++{
++
++	int ret = 0;
++
++	if (!card->dev->dma_mask)
++		card->dev->dma_mask = &imx_pcm_dmamask;
++	if (!card->dev->coherent_dma_mask)
++		card->dev->coherent_dma_mask = DMA_BIT_MASK(32);
++	if (dai->playback.channels_min) {
++		ret = imx_pcm_preallocate_dma_buffer(pcm,
++			SNDRV_PCM_STREAM_PLAYBACK);
++		if (ret)
++			goto out;
++	}
++
++	if (dai->capture.channels_min) {
++		ret = imx_pcm_preallocate_dma_buffer(pcm,
++			SNDRV_PCM_STREAM_CAPTURE);
++		if (ret)
++			goto out;
++	}
++
++out:
++	return ret;
++}
++
++void imx_pcm_free(struct snd_pcm *pcm)
++{
++	struct snd_pcm_substream *substream;
++	struct snd_dma_buffer *buf;
++	int stream;
++
++	for (stream = 0; stream < 2; stream++) {
++		substream = pcm->streams[stream].substream;
++		if (!substream)
++			continue;
++
++		buf = &substream->dma_buffer;
++		if (!buf->area)
++			continue;
++
++		dma_free_writecombine(pcm->card->dev, buf->bytes,
++				      buf->area, buf->addr);
++		buf->area = NULL;
++	}
++}
++
++struct snd_soc_platform imx_soc_platform = {
++	.name		= "imx-audio",
++};
++EXPORT_SYMBOL_GPL(imx_soc_platform);
++
++static struct snd_soc_dai imx_ac97_dai = {
++	.name = "AC97",
++	.ac97_control = 1,
++	.playback = {
++		.stream_name = "AC97 Playback",
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = SND_SOC_STD_AC97_FMTS,
++		.formats = SNDRV_PCM_FMTBIT_S16_LE,
++	},
++	.capture = {
++		.stream_name = "AC97 Capture",
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = SNDRV_PCM_RATE_48000,
++		.formats = SNDRV_PCM_FMTBIT_S16_LE,
++	},
++	.ops = &imx_ssi_pcm_dai_ops,
++};
++
++static void setup_channel_to_ac97(struct imx_ssi *imx_ssi)
++{
++	void __iomem *base = imx_ssi->base;
++
++	writel(0x0, base + SSI_SCR);
++	writel(0x0, base + SSI_STCR);
++	writel(0x0, base + SSI_SRCR);
++
++	writel(SSI_SCR_SYN | SSI_SCR_NET, base + SSI_SCR);
++
++	writel(SSI_SFCSR_RFWM0(8) |
++		SSI_SFCSR_TFWM0(8) |
++		SSI_SFCSR_RFWM1(8) |
++		SSI_SFCSR_TFWM1(8), base + SSI_SFCSR);
++
++	writel(SSI_STCCR_WL(16) | SSI_STCCR_DC(12), base + SSI_STCCR);
++	writel(SSI_STCCR_WL(16) | SSI_STCCR_DC(12), base + SSI_SRCCR);
++
++	writel(SSI_SCR_SYN | SSI_SCR_NET | SSI_SCR_SSIEN, base + SSI_SCR);
++	writel(SSI_SOR_WAIT(3), base + SSI_SOR);
++
++	writel(SSI_SCR_SYN | SSI_SCR_NET | SSI_SCR_SSIEN |
++			SSI_SCR_TE | SSI_SCR_RE,
++			base + SSI_SCR);
++
++	writel(SSI_SACNT_DEFAULT, base + SSI_SACNT);
++	writel(0xff, base + SSI_SACCDIS);
++	writel(0x300, base + SSI_SACCEN);
++}
++
++static struct imx_ssi *ac97_ssi;
++
++static void imx_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
++		unsigned short val)
++{
++	struct imx_ssi *imx_ssi = ac97_ssi;
++	void __iomem *base = imx_ssi->base;
++	unsigned int lreg;
++	unsigned int lval;
++
++	if (reg > 0x7f)
++		return;
++
++	pr_debug("%s: 0x%02x 0x%04x\n", __func__, reg, val);
++
++	lreg = reg <<  12;
++	writel(lreg, base + SSI_SACADD);
++
++	lval = val << 4;
++	writel(lval , base + SSI_SACDAT);
++
++	writel(SSI_SACNT_DEFAULT | SSI_SACNT_WR, base + SSI_SACNT);
++	udelay(100);
++}
++
++static unsigned short imx_ssi_ac97_read(struct snd_ac97 *ac97,
++		unsigned short reg)
++{
++	struct imx_ssi *imx_ssi = ac97_ssi;
++	void __iomem *base = imx_ssi->base;
++
++	unsigned short val = -1;
++	unsigned int lreg;
++
++	lreg = (reg & 0x7f) <<  12 ;
++	writel(lreg, base + SSI_SACADD);
++	writel(SSI_SACNT_DEFAULT | SSI_SACNT_RD, base + SSI_SACNT);
++
++	udelay(100);
++
++	val = (readl(base + SSI_SACDAT) >> 4) & 0xffff;
++
++	pr_debug("%s: 0x%02x 0x%04x\n", __func__, reg, val);
++
++	return val;
++}
++
++static void imx_ssi_ac97_reset(struct snd_ac97 *ac97)
++{
++	struct imx_ssi *imx_ssi = ac97_ssi;
++
++	if (imx_ssi->ac97_reset)
++		imx_ssi->ac97_reset(ac97);
++}
++
++static void imx_ssi_ac97_warm_reset(struct snd_ac97 *ac97)
++{
++	struct imx_ssi *imx_ssi = ac97_ssi;
++
++	if (imx_ssi->ac97_warm_reset)
++		imx_ssi->ac97_warm_reset(ac97);
++}
++
++struct snd_ac97_bus_ops soc_ac97_ops = {
++	.read		= imx_ssi_ac97_read,
++	.write		= imx_ssi_ac97_write,
++	.reset		= imx_ssi_ac97_reset,
++	.warm_reset	= imx_ssi_ac97_warm_reset
++};
++EXPORT_SYMBOL_GPL(soc_ac97_ops);
++
++struct snd_soc_dai *imx_ssi_pcm_dai[2];
++EXPORT_SYMBOL_GPL(imx_ssi_pcm_dai);
++
++static int imx_ssi_probe(struct platform_device *pdev)
++{
++	struct resource *res;
++	struct imx_ssi *ssi;
++	struct imx_ssi_platform_data *pdata = pdev->dev.platform_data;
++	struct snd_soc_platform *platform;
++	int ret = 0;
++	unsigned int val;
++
++	ssi = kzalloc(sizeof(*ssi), GFP_KERNEL);
++	if (!ssi)
++		return -ENOMEM;
++
++	if (pdata) {
++		ssi->ac97_reset = pdata->ac97_reset;
++		ssi->ac97_warm_reset = pdata->ac97_warm_reset;
++		ssi->flags = pdata->flags;
++	}
++
++	imx_ssi_pcm_dai[pdev->id] = &ssi->dai;
++
++	ssi->irq = platform_get_irq(pdev, 0);
++
++	ssi->clk = clk_get(&pdev->dev, NULL);
++	if (IS_ERR(ssi->clk)) {
++		ret = PTR_ERR(ssi->clk);
++		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
++			ret);
++		goto failed_clk;
++	}
++	clk_enable(ssi->clk);
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		ret = -ENODEV;
++		goto failed_get_resource;
++	}
++
++	if (!request_mem_region(res->start, resource_size(res), DRV_NAME)) {
++		dev_err(&pdev->dev, "request_mem_region failed\n");
++		ret = -EBUSY;
++		goto failed_get_resource;
++	}
++
++	ssi->base = ioremap(res->start, resource_size(res));
++	if (!ssi->base) {
++		dev_err(&pdev->dev, "ioremap failed\n");
++		ret = -ENODEV;
++		goto failed_ioremap;
++	}
++
++	if (ssi->flags & IMX_SSI_USE_AC97) {
++		if (ac97_ssi) {
++			ret = -EBUSY;
++			goto failed_ac97;
++		}
++		ac97_ssi = ssi;
++		setup_channel_to_ac97(ssi);
++		memcpy(&ssi->dai, &imx_ac97_dai, sizeof(imx_ac97_dai));
++	} else
++		memcpy(&ssi->dai, &imx_ssi_dai, sizeof(imx_ssi_dai));
++
++	ssi->dai.id = pdev->id;
++	ssi->dai.dev = &pdev->dev;
++	ssi->dai.name = kasprintf(GFP_KERNEL, "imx-ssi.%d", pdev->id);
++
++	writel(0x0, ssi->base + SSI_SIER);
++
++	ssi->dma_params_rx.dma_addr = res->start + SSI_SRX0;
++	ssi->dma_params_tx.dma_addr = res->start + SSI_STX0;
++
++	res = platform_get_resource_byname(pdev, IORESOURCE_DMA, "tx0");
++	if (res)
++		ssi->dma_params_tx.dma = res->start;
++
++	res = platform_get_resource_byname(pdev, IORESOURCE_DMA, "rx0");
++	if (res)
++		ssi->dma_params_rx.dma = res->start;
++
++	ssi->dai.id = pdev->id;
++	ssi->dai.dev = &pdev->dev;
++	ssi->dai.name = kasprintf(GFP_KERNEL, "imx-ssi.%d", pdev->id);
++
++	if ((cpu_is_mx27() || cpu_is_mx21()) &&
++			!(ssi->flags & IMX_SSI_USE_AC97)) {
++		ssi->flags |= IMX_SSI_DMA;
++		platform = imx_ssi_dma_mx2_init(pdev, ssi);
++	} else
++		platform = imx_ssi_fiq_init(pdev, ssi);
++
++	imx_soc_platform.pcm_ops = platform->pcm_ops;
++	imx_soc_platform.pcm_new = platform->pcm_new;
++	imx_soc_platform.pcm_free = platform->pcm_free;
++
++	val = SSI_SFCSR_TFWM0(ssi->dma_params_tx.burstsize) |
++		SSI_SFCSR_RFWM0(ssi->dma_params_rx.burstsize);
++	writel(val, ssi->base + SSI_SFCSR);
++
++	ret = snd_soc_register_dai(&ssi->dai);
++	if (ret) {
++		dev_err(&pdev->dev, "register DAI failed\n");
++		goto failed_register;
++	}
++
++	platform_set_drvdata(pdev, ssi);
++
++	return 0;
++
++failed_register:
++failed_ac97:
++	iounmap(ssi->base);
++failed_ioremap:
++	release_mem_region(res->start, resource_size(res));
++failed_get_resource:
++	clk_disable(ssi->clk);
++	clk_put(ssi->clk);
++failed_clk:
++	kfree(ssi);
++
++	return ret;
++}
++
++static int __devexit imx_ssi_remove(struct platform_device *pdev)
++{
++	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	struct imx_ssi *ssi = platform_get_drvdata(pdev);
++
++	snd_soc_unregister_dai(&ssi->dai);
++
++	if (ssi->flags & IMX_SSI_USE_AC97)
++		ac97_ssi = NULL;
++
++	if (!(ssi->flags & IMX_SSI_DMA))
++		imx_ssi_fiq_exit(pdev, ssi);
++
++	iounmap(ssi->base);
++	release_mem_region(res->start, resource_size(res));
++	clk_disable(ssi->clk);
++	clk_put(ssi->clk);
++	kfree(ssi);
++
++	return 0;
++}
++
++static struct platform_driver imx_ssi_driver = {
++	.probe = imx_ssi_probe,
++	.remove = __devexit_p(imx_ssi_remove),
++
++	.driver = {
++		.name = DRV_NAME,
++		.owner = THIS_MODULE,
++	},
++};
++
++static int __init imx_ssi_init(void)
++{
++	int ret;
++
++	ret = snd_soc_register_platform(&imx_soc_platform);
++	if (ret) {
++		pr_err("failed to register soc platform: %d\n", ret);
++		return ret;
++	}
++
++	ret = platform_driver_register(&imx_ssi_driver);
++	if (ret) {
++		snd_soc_unregister_platform(&imx_soc_platform);
++		return ret;
++	}
++
++	return 0;
++}
++
++static void __exit imx_ssi_exit(void)
++{
++	platform_driver_unregister(&imx_ssi_driver);
++	snd_soc_unregister_platform(&imx_soc_platform);
++}
++
++module_init(imx_ssi_init);
++module_exit(imx_ssi_exit);
++
++/* Module information */
++MODULE_AUTHOR("Sascha Hauer, <s.hauer@pengutronix.de>");
++MODULE_DESCRIPTION("i.MX I2S/ac97 SoC Interface");
++MODULE_LICENSE("GPL");
++
+diff --git a/sound/soc/imx/imx-ssi.h b/sound/soc/imx/imx-ssi.h
+new file mode 100644
+index 0000000..2823fd0
+--- /dev/null
++++ b/sound/soc/imx/imx-ssi.h
+@@ -0,0 +1,238 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#ifndef _IMX_SSI_H
++#define _IMX_SSI_H
++
++#define SSI_STX0	0x00
++#define SSI_STX1	0x04
++#define SSI_SRX0	0x08
++#define SSI_SRX1	0x0c
++
++#define SSI_SCR		0x10
++#define SSI_SCR_CLK_IST		(1 << 9)
++#define SSI_SCR_CLK_IST_SHIFT	9
++#define SSI_SCR_TCH_EN		(1 << 8)
++#define SSI_SCR_SYS_CLK_EN	(1 << 7)
++#define SSI_SCR_I2S_MODE_NORM	(0 << 5)
++#define SSI_SCR_I2S_MODE_MSTR	(1 << 5)
++#define SSI_SCR_I2S_MODE_SLAVE	(2 << 5)
++#define SSI_I2S_MODE_MASK	(3 << 5)
++#define SSI_SCR_SYN		(1 << 4)
++#define SSI_SCR_NET		(1 << 3)
++#define SSI_SCR_RE		(1 << 2)
++#define SSI_SCR_TE		(1 << 1)
++#define SSI_SCR_SSIEN		(1 << 0)
++
++#define SSI_SISR	0x14
++#define SSI_SISR_MASK		((1 << 19) - 1)
++#define SSI_SISR_CMDAU		(1 << 18)
++#define SSI_SISR_CMDDU		(1 << 17)
++#define SSI_SISR_RXT		(1 << 16)
++#define SSI_SISR_RDR1		(1 << 15)
++#define SSI_SISR_RDR0		(1 << 14)
++#define SSI_SISR_TDE1		(1 << 13)
++#define SSI_SISR_TDE0		(1 << 12)
++#define SSI_SISR_ROE1		(1 << 11)
++#define SSI_SISR_ROE0		(1 << 10)
++#define SSI_SISR_TUE1		(1 << 9)
++#define SSI_SISR_TUE0		(1 << 8)
++#define SSI_SISR_TFS		(1 << 7)
++#define SSI_SISR_RFS		(1 << 6)
++#define SSI_SISR_TLS		(1 << 5)
++#define SSI_SISR_RLS		(1 << 4)
++#define SSI_SISR_RFF1		(1 << 3)
++#define SSI_SISR_RFF0		(1 << 2)
++#define SSI_SISR_TFE1		(1 << 1)
++#define SSI_SISR_TFE0		(1 << 0)
++
++#define SSI_SIER	0x18
++#define SSI_SIER_RDMAE		(1 << 22)
++#define SSI_SIER_RIE		(1 << 21)
++#define SSI_SIER_TDMAE		(1 << 20)
++#define SSI_SIER_TIE		(1 << 19)
++#define SSI_SIER_CMDAU_EN	(1 << 18)
++#define SSI_SIER_CMDDU_EN	(1 << 17)
++#define SSI_SIER_RXT_EN		(1 << 16)
++#define SSI_SIER_RDR1_EN	(1 << 15)
++#define SSI_SIER_RDR0_EN	(1 << 14)
++#define SSI_SIER_TDE1_EN	(1 << 13)
++#define SSI_SIER_TDE0_EN	(1 << 12)
++#define SSI_SIER_ROE1_EN	(1 << 11)
++#define SSI_SIER_ROE0_EN	(1 << 10)
++#define SSI_SIER_TUE1_EN	(1 << 9)
++#define SSI_SIER_TUE0_EN	(1 << 8)
++#define SSI_SIER_TFS_EN		(1 << 7)
++#define SSI_SIER_RFS_EN		(1 << 6)
++#define SSI_SIER_TLS_EN		(1 << 5)
++#define SSI_SIER_RLS_EN		(1 << 4)
++#define SSI_SIER_RFF1_EN	(1 << 3)
++#define SSI_SIER_RFF0_EN	(1 << 2)
++#define SSI_SIER_TFE1_EN	(1 << 1)
++#define SSI_SIER_TFE0_EN	(1 << 0)
++
++#define SSI_STCR	0x1c
++#define SSI_STCR_TXBIT0		(1 << 9)
++#define SSI_STCR_TFEN1		(1 << 8)
++#define SSI_STCR_TFEN0		(1 << 7)
++#define SSI_FIFO_ENABLE_0_SHIFT 7
++#define SSI_STCR_TFDIR		(1 << 6)
++#define SSI_STCR_TXDIR		(1 << 5)
++#define SSI_STCR_TSHFD		(1 << 4)
++#define SSI_STCR_TSCKP		(1 << 3)
++#define SSI_STCR_TFSI		(1 << 2)
++#define SSI_STCR_TFSL		(1 << 1)
++#define SSI_STCR_TEFS		(1 << 0)
++
++#define SSI_SRCR	0x20
++#define SSI_SRCR_RXBIT0		(1 << 9)
++#define SSI_SRCR_RFEN1		(1 << 8)
++#define SSI_SRCR_RFEN0		(1 << 7)
++#define SSI_FIFO_ENABLE_0_SHIFT 7
++#define SSI_SRCR_RFDIR		(1 << 6)
++#define SSI_SRCR_RXDIR		(1 << 5)
++#define SSI_SRCR_RSHFD		(1 << 4)
++#define SSI_SRCR_RSCKP		(1 << 3)
++#define SSI_SRCR_RFSI		(1 << 2)
++#define SSI_SRCR_RFSL		(1 << 1)
++#define SSI_SRCR_REFS		(1 << 0)
++
++#define SSI_SRCCR		0x28
++#define SSI_SRCCR_DIV2		(1 << 18)
++#define SSI_SRCCR_PSR		(1 << 17)
++#define SSI_SRCCR_WL(x)		((((x) - 2) >> 1) << 13)
++#define SSI_SRCCR_DC(x)		(((x) & 0x1f) << 8)
++#define SSI_SRCCR_PM(x)		(((x) & 0xff) << 0)
++#define SSI_SRCCR_WL_MASK	(0xf << 13)
++#define SSI_SRCCR_DC_MASK	(0x1f << 8)
++#define SSI_SRCCR_PM_MASK	(0xff << 0)
++
++#define SSI_STCCR		0x24
++#define SSI_STCCR_DIV2		(1 << 18)
++#define SSI_STCCR_PSR		(1 << 17)
++#define SSI_STCCR_WL(x)		((((x) - 2) >> 1) << 13)
++#define SSI_STCCR_DC(x)		(((x) & 0x1f) << 8)
++#define SSI_STCCR_PM(x)		(((x) & 0xff) << 0)
++#define SSI_STCCR_WL_MASK	(0xf << 13)
++#define SSI_STCCR_DC_MASK	(0x1f << 8)
++#define SSI_STCCR_PM_MASK	(0xff << 0)
++
++#define SSI_SFCSR	0x2c
++#define SSI_SFCSR_RFCNT1(x)	(((x) & 0xf) << 28)
++#define SSI_RX_FIFO_1_COUNT_SHIFT 28
++#define SSI_SFCSR_TFCNT1(x)	(((x) & 0xf) << 24)
++#define SSI_TX_FIFO_1_COUNT_SHIFT 24
++#define SSI_SFCSR_RFWM1(x)	(((x) & 0xf) << 20)
++#define SSI_SFCSR_TFWM1(x)	(((x) & 0xf) << 16)
++#define SSI_SFCSR_RFCNT0(x)	(((x) & 0xf) << 12)
++#define SSI_RX_FIFO_0_COUNT_SHIFT 12
++#define SSI_SFCSR_TFCNT0(x)	(((x) & 0xf) <<  8)
++#define SSI_TX_FIFO_0_COUNT_SHIFT 8
++#define SSI_SFCSR_RFWM0(x)	(((x) & 0xf) <<  4)
++#define SSI_SFCSR_TFWM0(x)	(((x) & 0xf) <<  0)
++#define SSI_SFCSR_RFWM0_MASK	(0xf <<  4)
++#define SSI_SFCSR_TFWM0_MASK	(0xf <<  0)
++
++#define SSI_STR		0x30
++#define SSI_STR_TEST		(1 << 15)
++#define SSI_STR_RCK2TCK		(1 << 14)
++#define SSI_STR_RFS2TFS		(1 << 13)
++#define SSI_STR_RXSTATE(x)	(((x) & 0xf) << 8)
++#define SSI_STR_TXD2RXD		(1 <<  7)
++#define SSI_STR_TCK2RCK		(1 <<  6)
++#define SSI_STR_TFS2RFS		(1 <<  5)
++#define SSI_STR_TXSTATE(x)	(((x) & 0xf) << 0)
++
++#define SSI_SOR		0x34
++#define SSI_SOR_CLKOFF		(1 << 6)
++#define SSI_SOR_RX_CLR		(1 << 5)
++#define SSI_SOR_TX_CLR		(1 << 4)
++#define SSI_SOR_INIT		(1 << 3)
++#define SSI_SOR_WAIT(x)		(((x) & 0x3) << 1)
++#define SSI_SOR_WAIT_MASK	(0x3 << 1)
++#define SSI_SOR_SYNRST		(1 << 0)
++
++#define SSI_SACNT	0x38
++#define SSI_SACNT_FRDIV(x)	(((x) & 0x3f) << 5)
++#define SSI_SACNT_WR		(1 << 4)
++#define SSI_SACNT_RD		(1 << 3)
++#define SSI_SACNT_TIF		(1 << 2)
++#define SSI_SACNT_FV		(1 << 1)
++#define SSI_SACNT_AC97EN	(1 << 0)
++
++#define SSI_SACADD	0x3c
++#define SSI_SACDAT	0x40
++#define SSI_SATAG	0x44
++#define SSI_STMSK	0x48
++#define SSI_SRMSK	0x4c
++#define SSI_SACCST	0x50
++#define SSI_SACCEN	0x54
++#define SSI_SACCDIS	0x58
++
++/* SSI clock sources */
++#define IMX_SSP_SYS_CLK		0
++
++/* SSI audio dividers */
++#define IMX_SSI_TX_DIV_2	0
++#define IMX_SSI_TX_DIV_PSR	1
++#define IMX_SSI_TX_DIV_PM	2
++#define IMX_SSI_RX_DIV_2	3
++#define IMX_SSI_RX_DIV_PSR	4
++#define IMX_SSI_RX_DIV_PM	5
++
++extern struct snd_soc_dai *imx_ssi_pcm_dai[2];
++extern struct snd_soc_platform imx_soc_platform;
++
++#define DRV_NAME "imx-ssi"
++
++struct imx_pcm_dma_params {
++	int dma;
++	unsigned long dma_addr;
++	int burstsize;
++};
++
++struct imx_ssi {
++	struct snd_soc_dai dai;
++	struct platform_device *ac97_dev;
++
++	struct snd_soc_device imx_ac97;
++	struct clk *clk;
++	void __iomem *base;
++	int irq;
++	int fiq_enable;
++	unsigned int offset;
++
++	unsigned int flags;
++
++	void (*ac97_reset) (struct snd_ac97 *ac97);
++	void (*ac97_warm_reset)(struct snd_ac97 *ac97);
++
++	struct imx_pcm_dma_params	dma_params_rx;
++	struct imx_pcm_dma_params	dma_params_tx;
++
++	int enabled;
++};
++
++struct snd_soc_platform *imx_ssi_fiq_init(struct platform_device *pdev,
++		struct imx_ssi *ssi);
++void imx_ssi_fiq_exit(struct platform_device *pdev, struct imx_ssi *ssi);
++struct snd_soc_platform *imx_ssi_dma_mx2_init(struct platform_device *pdev,
++		struct imx_ssi *ssi);
++
++int snd_imx_pcm_mmap(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
++int imx_pcm_new(struct snd_card *card, struct snd_soc_dai *dai,
++	struct snd_pcm *pcm);
++void imx_pcm_free(struct snd_pcm *pcm);
++
++/*
++ * Do not change this as the FIQ handler depends on this size
++ */
++#define IMX_SSI_DMABUF_SIZE	(64 * 1024)
++
++#define DMA_RXFIFO_BURST      0x4
++#define DMA_TXFIFO_BURST      0x2
++
++#endif /* _IMX_SSI_H */
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0014-mxc_nand-Get-rid-of-pagesize_2k-flag.patch b/recipes/linux/linux-2.6.31/pcm043/0014-mxc_nand-Get-rid-of-pagesize_2k-flag.patch
new file mode 100644
index 0000000..e0c0226
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0014-mxc_nand-Get-rid-of-pagesize_2k-flag.patch
@@ -0,0 +1,128 @@
+From 8b4c0d1da3ec208fa4c79f495f75fcf0a5b01de5 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Mon, 5 Oct 2009 11:24:02 +0200
+Subject: [PATCH] mxc_nand: Get rid of pagesize_2k flag
+
+Later versions of this controller also allow 4k pagesize,
+so use mtd->writesize instead of a flag.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   29 ++++++++++++++---------------
+ 1 files changed, 14 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 450db4e..6525d0f 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -101,7 +101,6 @@ struct mxc_nand_host {
+ 	void __iomem		*base;
+ 	void __iomem		*regs;
+ 	int			status_request;
+-	int			pagesize_2k;
+ 	struct clk		*clk;
+ 	int			clk_act;
+ 	int			irq;
+@@ -214,11 +213,13 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
+ 	wait_op_done(host, TROP_US_DELAY, islast);
+ }
+ 
+-static void send_page(struct mxc_nand_host *host, unsigned int ops)
++static void send_page(struct mtd_info *mtd, unsigned int ops)
+ {
++	struct nand_chip *nand_chip = mtd->priv;
++	struct mxc_nand_host *host = nand_chip->priv;
+ 	int bufs, i;
+ 
+-	if (host->pagesize_2k)
++	if (mtd->writesize > 512)
+ 		bufs = 4;
+ 	else
+ 		bufs = 1;
+@@ -490,7 +491,7 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
+ 		 * the full page.
+ 		 */
+ 		send_addr(host, 0, page_addr == -1);
+-		if (host->pagesize_2k)
++		if (mtd->writesize > 512)
+ 			/* another col addr cycle for 2k page */
+ 			send_addr(host, 0, false);
+ 	}
+@@ -500,7 +501,7 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
+ 		/* paddr_0 - p_addr_7 */
+ 		send_addr(host, (page_addr & 0xff), false);
+ 
+-		if (host->pagesize_2k) {
++		if (mtd->writesize > 512) {
+ 			if (mtd->size >= 0x10000000) {
+ 				/* paddr_8 - paddr_15 */
+ 				send_addr(host, (page_addr >> 8) & 0xff, false);
+@@ -554,16 +555,16 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 		else
+ 			host->buf_start = column + mtd->writesize;
+ 
+-		if (host->pagesize_2k)
++		if (mtd->writesize > 512)
+ 			command = NAND_CMD_READ0; /* only READ0 is valid */
+ 
+ 		send_cmd(host, command, false);
+ 		mxc_do_addr_cycle(mtd, column, page_addr);
+ 
+-		if (host->pagesize_2k)
++		if (mtd->writesize > 512)
+ 			send_cmd(host, NAND_CMD_READSTART, true);
+ 
+-		send_page(host, NFC_OUTPUT);
++		send_page(mtd, NFC_OUTPUT);
+ 
+ 		memcpy(host->data_buf, host->main_area0, mtd->writesize);
+ 		copy_spare(mtd, true);
+@@ -578,7 +579,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 			 * pointer to spare area, we must write the whole page
+ 			 * including OOB together.
+ 			 */
+-			if (host->pagesize_2k)
++			if (mtd->writesize > 512)
+ 				/* call ourself to read a page */
+ 				mxc_nand_command(mtd, NAND_CMD_READ0, 0,
+ 						page_addr);
+@@ -586,13 +587,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 			host->buf_start = column;
+ 
+ 			/* Set program pointer to spare region */
+-			if (!host->pagesize_2k)
++			if (mtd->writesize == 512)
+ 				send_cmd(host, NAND_CMD_READOOB, false);
+ 		} else {
+ 			host->buf_start = column;
+ 
+ 			/* Set program pointer to page start */
+-			if (!host->pagesize_2k)
++			if (mtd->writesize == 512)
+ 				send_cmd(host, NAND_CMD_READ0, false);
+ 		}
+ 
+@@ -603,7 +604,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 	case NAND_CMD_PAGEPROG:
+ 		memcpy(host->main_area0, host->data_buf, mtd->writesize);
+ 		copy_spare(mtd, false);
+-		send_page(host, NFC_INPUT);
++		send_page(mtd, NFC_INPUT);
+ 		send_cmd(host, command, true);
+ 		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		break;
+@@ -745,10 +746,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 		goto escan;
+ 	}
+ 
+-	if (mtd->writesize == 2048) {
+-		host->pagesize_2k = 1;
++	if (mtd->writesize == 2048)
+ 		this->ecc.layout = &nand_hw_eccoob_largepage;
+-	}
+ 
+ 	/* second phase scan */
+ 	if (nand_scan_tail(mtd)) {
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0015-MXC-NFC-unlock_addr-is-only-used-while-__init-pha.patch b/recipes/linux/linux-2.6.31/pcm043/0015-MXC-NFC-unlock_addr-is-only-used-while-__init-pha.patch
new file mode 100644
index 0000000..6c1b6a0
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0015-MXC-NFC-unlock_addr-is-only-used-while-__init-pha.patch
@@ -0,0 +1,28 @@
+From 7c796b820f5aee73485636f5aafc13fcbb1cfacd Mon Sep 17 00:00:00 2001
+From: Juergen Beisert <j.beisert@pengutronix.de>
+Date: Wed, 30 Sep 2009 17:21:28 +0200
+Subject: [PATCH 15/15] MXC NFC: unlock_addr() is only used while __init phase
+
+unlock_addr() is only used while __init phase, so mark is as __init.
+
+Signed-off-by: Juergen Beisert <j.beisert@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand_v2.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand_v2.c b/drivers/mtd/nand/mxc_nand_v2.c
+index bab3712..9dd124c 100644
+--- a/drivers/mtd/nand/mxc_nand_v2.c
++++ b/drivers/mtd/nand/mxc_nand_v2.c
+@@ -781,7 +781,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
+ 	.pattern = mirror_pattern
+ };
+ 
+-static void unlock_addr(struct mxc_nand_host *host, unsigned int start_addr, unsigned int end_addr)
++static void __init unlock_addr(struct mxc_nand_host *host, unsigned int start_addr, unsigned int end_addr)
+ {
+ 	if (nfc_is_v21()) {
+ 		writew(start_addr, host->regs + NFC_V21_UNLOCKSTART_BLKADDR);
+-- 
+1.6.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0015-add-phycore-ac97-sound-support.patch b/recipes/linux/linux-2.6.31/pcm043/0015-add-phycore-ac97-sound-support.patch
new file mode 100644
index 0000000..2a588aa
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0015-add-phycore-ac97-sound-support.patch
@@ -0,0 +1,140 @@
+From cab3d12f55b4e89e6504a4fd9b1e950a3f2beae2 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 25 Nov 2009 16:18:28 +0100
+Subject: [PATCH 15/28] add phycore-ac97 sound support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ sound/soc/imx/Kconfig        |    9 ++++
+ sound/soc/imx/Makefile       |    2 +
+ sound/soc/imx/phycore-ac97.c |   91 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 102 insertions(+), 0 deletions(-)
+ create mode 100644 sound/soc/imx/phycore-ac97.c
+
+diff --git a/sound/soc/imx/Kconfig b/sound/soc/imx/Kconfig
+index 84a25e6..2a8c990 100644
+--- a/sound/soc/imx/Kconfig
++++ b/sound/soc/imx/Kconfig
+@@ -11,3 +11,12 @@ config SND_IMX_SOC
+ config SND_MXC_SOC_SSI
+ 	tristate
+ 
++config SND_SOC_PHYCORE_AC97
++	tristate "SoC Audio support for Phytec phyCORE (and phyCARD) boards"
++	depends on MACH_PCM043 || MACH_PCA100
++	select SND_MXC_SOC_SSI
++	select SND_SOC_WM9712
++	help
++	  Say Y if you want to add support for SoC audio on Phytec phyCORE
++	  and phyCARD boards in AC97 mode
++
+diff --git a/sound/soc/imx/Makefile b/sound/soc/imx/Makefile
+index d05cc95..9f8bb92 100644
+--- a/sound/soc/imx/Makefile
++++ b/sound/soc/imx/Makefile
+@@ -8,3 +8,5 @@ endif
+ obj-$(CONFIG_SND_IMX_SOC) += snd-soc-imx.o
+ 
+ # i.MX Machine Support
++snd-soc-phycore-ac97-objs := phycore-ac97.o
++obj-$(CONFIG_SND_SOC_PHYCORE_AC97) += snd-soc-phycore-ac97.o
+diff --git a/sound/soc/imx/phycore-ac97.c b/sound/soc/imx/phycore-ac97.c
+new file mode 100644
+index 0000000..8e3474b
+--- /dev/null
++++ b/sound/soc/imx/phycore-ac97.c
+@@ -0,0 +1,91 @@
++/*
++ * phycore.c  --  SoC audio for imx_phycore
++ *
++ * Copyright 2009 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
++ *
++ *  This program is free software; you can redistribute  it and/or modify it
++ *  under  the terms of  the GNU General  Public License as published by the
++ *  Free Software Foundation;  either version 2 of the  License, or (at your
++ *  option) any later version.
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/device.h>
++#include <linux/i2c.h>
++#include <sound/core.h>
++#include <sound/pcm.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <asm/mach-types.h>
++
++#include "../codecs/mc13783.h"
++#include "../codecs/wm9712.h"
++#include "imx-ssi.h"
++
++static struct snd_soc_card imx_phycore;
++
++static struct snd_soc_ops imx_phycore_hifi_ops = {
++};
++
++static struct snd_soc_dai_link imx_phycore_dai_ac97[] = {
++	{
++		.name		= "HiFi",
++		.stream_name	= "HiFi",
++		.codec_dai	= &wm9712_dai[WM9712_DAI_AC97_HIFI],
++		.ops		= &imx_phycore_hifi_ops,
++	},
++};
++
++static struct snd_soc_card imx_phycore = {
++	.name		= "PhyCORE-audio",
++	.platform	= &imx_soc_platform,
++	.dai_link	= imx_phycore_dai_ac97,
++	.num_links	= ARRAY_SIZE(imx_phycore_dai_ac97),
++};
++
++static struct snd_soc_device imx_phycore_snd_devdata = {
++	.card		= &imx_phycore,
++	.codec_dev	= &soc_codec_dev_wm9712,
++};
++
++static struct platform_device *imx_phycore_snd_device;
++
++static int __init imx_phycore_init(void)
++{
++	int ret;
++
++	if (!machine_is_pcm043() && !machine_is_pca100())
++		/* return happy. We might run on a totally different machine */
++		return 0;
++	
++	imx_phycore_snd_device = platform_device_alloc("soc-audio", -1);
++	if (!imx_phycore_snd_device)
++		return -ENOMEM;
++
++	imx_phycore_dai_ac97[0].cpu_dai = imx_ssi_pcm_dai[0];
++
++	platform_set_drvdata(imx_phycore_snd_device, &imx_phycore_snd_devdata);
++	imx_phycore_snd_devdata.dev = &imx_phycore_snd_device->dev;
++	ret = platform_device_add(imx_phycore_snd_device);
++
++	if (ret) {
++		printk(KERN_ERR "ASoC: Platform device allocation failed\n");
++		platform_device_put(imx_phycore_snd_device);
++	}
++
++	return ret;
++}
++
++static void __exit imx_phycore_exit(void)
++{
++	platform_device_unregister(imx_phycore_snd_device);
++}
++
++late_initcall(imx_phycore_init);
++module_exit(imx_phycore_exit);
++
++MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
++MODULE_DESCRIPTION("PhyCORE ALSA SoC driver");
++MODULE_LICENSE("GPL");
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0015-mxc_nand-Add-NFC-V2-support.patch b/recipes/linux/linux-2.6.31/pcm043/0015-mxc_nand-Add-NFC-V2-support.patch
new file mode 100644
index 0000000..a600e78
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0015-mxc_nand-Add-NFC-V2-support.patch
@@ -0,0 +1,191 @@
+From 7874c1c277ff88843747ccb2e1582c19cfb21986 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Mon, 5 Oct 2009 12:14:21 +0200
+Subject: [PATCH] mxc_nand: Add NFC V2 support
+
+The v2 version of this controller is used on i.MX35/25 SoCs.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   81 ++++++++++++++++++++++++++++++++++++-------
+ 1 files changed, 68 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 6525d0f..f2297eb 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -33,9 +33,13 @@
+ 
+ #include <asm/mach/flash.h>
+ #include <mach/mxc_nand.h>
++#include <mach/hardware.h>
+ 
+ #define DRIVER_NAME "mxc_nand"
+ 
++#define nfc_is_v21()		(cpu_is_mx25() || cpu_is_mx35())
++#define nfc_is_v1()		(cpu_is_mx31() || cpu_is_mx27())
++
+ /* Addresses for NFC registers */
+ #define NFC_BUF_SIZE		0xE00
+ #define NFC_BUF_ADDR		0xE04
+@@ -46,8 +50,10 @@
+ #define NFC_RSLTMAIN_AREA	0xE0E
+ #define NFC_RSLTSPARE_AREA	0xE10
+ #define NFC_WRPROT		0xE12
+-#define NFC_UNLOCKSTART_BLKADDR	0xE14
+-#define NFC_UNLOCKEND_BLKADDR	0xE16
++#define NFC_V1_UNLOCKSTART_BLKADDR	0xe14
++#define NFC_V1_UNLOCKEND_BLKADDR	0xe16
++#define NFC_V21_UNLOCKSTART_BLKADDR	0xe20
++#define NFC_V21_UNLOCKEND_BLKADDR	0xe22
+ #define NFC_NF_WRPRST		0xE18
+ #define NFC_CONFIG1		0xE1A
+ #define NFC_CONFIG2		0xE1C
+@@ -116,19 +122,47 @@ struct mxc_nand_host {
+ #define TROP_US_DELAY   2000
+ 
+ /* OOB placement block for use with hardware ecc generation */
+-static struct nand_ecclayout nand_hw_eccoob_smallpage = {
++static struct nand_ecclayout nandv1_hw_eccoob_smallpage = {
+ 	.eccbytes = 5,
+ 	.eccpos = {6, 7, 8, 9, 10},
+ 	.oobfree = {{0, 5}, {12, 4}, }
+ };
+ 
+-static struct nand_ecclayout nand_hw_eccoob_largepage = {
++static struct nand_ecclayout nandv1_hw_eccoob_largepage = {
+ 	.eccbytes = 20,
+ 	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
+ 		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
+ 	.oobfree = {{2, 4}, {11, 10}, {27, 10}, {43, 10}, {59, 5}, }
+ };
+ 
++/* OOB description for 512 byte pages with 16 byte OOB */
++static struct nand_ecclayout nandv2_hw_eccoob_smallpage = {
++	.eccbytes = 1 * 9,
++	.eccpos = {
++		 7,  8,  9, 10, 11, 12, 13, 14, 15
++	},
++	.oobfree = {
++		{.offset = 0, .length = 5}
++	}
++};
++
++/* OOB description for 2048 byte pages with 64 byte OOB */
++static struct nand_ecclayout nandv2_hw_eccoob_largepage = {
++	.eccbytes = 4 * 9,
++	.eccpos = {
++		 7,  8,  9, 10, 11, 12, 13, 14, 15,
++		23, 24, 25, 26, 27, 28, 29, 30, 31,
++		39, 40, 41, 42, 43, 44, 45, 46, 47,
++		55, 56, 57, 58, 59, 60, 61, 62, 63
++	},
++	.oobfree = {
++		{.offset = 2, .length = 4},
++		{.offset = 16, .length = 7},
++		{.offset = 32, .length = 7},
++		{.offset = 48, .length = 7}
++	}
++};
++
+ #ifdef CONFIG_MTD_PARTITIONS
+ static const char *part_probes[] = { "RedBoot", "cmdlinepart", NULL };
+ #endif
+@@ -219,7 +253,7 @@ static void send_page(struct mtd_info *mtd, unsigned int ops)
+ 	struct mxc_nand_host *host = nand_chip->priv;
+ 	int bufs, i;
+ 
+-	if (mtd->writesize > 512)
++	if (nfc_is_v1() && mtd->writesize > 512)
+ 		bufs = 4;
+ 	else
+ 		bufs = 1;
+@@ -613,6 +647,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 		send_cmd(host, command, true);
+ 		mxc_do_addr_cycle(mtd, column, page_addr);
+ 		send_read_id(host);
++		host->buf_start = column;
+ 		break;
+ 
+ 	case NAND_CMD_ERASE1:
+@@ -633,6 +668,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	struct resource *res;
+ 	uint16_t tmp;
+ 	int err = 0, nr_parts = 0;
++	struct nand_ecclayout *oob_smallpage, *oob_largepage;
+ 
+ 	/* Allocate memory for MTD device structure and private data */
+ 	host = kzalloc(sizeof(struct mxc_nand_host) + NAND_MAX_PAGESIZE +
+@@ -641,7 +677,6 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 		return -ENOMEM;
+ 
+ 	host->data_buf = (uint8_t *)(host + 1);
+-	host->spare_len = 16;
+ 
+ 	host->dev = &pdev->dev;
+ 	/* structures must be linked */
+@@ -686,10 +721,23 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 		goto eres;
+ 	}
+ 
+-	host->regs = host->base;
+ 	host->main_area0 = host->base;
+ 	host->main_area1 = host->base + 0x200;
+-	host->spare0 = host->base + 0x800;
++
++	if (nfc_is_v21()) {
++		host->regs = host->base + 0x1000;
++		host->spare0 = host->base + 0x1000;
++		host->spare_len = 64;
++		oob_smallpage = &nandv2_hw_eccoob_smallpage;
++		oob_largepage = &nandv2_hw_eccoob_largepage;
++	} else if (nfc_is_v1()) {
++		host->regs = host->base;
++		host->spare0 = host->base + 0x800;
++		host->spare_len = 16;
++		oob_smallpage = &nandv1_hw_eccoob_smallpage;
++		oob_largepage = &nandv1_hw_eccoob_largepage;
++	} else
++		BUG();
+ 
+ 	tmp = readw(host->regs + NFC_CONFIG1);
+ 	tmp |= NFC_INT_MSK;
+@@ -711,15 +759,22 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	writew(0x2, host->regs + NFC_CONFIG);
+ 
+ 	/* Blocks to be unlocked */
+-	writew(0x0, host->regs + NFC_UNLOCKSTART_BLKADDR);
+-	writew(0x4000, host->regs + NFC_UNLOCKEND_BLKADDR);
++	if (nfc_is_v21()) {
++		writew(0x0, host->regs + NFC_V21_UNLOCKSTART_BLKADDR);
++	        writew(0xffff, host->regs + NFC_V21_UNLOCKEND_BLKADDR);
++		this->ecc.bytes = 9;
++	} else if (nfc_is_v1()) {
++		writew(0x0, host->regs + NFC_V1_UNLOCKSTART_BLKADDR);
++	        writew(0x4000, host->regs + NFC_V1_UNLOCKEND_BLKADDR);
++		this->ecc.bytes = 3;
++	} else
++		BUG();
+ 
+ 	/* Unlock Block Command for given address range */
+ 	writew(0x4, host->regs + NFC_WRPROT);
+ 
+ 	this->ecc.size = 512;
+-	this->ecc.bytes = 3;
+-	this->ecc.layout = &nand_hw_eccoob_smallpage;
++	this->ecc.layout = oob_smallpage;
+ 
+ 	if (pdata->hw_ecc) {
+ 		this->ecc.calculate = mxc_nand_calculate_ecc;
+@@ -747,7 +802,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	}
+ 
+ 	if (mtd->writesize == 2048)
+-		this->ecc.layout = &nand_hw_eccoob_largepage;
++		this->ecc.layout = oob_largepage;
+ 
+ 	/* second phase scan */
+ 	if (nand_scan_tail(mtd)) {
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0016-add-phycore-mc13783-sound-support.patch b/recipes/linux/linux-2.6.31/pcm043/0016-add-phycore-mc13783-sound-support.patch
new file mode 100644
index 0000000..629f551
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0016-add-phycore-mc13783-sound-support.patch
@@ -0,0 +1,211 @@
+From 62b2363d03aa1d58d2ff23eff6c535d1e3715277 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 25 Nov 2009 16:18:38 +0100
+Subject: [PATCH 16/28] add phycore-mc13783 sound support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ sound/soc/imx/Kconfig           |   10 +++
+ sound/soc/imx/Makefile          |    3 +
+ sound/soc/imx/phycore-mc13783.c |  160 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 173 insertions(+), 0 deletions(-)
+ create mode 100644 sound/soc/imx/phycore-mc13783.c
+
+diff --git a/sound/soc/imx/Kconfig b/sound/soc/imx/Kconfig
+index 2a8c990..e145212 100644
+--- a/sound/soc/imx/Kconfig
++++ b/sound/soc/imx/Kconfig
+@@ -20,3 +20,13 @@ config SND_SOC_PHYCORE_AC97
+ 	  Say Y if you want to add support for SoC audio on Phytec phyCORE
+ 	  and phyCARD boards in AC97 mode
+ 
++config SND_SOC_PHYCORE_MC13783
++	tristate "SoC Audio support for Phytec phyCORE (and phyCARD) boards"
++	depends on MACH_PCM038 || MACH_PCM037
++	select SND_MXC_SOC_SSI
++	select SND_SOC_MC13783
++	select SND_SOC_WM9712 if MACH_PCM043 || MACH_PCA100
++	help
++	  Say Y if you want to add support for SoC audio on Phytec phyCORE
++	  boards using a MC13783 Codec.
++
+diff --git a/sound/soc/imx/Makefile b/sound/soc/imx/Makefile
+index 9f8bb92..425ffaf 100644
+--- a/sound/soc/imx/Makefile
++++ b/sound/soc/imx/Makefile
+@@ -10,3 +10,6 @@ obj-$(CONFIG_SND_IMX_SOC) += snd-soc-imx.o
+ # i.MX Machine Support
+ snd-soc-phycore-ac97-objs := phycore-ac97.o
+ obj-$(CONFIG_SND_SOC_PHYCORE_AC97) += snd-soc-phycore-ac97.o
++
++snd-soc-phycore-mc13783-objs := phycore-mc13783.o
++obj-$(CONFIG_SND_SOC_PHYCORE_MC13783) += snd-soc-phycore-mc13783.o
+diff --git a/sound/soc/imx/phycore-mc13783.c b/sound/soc/imx/phycore-mc13783.c
+new file mode 100644
+index 0000000..3743e0f
+--- /dev/null
++++ b/sound/soc/imx/phycore-mc13783.c
+@@ -0,0 +1,160 @@
++/*
++ * phycore.c  --  SoC audio for imx_phycore
++ *
++ * Copyright 2009 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
++ *
++ *  This program is free software; you can redistribute  it and/or modify it
++ *  under  the terms of  the GNU General  Public License as published by the
++ *  Free Software Foundation;  either version 2 of the  License, or (at your
++ *  option) any later version.
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/device.h>
++#include <linux/i2c.h>
++#include <sound/core.h>
++#include <sound/pcm.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <asm/mach-types.h>
++
++#include "../codecs/mc13783.h"
++#include "../codecs/wm9712.h"
++#include "imx-ssi.h"
++
++static struct snd_soc_card imx_phycore;
++
++#define FMT_PLAYBACK (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | \
++		SND_SOC_DAIFMT_CBM_CFM)
++#define FMT_CAPTURE (SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | \
++		SND_SOC_DAIFMT_CBM_CFM)
++
++static int imx_phycore_hifi_hw_params(struct snd_pcm_substream *substream,
++	struct snd_pcm_hw_params *params)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct snd_soc_dai *cpu_dai = rtd->dai->cpu_dai;
++	struct snd_soc_dai *codec_dai = rtd->dai->codec_dai;
++	int ret;
++
++	/* set cpu DAI configuration */
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		ret = snd_soc_dai_set_fmt(codec_dai, FMT_PLAYBACK);
++		if (ret)
++			return ret;
++		ret = snd_soc_dai_set_fmt(cpu_dai, FMT_PLAYBACK);
++		if (ret)
++			return ret;
++	} else {
++		ret = snd_soc_dai_set_fmt(codec_dai, FMT_CAPTURE);
++		if (ret)
++			return ret;
++		ret = snd_soc_dai_set_fmt(cpu_dai, FMT_CAPTURE);
++		if (ret)
++			return ret;
++		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0, 4);
++		if (ret)
++			return ret;
++	}
++
++	ret = snd_soc_dai_set_sysclk(codec_dai, MC13783_CLK_CLIA, 26000000, 0);
++	if (ret)
++		return ret;
++
++	ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xfffffffc, 4);
++	if (ret)
++		return ret;
++
++	return 0;
++}
++
++static int imx_phycore_hifi_hw_free(struct snd_pcm_substream *substream)
++{
++	return 0;
++}
++
++static struct snd_soc_ops imx_phycore_hifi_ops = {
++	.hw_params = imx_phycore_hifi_hw_params,
++	.hw_free = imx_phycore_hifi_hw_free,
++};
++
++static int imx_phycore_probe(struct platform_device *pdev)
++{
++	return 0;
++}
++
++static int imx_phycore_remove(struct platform_device *pdev)
++{
++	return 0;
++}
++
++static struct snd_soc_dai_link imx_phycore_dai_mc13783[] = {
++	{
++		.name = "MC13783 Playback",
++		.stream_name	= "Playback",
++		.codec_dai	= &mc13783_dai[0],
++		.ops		= &imx_phycore_hifi_ops,
++	}, {
++		.name = "MC13783 Capture",
++		.stream_name	= "Capture",
++		.codec_dai	= &mc13783_dai[1],
++		.ops		= &imx_phycore_hifi_ops,
++	},
++};
++
++static struct snd_soc_card imx_phycore = {
++	.name		= "PhyCORE-audio",
++	.platform	= &imx_soc_platform,
++	.probe		= imx_phycore_probe,
++	.remove		= imx_phycore_remove,
++	.dai_link	= imx_phycore_dai_mc13783,
++	.num_links	= ARRAY_SIZE(imx_phycore_dai_mc13783),
++};
++
++static struct snd_soc_device imx_phycore_snd_devdata = {
++	.card		= &imx_phycore,
++	.codec_dev	= &soc_codec_dev_mc13783,
++};
++
++static struct platform_device *imx_phycore_snd_device;
++
++static int __init imx_phycore_init(void)
++{
++	int ret;
++
++	if (!machine_is_pcm038() && !machine_is_pcm037())
++		/* return happy. We might run on a totally different machine */
++		return 0;
++
++	imx_phycore_snd_device = platform_device_alloc("soc-audio", -1);
++	if (!imx_phycore_snd_device)
++		return -ENOMEM;
++
++	imx_phycore_dai_mc13783[0].cpu_dai = imx_ssi_pcm_dai[0];
++	imx_phycore_dai_mc13783[1].cpu_dai = imx_ssi_pcm_dai[0];
++
++	platform_set_drvdata(imx_phycore_snd_device, &imx_phycore_snd_devdata);
++	imx_phycore_snd_devdata.dev = &imx_phycore_snd_device->dev;
++	ret = platform_device_add(imx_phycore_snd_device);
++
++	if (ret) {
++		printk(KERN_ERR "ASoC: Platform device allocation failed\n");
++		platform_device_put(imx_phycore_snd_device);
++	}
++
++	return ret;
++}
++
++static void __exit imx_phycore_exit(void)
++{
++	platform_device_unregister(imx_phycore_snd_device);
++}
++
++late_initcall(imx_phycore_init);
++module_exit(imx_phycore_exit);
++
++MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
++MODULE_DESCRIPTION("PhyCORE ALSA SoC driver");
++MODULE_LICENSE("GPL");
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0016-mxc_nand-disable-sp_en-bit-only-once.patch b/recipes/linux/linux-2.6.31/pcm043/0016-mxc_nand-disable-sp_en-bit-only-once.patch
new file mode 100644
index 0000000..f926c8f
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0016-mxc_nand-disable-sp_en-bit-only-once.patch
@@ -0,0 +1,66 @@
+From b21f4e602fec63eb29aea9dc9bc59d31f6e027c5 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Mon, 5 Oct 2009 17:18:42 +0200
+Subject: [PATCH] mxc_nand: disable sp_en bit only once
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   15 +++------------
+ 1 files changed, 3 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index f2297eb..199a5f2 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -274,16 +274,10 @@ static void send_page(struct mtd_info *mtd, unsigned int ops)
+ static void send_read_id(struct mxc_nand_host *host)
+ {
+ 	struct nand_chip *this = &host->nand;
+-	uint16_t tmp;
+ 
+ 	/* NANDFC buffer 0 is used for device ID output */
+ 	writew(0x0, host->regs + NFC_BUF_ADDR);
+ 
+-	/* Read ID into main buffer */
+-	tmp = readw(host->regs + NFC_CONFIG1);
+-	tmp &= ~NFC_SP_EN;
+-	writew(tmp, host->regs + NFC_CONFIG1);
+-
+ 	writew(NFC_ID, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+@@ -307,7 +301,7 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
+ {
+ 	void __iomem *main_buf = host->main_area1;
+ 	uint32_t store;
+-	uint16_t ret, tmp;
++	uint16_t ret;
+ 	/* Issue status request to NAND device */
+ 
+ 	/* store the main area1 first word, later do recovery */
+@@ -316,11 +310,6 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
+ 	 * corruption of read/write buffer on status requests. */
+ 	writew(1, host->regs + NFC_BUF_ADDR);
+ 
+-	/* Read status into main buffer */
+-	tmp = readw(host->regs + NFC_CONFIG1);
+-	tmp &= ~NFC_SP_EN;
+-	writew(tmp, host->regs + NFC_CONFIG1);
+-
+ 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+@@ -739,8 +728,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	} else
+ 		BUG();
+ 
++	/* disable interrupt and spare enable */
+ 	tmp = readw(host->regs + NFC_CONFIG1);
+ 	tmp |= NFC_INT_MSK;
++	tmp &= ~NFC_SP_EN;
+ 	writew(tmp, host->regs + NFC_CONFIG1);
+ 
+ 	init_waitqueue_head(&host->irq_waitq);
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0017-mxc_nand-Allow-flash-based-bbt.patch b/recipes/linux/linux-2.6.31/pcm043/0017-mxc_nand-Allow-flash-based-bbt.patch
new file mode 100644
index 0000000..1f3f9ee
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0017-mxc_nand-Allow-flash-based-bbt.patch
@@ -0,0 +1,79 @@
+From b865b0240161ad328bb2fe69eea58111c8df6a29 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 21 Oct 2009 14:25:27 +0200
+Subject: [PATCH] mxc_nand: Allow flash based bbt
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/plat-mxc/include/mach/mxc_nand.h |    3 +-
+ drivers/mtd/nand/mxc_nand.c               |   34 +++++++++++++++++++++++++++++
+ 2 files changed, 36 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/plat-mxc/include/mach/mxc_nand.h b/arch/arm/plat-mxc/include/mach/mxc_nand.h
+index 2b972df..5d2d21d 100644
+--- a/arch/arm/plat-mxc/include/mach/mxc_nand.h
++++ b/arch/arm/plat-mxc/include/mach/mxc_nand.h
+@@ -22,6 +22,7 @@
+ 
+ struct mxc_nand_platform_data {
+ 	int width;	/* data bus width in bytes */
+-	int hw_ecc;	/* 0 if supress hardware ECC */
++	int hw_ecc:1;	/* 0 if supress hardware ECC */
++	int flash_bbt:1; /* set to 1 to use a flash based bbt */
+ };
+ #endif /* __ASM_ARCH_NAND_H */
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 199a5f2..3fdc172 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -648,6 +648,33 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
+ 	}
+ }
+ 
++/*
++ * The generic flash bbt decriptors overlap with our ecc
++ * hardware, so define some i.MX specific ones.
++ */
++static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
++static uint8_t mirror_pattern[] = { '1', 't', 'b', 'B' };
++
++static struct nand_bbt_descr bbt_main_descr = {
++	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
++	    | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
++	.offs = 0,
++	.len = 4,
++	.veroffs = 4,
++	.maxblocks = 4,
++	.pattern = bbt_pattern,
++};
++
++static struct nand_bbt_descr bbt_mirror_descr = {
++	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
++	    | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
++	.offs = 0,
++	.len = 4,
++	.veroffs = 4,
++	.maxblocks = 4,
++	.pattern = mirror_pattern,
++};
++
+ static int __init mxcnd_probe(struct platform_device *pdev)
+ {
+ 	struct nand_chip *this;
+@@ -786,6 +813,13 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	if (pdata->width == 2)
+ 		this->options |= NAND_BUSWIDTH_16;
+ 
++	if (pdata->flash_bbt) {
++		this->bbt_td = &bbt_main_descr;
++		this->bbt_md = &bbt_mirror_descr;
++		/* update flash based bbt */
++		this->options |= NAND_USE_FLASH_BBT;
++	}
++
+ 	/* first scan to find the device and get the page size */
+ 	if (nand_scan_ident(mtd, 1)) {
+ 		err = -ENXIO;
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0017-pcm043-add-sound-support.patch b/recipes/linux/linux-2.6.31/pcm043/0017-pcm043-add-sound-support.patch
new file mode 100644
index 0000000..d4c1527
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0017-pcm043-add-sound-support.patch
@@ -0,0 +1,161 @@
+From 9ce0a3fb1764c093452db1f34dfecbca1ea41833 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 29 Oct 2009 17:17:31 +0100
+Subject: [PATCH 17/28] pcm043: add sound support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/pcm043.c |  104 +++++++++++++++++++++++++++++++++++++++++++-
+ 1 files changed, 103 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/pcm043.c b/arch/arm/mach-mx3/pcm043.c
+index 8d27c32..d1b6f53 100644
+--- a/arch/arm/mach-mx3/pcm043.c
++++ b/arch/arm/mach-mx3/pcm043.c
+@@ -28,6 +28,7 @@
+ #include <linux/interrupt.h>
+ #include <linux/i2c.h>
+ #include <linux/i2c/at24.h>
++#include <linux/delay.h>
+ 
+ #include <asm/mach-types.h>
+ #include <asm/mach/arch.h>
+@@ -43,6 +44,8 @@
+ #include <mach/iomux-mx35.h>
+ #include <mach/ipu.h>
+ #include <mach/mx3fb.h>
++#include <mach/audmux.h>
++#include <mach/ssi.h>
+ 
+ #include "devices.h"
+ 
+@@ -203,7 +206,92 @@ static struct pad_desc pcm043_pads[] = {
+ 	MX35_PAD_D3_VSYNC__IPU_DISPB_D3_VSYNC,
+ 	MX35_PAD_D3_REV__IPU_DISPB_D3_REV,
+ 	MX35_PAD_D3_CLS__IPU_DISPB_D3_CLS,
+-	MX35_PAD_D3_SPL__IPU_DISPB_D3_SPL
++	MX35_PAD_D3_SPL__IPU_DISPB_D3_SPL,
++	/* SSI */
++	MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS,
++	MX35_PAD_STXD4__AUDMUX_AUD4_TXD,
++	MX35_PAD_SRXD4__AUDMUX_AUD4_RXD,
++	MX35_PAD_SCK4__AUDMUX_AUD4_TXC,
++};
++
++#define AC97_GPIO_TXFS	(1 * 32 + 31)
++#define AC97_GPIO_TXD	(1 * 32 + 28)
++#define AC97_GPIO_RESET	(1 * 32 + 0)
++
++static void pcm043_ac97_warm_reset(struct snd_ac97 *ac97)
++{
++	struct pad_desc txfs_gpio = MX35_PAD_STXFS4__GPIO2_31;
++	struct pad_desc txfs = MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS;
++	int ret;
++
++	ret = gpio_request(AC97_GPIO_TXFS, "SSI");
++	if (ret) {
++		printk("failed to get GPIO_TXFS: %d\n", ret);
++		return;
++	}
++
++	mxc_iomux_v3_setup_pad(&txfs_gpio);
++
++	/* warm reset */
++	gpio_direction_output(AC97_GPIO_TXFS, 1);
++	udelay(2);
++	gpio_set_value(AC97_GPIO_TXFS, 0);
++
++	gpio_free(AC97_GPIO_TXFS);
++	mxc_iomux_v3_setup_pad(&txfs);
++}
++
++static void pcm043_ac97_cold_reset(struct snd_ac97 *ac97)
++{
++	struct pad_desc txfs_gpio = MX35_PAD_STXFS4__GPIO2_31;
++	struct pad_desc txfs = MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS;
++	struct pad_desc txd_gpio = MX35_PAD_STXD4__GPIO2_28;
++	struct pad_desc txd = MX35_PAD_STXD4__AUDMUX_AUD4_TXD;
++	struct pad_desc reset_gpio = MX35_PAD_SD2_CMD__GPIO2_0;
++	int ret;
++
++	ret = gpio_request(AC97_GPIO_TXFS, "SSI");
++	if (ret)
++		goto err1;
++
++	ret = gpio_request(AC97_GPIO_TXD, "SSI");
++	if (ret)
++		goto err2;
++
++	ret = gpio_request(AC97_GPIO_RESET, "SSI");
++	if (ret)
++		goto err3;
++
++	mxc_iomux_v3_setup_pad(&txfs_gpio);
++	mxc_iomux_v3_setup_pad(&txd_gpio);
++	mxc_iomux_v3_setup_pad(&reset_gpio);
++
++	gpio_direction_output(AC97_GPIO_TXFS, 0);
++	gpio_direction_output(AC97_GPIO_TXD, 0);
++
++	/* cold reset */
++	gpio_direction_output(AC97_GPIO_RESET, 0);
++	udelay(10);
++	gpio_direction_output(AC97_GPIO_RESET, 1);
++
++	mxc_iomux_v3_setup_pad(&txd);
++	mxc_iomux_v3_setup_pad(&txfs);
++
++	gpio_free(AC97_GPIO_RESET);
++err3:
++	gpio_free(AC97_GPIO_TXD);
++err2:
++	gpio_free(AC97_GPIO_TXFS);
++err1:
++	if (ret)
++		printk("%s failed with %d\n", __func__, ret);
++	mdelay(1);
++}
++
++static struct imx_ssi_platform_data pcm043_ssi_pdata = {
++	.ac97_reset = pcm043_ac97_cold_reset,
++	.ac97_warm_reset = pcm043_ac97_warm_reset,
++	.flags = IMX_SSI_USE_AC97,
+ };
+ 
+ /*
+@@ -213,11 +301,24 @@ static void __init mxc_board_init(void)
+ {
+ 	mxc_iomux_v3_setup_multiple_pads(pcm043_pads, ARRAY_SIZE(pcm043_pads));
+ 
++	mxc_audmux_v2_configure_port(3,
++			MXC_AUDMUX_V2_PTCR_SYN | /* 4wire mode */
++			MXC_AUDMUX_V2_PTCR_TFSEL(0) |
++			MXC_AUDMUX_V2_PTCR_TFSDIR,
++			MXC_AUDMUX_V2_PDCR_RXDSEL(0));
++
++	mxc_audmux_v2_configure_port(0,
++			MXC_AUDMUX_V2_PTCR_SYN | /* 4wire mode */
++			MXC_AUDMUX_V2_PTCR_TCSEL(3) |
++			MXC_AUDMUX_V2_PTCR_TCLKDIR, /* clock is output */
++			MXC_AUDMUX_V2_PDCR_RXDSEL(3));
++
+ 	platform_add_devices(devices, ARRAY_SIZE(devices));
+ 
+ 	mxc_register_device(&mxc_uart_device0, &uart_pdata);
+ 
+ 	mxc_register_device(&mxc_uart_device1, &uart_pdata);
++	mxc_register_device(&imx_ssi_device0, &pcm043_ssi_pdata);
+ 
+ #if defined CONFIG_I2C_IMX || defined CONFIG_I2C_IMX_MODULE
+ 	i2c_register_board_info(0, pcm043_i2c_devices,
+@@ -232,6 +333,7 @@ static void __init mxc_board_init(void)
+ 
+ static void __init pcm043_timer_init(void)
+ {
++	printk("mx35_clocks_init()\n");
+ 	mx35_clocks_init();
+ }
+ 
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0018-mxc_nand-remove-TROP_US_DELAY.patch b/recipes/linux/linux-2.6.31/pcm043/0018-mxc_nand-remove-TROP_US_DELAY.patch
new file mode 100644
index 0000000..9d8d266
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0018-mxc_nand-remove-TROP_US_DELAY.patch
@@ -0,0 +1,88 @@
+From 55f91a40d858b579960bb9d3e29d8339b7210be2 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 21 Oct 2009 16:01:02 +0200
+Subject: [PATCH] mxc_nand: remove TROP_US_DELAY
+
+wait_op_done is only called with the same timeout, so
+code the timeout into the function itself.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |   17 +++++++----------
+ 1 files changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index 3fdc172..dd80e88 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -118,9 +118,6 @@ struct mxc_nand_host {
+ 	int			spare_len;
+ };
+ 
+-/* Define delays in microsec for NAND device operations */
+-#define TROP_US_DELAY   2000
+-
+ /* OOB placement block for use with hardware ecc generation */
+ static struct nand_ecclayout nandv1_hw_eccoob_smallpage = {
+ 	.eccbytes = 5,
+@@ -185,10 +182,10 @@ static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
+ /* This function polls the NANDFC to wait for the basic operation to
+  * complete by checking the INT bit of config2 register.
+  */
+-static void wait_op_done(struct mxc_nand_host *host, int max_retries,
+-				int useirq)
++static void wait_op_done(struct mxc_nand_host *host, int useirq)
+ {
+ 	uint32_t tmp;
++	int max_retries = 2000;
+ 
+ 	if (useirq) {
+ 		if ((readw(host->regs + NFC_CONFIG2) & NFC_INT) == 0) {
+@@ -230,7 +227,7 @@ static void send_cmd(struct mxc_nand_host *host, uint16_t cmd, int useirq)
+ 	writew(NFC_CMD, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, useirq);
++	wait_op_done(host, useirq);
+ }
+ 
+ /* This function sends an address (or partial address) to the
+@@ -244,7 +241,7 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
+ 	writew(NFC_ADDR, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, islast);
++	wait_op_done(host, islast);
+ }
+ 
+ static void send_page(struct mtd_info *mtd, unsigned int ops)
+@@ -266,7 +263,7 @@ static void send_page(struct mtd_info *mtd, unsigned int ops)
+ 		writew(ops, host->regs + NFC_CONFIG2);
+ 
+ 		/* Wait for operation to complete */
+-		wait_op_done(host, TROP_US_DELAY, true);
++		wait_op_done(host, true);
+ 	}
+ }
+ 
+@@ -281,7 +278,7 @@ static void send_read_id(struct mxc_nand_host *host)
+ 	writew(NFC_ID, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, true);
++	wait_op_done(host, true);
+ 
+ 	if (this->options & NAND_BUSWIDTH_16) {
+ 		void __iomem *main_buf = host->main_area0;
+@@ -313,7 +310,7 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
+ 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
+ 
+ 	/* Wait for operation to complete */
+-	wait_op_done(host, TROP_US_DELAY, true);
++	wait_op_done(host, true);
+ 
+ 	/* Status is placed in first word of main buffer */
+ 	/* get status, then recovery area 1 data */
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0018-pcm038-Add-SPI-MC13783-support.patch b/recipes/linux/linux-2.6.31/pcm043/0018-pcm038-Add-SPI-MC13783-support.patch
new file mode 100644
index 0000000..447936a
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0018-pcm038-Add-SPI-MC13783-support.patch
@@ -0,0 +1,146 @@
+From d29530587128ca197998d1b02a3e9e3286cf98e1 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 24 Sep 2009 10:01:53 +0200
+Subject: [PATCH 18/28] pcm038: Add SPI/MC13783 support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/pcm038.c |   94 +++++++++++++++++++++++++++++++++++++++++++-
+ 1 files changed, 92 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-mx2/pcm038.c b/arch/arm/mach-mx2/pcm038.c
+index a4628d0..b3a8ed8 100644
+--- a/arch/arm/mach-mx2/pcm038.c
++++ b/arch/arm/mach-mx2/pcm038.c
+@@ -23,6 +23,10 @@
+ #include <linux/mtd/plat-ram.h>
+ #include <linux/mtd/physmap.h>
+ #include <linux/platform_device.h>
++#include <linux/regulator/machine.h>
++#include <linux/mfd/mc13783.h>
++#include <linux/spi/spi.h>
++#include <linux/irq.h>
+ 
+ #include <asm/mach-types.h>
+ #include <asm/mach/arch.h>
+@@ -35,6 +39,7 @@
+ #include <mach/iomux.h>
+ #include <mach/imx-uart.h>
+ #include <mach/mxc_nand.h>
++#include <mach/spi.h>
+ 
+ #include "devices.h"
+ 
+@@ -78,8 +83,6 @@ static int pcm038_pins[] = {
+ 	PC6_PF_I2C2_SCL,
+ 	/* SPI1 */
+ 	PD25_PF_CSPI1_RDY,
+-	PD27_PF_CSPI1_SS1,
+-	PD28_PF_CSPI1_SS0,
+ 	PD29_PF_CSPI1_SCLK,
+ 	PD30_PF_CSPI1_MISO,
+ 	PD31_PF_CSPI1_MOSI,
+@@ -200,6 +203,86 @@ static struct i2c_board_info pcm038_i2c_devices[] = {
+ 	}
+ };
+ 
++static int pcm038_spi_cs[] = {GPIO_PORTD + 28};
++
++static struct spi_imx_master pcm038_spi_0_data = {
++	.chipselect = pcm038_spi_cs,
++	.num_chipselect = ARRAY_SIZE(pcm038_spi_cs),
++};
++
++static struct regulator_consumer_supply sdhc1_consumers[] = {
++	{
++		.dev	= &mxc_sdhc_device1.dev,
++		.supply	= "sdhc_vcc",
++	},
++};
++
++static struct regulator_init_data sdhc1_data = {
++	.constraints = {
++		.min_uV = 3000000,
++		.max_uV = 3400000,
++		.valid_ops_mask = REGULATOR_CHANGE_VOLTAGE |
++			REGULATOR_CHANGE_MODE | REGULATOR_CHANGE_STATUS,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL |
++			REGULATOR_MODE_FAST,
++		.always_on = 0,
++		.boot_on = 0,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(sdhc1_consumers),
++	.consumer_supplies = sdhc1_consumers,
++};
++
++static struct regulator_consumer_supply cam_consumers[] = {
++	{
++		.dev	= NULL,
++		.supply	= "imx_cam_vcc",
++	},
++};
++
++static struct regulator_init_data cam_data = {
++	.constraints = {
++		.min_uV = 3000000,
++		.max_uV = 3400000,
++		.valid_ops_mask = REGULATOR_CHANGE_VOLTAGE |
++			REGULATOR_CHANGE_MODE | REGULATOR_CHANGE_STATUS,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL |
++			REGULATOR_MODE_FAST,
++		.always_on = 0,
++		.boot_on = 0,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(cam_consumers),
++	.consumer_supplies = cam_consumers,
++};
++
++struct mc13783_regulator_init_data pcm038_regulators[] = {
++	{
++		.id = MC13783_REGU_VCAM,
++		.init_data = &cam_data,
++	}, {
++		.id = MC13783_REGU_VMMC1,
++		.init_data = &sdhc1_data,
++	},
++};
++
++static struct mc13783_platform_data pcm038_pmic = {
++	.regulators = pcm038_regulators,
++	.num_regulators = ARRAY_SIZE(pcm038_regulators),
++	.flags = MC13783_USE_ADC | MC13783_USE_REGULATOR |
++		 MC13783_USE_TOUCHSCREEN,
++};
++
++static struct spi_board_info pcm038_spi_board_info[] __initdata = {
++	{
++		.modalias = "mc13783",
++		.irq = IRQ_GPIOB(23),
++		.max_speed_hz = 300000,
++		.bus_num = 0,
++		.chip_select = 0,
++		.platform_data = &pcm038_pmic,
++		.mode = SPI_CS_HIGH,
++	}
++};
++
+ static void __init pcm038_init(void)
+ {
+ 	mxc_gpio_setup_multiple_pins(pcm038_pins, ARRAY_SIZE(pcm038_pins),
+@@ -220,6 +303,13 @@ static void __init pcm038_init(void)
+ 
+ 	mxc_register_device(&mxc_i2c_device1, &pcm038_i2c_1_data);
+ 
++	/* MC13783 IRQ */
++	mxc_gpio_mode(GPIO_PORTB | 23 | GPIO_GPIO | GPIO_IN);
++
++	mxc_register_device(&mxc_spi_device0, &pcm038_spi_0_data);
++	spi_register_board_info(pcm038_spi_board_info,
++				ARRAY_SIZE(pcm038_spi_board_info));
++
+ 	platform_add_devices(platform_devices, ARRAY_SIZE(platform_devices));
+ 
+ #ifdef CONFIG_MACH_PCM970_BASEBOARD
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0019-mx27-add-support-for-phytec-pca100-phyCARD-s-board.patch b/recipes/linux/linux-2.6.31/pcm043/0019-mx27-add-support-for-phytec-pca100-phyCARD-s-board.patch
new file mode 100644
index 0000000..fbada0b
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0019-mx27-add-support-for-phytec-pca100-phyCARD-s-board.patch
@@ -0,0 +1,293 @@
+From 11082d5306315626cb67dc73b13c95baefd6bc9c Mon Sep 17 00:00:00 2001
+From: Luotao Fu <l.fu@pengutronix.de>
+Date: Thu, 6 Aug 2009 11:19:39 +0200
+Subject: [PATCH 19/28] mx27: add support for phytec pca100 (phyCARD-s) board
+
+Signed-off-by: Luotao Fu <l.fu@pengutronix.de>
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/Kconfig  |    7 ++
+ arch/arm/mach-mx2/Makefile |    2 +-
+ arch/arm/mach-mx2/pca100.c |  244 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 252 insertions(+), 1 deletions(-)
+ create mode 100644 arch/arm/mach-mx2/pca100.c
+
+diff --git a/arch/arm/mach-mx2/Kconfig b/arch/arm/mach-mx2/Kconfig
+index 0d08c34..69e2a9b 100644
+--- a/arch/arm/mach-mx2/Kconfig
++++ b/arch/arm/mach-mx2/Kconfig
+@@ -69,4 +69,11 @@ config MACH_MX27LITE
+ 	  Include support for MX27 LITEKIT platform. This includes specific
+ 	  configurations for the board and its peripherals.
+ 
++config MACH_PCA100
++	bool "Phytec phyCARD-s (pca100)"
++	depends on MACH_MX27
++	help
++	  Include support for phyCARD-s (aka pca100) platform. This
++	  includes specific configurations for the module and its peripherals.
++
+ endif
+diff --git a/arch/arm/mach-mx2/Makefile b/arch/arm/mach-mx2/Makefile
+index b9b1cca..046c115 100644
+--- a/arch/arm/mach-mx2/Makefile
++++ b/arch/arm/mach-mx2/Makefile
+@@ -17,4 +17,4 @@ obj-$(CONFIG_MACH_PCM038) += pcm038.o
+ obj-$(CONFIG_MACH_PCM970_BASEBOARD) += pcm970-baseboard.o
+ obj-$(CONFIG_MACH_MX27_3DS) += mx27pdk.o
+ obj-$(CONFIG_MACH_MX27LITE) += mx27lite.o
+-
++obj-$(CONFIG_MACH_PCA100) += pca100.o
+diff --git a/arch/arm/mach-mx2/pca100.c b/arch/arm/mach-mx2/pca100.c
+new file mode 100644
+index 0000000..fe5b165
+--- /dev/null
++++ b/arch/arm/mach-mx2/pca100.c
+@@ -0,0 +1,244 @@
++/*
++ * Copyright 2007 Robert Schwebel <r.schwebel@pengutronix.de>, Pengutronix
++ * Copyright (C) 2009 Sascha Hauer (kernel@pengutronix.de)
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
++ * MA 02110-1301, USA.
++ */
++
++#include <linux/platform_device.h>
++#include <linux/io.h>
++#include <linux/i2c.h>
++#include <linux/i2c/at24.h>
++#include <linux/dma-mapping.h>
++#include <linux/spi/spi.h>
++#include <linux/spi/eeprom.h>
++#include <linux/irq.h>
++#include <linux/gpio.h>
++
++#include <asm/mach/arch.h>
++#include <asm/mach-types.h>
++#include <mach/common.h>
++#include <mach/hardware.h>
++#include <mach/iomux.h>
++#include <mach/i2c.h>
++#include <asm/mach/time.h>
++#if defined(CONFIG_SPI_IMX) || defined(CONFIG_SPI_IMX_MODULE)
++#include <mach/spi.h>
++#endif
++#include <mach/imx-uart.h>
++#include <mach/mxc_nand.h>
++#include <mach/irqs.h>
++#include <mach/mmc.h>
++
++#include "devices.h"
++
++static int pca100_pins[] = {
++	/* UART1 */
++	PE12_PF_UART1_TXD,
++	PE13_PF_UART1_RXD,
++	PE14_PF_UART1_CTS,
++	PE15_PF_UART1_RTS,
++	/* SDHC */
++	PB4_PF_SD2_D0,
++	PB5_PF_SD2_D1,
++	PB6_PF_SD2_D2,
++	PB7_PF_SD2_D3,
++	PB8_PF_SD2_CMD,
++	PB9_PF_SD2_CLK,
++	/* FEC */
++	PD0_AIN_FEC_TXD0,
++	PD1_AIN_FEC_TXD1,
++	PD2_AIN_FEC_TXD2,
++	PD3_AIN_FEC_TXD3,
++	PD4_AOUT_FEC_RX_ER,
++	PD5_AOUT_FEC_RXD1,
++	PD6_AOUT_FEC_RXD2,
++	PD7_AOUT_FEC_RXD3,
++	PD8_AF_FEC_MDIO,
++	PD9_AIN_FEC_MDC,
++	PD10_AOUT_FEC_CRS,
++	PD11_AOUT_FEC_TX_CLK,
++	PD12_AOUT_FEC_RXD0,
++	PD13_AOUT_FEC_RX_DV,
++	PD14_AOUT_FEC_RX_CLK,
++	PD15_AOUT_FEC_COL,
++	PD16_AIN_FEC_TX_ER,
++	PF23_AIN_FEC_TX_EN,
++	/* SSI1 */
++	PC20_PF_SSI1_FS,
++	PC21_PF_SSI1_RXD,
++	PC22_PF_SSI1_TXD,
++	PC23_PF_SSI1_CLK,
++	/* onboard I2C */
++	PC5_PF_I2C2_SDA,
++	PC6_PF_I2C2_SCL,
++	/* external I2C */
++	PD17_PF_I2C_DATA,
++	PD18_PF_I2C_CLK,
++	/* SPI1 */
++	PD25_PF_CSPI1_RDY,
++	PD29_PF_CSPI1_SCLK,
++	PD30_PF_CSPI1_MISO,
++	PD31_PF_CSPI1_MOSI,
++};
++
++static struct imxuart_platform_data uart_pdata = {
++	.flags = IMXUART_HAVE_RTSCTS,
++};
++
++static struct mxc_nand_platform_data pca100_nand_board_info = {
++	.width = 1,
++	.hw_ecc = 1,
++};
++
++static struct platform_device *platform_devices[] __initdata = {
++	&mxc_w1_master_device,
++	&mxc_fec_device,
++};
++
++static struct imxi2c_platform_data pca100_i2c_1_data = {
++	.bitrate = 100000,
++};
++
++static struct at24_platform_data board_eeprom = {
++	.byte_len = 4096,
++	.page_size = 32,
++	.flags = AT24_FLAG_ADDR16,
++};
++
++static struct i2c_board_info pca100_i2c_devices[] = {
++	{
++		I2C_BOARD_INFO("at24", 0x52), /* E0=0, E1=1, E2=0 */
++		.platform_data = &board_eeprom,
++	}, {
++		I2C_BOARD_INFO("rtc-pcf8563", 0x51),
++		.type = "pcf8563"
++	}, {
++		I2C_BOARD_INFO("lm75", 0x4a),
++		.type = "lm75"
++	}
++};
++
++#if defined(CONFIG_SPI_IMX) || defined(CONFIG_SPI_IMX_MODULE)
++static struct spi_eeprom at25320 = {
++	.name		= "at25320an",
++	.byte_len	= 4096,
++	.page_size	= 32,
++	.flags		= EE_ADDR2,
++};
++
++static struct spi_board_info pca100_spi_board_info[] __initdata = {
++	{
++		.modalias = "at25",
++		.max_speed_hz = 30000,
++		.bus_num = 0,
++		.chip_select = 1,
++		.platform_data = &at25320,
++	},
++};
++
++static int pca100_spi_cs[] = {GPIO_PORTD + 28, GPIO_PORTD + 27};
++
++static struct spi_imx_master pca100_spi_0_data = {
++	.chipselect	= pca100_spi_cs,
++	.num_chipselect = ARRAY_SIZE(pca100_spi_cs),
++};
++#endif
++
++static int pca100_sdhc2_init(struct device *dev, irq_handler_t detect_irq,
++		void *data)
++{
++	int ret;
++
++	ret = request_irq(IRQ_GPIOC(29), detect_irq,
++			  IRQF_DISABLED | IRQF_TRIGGER_FALLING,
++			  "imx-mmc-detect", data);
++	if (ret)
++		printk(KERN_ERR
++			"pca100: Failed to reuest irq for sd/mmc detection\n");
++
++	return ret;
++}
++
++static void pca100_sdhc2_exit(struct device *dev, void *data)
++{
++	free_irq(IRQ_GPIOC(29), data);
++}
++
++static struct imxmmc_platform_data sdhc_pdata = {
++	.init = pca100_sdhc2_init,
++	.exit = pca100_sdhc2_exit,
++};
++
++static void __init pca100_init(void)
++{
++	int ret;
++
++	ret = mxc_gpio_setup_multiple_pins(pca100_pins,
++			ARRAY_SIZE(pca100_pins), "PCA100");
++	if (ret)
++		printk(KERN_ERR "pca100: Failed to setup pins (%d)\n", ret);
++
++	mxc_register_device(&mxc_uart_device0, &uart_pdata);
++
++	mxc_gpio_mode(GPIO_PORTC | 29 | GPIO_GPIO | GPIO_IN);
++	mxc_register_device(&mxc_sdhc_device1, &sdhc_pdata);
++
++	mxc_register_device(&mxc_nand_device, &pca100_nand_board_info);
++
++	/* only the i2c master 1 is used on this CPU card */
++	i2c_register_board_info(1, pca100_i2c_devices,
++				ARRAY_SIZE(pca100_i2c_devices));
++
++	mxc_register_device(&mxc_i2c_device1, &pca100_i2c_1_data);
++
++	mxc_gpio_mode(GPIO_PORTD | 28 | GPIO_GPIO | GPIO_OUT);
++	mxc_gpio_mode(GPIO_PORTD | 27 | GPIO_GPIO | GPIO_OUT);
++
++	/* GPIO0_IRQ */
++	mxc_gpio_mode(GPIO_PORTC | 31 | GPIO_GPIO | GPIO_IN);
++	/* GPIO1_IRQ */
++	mxc_gpio_mode(GPIO_PORTC | 25 | GPIO_GPIO | GPIO_IN);
++	/* GPIO2_IRQ */
++	mxc_gpio_mode(GPIO_PORTE | 5 | GPIO_GPIO | GPIO_IN);
++
++#if defined(CONFIG_SPI_IMX) || defined(CONFIG_SPI_IMX_MODULE)
++	spi_register_board_info(pca100_spi_board_info,
++				ARRAY_SIZE(pca100_spi_board_info));
++	mxc_register_device(&mxc_spi_device0, &pca100_spi_0_data);
++#endif
++
++	platform_add_devices(platform_devices, ARRAY_SIZE(platform_devices));
++}
++
++static void __init pca100_timer_init(void)
++{
++	mx27_clocks_init(26000000);
++}
++
++static struct sys_timer pca100_timer = {
++	.init = pca100_timer_init,
++};
++
++MACHINE_START(PCA100, "phyCARD-i.MX27")
++	.phys_io        = AIPI_BASE_ADDR,
++	.io_pg_offst    = ((AIPI_BASE_ADDR_VIRT) >> 18) & 0xfffc,
++	.boot_params    = PHYS_OFFSET + 0x100,
++	.map_io         = mx27_map_io,
++	.init_irq       = mxc_init_irq,
++	.init_machine   = pca100_init,
++	.timer          = &pca100_timer,
++MACHINE_END
++
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0019-mxc_nand-use-DRIVER_NAME-where-appropriate.patch b/recipes/linux/linux-2.6.31/pcm043/0019-mxc_nand-use-DRIVER_NAME-where-appropriate.patch
new file mode 100644
index 0000000..919ea3c
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0019-mxc_nand-use-DRIVER_NAME-where-appropriate.patch
@@ -0,0 +1,35 @@
+From b3fc73608b3fee8aa3dbccf4826fe21ffa69850b Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 21 Oct 2009 16:06:27 +0200
+Subject: [PATCH] mxc_nand: use DRIVER_NAME where appropriate
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/mtd/nand/mxc_nand.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
+index dd80e88..d5445cd 100644
+--- a/drivers/mtd/nand/mxc_nand.c
++++ b/drivers/mtd/nand/mxc_nand.c
+@@ -698,7 +698,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 	mtd->priv = this;
+ 	mtd->owner = THIS_MODULE;
+ 	mtd->dev.parent = &pdev->dev;
+-	mtd->name = "mxc_nand";
++	mtd->name = DRIVER_NAME;
+ 
+ 	/* 50 us command delay time */
+ 	this->chip_delay = 5;
+@@ -762,7 +762,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
+ 
+ 	host->irq = platform_get_irq(pdev, 0);
+ 
+-	err = request_irq(host->irq, mxc_nfc_irq, 0, "mxc_nd", host);
++	err = request_irq(host->irq, mxc_nfc_irq, 0, DRIVER_NAME, host);
+ 	if (err)
+ 		goto eirq;
+ 
+-- 
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0020-MX2-Add-SPI-devices-resources.patch b/recipes/linux/linux-2.6.31/pcm043/0020-MX2-Add-SPI-devices-resources.patch
new file mode 100644
index 0000000..45142f7
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0020-MX2-Add-SPI-devices-resources.patch
@@ -0,0 +1,92 @@
+From 0e60c1eae435eee1188d751f29802ce1cce61021 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 19 Dec 2008 14:32:14 +0100
+Subject: [PATCH 20/28] MX2: Add SPI devices/resources
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/devices.c |   68 +++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 68 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-mx2/devices.c b/arch/arm/mach-mx2/devices.c
+index f877baa..39cd74f 100644
+--- a/arch/arm/mach-mx2/devices.c
++++ b/arch/arm/mach-mx2/devices.c
+@@ -64,6 +64,74 @@ struct platform_device mxc_irda_device = {
+ };
+ 
+ /*
++ * SPI master controller
++ *
++ * - i.MX1: 2 channel (slighly different register setting)
++ * - i.MX21: 2 channel
++ * - i.MX27: 3 channel
++ */
++static struct resource mxc_spi_resources0[] = {
++	{
++	       .start = CSPI1_BASE_ADDR,
++	       .end = CSPI1_BASE_ADDR + SZ_4K - 1,
++	       .flags = IORESOURCE_MEM,
++	}, {
++	       .start = MXC_INT_CSPI1,
++	       .end = MXC_INT_CSPI1,
++	       .flags = IORESOURCE_IRQ,
++	},
++};
++
++static struct resource mxc_spi_resources1[] = {
++	{
++		.start = CSPI2_BASE_ADDR,
++		.end = CSPI2_BASE_ADDR + SZ_4K - 1,
++		.flags = IORESOURCE_MEM,
++	}, {
++		.start = MXC_INT_CSPI2,
++		.end = MXC_INT_CSPI2,
++		.flags = IORESOURCE_IRQ,
++	},
++};
++
++#ifdef CONFIG_MACH_MX27
++static struct resource mxc_spi_resources2[] = {
++	{
++		.start = CSPI3_BASE_ADDR,
++		.end = CSPI3_BASE_ADDR + SZ_4K - 1,
++		.flags = IORESOURCE_MEM,
++	}, {
++		.start = MXC_INT_CSPI3,
++		.end = MXC_INT_CSPI3,
++		.flags = IORESOURCE_IRQ,
++	},
++};
++#endif
++
++struct platform_device mxc_spi_device0 = {
++	.name = "spi_imx",
++	.id = 0,
++	.num_resources = ARRAY_SIZE(mxc_spi_resources0),
++	.resource = mxc_spi_resources0,
++};
++
++struct platform_device mxc_spi_device1 = {
++	.name = "spi_imx",
++	.id = 1,
++	.num_resources = ARRAY_SIZE(mxc_spi_resources1),
++	.resource = mxc_spi_resources1,
++};
++
++#ifdef CONFIG_MACH_MX27
++struct platform_device mxc_spi_device2 = {
++	.name = "spi_imx",
++	.id = 2,
++	.num_resources = ARRAY_SIZE(mxc_spi_resources2),
++	.resource = mxc_spi_resources2,
++};
++#endif
++
++/*
+  * General Purpose Timer
+  * - i.MX1: 2 timer (slighly different register handling)
+  * - i.MX21: 3 timer
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0021-Early-printk.patch b/recipes/linux/linux-2.6.31/pcm043/0021-Early-printk.patch
new file mode 100644
index 0000000..24f2264
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0021-Early-printk.patch
@@ -0,0 +1,106 @@
+From 286132d92272ffb0ae06ec3ecbe0cb3cfbd611c3 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 29 Jan 2009 16:39:15 +0100
+Subject: [PATCH 021/101] Early printk
+
+Hi,
+
+Below is a patch which I have in my repository for some time now. It
+adds an early console using the printch function. Unlike the printk
+patch this one does not require patching the kernel and you do not get
+duplicated kernel output lines. I don't know if this solution starts to
+work at a later point than the printk patch, but it has proven useful in
+several situations now. What do you think?
+
+Sascha
+
+commit 57242f4143c9ce48e3c49ddf3b206f780184991c
+Author: Sascha Hauer <s.hauer@pengutronix.de>
+Date:   Thu Jan 29 16:32:30 2009 +0100
+
+    [ARM] Add an early debug console
+
+    Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/Kconfig.debug         |    8 ++++++++
+ arch/arm/kernel/Makefile       |    1 +
+ arch/arm/kernel/early_printk.c |   38 ++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 47 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/kernel/early_printk.c
+
+Index: linux-2.6.31.6/arch/arm/Kconfig.debug
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/Kconfig.debug	2009-12-07 15:58:21.683889680 +0100
++++ linux-2.6.31.6/arch/arm/Kconfig.debug	2009-12-07 16:00:33.757198435 +0100
+@@ -70,6 +70,14 @@
+ 	  in the kernel.  This is helpful if you are debugging code that
+ 	  executes before the console is initialized.
+ 
++config DEBUG_LL_CONSOLE
++	bool "Kernel early console"
++	depends on DEBUG_LL
++	help
++	  Say Y here if you want to have an early console using the Kernel
++	  low-level debugging functions. Add earlyprintk to your kernel
++	  parameters to enable this console.
++
+ config DEBUG_ICEDCC
+ 	bool "Kernel low-level debugging via EmbeddedICE DCC channel"
+ 	depends on DEBUG_LL
+Index: linux-2.6.31.6/arch/arm/kernel/Makefile
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/kernel/Makefile	2009-12-07 15:58:21.673849262 +0100
++++ linux-2.6.31.6/arch/arm/kernel/Makefile	2009-12-07 16:00:33.757198435 +0100
+@@ -49,5 +49,6 @@
+ 
+ head-y			:= head$(MMUEXT).o
+ obj-$(CONFIG_DEBUG_LL)	+= debug.o
++obj-$(CONFIG_DEBUG_LL_CONSOLE)	+= early_printk.o
+ 
+ extra-y := $(head-y) init_task.o vmlinux.lds
+Index: linux-2.6.31.6/arch/arm/kernel/early_printk.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/arch/arm/kernel/early_printk.c	2009-12-07 16:00:33.757198435 +0100
+@@ -0,0 +1,38 @@
++/*
++ *  linux/arch/arm/kernel/early_printk.c
++ *
++ *  Copyright (C) 2009 Sascha Hauer <s.hauer@pengutronix.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++#include <linux/console.h>
++#include <linux/init.h>
++
++extern void printch(int);
++
++static void early_serial_write(struct console *con, const char *s, unsigned n)
++{
++	while (*s && n-- > 0) {
++		if (*s == '\n')
++			printch('\r');
++		printch(*s);
++		s++;
++	}
++}
++
++static struct console early_serial_console = {
++	.name =		"earlyser",
++	.write =	early_serial_write,
++	.flags =	CON_PRINTBUFFER | CON_BOOT,
++	.index =	-1,
++};
++
++static int __init setup_early_printk(char *buf)
++{
++	register_console(&early_serial_console);
++	return 0;
++}
++
++early_param("earlyprintk", setup_early_printk);
diff --git a/recipes/linux/linux-2.6.31/pcm043/0021-mxc-mx1-mx2-DMA-add-a-possibility-to-create-an-endle.patch b/recipes/linux/linux-2.6.31/pcm043/0021-mxc-mx1-mx2-DMA-add-a-possibility-to-create-an-endle.patch
new file mode 100644
index 0000000..026d9d5
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0021-mxc-mx1-mx2-DMA-add-a-possibility-to-create-an-endle.patch
@@ -0,0 +1,50 @@
+From 5e93e22102052940681b45b6e3ec5d037983e256 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 18 Nov 2009 15:21:44 +0100
+Subject: [PATCH 21/28] mxc: mx1/mx2 DMA: add a possibility to create an endless DMA transfer
+
+This is useful for audio where we do not want to setup a new scatterlist
+after playing 4GB of audio data. This would cause skips in the playback.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/plat-mxc/dma-mx1-mx2.c              |    3 ++-
+ arch/arm/plat-mxc/include/mach/dma-mx1-mx2.h |    8 ++++++++
+ 2 files changed, 10 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/plat-mxc/dma-mx1-mx2.c b/arch/arm/plat-mxc/dma-mx1-mx2.c
+index 7764643..9c1b3f9 100644
+--- a/arch/arm/plat-mxc/dma-mx1-mx2.c
++++ b/arch/arm/plat-mxc/dma-mx1-mx2.c
+@@ -156,7 +156,8 @@ static inline int imx_dma_sg_next(int channel, struct scatterlist *sg)
+ 	}
+ 
+ 	now = min(imxdma->resbytes, sg->length);
+-	imxdma->resbytes -= now;
++	if (imxdma->resbytes != IMX_DMA_LENGTH_LOOP)
++		imxdma->resbytes -= now;
+ 
+ 	if ((imxdma->dma_mode & DMA_MODE_MASK) == DMA_MODE_READ)
+ 		__raw_writel(sg->dma_address, DMA_BASE + DMA_DAR(channel));
+diff --git a/arch/arm/plat-mxc/include/mach/dma-mx1-mx2.h b/arch/arm/plat-mxc/include/mach/dma-mx1-mx2.h
+index b3876cc..07be8ad 100644
+--- a/arch/arm/plat-mxc/include/mach/dma-mx1-mx2.h
++++ b/arch/arm/plat-mxc/include/mach/dma-mx1-mx2.h
+@@ -58,6 +58,14 @@ imx_dma_setup_single(int channel, dma_addr_t dma_address,
+ 		unsigned int dma_length, unsigned int dev_addr,
+ 		unsigned int dmamode);
+ 
++
++/*
++ * Use this flag as the dma_length argument to imx_dma_setup_sg()
++ * to create an endless running dma loop. The end of the scatterlist
++ * must be linked to the beginning for this to work.
++ */
++#define IMX_DMA_LENGTH_LOOP	((unsigned int)-1)
++
+ int
+ imx_dma_setup_sg(int channel, struct scatterlist *sg,
+ 		unsigned int sgcount, unsigned int dma_length,
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0022-ASoC-Allow-32-bit-registers-for-DAPM.patch b/recipes/linux/linux-2.6.31/pcm043/0022-ASoC-Allow-32-bit-registers-for-DAPM.patch
new file mode 100644
index 0000000..af34209
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0022-ASoC-Allow-32-bit-registers-for-DAPM.patch
@@ -0,0 +1,203 @@
+From f3f4462475d2c86023f7d48c40359d925730ee1b Mon Sep 17 00:00:00 2001
+From: Daniel Ribeiro <drwyrm@gmail.com>
+Date: Sun, 7 Jun 2009 02:49:11 -0300
+Subject: [PATCH 22/28] ASoC: Allow 32 bit registers for DAPM
+
+Replace the remaining unsigned shorts with unsigned ints.
+Tested with pcap2 codec (25 bits registers).
+
+Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+---
+ include/sound/soc.h  |    4 ++--
+ sound/soc/soc-core.c |   28 ++++++++++++++--------------
+ sound/soc/soc-dapm.c |   16 ++++++++--------
+ 3 files changed, 24 insertions(+), 24 deletions(-)
+
+diff --git a/include/sound/soc.h b/include/sound/soc.h
+index cf6111d..a167b49 100644
+--- a/include/sound/soc.h
++++ b/include/sound/soc.h
+@@ -216,9 +216,9 @@ void snd_soc_jack_free_gpios(struct snd_soc_jack *jack, int count,
+ 
+ /* codec register bit access */
+ int snd_soc_update_bits(struct snd_soc_codec *codec, unsigned short reg,
+-				unsigned short mask, unsigned short value);
++				unsigned int mask, unsigned int value);
+ int snd_soc_test_bits(struct snd_soc_codec *codec, unsigned short reg,
+-				unsigned short mask, unsigned short value);
++				unsigned int mask, unsigned int value);
+ 
+ int snd_soc_new_ac97_codec(struct snd_soc_codec *codec,
+ 	struct snd_ac97_bus_ops *ops, int num);
+diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
+index 1d70829..9b88c74 100644
+--- a/sound/soc/soc-core.c
++++ b/sound/soc/soc-core.c
+@@ -1264,10 +1264,10 @@ EXPORT_SYMBOL_GPL(snd_soc_free_ac97_codec);
+  * Returns 1 for change else 0.
+  */
+ int snd_soc_update_bits(struct snd_soc_codec *codec, unsigned short reg,
+-				unsigned short mask, unsigned short value)
++				unsigned int mask, unsigned int value)
+ {
+ 	int change;
+-	unsigned short old, new;
++	unsigned int old, new;
+ 
+ 	mutex_lock(&io_mutex);
+ 	old = snd_soc_read(codec, reg);
+@@ -1294,10 +1294,10 @@ EXPORT_SYMBOL_GPL(snd_soc_update_bits);
+  * Returns 1 for change else 0.
+  */
+ int snd_soc_test_bits(struct snd_soc_codec *codec, unsigned short reg,
+-				unsigned short mask, unsigned short value)
++				unsigned int mask, unsigned int value)
+ {
+ 	int change;
+-	unsigned short old, new;
++	unsigned int old, new;
+ 
+ 	mutex_lock(&io_mutex);
+ 	old = snd_soc_read(codec, reg);
+@@ -1586,7 +1586,7 @@ int snd_soc_get_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short val, bitmask;
++	unsigned int val, bitmask;
+ 
+ 	for (bitmask = 1; bitmask < e->max; bitmask <<= 1)
+ 		;
+@@ -1615,8 +1615,8 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short val;
+-	unsigned short mask, bitmask;
++	unsigned int val;
++	unsigned int mask, bitmask;
+ 
+ 	for (bitmask = 1; bitmask < e->max; bitmask <<= 1)
+ 		;
+@@ -1652,7 +1652,7 @@ int snd_soc_get_value_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short reg_val, val, mux;
++	unsigned int reg_val, val, mux;
+ 
+ 	reg_val = snd_soc_read(codec, e->reg);
+ 	val = (reg_val >> e->shift_l) & e->mask;
+@@ -1691,8 +1691,8 @@ int snd_soc_put_value_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short val;
+-	unsigned short mask;
++	unsigned int val;
++	unsigned int mask;
+ 
+ 	if (ucontrol->value.enumerated.item[0] > e->max - 1)
+ 		return -EINVAL;
+@@ -1852,7 +1852,7 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
+ 	int max = mc->max;
+ 	unsigned int mask = (1 << fls(max)) - 1;
+ 	unsigned int invert = mc->invert;
+-	unsigned short val, val2, val_mask;
++	unsigned int val, val2, val_mask;
+ 
+ 	val = (ucontrol->value.integer.value[0] & mask);
+ 	if (invert)
+@@ -1918,7 +1918,7 @@ int snd_soc_get_volsw_2r(struct snd_kcontrol *kcontrol,
+ 	unsigned int reg2 = mc->rreg;
+ 	unsigned int shift = mc->shift;
+ 	int max = mc->max;
+-	unsigned int mask = (1<<fls(max))-1;
++	unsigned int mask = (1 << fls(max)) - 1;
+ 	unsigned int invert = mc->invert;
+ 
+ 	ucontrol->value.integer.value[0] =
+@@ -1958,7 +1958,7 @@ int snd_soc_put_volsw_2r(struct snd_kcontrol *kcontrol,
+ 	unsigned int mask = (1 << fls(max)) - 1;
+ 	unsigned int invert = mc->invert;
+ 	int err;
+-	unsigned short val, val2, val_mask;
++	unsigned int val, val2, val_mask;
+ 
+ 	val_mask = mask << shift;
+ 	val = (ucontrol->value.integer.value[0] & mask);
+@@ -2050,7 +2050,7 @@ int snd_soc_put_volsw_s8(struct snd_kcontrol *kcontrol,
+ 	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
+ 	unsigned int reg = mc->reg;
+ 	int min = mc->min;
+-	unsigned short val;
++	unsigned int val;
+ 
+ 	val = (ucontrol->value.integer.value[0]+min) & 0xff;
+ 	val |= ((ucontrol->value.integer.value[1]+min) & 0xff) << 8;
+diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
+index 21c6907..7ad8afa 100644
+--- a/sound/soc/soc-dapm.c
++++ b/sound/soc/soc-dapm.c
+@@ -268,7 +268,7 @@ static int dapm_connect_mixer(struct snd_soc_codec *codec,
+ static int dapm_update_bits(struct snd_soc_dapm_widget *widget)
+ {
+ 	int change, power;
+-	unsigned short old, new;
++	unsigned int old, new;
+ 	struct snd_soc_codec *codec = widget->codec;
+ 
+ 	/* check for valid widgets */
+@@ -1372,7 +1372,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
+ 	int max = mc->max;
+ 	unsigned int mask = (1 << fls(max)) - 1;
+ 	unsigned int invert = mc->invert;
+-	unsigned short val, val2, val_mask;
++	unsigned int val, val2, val_mask;
+ 	int ret;
+ 
+ 	val = (ucontrol->value.integer.value[0] & mask);
+@@ -1436,7 +1436,7 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_dapm_widget *widget = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short val, bitmask;
++	unsigned int val, bitmask;
+ 
+ 	for (bitmask = 1; bitmask < e->max; bitmask <<= 1)
+ 		;
+@@ -1464,8 +1464,8 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_dapm_widget *widget = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short val, mux;
+-	unsigned short mask, bitmask;
++	unsigned int val, mux;
++	unsigned int mask, bitmask;
+ 	int ret = 0;
+ 
+ 	for (bitmask = 1; bitmask < e->max; bitmask <<= 1)
+@@ -1523,7 +1523,7 @@ int snd_soc_dapm_get_value_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_dapm_widget *widget = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short reg_val, val, mux;
++	unsigned int reg_val, val, mux;
+ 
+ 	reg_val = snd_soc_read(widget->codec, e->reg);
+ 	val = (reg_val >> e->shift_l) & e->mask;
+@@ -1563,8 +1563,8 @@ int snd_soc_dapm_put_value_enum_double(struct snd_kcontrol *kcontrol,
+ {
+ 	struct snd_soc_dapm_widget *widget = snd_kcontrol_chip(kcontrol);
+ 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+-	unsigned short val, mux;
+-	unsigned short mask;
++	unsigned int val, mux;
++	unsigned int mask;
+ 	int ret = 0;
+ 
+ 	if (ucontrol->value.enumerated.item[0] > e->max - 1)
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0023-pca100-add-sound-support.patch b/recipes/linux/linux-2.6.31/pcm043/0023-pca100-add-sound-support.patch
new file mode 100644
index 0000000..623d80a
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0023-pca100-add-sound-support.patch
@@ -0,0 +1,99 @@
+From f58f54a10075e0ff2d952b9264ce880c1ecbf439 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 6 Nov 2009 15:29:58 +0100
+Subject: [PATCH 23/28] pca100: add sound support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/pca100.c |   52 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 52 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-mx2/pca100.c b/arch/arm/mach-mx2/pca100.c
+index fe5b165..e0a464d 100644
+--- a/arch/arm/mach-mx2/pca100.c
++++ b/arch/arm/mach-mx2/pca100.c
+@@ -26,6 +26,7 @@
+ #include <linux/spi/eeprom.h>
+ #include <linux/irq.h>
+ #include <linux/gpio.h>
++#include <linux/delay.h>
+ 
+ #include <asm/mach/arch.h>
+ #include <asm/mach-types.h>
+@@ -41,6 +42,8 @@
+ #include <mach/mxc_nand.h>
+ #include <mach/irqs.h>
+ #include <mach/mmc.h>
++#include <mach/audmux.h>
++#include <mach/ssi.h>
+ 
+ #include "devices.h"
+ 
+@@ -182,15 +185,64 @@ static struct imxmmc_platform_data sdhc_pdata = {
+ 	.exit = pca100_sdhc2_exit,
+ };
+ 
++static void pca100_ac97_warm_reset(struct snd_ac97 *ac97)
++{
++	printk("%s\n", __func__);
++
++	mxc_gpio_mode(GPIO_PORTC | 20 | GPIO_GPIO | GPIO_OUT);
++	gpio_set_value(GPIO_PORTC + 20, 1);
++	udelay(2);
++	gpio_set_value(GPIO_PORTC + 20, 0);
++	mxc_gpio_mode(PC20_PF_SSI1_FS);
++	msleep(2);
++}
++
++static void pca100_ac97_cold_reset(struct snd_ac97 *ac97)
++{
++	printk("%s\n", __func__);
++
++	mxc_gpio_mode(GPIO_PORTC | 20 | GPIO_GPIO | GPIO_OUT);  /* FS */
++	gpio_set_value(GPIO_PORTC + 20, 0);
++	mxc_gpio_mode(GPIO_PORTC | 22 | GPIO_GPIO | GPIO_OUT);  /* TX */
++	gpio_set_value(GPIO_PORTC + 22, 0);
++	mxc_gpio_mode(GPIO_PORTC | 28 | GPIO_GPIO | GPIO_OUT);  /* reset */
++	gpio_set_value(GPIO_PORTC + 28, 0);
++	udelay(10);
++	gpio_set_value(GPIO_PORTC + 28, 1);
++	mxc_gpio_mode(PC20_PF_SSI1_FS);
++	mxc_gpio_mode(PC22_PF_SSI1_TXD);
++	msleep(2);
++}
++
++static struct imx_ssi_platform_data pca100_ssi_pdata = {
++	.ac97_reset		= pca100_ac97_cold_reset,
++	.ac97_warm_reset	= pca100_ac97_warm_reset,
++	.flags			= IMX_SSI_USE_AC97,
++};
++
+ static void __init pca100_init(void)
+ {
+ 	int ret;
+ 
++	/* SSI unit */
++	mxc_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
++				  MXC_AUDMUX_V1_PCR_SYN | /* 4wire mode */
++				  MXC_AUDMUX_V1_PCR_TFCSEL(3) |
++				  MXC_AUDMUX_V1_PCR_TCLKDIR | /* clock is output */
++				  MXC_AUDMUX_V1_PCR_RXDSEL(3));
++	mxc_audmux_v1_configure_port(4,
++				  MXC_AUDMUX_V1_PCR_SYN | /* 4wire mode */
++				  MXC_AUDMUX_V1_PCR_TFCSEL(0) |
++				  MXC_AUDMUX_V1_PCR_TFSDIR |
++				  MXC_AUDMUX_V1_PCR_RXDSEL(0));
++
+ 	ret = mxc_gpio_setup_multiple_pins(pca100_pins,
+ 			ARRAY_SIZE(pca100_pins), "PCA100");
+ 	if (ret)
+ 		printk(KERN_ERR "pca100: Failed to setup pins (%d)\n", ret);
+ 
++	mxc_register_device(&imx_ssi_device0, &pca100_ssi_pdata);
++
+ 	mxc_register_device(&mxc_uart_device0, &uart_pdata);
+ 
+ 	mxc_gpio_mode(GPIO_PORTC | 29 | GPIO_GPIO | GPIO_IN);
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0024-MX31-Clock-updates.patch b/recipes/linux/linux-2.6.31/pcm043/0024-MX31-Clock-updates.patch
new file mode 100644
index 0000000..9bb85dd
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0024-MX31-Clock-updates.patch
@@ -0,0 +1,40 @@
+From f9a58060254e1c7d6d2bedf6044577aa61885ca3 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 20 Mar 2009 19:25:01 +0100
+Subject: [PATCH 024/101] MX31 Clock updates
+
+- register correct ehci clocks
+- update spi clock names
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/clock.c |   12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+Index: arch/arm/mach-mx3/clock.c
+===================================================================
+--- arch/arm/mach-mx3/clock.c.orig	2009-12-07 15:20:31.943942228 +0100
++++ arch/arm/mach-mx3/clock.c	2009-12-07 16:10:37.774566402 +0100
+@@ -523,7 +523,7 @@
+ 	_REGISTER_CLOCK("spi_imx.2", NULL, cspi3_clk)
+ 	_REGISTER_CLOCK(NULL, "gpt", gpt_clk)
+ 	_REGISTER_CLOCK(NULL, "pwm", pwm_clk)
+-	_REGISTER_CLOCK(NULL, "wdog", wdog_clk)
++	_REGISTER_CLOCK("imx-wdt.0", NULL, wdog_clk)
+ 	_REGISTER_CLOCK(NULL, "rtc", rtc_clk)
+ 	_REGISTER_CLOCK(NULL, "epit", epit1_clk)
+ 	_REGISTER_CLOCK(NULL, "epit", epit2_clk)
+@@ -531,6 +531,10 @@
+ 	_REGISTER_CLOCK("ipu-core", NULL, ipu_clk)
+ 	_REGISTER_CLOCK("mx3_sdc_fb", NULL, ipu_clk)
+ 	_REGISTER_CLOCK(NULL, "kpp", kpp_clk)
++	/* FIXME: mxc-ehci now misses the secondary clock */
++	_REGISTER_CLOCK("mxc-ehci.0", NULL, usb_clk1)
++	_REGISTER_CLOCK("mxc-ehci.1", NULL, usb_clk1)
++	_REGISTER_CLOCK("mxc-ehci.2", NULL, usb_clk1)
+ 	_REGISTER_CLOCK("fsl-usb2-udc", "usb", usb_clk1)
+ 	_REGISTER_CLOCK("fsl-usb2-udc", "usb_ahb", usb_clk2)
+ 	_REGISTER_CLOCK("mx3-camera.0", NULL, csi_clk)
diff --git a/recipes/linux/linux-2.6.31/pcm043/0024-pcm038-add-sound-support.patch b/recipes/linux/linux-2.6.31/pcm043/0024-pcm038-add-sound-support.patch
new file mode 100644
index 0000000..bebcb3a
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0024-pcm038-add-sound-support.patch
@@ -0,0 +1,72 @@
+From 76c72535c2ae04d10a52c1958add9a08b97a11be Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 6 Nov 2009 09:45:42 +0100
+Subject: [PATCH 24/28] pcm038: add sound support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx2/pcm038.c |   23 ++++++++++++++++++++++-
+ 1 files changed, 22 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-mx2/pcm038.c b/arch/arm/mach-mx2/pcm038.c
+index b3a8ed8..b0c38b9 100644
+--- a/arch/arm/mach-mx2/pcm038.c
++++ b/arch/arm/mach-mx2/pcm038.c
+@@ -39,7 +39,9 @@
+ #include <mach/iomux.h>
+ #include <mach/imx-uart.h>
+ #include <mach/mxc_nand.h>
++#include <mach/audmux.h>
+ #include <mach/spi.h>
++#include <mach/ssi.h>
+ 
+ #include "devices.h"
+ 
+@@ -268,7 +270,7 @@ static struct mc13783_platform_data pcm038_pmic = {
+ 	.regulators = pcm038_regulators,
+ 	.num_regulators = ARRAY_SIZE(pcm038_regulators),
+ 	.flags = MC13783_USE_ADC | MC13783_USE_REGULATOR |
+-		 MC13783_USE_TOUCHSCREEN,
++		 MC13783_USE_TOUCHSCREEN | MC13783_USE_CODEC,
+ };
+ 
+ static struct spi_board_info pcm038_spi_board_info[] __initdata = {
+@@ -283,16 +285,35 @@ static struct spi_board_info pcm038_spi_board_info[] __initdata = {
+ 	}
+ };
+ 
++struct imx_ssi_platform_data pcm038_ssi_pdata = {
++	.flags = IMX_SSI_DMA,
++};
++
+ static void __init pcm038_init(void)
+ {
+ 	mxc_gpio_setup_multiple_pins(pcm038_pins, ARRAY_SIZE(pcm038_pins),
+ 			"PCM038");
+ 
++	mxc_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
++		MXC_AUDMUX_V1_PCR_TFSDIR |
++		MXC_AUDMUX_V1_PCR_TCLKDIR |
++		MXC_AUDMUX_V1_PCR_TFCSEL(MX27_AUDMUX_PPCR1_SSI_PINS_1) |
++		MXC_AUDMUX_V1_PCR_RFSDIR |
++		MXC_AUDMUX_V1_PCR_RCLKDIR |
++		MXC_AUDMUX_V1_PCR_RFCSEL(MX27_AUDMUX_HPCR3_SSI_PINS_4) |
++		MXC_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR3_SSI_PINS_4));
++	mxc_audmux_v1_configure_port(MX27_AUDMUX_HPCR3_SSI_PINS_4,
++		MXC_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0));
++	mxc_audmux_v1_configure_port(MX27_AUDMUX_PPCR1_SSI_PINS_1,
++		MXC_AUDMUX_V1_PCR_TFCSEL(MX27_AUDMUX_HPCR1_SSI0) |
++		MXC_AUDMUX_V1_PCR_RFCSEL(MX27_AUDMUX_HPCR1_SSI0));
++
+ 	pcm038_init_sram();
+ 
+ 	mxc_register_device(&mxc_uart_device0, &uart_pdata[0]);
+ 	mxc_register_device(&mxc_uart_device1, &uart_pdata[1]);
+ 	mxc_register_device(&mxc_uart_device2, &uart_pdata[2]);
++	mxc_register_device(&imx_ssi_device0, &pcm038_ssi_pdata);
+ 
+ 	mxc_gpio_mode(PE16_AF_OWIRE);
+ 	mxc_register_device(&mxc_nand_device, &pcm038_nand_board_info);
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0025-pcm037-Add-sound-support.patch b/recipes/linux/linux-2.6.31/pcm043/0025-pcm037-Add-sound-support.patch
new file mode 100644
index 0000000..cba390c
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0025-pcm037-Add-sound-support.patch
@@ -0,0 +1,144 @@
+From 8b4873639bb66d8269f0767ddfbb4c8a7f8082f7 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 12 Nov 2009 14:02:13 +0100
+Subject: [PATCH 25/28] pcm037: Add sound support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/pcm037.c |   71 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 71 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/pcm037.c b/arch/arm/mach-mx3/pcm037.c
+index 840cfda..8ef6c79 100644
+--- a/arch/arm/mach-mx3/pcm037.c
++++ b/arch/arm/mach-mx3/pcm037.c
+@@ -32,6 +32,7 @@
+ #include <linux/spi/spi.h>
+ #include <linux/irq.h>
+ #include <linux/fsl_devices.h>
++#include <linux/mfd/mc13783.h>
+ 
+ #include <media/soc_camera.h>
+ 
+@@ -50,6 +51,9 @@
+ #include <mach/mx3_camera.h>
+ #include <mach/mx3fb.h>
+ #include <mach/mxc_nand.h>
++#include <mach/spi.h>
++#include <mach/audmux.h>
++#include <mach/ssi.h>
+ 
+ #include "devices.h"
+ #include "pcm037.h"
+@@ -123,6 +127,8 @@ static unsigned int pcm037_pins[] = {
+ 	MX31_PIN_CSPI3_SPI_RDY__CTS3,
+ 	/* LAN9217 irq pin */
+ 	IOMUX_MODE(MX31_PIN_GPIO3_1, IOMUX_CONFIG_GPIO),
++	/* MC13783 IRQ pim */
++	IOMUX_MODE(MX31_PIN_GPIO3_0, IOMUX_CONFIG_GPIO),
+ 	/* Onewire */
+ 	MX31_PIN_BATT_LINE__OWIRE,
+ 	/* Framebuffer */
+@@ -169,6 +175,15 @@ static unsigned int pcm037_pins[] = {
+ 	MX31_PIN_CSI_MCLK__CSI_MCLK,
+ 	MX31_PIN_CSI_PIXCLK__CSI_PIXCLK,
+ 	MX31_PIN_CSI_VSYNC__CSI_VSYNC,
++	/* SSI */
++	MX31_PIN_STXD4__STXD4,
++	MX31_PIN_SRXD4__SRXD4,
++	MX31_PIN_SCK4__SCK4,
++	MX31_PIN_SFS4__SFS4,
++	MX31_PIN_STXD5__STXD5,
++	MX31_PIN_SRXD5__SRXD5,
++	MX31_PIN_SCK5__SCK5,
++	MX31_PIN_SFS5__SFS5,
+ };
+ 
+ static struct physmap_flash_data pcm037_flash_data = {
+@@ -406,6 +421,31 @@ static void pcm970_sdhc1_exit(struct device *dev, void *data)
+ 	gpio_free(SDHC1_GPIO_WP);
+ }
+ 
++#ifdef CONFIG_SPI
++static struct mc13783_platform_data pcm037_pmic = {
++	.flags = MC13783_USE_ADC | MC13783_USE_TOUCHSCREEN |
++		 MC13783_USE_CODEC,
++};
++
++static unsigned int pcm037_spi_cs[] = {MXC_SPI_CS(0), };
++
++static struct spi_imx_master pcm037_spi_0_data = {
++	.chipselect = pcm037_spi_cs,
++	.num_chipselect = ARRAY_SIZE(pcm037_spi_cs),
++};
++
++static struct spi_board_info pcm037_spi_board_info[] __initdata = {
++	{
++		.modalias	= "mc13783",
++		.irq		= IOMUX_TO_IRQ(MX31_PIN_GPIO3_0),
++		.max_speed_hz	= 3000000,
++		.bus_num	= 0,
++		.platform_data	= &pcm037_pmic,
++		.chip_select	= 0,
++	}
++};
++#endif /* CONFIG_SPI */
++
+ static struct imxmmc_platform_data sdhc_pdata = {
+ #ifdef PCM970_SDHC_RW_SWITCH
+ 	.get_ro = pcm970_sdhc1_get_ro,
+@@ -515,6 +555,9 @@ static struct mx3fb_platform_data mx3fb_pdata = {
+ 	.num_modes	= ARRAY_SIZE(fb_modedb),
+ };
+ 
++struct imx_ssi_platform_data pcm037_ssi_pdata = {
++};
++
+ /*
+  * Board specific initialization.
+  */
+@@ -522,6 +565,26 @@ static void __init mxc_board_init(void)
+ {
+ 	int ret;
+ 
++	mxc_audmux_v2_configure_port(MX31_AUDMUX_PORT1_SSI0,
++			MXC_AUDMUX_V2_PTCR_TFSDIR |
++			MXC_AUDMUX_V2_PTCR_TCLKDIR |
++			MXC_AUDMUX_V2_PTCR_TFSEL(MX31_AUDMUX_PORT4_SSI_PINS_4) |
++			MXC_AUDMUX_V2_PTCR_TCSEL(MX31_AUDMUX_PORT4_SSI_PINS_4) |
++			MXC_AUDMUX_V2_PTCR_RFSDIR |
++			MXC_AUDMUX_V2_PTCR_RCLKDIR |
++			MXC_AUDMUX_V2_PTCR_RFSEL(MX31_AUDMUX_PORT5_SSI_PINS_5) |
++			MXC_AUDMUX_V2_PTCR_RCSEL(MX31_AUDMUX_PORT5_SSI_PINS_5),
++			MXC_AUDMUX_V2_PDCR_RXDSEL(MX31_AUDMUX_PORT5_SSI_PINS_5));
++	mxc_audmux_v2_configure_port(MX31_AUDMUX_PORT5_SSI_PINS_5,
++			0,
++			MXC_AUDMUX_V2_PDCR_RXDSEL(MX31_AUDMUX_PORT1_SSI0));
++	mxc_audmux_v2_configure_port(MX31_AUDMUX_PORT4_SSI_PINS_4,
++			MXC_AUDMUX_V2_PTCR_TFSEL(MX31_AUDMUX_PORT1_SSI0) |
++			MXC_AUDMUX_V2_PTCR_TCSEL(MX31_AUDMUX_PORT1_SSI0) |
++			MXC_AUDMUX_V2_PTCR_RFSEL(MX31_AUDMUX_PORT1_SSI0) |
++			MXC_AUDMUX_V2_PTCR_RCSEL(MX31_AUDMUX_PORT1_SSI0),
++			0);
++
+ 	mxc_iomux_setup_multiple_pins(pcm037_pins, ARRAY_SIZE(pcm037_pins),
+ 			"pcm037");
+ 
+@@ -575,6 +638,14 @@ static void __init mxc_board_init(void)
+ 
+ 	if (!pcm037_camera_alloc_dma(4 * 1024 * 1024))
+ 		mxc_register_device(&mx3_camera, &camera_pdata);
++
++#ifdef CONFIG_SPI
++	mxc_register_device(&imx_spi_device0, &pcm037_spi_0_data);
++
++	spi_register_board_info(pcm037_spi_board_info,
++			ARRAY_SIZE(pcm037_spi_board_info));
++#endif
++	mxc_register_device(&imx_ssi_device0, &pcm037_ssi_pdata);
+ }
+ 
+ static void __init pcm037_timer_init(void)
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0026-imx-ssi-Fix-AC97-rates.patch b/recipes/linux/linux-2.6.31/pcm043/0026-imx-ssi-Fix-AC97-rates.patch
new file mode 100644
index 0000000..53b1a60
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0026-imx-ssi-Fix-AC97-rates.patch
@@ -0,0 +1,37 @@
+From da230ac4c6dce39cc85b95a08bceec2976288419 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 27 Nov 2009 16:28:59 +0100
+Subject: [PATCH 26/28] imx-ssi: Fix AC97 rates
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ sound/soc/imx/imx-ssi.c |    6 +++++-
+ 1 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/sound/soc/imx/imx-ssi.c b/sound/soc/imx/imx-ssi.c
+index 9823425..6219df9 100644
+--- a/sound/soc/imx/imx-ssi.c
++++ b/sound/soc/imx/imx-ssi.c
+@@ -453,6 +453,10 @@ struct snd_soc_platform imx_soc_platform = {
+ };
+ EXPORT_SYMBOL_GPL(imx_soc_platform);
+ 
++#define IMX_AC97_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |\
++		SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | \
++		SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
++
+ static struct snd_soc_dai imx_ac97_dai = {
+ 	.name = "AC97",
+ 	.ac97_control = 1,
+@@ -460,7 +464,7 @@ static struct snd_soc_dai imx_ac97_dai = {
+ 		.stream_name = "AC97 Playback",
+ 		.channels_min = 2,
+ 		.channels_max = 2,
+-		.rates = SND_SOC_STD_AC97_FMTS,
++		.rates = IMX_AC97_RATES,
+ 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+ 	},
+ 	.capture = {
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0027-Add-EHCI-support-for-MX27-and-MX31-based-boards.patch b/recipes/linux/linux-2.6.31/pcm043/0027-Add-EHCI-support-for-MX27-and-MX31-based-boards.patch
new file mode 100644
index 0000000..1c60690
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0027-Add-EHCI-support-for-MX27-and-MX31-based-boards.patch
@@ -0,0 +1,347 @@
+From ce297d614ab56284823043e1743200388d9f466f Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Mon, 9 Mar 2009 12:29:23 +0100
+Subject: [PATCH 027/101] Add EHCI support for MX27 and MX31 based boards
+
+The Freescale MX27 and MX31 SoCs have a EHCI controller onboard.
+The controller is capable of USB on the go. This patch adds
+support for the host controller only.
+
+The USB OTG core used here is the ARC core, so the driver should
+be renamed.
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/plat-mxc/include/mach/mxc_ehci.h |    9 +
+ drivers/usb/Kconfig                       |    1 +
+ drivers/usb/host/Kconfig                  |    7 +
+ drivers/usb/host/ehci-hcd.c               |    5 +
+ drivers/usb/host/ehci-mxc.c               |  256 +++++++++++++++++++++++++++++
+ 5 files changed, 278 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/plat-mxc/include/mach/mxc_ehci.h
+ create mode 100644 drivers/usb/host/ehci-mxc.c
+
+Index: linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mxc_ehci.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mxc_ehci.h	2009-12-10 11:40:43.315272374 +0100
+@@ -0,0 +1,9 @@
++#ifndef __INCLUDE_ASM_ARCH_MXC_EHCI_H
++#define __INCLUDE_ASM_ARCH_MXC_EHCI_H
++
++struct mxc_usbh_platform_data {
++	int (*init)(struct platform_device *pdev);
++	int (*exit)(struct platform_device *pdev);
++};
++#endif /* __INCLUDE_ASM_ARCH_MXC_EHCI_H */
++
+Index: linux-2.6.31.6/drivers/usb/Kconfig
+===================================================================
+--- linux-2.6.31.6.orig/drivers/usb/Kconfig	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/usb/Kconfig	2009-12-10 11:40:43.315272374 +0100
+@@ -58,6 +58,7 @@
+ 	default y if PPC_83xx
+ 	default y if SOC_AU1200
+ 	default y if ARCH_IXP4XX
++	default y if ARCH_MXC
+ 	default PCI
+ 
+ # ARM SA1111 chips have a non-PCI based "OHCI-compatible" USB host interface.
+Index: linux-2.6.31.6/drivers/usb/host/Kconfig
+===================================================================
+--- linux-2.6.31.6.orig/drivers/usb/host/Kconfig	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/usb/host/Kconfig	2009-12-10 11:40:43.315272374 +0100
+@@ -105,6 +105,13 @@
+ 	---help---
+ 	  Variation of ARC USB block used in some Freescale chips.
+ 
++config USB_EHCI_MXC
++	bool "Support for Freescale on-chip EHCI USB controller"
++	depends on USB_EHCI_HCD && ARCH_MXC
++	select USB_EHCI_ROOT_HUB_TT
++	---help---
++	  Variation of ARC USB block used in some Freescale chips.
++
+ config USB_EHCI_HCD_PPC_OF
+ 	bool "EHCI support for PPC USB controller on OF platform bus"
+ 	depends on USB_EHCI_HCD && PPC_OF
+Index: linux-2.6.31.6/drivers/usb/host/ehci-hcd.c
+===================================================================
+--- linux-2.6.31.6.orig/drivers/usb/host/ehci-hcd.c	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/usb/host/ehci-hcd.c	2009-12-10 11:40:43.315272374 +0100
+@@ -1092,6 +1092,11 @@
+ #define	PLATFORM_DRIVER		ehci_fsl_driver
+ #endif
+ 
++#ifdef CONFIG_USB_EHCI_MXC
++#include "ehci-mxc.c"
++#define PLATFORM_DRIVER		ehci_mxc_driver
++#endif
++
+ #ifdef CONFIG_SOC_AU1200
+ #include "ehci-au1xxx.c"
+ #define	PLATFORM_DRIVER		ehci_hcd_au1xxx_driver
+Index: linux-2.6.31.6/drivers/usb/host/ehci-mxc.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/usb/host/ehci-mxc.c	2009-12-10 11:40:43.315272374 +0100
+@@ -0,0 +1,256 @@
++/*
++ * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by the
++ * Free Software Foundation; either version 2 of the License, or (at your
++ * option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++ * for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software Foundation,
++ * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ *
++ */
++
++#include <linux/platform_device.h>
++#include <linux/clk.h>
++#include <mach/mxc_ehci.h>
++
++struct ehci_mxc_priv {
++	struct clk *usbclk, *ahbclk;
++	struct usb_hcd *hcd;
++};
++
++/* called during probe() after chip reset completes */
++static int ehci_mxc_setup(struct usb_hcd *hcd)
++{
++	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
++	int retval;
++
++	/* EHCI registers start at offset 0x100 */
++	ehci->caps = hcd->regs + 0x100;
++	ehci->regs = hcd->regs + 0x100 +
++	    HC_LENGTH(ehci_readl(ehci, &ehci->caps->hc_capbase));
++	dbg_hcs_params(ehci, "reset");
++	dbg_hcc_params(ehci, "reset");
++
++	/* cache this readonly data; minimize chip reads */
++	ehci->hcs_params = ehci_readl(ehci, &ehci->caps->hcs_params);
++
++	retval = ehci_halt(ehci);
++	if (retval)
++		return retval;
++
++	/* data structure init */
++	retval = ehci_init(hcd);
++	if (retval)
++		return retval;
++
++	hcd->has_tt = 1;
++
++	ehci->sbrn = 0x20;
++
++	ehci_reset(ehci);
++
++	ehci_port_power(ehci, 0);
++	return 0;
++}
++
++static const struct hc_driver ehci_mxc_hc_driver = {
++	.description = hcd_name,
++	.product_desc = "Freescale On-Chip EHCI Host Controller",
++	.hcd_priv_size = sizeof(struct ehci_hcd),
++
++	/*
++	 * generic hardware linkage
++	 */
++	.irq = ehci_irq,
++	.flags = HCD_USB2 | HCD_MEMORY,
++
++	/*
++	 * basic lifecycle operations
++	 */
++	.reset = ehci_mxc_setup,
++	.start = ehci_run,
++	.stop = ehci_stop,
++	.shutdown = ehci_shutdown,
++
++	/*
++	 * managing i/o requests and associated device resources
++	 */
++	.urb_enqueue = ehci_urb_enqueue,
++	.urb_dequeue = ehci_urb_dequeue,
++	.endpoint_disable = ehci_endpoint_disable,
++
++	/*
++	 * scheduling support
++	 */
++	.get_frame_number = ehci_get_frame,
++
++	/*
++	 * root hub support
++	 */
++	.hub_status_data = ehci_hub_status_data,
++	.hub_control = ehci_hub_control,
++	.bus_suspend = ehci_bus_suspend,
++	.bus_resume = ehci_bus_resume,
++	.relinquish_port = ehci_relinquish_port,
++	.port_handed_over = ehci_port_handed_over,
++};
++
++static int ehci_mxc_drv_probe(struct platform_device *pdev)
++{
++	struct mxc_usbh_platform_data *pdata;
++	struct usb_hcd *hcd;
++	struct resource *res;
++	int irq, ret, temp;
++	struct ehci_mxc_priv *priv;
++
++	dev_info(&pdev->dev, "initializing i.MX USB Controller\n");
++
++	pdata = (struct mxc_usbh_platform_data *)pdev->dev.platform_data;
++
++	irq = platform_get_irq(pdev, 0);
++
++	hcd = usb_create_hcd(&ehci_mxc_hc_driver, &pdev->dev, dev_name(&pdev->dev));
++	if (!hcd)
++		return -ENOMEM;
++
++	priv = kzalloc(sizeof (*priv), GFP_KERNEL);
++	if (!priv) {
++		ret = -ENOMEM;
++		goto err_alloc;
++	}
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(&pdev->dev,
++			"Found HC with no register addr. Check setup!\n");
++		ret = -ENODEV;
++		goto err_get_resource;
++	}
++
++	hcd->rsrc_start = res->start;
++	hcd->rsrc_len = resource_size(res);
++
++	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
++		dev_dbg(&pdev->dev, "controller already in use\n");
++		ret = -EBUSY;
++		goto err_request_mem;
++	}
++
++	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
++	if (!hcd->regs) {
++		dev_err(&pdev->dev, "error mapping memory\n");
++		ret = -EFAULT;
++		goto err_ioremap;
++	}
++
++	priv->usbclk = clk_get(&pdev->dev, "usb");
++	if (IS_ERR(priv->usbclk)) {
++		ret = PTR_ERR(priv->usbclk);
++		goto err_clk;
++	}
++	clk_enable(priv->usbclk);
++
++	if (!cpu_is_mx35()) {
++		priv->ahbclk = clk_get(&pdev->dev, "usb_ahb");
++		if (IS_ERR(priv->ahbclk)) {
++			ret = PTR_ERR(priv->ahbclk);
++			goto err_clk_ahb;
++		}
++		clk_enable(priv->ahbclk);
++	}
++
++	if (pdata && pdata->init) {
++		ret = pdata->init(pdev);
++		if (ret) {
++			dev_err(&pdev->dev, "platform init failed\n");
++			goto err_init;
++		}
++	}
++
++	/* Set to Host mode */
++	temp = readl(hcd->regs + 0x1a8);
++	writel(temp | 0x3, hcd->regs + 0x1a8);
++
++	priv->hcd = hcd;
++	platform_set_drvdata(pdev, priv);
++
++	ret = usb_add_hcd(hcd, irq, IRQF_DISABLED | IRQF_SHARED);
++	if (ret)
++		goto err_add;
++
++	return 0;
++
++err_add:
++	if (pdata && pdata->exit)
++		pdata->exit(pdev);
++err_init:
++	if (priv->ahbclk) {
++		clk_disable(priv->ahbclk);
++		clk_put(priv->ahbclk);
++	}
++err_clk_ahb:
++	clk_disable(priv->usbclk);
++	clk_put(priv->usbclk);
++err_clk:
++	iounmap(hcd->regs);
++err_ioremap:
++	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
++err_request_mem:
++err_get_resource:
++	kfree(priv);
++err_alloc:
++	usb_put_hcd(hcd);
++	return ret;
++}
++
++static int __exit ehci_mxc_drv_remove(struct platform_device *pdev)
++{
++	struct ehci_mxc_priv *priv = platform_get_drvdata(pdev);
++	struct usb_hcd *hcd = priv->hcd;
++
++	usb_remove_hcd(hcd);
++	iounmap(hcd->regs);
++	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
++	usb_put_hcd(hcd);
++	platform_set_drvdata(pdev, NULL);
++
++	clk_disable(priv->usbclk);
++	clk_put(priv->usbclk);
++	if (priv->ahbclk) {
++		clk_disable(priv->ahbclk);
++		clk_put(priv->ahbclk);
++	}
++
++	kfree(priv);
++
++	return 0;
++}
++
++static void
++ehci_mxc_shutdown(struct platform_device *pdev)
++{
++	struct ehci_mxc_priv *priv = platform_get_drvdata(pdev);
++	struct usb_hcd *hcd = priv->hcd;
++
++	if (hcd->driver->shutdown)
++		hcd->driver->shutdown(hcd);
++}
++
++MODULE_ALIAS("platform:mxc-ehci");
++
++static struct platform_driver ehci_mxc_driver = {
++	.probe = ehci_mxc_drv_probe,
++	.remove = __exit_p(ehci_mxc_drv_remove),
++	.shutdown = ehci_mxc_shutdown,
++	.driver = {
++		   .name = "mxc-ehci",
++	},
++};
diff --git a/recipes/linux/linux-2.6.31/pcm043/0027-imx-ssi-flush-fifos.patch b/recipes/linux/linux-2.6.31/pcm043/0027-imx-ssi-flush-fifos.patch
new file mode 100644
index 0000000..56fcd9e
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0027-imx-ssi-flush-fifos.patch
@@ -0,0 +1,29 @@
+From 447b943dc48d3775e59be1800a3198f65265536d Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 2 Dec 2009 11:59:05 +0100
+Subject: [PATCH 27/28] imx-ssi: flush fifos
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ sound/soc/imx/imx-ssi.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/sound/soc/imx/imx-ssi.c b/sound/soc/imx/imx-ssi.c
+index 6219df9..d25ee2b 100644
+--- a/sound/soc/imx/imx-ssi.c
++++ b/sound/soc/imx/imx-ssi.c
+@@ -333,6 +333,11 @@ static int imx_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
+ 		/* rx/tx are always enabled to access ac97 registers */
+ 		writel(scr, ssi->base + SSI_SCR);
+ 
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
++		writel(SSI_SOR_TX_CLR, ssi->base + SSI_SOR);
++	else
++		writel(SSI_SOR_RX_CLR, ssi->base + SSI_SOR);
++
+ 	writel(sier, ssi->base + SSI_SIER);
+ 
+ 	return 0;
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0028-imx-ssi-Fix-occasional-AC97-reset-failure.patch b/recipes/linux/linux-2.6.31/pcm043/0028-imx-ssi-Fix-occasional-AC97-reset-failure.patch
new file mode 100644
index 0000000..fcb26ac
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0028-imx-ssi-Fix-occasional-AC97-reset-failure.patch
@@ -0,0 +1,37 @@
+From fb79a42a2badc12714a50ad5cc360927a138e8a6 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Thu, 17 Dec 2009 11:19:38 +0100
+Subject: [PATCH 28/28] imx-ssi: Fix occasional AC97 reset failure
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ sound/soc/imx/imx-ssi.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/sound/soc/imx/imx-ssi.c b/sound/soc/imx/imx-ssi.c
+index d25ee2b..94ef361 100644
+--- a/sound/soc/imx/imx-ssi.c
++++ b/sound/soc/imx/imx-ssi.c
+@@ -565,6 +565,9 @@ static void imx_ssi_ac97_reset(struct snd_ac97 *ac97)
+ 
+ 	if (imx_ssi->ac97_reset)
+ 		imx_ssi->ac97_reset(ac97);
++
++	/* First read sometimes fails, do a dummy read */
++	imx_ssi_ac97_read(ac97, 0);
+ }
+ 
+ static void imx_ssi_ac97_warm_reset(struct snd_ac97 *ac97)
+@@ -573,6 +576,9 @@ static void imx_ssi_ac97_warm_reset(struct snd_ac97 *ac97)
+ 
+ 	if (imx_ssi->ac97_warm_reset)
+ 		imx_ssi->ac97_warm_reset(ac97);
++
++	/* First read sometimes fails, do a dummy read */
++	imx_ssi_ac97_read(ac97, 0);
+ }
+ 
+ struct snd_ac97_bus_ops soc_ac97_ops = {
+-- 
+1.6.5.2
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0029-MX31-Add-USB-platform-devices-and-resources.patch b/recipes/linux/linux-2.6.31/pcm043/0029-MX31-Add-USB-platform-devices-and-resources.patch
new file mode 100644
index 0000000..63eef36
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0029-MX31-Add-USB-platform-devices-and-resources.patch
@@ -0,0 +1,100 @@
+From f9a5d99348fb2c9cacdbbc0334f372ec6e5962de Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 19 Dec 2008 14:32:11 +0100
+Subject: [PATCH 029/101] MX31: Add USB platform devices and resources
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/devices.c |   75 +++++++++++++++++++++++++++++++++++++++++++
+ arch/arm/mach-mx3/devices.h |    3 ++
+ 2 files changed, 78 insertions(+), 0 deletions(-)
+
+Index: linux-2.6.31.6/arch/arm/mach-mx3/devices.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/devices.c	2009-12-08 11:08:01.138690103 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/devices.c	2009-12-08 11:17:36.012748409 +0100
+@@ -395,6 +395,67 @@
+ 	.num_resources	= ARRAY_SIZE(otg_resources),
+ };
+ 
++struct platform_device mxc_otg = {
++	.name = "mxc-ehci",
++	.id = 0,
++	.dev = {
++		.coherent_dma_mask = 0xffffffff,
++		.dma_mask = &otg_dmamask,
++	},
++	.resource = otg_resources,
++	.num_resources = ARRAY_SIZE(otg_resources),
++};
++
++static u64 usbh1_dmamask = ~(u32)0;
++
++static struct resource mxc_usbh1_resources[] = {
++	{
++		.start = OTG_BASE_ADDR + 0x200,
++		.end = OTG_BASE_ADDR + 0x3ff,
++		.flags = IORESOURCE_MEM,
++	}, {
++		.start = MXC_INT_USB1,
++		.end = MXC_INT_USB1,
++		.flags = IORESOURCE_IRQ,
++	},
++};
++
++struct platform_device mxc_usbh1 = {
++	.name = "mxc-ehci",
++	.id = 1,
++	.dev = {
++		.coherent_dma_mask = 0xffffffff,
++		.dma_mask = &usbh1_dmamask,
++	},
++	.resource = mxc_usbh1_resources,
++	.num_resources = ARRAY_SIZE(mxc_usbh1_resources),
++};
++
++static u64 usbh2_dmamask = ~(u32)0;
++
++static struct resource mxc_usbh2_resources[] = {
++	{
++		.start = OTG_BASE_ADDR + 0x400,
++		.end = OTG_BASE_ADDR + 0x5ff,
++		.flags = IORESOURCE_MEM,
++	}, {
++		.start = MXC_INT_USB2,
++		.end = MXC_INT_USB2,
++		.flags = IORESOURCE_IRQ,
++	},
++};
++
++struct platform_device mxc_usbh2 = {
++	.name = "mxc-ehci",
++	.id = 2,
++	.dev = {
++		.coherent_dma_mask = 0xffffffff,
++		.dma_mask = &usbh2_dmamask,
++	},
++	.resource = mxc_usbh2_resources,
++	.num_resources = ARRAY_SIZE(mxc_usbh2_resources),
++};
++
+ #ifdef CONFIG_ARCH_MX35
+ static struct resource mxc_fec_resources[] = {
+ 	{
+Index: linux-2.6.31.6/arch/arm/mach-mx3/devices.h
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/devices.h	2009-12-08 11:08:01.138690103 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/devices.h	2009-12-08 11:16:59.408625374 +0100
+@@ -16,6 +16,9 @@
+ extern struct platform_device mxcsdhc_device0;
+ extern struct platform_device mxcsdhc_device1;
+ extern struct platform_device mxc_otg_udc_device;
++extern struct platform_device mxc_otg;
++extern struct platform_device mxc_usbh1;
++extern struct platform_device mxc_usbh2;
+ extern struct platform_device mxc_rnga_device;
+ extern struct platform_device imx_ssi_device0;
+ extern struct platform_device imx_ssi_device1;
diff --git a/recipes/linux/linux-2.6.31/pcm043/0053-Watchdog-driver-for-IMX-MXC.patch b/recipes/linux/linux-2.6.31/pcm043/0053-Watchdog-driver-for-IMX-MXC.patch
new file mode 100644
index 0000000..2f19c1c
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0053-Watchdog-driver-for-IMX-MXC.patch
@@ -0,0 +1,490 @@
+From 384c73ff72ecf48d438ef54cb297b035c4060347 Mon Sep 17 00:00:00 2001
+From: Darius Augulis <augulis.darius@gmail.com>
+Date: Mon, 9 Mar 2009 17:10:25 +0200
+Subject: [PATCH 053/101] Watchdog driver for IMX/MXC
+
+Driver for watchdog timer on Freesale IMX processors.
+
+Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ drivers/watchdog/Kconfig   |   12 ++
+ drivers/watchdog/Makefile  |    1 +
+ drivers/watchdog/imx-wdt.c |  432 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 445 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/watchdog/imx-wdt.c
+
+Index: linux-2.6.31.6/drivers/watchdog/Kconfig
+===================================================================
+--- linux-2.6.31.6.orig/drivers/watchdog/Kconfig	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/watchdog/Kconfig	2009-12-08 08:59:05.611195459 +0100
+@@ -66,6 +66,18 @@
+ 
+ # ARM Architecture
+ 
++config IMX_WDT
++	tristate "IMX Watchdog"
++	depends on ARCH_MXC
++	help
++	  This is the driver for the hardware watchdog
++	  on the Freescale IMX processors.
++	  If you have one of these processors and wish to have
++	  watchdog support enabled, say Y, otherwise say N.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called imx_wdt.
++
+ config AT91RM9200_WATCHDOG
+ 	tristate "AT91RM9200 watchdog"
+ 	depends on ARCH_AT91RM9200
+Index: linux-2.6.31.6/drivers/watchdog/Makefile
+===================================================================
+--- linux-2.6.31.6.orig/drivers/watchdog/Makefile	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/watchdog/Makefile	2009-12-08 09:00:06.603252242 +0100
+@@ -44,6 +44,7 @@
+ obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
+ obj-$(CONFIG_COH901327_WATCHDOG) += coh901327_wdt.o
+ obj-$(CONFIG_STMP3XXX_WATCHDOG) += stmp3xxx_wdt.o
++obj-$(CONFIG_IMX_WDT) += imx-wdt.o
+ 
+ # AVR32 Architecture
+ obj-$(CONFIG_AT32AP700X_WDT) += at32ap700x_wdt.o
+Index: linux-2.6.31.6/drivers/watchdog/imx-wdt.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/watchdog/imx-wdt.c	2009-12-08 08:59:05.611195459 +0100
+@@ -0,0 +1,432 @@
++/*
++ * Watchdog driver for IMX processors
++ *
++ *  Copyright (C) 2008 Darius Augulis <augulis.darius@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++/*
++ * NOTE: MX1 arch has a bit different Watchdog than MX2 and MX3.
++ * It's not possible to turn off watchdog on MX2 or MX3 since it's enabled.
++ * Timeout changing with IOCTL command is possible only on MX1.
++ * WD timer halting during suspend is implemented in all archs but in
++ * different way.
++ * MX2 and MX3 has 16 bit watchdog registers compared to 32 bit on MX1.
++ *
++ */
++
++/*#define DEBUG*/
++
++#include <linux/init.h>
++#include <linux/kernel.h>
++#include <linux/miscdevice.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/platform_device.h>
++#include <linux/types.h>
++#include <linux/fs.h>
++#include <linux/io.h>
++#include <linux/bitops.h>
++#include <linux/errno.h>
++#include <linux/watchdog.h>
++#include <linux/uaccess.h>
++#include <mach/hardware.h>
++#include <linux/clk.h>
++
++#ifdef CONFIG_ARCH_MX1
++# define WDT_MAX_TIME		63		/* seconds */
++
++# define IMX_WDT_WCR		0x00		/* Control reg */
++# define IMX_WDT_WSR		0x04		/* Service reg */
++# define IMX_WDT_WSTR		0x08		/* Status reg */
++
++# define WCR_WT			(0x7F<<8)
++# define WCR_WDEC		(1<<1)
++# define WCR_WDE		(1<<0)
++# define WCR_WHALT		(1<<15)
++#else
++# define WDT_MAX_TIME		127		/* seconds */
++
++# define IMX_WDT_WCR		0x00		/* Control reg */
++# define IMX_WDT_WSR		0x02		/* Service reg */
++# define IMX_WDT_WSTR		0x04		/* Status reg */
++
++# define WCR_WT			(0xFF<<8)
++# define WCR_WDE		(1<<2)
++# define WCR_WDZST		(1<<0)
++#endif
++
++#define WDT_DEFAULT_TIME	10		/* seconds */
++#define WDT_SEQ1		0x5555
++#define WDT_SEQ2		0xAAAA
++
++static struct platform_device *imx_wdt_dev;
++
++struct imx_wdt_struct {
++	struct resource		*res;
++	struct device		*dev;
++	struct clk		*clk;
++	void __iomem		*base;
++	int			wdt_time;
++	int			nowayout;
++	unsigned long		status;
++};
++
++static unsigned int timeout = WDT_DEFAULT_TIME;
++
++static struct watchdog_info imx_wdt_info = {
++	.identity	= "imx watchdog",
++	.options	= WDIOF_KEEPALIVEPING
++#ifdef CONFIG_ARCH_MX1
++			| WDIOF_SETTIMEOUT
++#endif
++};
++
++/* Disable the watchdog. */
++static inline void imx_wdt_stop(struct imx_wdt_struct *imx_wdt)
++{
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++#ifdef CONFIG_ARCH_MX1
++	__raw_writew(0, imx_wdt->base + IMX_WDT_WCR);
++#else
++	dev_info(imx_wdt->dev, "watchdog is unstoppable on i.MX2/3 !\n");
++#endif
++}
++
++/* Enable and reset the watchdog. */
++static inline void imx_wdt_start(struct imx_wdt_struct *imx_wdt)
++{
++	u16 temp;
++
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	temp = __raw_readw(imx_wdt->base + IMX_WDT_WCR);
++	temp |= imx_wdt->wdt_time << 8;
++	__raw_writew(temp, imx_wdt->base + IMX_WDT_WCR);
++
++#ifdef CONFIG_ARCH_MX1
++# ifndef CONFIG_WATCHDOG_NOWAYOUT
++	temp |= WCR_WDEC;
++	__raw_writew(temp, imx_wdt->base + IMX_WDT_WCR);
++# endif
++	temp |= WCR_WDE;
++	__raw_writew(temp, imx_wdt->base + IMX_WDT_WCR);
++#else
++	temp |= WCR_WDE | WCR_WDZST;
++	__raw_writew(temp, imx_wdt->base + IMX_WDT_WCR);
++#endif
++
++#ifdef CONFIG_ARCH_MX1
++	__raw_writew(WDT_SEQ1, imx_wdt->base + IMX_WDT_WSR);
++	__raw_writew(WDT_SEQ2, imx_wdt->base + IMX_WDT_WSR);
++#endif
++}
++
++/* Service the watchdog */
++static inline void imx_wdt_service(struct imx_wdt_struct *imx_wdt)
++{
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	__raw_writew(WDT_SEQ1, imx_wdt->base + IMX_WDT_WSR);
++	__raw_writew(WDT_SEQ2, imx_wdt->base + IMX_WDT_WSR);
++}
++
++/* Watchdog device is opened, and watchdog starts running. */
++static int imx_wdt_open(struct inode *inode, struct file *file)
++{
++	struct imx_wdt_struct *imx_wdt = platform_get_drvdata(imx_wdt_dev);
++
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	if (test_and_set_bit(0, &imx_wdt->status))
++		return -EBUSY;
++
++	file->private_data = imx_wdt;
++
++	imx_wdt_start(imx_wdt);
++	return nonseekable_open(inode, file);
++}
++
++/* Close the watchdog device. */
++static int imx_wdt_close(struct inode *inode, struct file *file)
++{
++	struct imx_wdt_struct *imx_wdt = file->private_data;
++
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	/* Disable the watchdog if possible */
++	if (!imx_wdt->nowayout)
++		imx_wdt_stop(imx_wdt);
++
++	clear_bit(0, &imx_wdt->status);
++	return 0;
++}
++
++#ifdef CONFIG_ARCH_MX1
++/* Change the watchdog time interval. */
++static int imx_wdt_settimeout(struct imx_wdt_struct *imx_wdt, int new_time)
++{
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	if ((new_time * 2 < 1) || (new_time * 2  > WDT_MAX_TIME))
++		return -EINVAL;
++
++	imx_wdt->wdt_time = new_time * 2;
++	return 0;
++}
++#endif
++
++/* Handle commands from user-space. */
++static int imx_wdt_ioctl(struct inode *inode, struct file *file,
++		unsigned int cmd, unsigned long arg)
++{
++	struct imx_wdt_struct *imx_wdt = file->private_data;
++
++	void __user *argp = (void __user *)arg;
++	int __user *p = argp;
++#ifdef CONFIG_ARCH_MX1
++	int new_value;
++#endif
++
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	switch (cmd) {
++	case WDIOC_KEEPALIVE:
++		imx_wdt_service(imx_wdt);
++		return 0;
++
++	case WDIOC_GETSUPPORT:
++		return copy_to_user(argp, &imx_wdt_info,
++			sizeof(imx_wdt_info)) ? -EFAULT : 0;
++#ifdef CONFIG_ARCH_MX1
++	case WDIOC_SETTIMEOUT:
++		if (get_user(new_value, p))
++			return -EFAULT;
++
++		if (imx_wdt_settimeout(imx_wdt, new_value))
++			return -EINVAL;
++
++		/* Enable new time value */
++		imx_wdt_start(imx_wdt);
++
++		/* Return current value */
++		return put_user(imx_wdt->wdt_time / 2, p);
++#endif
++	case WDIOC_GETTIMEOUT:
++		return put_user(imx_wdt->wdt_time / 2, p);
++
++	default:
++		return -ENOTTY;
++	}
++}
++
++/* Refresh the watchdog whenever device is written to. */
++static ssize_t imx_wdt_write(struct file *file, const char *data,
++						size_t len, loff_t *ppos)
++{
++	struct imx_wdt_struct *imx_wdt = file->private_data;
++
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	imx_wdt_service(imx_wdt);
++	return len;
++}
++
++static const struct file_operations imx_wdt_fops = {
++	.owner		= THIS_MODULE,
++	.llseek		= no_llseek,
++	.ioctl		= imx_wdt_ioctl,
++	.open		= imx_wdt_open,
++	.release	= imx_wdt_close,
++	.write		= imx_wdt_write,
++};
++
++static struct miscdevice imx_wdt_miscdev = {
++	.minor		= WATCHDOG_MINOR,
++	.name		= "watchdog",
++	.fops		= &imx_wdt_fops,
++};
++
++static void imx_wdt_shutdown(struct platform_device *pdev)
++{
++	struct imx_wdt_struct *imx_wdt = platform_get_drvdata(pdev);
++
++	dev_dbg(imx_wdt->dev, "<%s>\n", __func__);
++
++	imx_wdt_stop(imx_wdt);
++}
++
++static int __init imx_wdt_probe(struct platform_device *pdev)
++{
++	int ret;
++	int res_size;
++	struct resource *res;
++	void __iomem *base;
++	struct imx_wdt_struct *imx_wdt;
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "can't get device resources\n");
++		return -ENODEV;
++	}
++
++	res_size = res->end - res->start + 1;
++	if (!request_mem_region(res->start, res_size, res->name)) {
++		dev_err(&pdev->dev, "can't allocate %d bytes at %d address\n",
++			res_size, res->start);
++		return -ENOMEM;
++	}
++
++	base = ioremap(res->start, res_size);
++	if (!base) {
++		dev_err(&pdev->dev, "ioremap failed\n");
++		ret = -EIO;
++		goto fail0;
++	}
++
++	imx_wdt = kzalloc(sizeof(struct imx_wdt_struct), GFP_KERNEL);
++	if (!imx_wdt) {
++		dev_err(&pdev->dev, "can't allocate interface\n");
++		ret = -ENOMEM;
++		goto fail1;
++	}
++
++	imx_wdt->clk = clk_get(&pdev->dev, NULL);
++	if (IS_ERR(imx_wdt->clk)) {
++		dev_err(&pdev->dev, "can't get Watchdog clock\n");
++		ret = PTR_ERR(imx_wdt->clk);
++		goto fail2;
++	}
++	clk_enable(imx_wdt->clk);
++
++	/* Setup imx_wdt driver structure */
++	imx_wdt->dev			= &pdev->dev;
++	imx_wdt->base			= base;
++	imx_wdt->res			= res;
++	imx_wdt->wdt_time		= timeout * 2;
++#ifdef CONFIG_WATCHDOG_NOWAYOUT
++	imx_wdt->nowayout		= 1;
++#else
++	imx_wdt->nowayout		= 0;
++#endif
++
++	/* Set up platform driver data */
++	platform_set_drvdata(pdev, imx_wdt);
++	imx_wdt_dev = pdev;
++
++	if (imx_wdt_miscdev.parent) {
++		ret = -EBUSY;
++		goto fail3;
++	}
++	imx_wdt_miscdev.parent = &pdev->dev;
++
++	ret = misc_register(&imx_wdt_miscdev);
++	if (ret)
++		goto fail3;
++
++	dev_dbg(&pdev->dev, "IMX Watchdog Timer enabled\n");
++	return 0;
++
++fail3:
++	clk_disable(imx_wdt->clk);
++	clk_put(imx_wdt->clk);
++fail2:
++	platform_set_drvdata(pdev, NULL);
++	kfree(imx_wdt);
++fail1:
++	iounmap(base);
++fail0:
++	release_mem_region(res->start, res_size);
++
++	return ret; /* Return error number */
++}
++
++static int __exit imx_wdt_remove(struct platform_device *pdev)
++{
++	struct imx_wdt_struct *imx_wdt = platform_get_drvdata(pdev);
++
++	dev_dbg(&pdev->dev, "IMX Watchdog Timer disabled\n");
++
++	platform_set_drvdata(pdev, NULL);
++	misc_deregister(&imx_wdt_miscdev);
++	imx_wdt_dev = NULL;
++	iounmap(imx_wdt->base);
++	release_mem_region(imx_wdt->res->start,
++		imx_wdt->res->end - imx_wdt->res->start + 1);
++
++	clk_disable(imx_wdt->clk);
++	clk_put(imx_wdt->clk);
++
++	kfree(imx_wdt);
++	return 0;
++}
++
++#ifdef CONFIG_PM
++
++static int imx_wdt_suspend(struct platform_device *pdev, pm_message_t message)
++{
++#ifdef CONFIG_ARCH_MX1
++	struct imx_wdt_struct *imx_wdt = platform_get_drvdata(pdev);
++
++	u32 temp = __raw_readw(imx_wdt->base + IMX_WDT_WCR);
++	__raw_writew(temp | WCR_WHALT, imx_wdt->base + IMX_WDT_WCR);
++#endif
++	return 0;
++}
++
++static int imx_wdt_resume(struct platform_device *pdev)
++{
++#ifdef CONFIG_ARCH_MX1
++	struct imx_wdt_struct *imx_wdt = platform_get_drvdata(pdev);
++	u32 temp;
++
++	if (imx_wdt->status) {
++		temp = __raw_readw(imx_wdt->base + IMX_WDT_WCR) & ~WCR_WHALT;
++		__raw_writew(temp, imx_wdt->base + IMX_WDT_WCR);
++	}
++#endif
++	return 0;
++}
++
++#else
++#define imx_wdt_suspend NULL
++#define imx_wdt_resume	NULL
++#endif
++
++static struct platform_driver imx_wdt_driver = {
++	.probe		= imx_wdt_probe,
++	.remove		= __exit_p(imx_wdt_remove),
++	.shutdown	= imx_wdt_shutdown,
++	.suspend	= imx_wdt_suspend,
++	.resume		= imx_wdt_resume,
++	.driver		= {
++		.name	= "imx-wdt",
++		.owner	= THIS_MODULE,
++	},
++};
++
++static int __init imx_wdt_init(void)
++{
++	return platform_driver_probe(&imx_wdt_driver, imx_wdt_probe);
++}
++
++static void __exit imx_wdt_exit(void)
++{
++	platform_driver_unregister(&imx_wdt_driver);
++}
++module_init(imx_wdt_init);
++module_exit(imx_wdt_exit);
++
++module_param(timeout, uint, 0);
++MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
++
++MODULE_AUTHOR("Darius Augulis");
++MODULE_DESCRIPTION("Watchdog driver for IMX");
++MODULE_LICENSE("GPL");
++MODULE_ALIAS_MISCDEV(WATCHDOG_MINOR);
++MODULE_ALIAS("platform:imx-wdt");
diff --git a/recipes/linux/linux-2.6.31/pcm043/0066-HACK-increase-default-tx_queue_len-to-10000.patch b/recipes/linux/linux-2.6.31/pcm043/0066-HACK-increase-default-tx_queue_len-to-10000.patch
new file mode 100644
index 0000000..d0b9123
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0066-HACK-increase-default-tx_queue_len-to-10000.patch
@@ -0,0 +1,36 @@
+From c15a83d5d49ca36d827fd35faee8d9c0048e8053 Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Fri, 19 Dec 2008 14:32:42 +0100
+Subject: [PATCH 066/101] HACK: increase default tx_queue_len to 10000
+
+HACK HACK HACK
+
+Without this patch sending CAN packages faster then they could be
+send out on the wire results in -ENOBUF. This patch increases the
+default tx_queue_len to 10000 so that in this case the sender blocks.
+Thus the CAN socket just behaves like congested a TCP/IP socket.
+
+HACK HACK HACK
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+
+ drivers/net/can/dev.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+Index: linux-2.6.31.6/drivers/net/can/dev.c
+===================================================================
+--- linux-2.6.31.6.orig/drivers/net/can/dev.c	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/net/can/dev.c	2009-12-08 09:12:45.558976163 +0100
+@@ -420,7 +420,7 @@
+ 	dev->mtu = sizeof(struct can_frame);
+ 	dev->hard_header_len = 0;
+ 	dev->addr_len = 0;
+-	dev->tx_queue_len = 10;
++	dev->tx_queue_len = 10000;
+ 
+ 	/* New-style flags. */
+ 	dev->flags = IFF_NOARP;
diff --git a/recipes/linux/linux-2.6.31/pcm043/0084-i.MX35-clock-support-Add-USB-clocks.patch b/recipes/linux/linux-2.6.31/pcm043/0084-i.MX35-clock-support-Add-USB-clocks.patch
new file mode 100644
index 0000000..da33524
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0084-i.MX35-clock-support-Add-USB-clocks.patch
@@ -0,0 +1,30 @@
+From f46cfd74faf9b1644e9eefc1e7fa5541f17d1d32 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Tue, 17 Mar 2009 15:43:54 +0100
+Subject: [PATCH 084/101] i.MX35 clock support: Add USB clocks
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/clock-imx35.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+Index: linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/clock-imx35.c	2009-12-07 15:20:31.963944848 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c	2009-12-08 09:39:04.798706951 +0100
+@@ -425,8 +425,10 @@
+ 	_REGISTER_CLOCK("imx-uart.0", NULL, uart1_clk)
+ 	_REGISTER_CLOCK("imx-uart.1", NULL, uart2_clk)
+ 	_REGISTER_CLOCK("imx-uart.2", NULL, uart3_clk)
+-	_REGISTER_CLOCK(NULL, "usbotg", usbotg_clk)
+-	_REGISTER_CLOCK("mxc_wdt.0", NULL, wdog_clk)
++	_REGISTER_CLOCK("mxc-ehci.0", NULL, usbotg_clk)
++	_REGISTER_CLOCK("mxc-ehci.1", NULL, usbotg_clk)
++	_REGISTER_CLOCK("mxc-ehci.2", NULL, usbotg_clk)
++	_REGISTER_CLOCK("imx-wdt.0", NULL, wdog_clk)
+ 	_REGISTER_CLOCK(NULL, "max", max_clk)
+ 	_REGISTER_CLOCK(NULL, "audmux", audmux_clk)
+ 	_REGISTER_CLOCK(NULL, "csi", csi_clk)
diff --git a/recipes/linux/linux-2.6.31/pcm043/0088-ehci-mxc-Fix-clocks.patch b/recipes/linux/linux-2.6.31/pcm043/0088-ehci-mxc-Fix-clocks.patch
new file mode 100644
index 0000000..25143cb
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0088-ehci-mxc-Fix-clocks.patch
@@ -0,0 +1,33 @@
+From f5d7944a7257ffcf2aa7ee0736962e9b564837fd Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Wed, 8 Apr 2009 16:39:47 +0200
+Subject: [PATCH 088/101] ehci mxc: Fix clocks
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/clock.c |    9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/clock.c b/arch/arm/mach-mx3/clock.c
+index aee34ed..a08f2be 100644
+--- a/arch/arm/mach-mx3/clock.c
++++ b/arch/arm/mach-mx3/clock.c
+@@ -532,9 +532,12 @@ static struct clk_lookup lookups[] __initdata = {
+ 	_REGISTER_CLOCK("mx3_sdc_fb", NULL, ipu_clk)
+ 	_REGISTER_CLOCK(NULL, "kpp", kpp_clk)
+ 	/* FIXME: mxc-ehci now misses the secondary clock */
+-	_REGISTER_CLOCK("mxc-ehci.0", NULL, usb_clk1)
+-	_REGISTER_CLOCK("mxc-ehci.1", NULL, usb_clk1)
+-	_REGISTER_CLOCK("mxc-ehci.2", NULL, usb_clk1)
++	_REGISTER_CLOCK("mxc-ehci.0", "usb", usb_clk1)
++	_REGISTER_CLOCK("mxc-ehci.0", "usb_ahb", usb_clk2)
++	_REGISTER_CLOCK("mxc-ehci.1", "usb", usb_clk1)
++	_REGISTER_CLOCK("mxc-ehci.1", "usb_ahb", usb_clk2)
++	_REGISTER_CLOCK("mxc-ehci.2", "usb", usb_clk1)
++	_REGISTER_CLOCK("mxc-ehci.2", "usb_ahb", usb_clk2)
+ 	_REGISTER_CLOCK("fsl-usb2-udc", "usb", usb_clk1)
+ 	_REGISTER_CLOCK("fsl-usb2-udc", "usb_ahb", usb_clk2)
+ 	_REGISTER_CLOCK("mx3-camera.0", NULL, csi_clk)
+-- 
+1.6.2.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0090-mx3x-Fixup-USB-base-addresses.patch b/recipes/linux/linux-2.6.31/pcm043/0090-mx3x-Fixup-USB-base-addresses.patch
new file mode 100644
index 0000000..61fe36c
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0090-mx3x-Fixup-USB-base-addresses.patch
@@ -0,0 +1,93 @@
+From c5ff90856d241112b588e091167e6fc69020d535 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 17 Apr 2009 16:52:25 +0200
+Subject: [PATCH 090/101] mx3x: Fixup USB base addresses
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to 2.6.31.6, but without pcm037.c changes
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/devices.c           |   20 ++++++++++++++------
+ arch/arm/mach-mx3/pcm037.c            |   20 ++++++++++----------
+ arch/arm/plat-mxc/include/mach/mx31.h |    2 +-
+ arch/arm/plat-mxc/include/mach/mx35.h |    1 +
+ 4 files changed, 26 insertions(+), 17 deletions(-)
+
+Index: linux-2.6.31.6/arch/arm/mach-mx3/devices.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/devices.c	2009-12-10 11:33:07.024614628 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/devices.c	2009-12-10 11:33:10.356276214 +0100
+@@ -371,8 +371,8 @@
+ 
+ static struct resource otg_resources[] = {
+ 	{
+-		.start	= OTG_BASE_ADDR,
+-		.end	= OTG_BASE_ADDR + 0x1ff,
++		.start = MX31_OTG_BASE_ADDR,
++		.end = MX31_OTG_BASE_ADDR + 0x1ff,
+ 		.flags	= IORESOURCE_MEM,
+ 	}, {
+ 		.start	= MXC_INT_USB3,
+@@ -410,8 +410,8 @@
+ 
+ static struct resource mxc_usbh1_resources[] = {
+ 	{
+-		.start = OTG_BASE_ADDR + 0x200,
+-		.end = OTG_BASE_ADDR + 0x3ff,
++		.start = MX31_OTG_BASE_ADDR + 0x200,
++		.end = MX31_OTG_BASE_ADDR + 0x3ff,
+ 		.flags = IORESOURCE_MEM,
+ 	}, {
+ 		.start = MXC_INT_USB1,
+@@ -435,8 +435,8 @@
+ 
+ static struct resource mxc_usbh2_resources[] = {
+ 	{
+-		.start = OTG_BASE_ADDR + 0x400,
+-		.end = OTG_BASE_ADDR + 0x5ff,
++		.start = MX31_OTG_BASE_ADDR + 0x400,
++		.end = MX31_OTG_BASE_ADDR + 0x5ff,
+ 		.flags = IORESOURCE_MEM,
+ 	}, {
+ 		.start = MXC_INT_USB2,
+@@ -586,6 +586,14 @@
+ 	if (cpu_is_mx35()) {
+ 		mxc_nand_resources[0].start = MX35_NFC_BASE_ADDR;
+ 		mxc_nand_resources[0].end = MX35_NFC_BASE_ADDR + 0xfff;
++		otg_resources[0].start = MX35_OTG_BASE_ADDR;
++		otg_resources[0].end = MX35_OTG_BASE_ADDR + 0x1ff;
++		otg_resources[1].start = MXC_INT_USBOTG;
++		otg_resources[1].end = MXC_INT_USBOTG;
++		mxc_usbh1_resources[0].start = MX35_OTG_BASE_ADDR + 0x400;
++		mxc_usbh1_resources[0].end = MX35_OTG_BASE_ADDR + 0x5ff;
++		mxc_usbh1_resources[1].start = MXC_INT_USBHS;
++		mxc_usbh1_resources[1].end = MXC_INT_USBHS;
+ 		imx_ssi_resources0[1].start = MX35_INT_SSI1;
+ 		imx_ssi_resources0[1].end = MX35_INT_SSI1;
+ 		imx_ssi_resources1[1].start = MX35_INT_SSI2;
+Index: linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx31.h
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/plat-mxc/include/mach/mx31.h	2009-12-10 11:33:07.004682613 +0100
++++ linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx31.h	2009-12-10 11:33:10.356276214 +0100
+@@ -4,7 +4,7 @@
+ #define MX31_IRAM_BASE_ADDR		0x1FFC0000	/* internal ram */
+ #define MX31_IRAM_SIZE			SZ_16K
+ 
+-#define OTG_BASE_ADDR		(AIPS1_BASE_ADDR + 0x00088000)
++#define MX31_OTG_BASE_ADDR	(AIPS1_BASE_ADDR + 0x00088000)
+ #define ATA_BASE_ADDR		(AIPS1_BASE_ADDR + 0x0008C000)
+ #define UART4_BASE_ADDR 	(AIPS1_BASE_ADDR + 0x000B0000)
+ #define UART5_BASE_ADDR 	(AIPS1_BASE_ADDR + 0x000B4000)
+Index: linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx35.h
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/plat-mxc/include/mach/mx35.h	2009-12-10 11:33:07.014617995 +0100
++++ linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx35.h	2009-12-10 11:33:10.356276214 +0100
+@@ -5,6 +5,7 @@
+ #define MX35_IRAM_SIZE		SZ_128K
+ 
+ #define MXC_FEC_BASE_ADDR	0x50038000
++#define MX35_OTG_BASE_ADDR	0x53ff4000
+ #define MX35_NFC_BASE_ADDR	0xBB000000
+ 
+ /*
diff --git a/recipes/linux/linux-2.6.31/pcm043/0091-mx31-clock-remove-obsolete-FIXME-comment.patch b/recipes/linux/linux-2.6.31/pcm043/0091-mx31-clock-remove-obsolete-FIXME-comment.patch
new file mode 100644
index 0000000..40c9c63
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0091-mx31-clock-remove-obsolete-FIXME-comment.patch
@@ -0,0 +1,25 @@
+From 4ed32022da7583d8cf260809f41fb1bfcfb033a8 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 17 Apr 2009 16:52:55 +0200
+Subject: [PATCH 091/101] mx31 clock: remove obsolete FIXME comment
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ arch/arm/mach-mx3/clock.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-mx3/clock.c b/arch/arm/mach-mx3/clock.c
+index a08f2be..8ec45f6 100644
+--- a/arch/arm/mach-mx3/clock.c
++++ b/arch/arm/mach-mx3/clock.c
+@@ -531,7 +531,6 @@ static struct clk_lookup lookups[] __initdata = {
+ 	_REGISTER_CLOCK("ipu-core", NULL, ipu_clk)
+ 	_REGISTER_CLOCK("mx3_sdc_fb", NULL, ipu_clk)
+ 	_REGISTER_CLOCK(NULL, "kpp", kpp_clk)
+-	/* FIXME: mxc-ehci now misses the secondary clock */
+ 	_REGISTER_CLOCK("mxc-ehci.0", "usb", usb_clk1)
+ 	_REGISTER_CLOCK("mxc-ehci.0", "usb_ahb", usb_clk2)
+ 	_REGISTER_CLOCK("mxc-ehci.1", "usb", usb_clk1)
+-- 
+1.6.2.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/0092-mx35-clock-give-ehci-clocks-names.patch b/recipes/linux/linux-2.6.31/pcm043/0092-mx35-clock-give-ehci-clocks-names.patch
new file mode 100644
index 0000000..91b27f9
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0092-mx35-clock-give-ehci-clocks-names.patch
@@ -0,0 +1,30 @@
+From 655b9879b22d1e2776c8df0a4fa77801a1b7fd97 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 17 Apr 2009 16:53:27 +0200
+Subject: [PATCH 092/101] mx35 clock: give ehci clocks names
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/clock-imx35.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+Index: linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/clock-imx35.c	2009-12-08 09:39:04.798706951 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c	2009-12-08 09:49:47.949859691 +0100
+@@ -425,9 +425,9 @@
+ 	_REGISTER_CLOCK("imx-uart.0", NULL, uart1_clk)
+ 	_REGISTER_CLOCK("imx-uart.1", NULL, uart2_clk)
+ 	_REGISTER_CLOCK("imx-uart.2", NULL, uart3_clk)
+-	_REGISTER_CLOCK("mxc-ehci.0", NULL, usbotg_clk)
+-	_REGISTER_CLOCK("mxc-ehci.1", NULL, usbotg_clk)
+-	_REGISTER_CLOCK("mxc-ehci.2", NULL, usbotg_clk)
++	_REGISTER_CLOCK("mxc-ehci.0", "usb", usbotg_clk)
++	_REGISTER_CLOCK("mxc-ehci.1", "usb", usbotg_clk)
++	_REGISTER_CLOCK("mxc-ehci.2", "usb", usbotg_clk)
+ 	_REGISTER_CLOCK("imx-wdt.0", NULL, wdog_clk)
+ 	_REGISTER_CLOCK(NULL, "max", max_clk)
+ 	_REGISTER_CLOCK(NULL, "audmux", audmux_clk)
diff --git a/recipes/linux/linux-2.6.31/pcm043/0096-i.MX35-implement-get_rate-for-usb-otg-clock.patch b/recipes/linux/linux-2.6.31/pcm043/0096-i.MX35-implement-get_rate-for-usb-otg-clock.patch
new file mode 100644
index 0000000..0190641
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0096-i.MX35-implement-get_rate-for-usb-otg-clock.patch
@@ -0,0 +1,54 @@
+From d7463937b967203cee097b96593ef46cb9ea23a7 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Tue, 21 Apr 2009 14:50:53 +0200
+Subject: [PATCH 096/101] i.MX35: implement get_rate for usb otg clock
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+rebased to  2.6.31.6
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+ arch/arm/mach-mx3/clock-imx35.c |   16 +++++++++++++++-
+ 1 files changed, 15 insertions(+), 1 deletions(-)
+
+Index: linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/clock-imx35.c	2009-12-08 09:49:47.949859691 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c	2009-12-08 09:56:24.498623255 +0100
+@@ -273,6 +273,19 @@
+ 	return rate / get_3_3_div((pdr2 >> 16) & 0x3f);
+ }
+ 
++static unsigned long get_rate_otg(struct clk *clk)
++{
++	unsigned long pdr4 = __raw_readl(CCM_BASE + CCM_PDR4);
++	unsigned long rate;
++
++	if (pdr4 & (1 << 9))
++		rate = get_rate_arm();
++	else
++		rate = get_rate_ppll();
++
++	return rate / get_3_3_div((pdr4 >> 22) & 0x3f);
++}
++
+ static unsigned long get_rate_ipg_per(struct clk *clk)
+ {
+ 	unsigned long pdr0 = __raw_readl(CCM_BASE + CCM_PDR0);
+@@ -365,7 +378,7 @@
+ DEFINE_CLOCK(uart1_clk,  0, CCM_CGR2, 16, get_rate_uart, NULL);
+ DEFINE_CLOCK(uart2_clk,  1, CCM_CGR2, 18, get_rate_uart, NULL);
+ DEFINE_CLOCK(uart3_clk,  2, CCM_CGR2, 20, get_rate_uart, NULL);
+-DEFINE_CLOCK(usbotg_clk, 0, CCM_CGR2, 22, NULL, NULL);
++DEFINE_CLOCK(usbotg_clk, 0, CCM_CGR2, 22, get_rate_otg, NULL);
+ DEFINE_CLOCK(wdog_clk,   0, CCM_CGR2, 24, NULL, NULL);
+ DEFINE_CLOCK(max_clk,    0, CCM_CGR2, 26, NULL, NULL);
+ DEFINE_CLOCK(audmux_clk, 0, CCM_CGR2, 30, NULL, NULL);
+@@ -428,6 +441,7 @@
+ 	_REGISTER_CLOCK("mxc-ehci.0", "usb", usbotg_clk)
+ 	_REGISTER_CLOCK("mxc-ehci.1", "usb", usbotg_clk)
+ 	_REGISTER_CLOCK("mxc-ehci.2", "usb", usbotg_clk)
++	_REGISTER_CLOCK("fsl-usb2-udc", "usb", usbotg_clk)
+ 	_REGISTER_CLOCK("imx-wdt.0", NULL, wdog_clk)
+ 	_REGISTER_CLOCK(NULL, "max", max_clk)
+ 	_REGISTER_CLOCK(NULL, "audmux", audmux_clk)
diff --git a/recipes/linux/linux-2.6.31/pcm043/0097-fsl-udc-driver-add-mx35-support.patch b/recipes/linux/linux-2.6.31/pcm043/0097-fsl-udc-driver-add-mx35-support.patch
new file mode 100644
index 0000000..3467895
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/0097-fsl-udc-driver-add-mx35-support.patch
@@ -0,0 +1,83 @@
+From 56e08cdd4fde350a1e43c69b084fa618df1e2af7 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Tue, 21 Apr 2009 14:52:45 +0200
+Subject: [PATCH 097/101] fsl udc driver: add mx35 support
+
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+---
+ drivers/usb/gadget/fsl_mx3_udc.c |   31 ++++++++++++++++++++-----------
+ 1 files changed, 20 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/usb/gadget/fsl_mx3_udc.c b/drivers/usb/gadget/fsl_mx3_udc.c
+index 4bc2bf3..20a802e 100644
+--- a/drivers/usb/gadget/fsl_mx3_udc.c
++++ b/drivers/usb/gadget/fsl_mx3_udc.c
+@@ -17,6 +17,8 @@
+ #include <linux/fsl_devices.h>
+ #include <linux/platform_device.h>
+ 
++#include <mach/hardware.h>
++
+ static struct clk *mxc_ahb_clk;
+ static struct clk *mxc_usb_clk;
+ 
+@@ -28,14 +30,16 @@ int fsl_udc_clk_init(struct platform_device *pdev)
+ 
+ 	pdata = pdev->dev.platform_data;
+ 
+-	mxc_ahb_clk = clk_get(&pdev->dev, "usb_ahb");
+-	if (IS_ERR(mxc_ahb_clk))
+-		return PTR_ERR(mxc_ahb_clk);
++	if (!cpu_is_mx35()) {
++		mxc_ahb_clk = clk_get(&pdev->dev, "usb_ahb");
++		if (IS_ERR(mxc_ahb_clk))
++			return PTR_ERR(mxc_ahb_clk);
+ 
+-	ret = clk_enable(mxc_ahb_clk);
+-	if (ret < 0) {
+-		dev_err(&pdev->dev, "clk_enable(\"usb_ahb\") failed\n");
+-		goto eenahb;
++		ret = clk_enable(mxc_ahb_clk);
++		if (ret < 0) {
++			dev_err(&pdev->dev, "clk_enable(\"usb_ahb\") failed\n");
++			goto eenahb;
++		}
+ 	}
+ 
+ 	/* make sure USB_CLK is running at 60 MHz +/- 1000 Hz */
+@@ -50,6 +54,7 @@ int fsl_udc_clk_init(struct platform_device *pdev)
+ 	if (pdata->phy_mode != FSL_USB2_PHY_ULPI &&
+ 	    (freq < 59999000 || freq > 60001000)) {
+ 		dev_err(&pdev->dev, "USB_CLK=%lu, should be 60MHz\n", freq);
++		ret = -EINVAL;
+ 		goto eclkrate;
+ 	}
+ 
+@@ -66,9 +71,11 @@ eclkrate:
+ 	clk_put(mxc_usb_clk);
+ 	mxc_usb_clk = NULL;
+ egusb:
+-	clk_disable(mxc_ahb_clk);
++	if (!cpu_is_mx35())
++		clk_disable(mxc_ahb_clk);
+ eenahb:
+-	clk_put(mxc_ahb_clk);
++	if (!cpu_is_mx35())
++		clk_put(mxc_ahb_clk);
+ 	return ret;
+ }
+ 
+@@ -90,6 +97,8 @@ void fsl_udc_clk_release(void)
+ 		clk_disable(mxc_usb_clk);
+ 		clk_put(mxc_usb_clk);
+ 	}
+-	clk_disable(mxc_ahb_clk);
+-	clk_put(mxc_ahb_clk);
++	if (!cpu_is_mx35()) {
++		clk_disable(mxc_ahb_clk);
++		clk_put(mxc_ahb_clk);
++	}
+ }
+-- 
+1.6.2.1
+
diff --git a/recipes/linux/linux-2.6.31/pcm043/Update-PCM043-board-support.patch b/recipes/linux/linux-2.6.31/pcm043/Update-PCM043-board-support.patch
new file mode 100644
index 0000000..117611e
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/Update-PCM043-board-support.patch
@@ -0,0 +1,134 @@
+Based on 
+From 0d4941a59648e16d99624cf16812d5ae83986187 Mon Sep 17 00:00:00 2001
+From: Sascha Hauer <s.hauer@pengutronix.de>
+Date: Fri, 6 Feb 2009 15:42:26 +0100
+Subject: [PATCH 026/101] [ARM] MX35: Add PCM043 board support
+
+add USB support
+
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+Index: linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/pcm043.c	2009-12-10 11:59:35.364772725 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c	2009-12-10 13:45:21.484650731 +0100
+@@ -28,6 +28,7 @@
+ #include <linux/interrupt.h>
+ #include <linux/i2c.h>
+ #include <linux/i2c/at24.h>
++#include <linux/fsl_devices.h>
+ #include <linux/delay.h>
+ 
+ #include <asm/mach-types.h>
+@@ -44,6 +45,7 @@
+ #include <mach/iomux-mx35.h>
+ #include <mach/ipu.h>
+ #include <mach/mx3fb.h>
++#include <mach/mxc_ehci.h>
+ #include <mach/audmux.h>
+ #include <mach/ssi.h>
+ 
+@@ -207,6 +209,9 @@
+ 	MX35_PAD_D3_REV__IPU_DISPB_D3_REV,
+ 	MX35_PAD_D3_CLS__IPU_DISPB_D3_CLS,
+ 	MX35_PAD_D3_SPL__IPU_DISPB_D3_SPL,
++	/* USB host */
++	MX35_PAD_I2C2_CLK__USB_TOP_USBH2_PWR,
++	MX35_PAD_I2C2_DAT__USB_TOP_USBH2_OC,
+ 	/* SSI */
+ 	MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS,
+ 	MX35_PAD_STXD4__AUDMUX_AUD4_TXD,
+@@ -214,6 +219,66 @@
+ 	MX35_PAD_SCK4__AUDMUX_AUD4_TXC,
+ };
+ 
++static int pcm043_usbh1_init(struct platform_device *pdev)
++{
++	unsigned int tmp;
++
++	tmp = readl(IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x600);
++	tmp &= ~((3 << 21) | (1 << 2) | (1 << 16));
++	tmp |= (1 << 4) | (2 << 21) | (1 << 19) | (1 << 12) | (1 << 6) | (1 << 5);
++	writel(tmp, IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x600);
++
++	tmp = readl(IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x584);
++	tmp |= (3 << 30);
++	writel(tmp, IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x584);
++
++	return 0;
++}
++
++static struct mxc_usbh_platform_data usbh1_pdata = {
++	.init = pcm043_usbh1_init,
++};
++
++static int pcm043_otg_init(struct platform_device *pdev)
++{
++	unsigned int tmp;
++
++	tmp = readl(IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x600);
++	tmp &= ~(3 << 29);
++	tmp |= (2 << 29);
++	writel(tmp, IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x600);
++
++	tmp = readl(IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x184);
++	tmp &= ~(3 << 30);
++	writel(tmp, IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x184);
++
++	return 0;
++}
++
++static struct mxc_usbh_platform_data otg_pdata = {
++	.init = pcm043_otg_init,
++};
++
++static struct fsl_usb2_platform_data usb_data = {
++	.operating_mode	= FSL_USB2_DR_DEVICE,
++	.phy_mode	= FSL_USB2_PHY_UTMI,
++};
++
++static int otg_mode_host;
++
++static int __init pcm043_otg_mode(char *options)
++{
++	if (!strcmp(options, "host"))
++		otg_mode_host = 1;
++	else if (!strcmp(options, "device"))
++		otg_mode_host = 0;
++	else
++		pr_info("pcm043_otg_mode neither \"host\" nor \"device\". "
++			"Defaulting to device\n");
++	return 0;
++}
++__setup("pcm043_otg_mode=", pcm043_otg_mode);
++
+ #define AC97_GPIO_TXFS	(1 * 32 + 31)
+ #define AC97_GPIO_TXD	(1 * 32 + 28)
+ #define AC97_GPIO_RESET	(1 * 32 + 0)
+@@ -299,6 +364,8 @@
+  */
+ static void __init mxc_board_init(void)
+ {
++	unsigned int tmp;
++
+ 	mxc_iomux_v3_setup_multiple_pads(pcm043_pads, ARRAY_SIZE(pcm043_pads));
+ 
+ 	mxc_audmux_v2_configure_port(3,
+@@ -329,6 +396,17 @@
+ 
+ 	mxc_register_device(&mx3_ipu, &mx3_ipu_data);
+ 	mxc_register_device(&mx3_fb, &mx3fb_pdata);
++
++	tmp = readl(IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x600);
++	tmp &= ~(3 << 29);
++	tmp |= (2 << 29);
++	writel(tmp, IO_ADDRESS(MX35_OTG_BASE_ADDR) + 0x600);
++
++	mxc_register_device(&mxc_usbh1, &usbh1_pdata);
++	if (otg_mode_host)
++		mxc_register_device(&mxc_otg, &otg_pdata);
++	else
++		mxc_register_device(&mxc_otg_udc_device, &usb_data);
+ }
+ 
+ static void __init pcm043_timer_init(void)
diff --git a/recipes/linux/linux-2.6.31/pcm043/add-led-gpio.patch b/recipes/linux/linux-2.6.31/pcm043/add-led-gpio.patch
new file mode 100644
index 0000000..cbd096b
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/add-led-gpio.patch
@@ -0,0 +1,17 @@
+Add support for the LED on baseboard
+
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+Index: linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/pcm043.c	2009-12-11 13:56:03.526475695 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c	2009-12-11 13:58:49.894701069 +0100
+@@ -250,6 +250,8 @@
+ 	MX35_PAD_SCK4__AUDMUX_AUD4_TXC,
+   	/* 1-Wire*/
+ 	MX35_PAD_GPIO1_0__OWIRE_LINE,
++	/* GPIO */
++	MX35_PAD_ATA_CS0__GPIO2_6,
+ 	/* CAN */
+         MX35_PAD_SD2_DATA2__CAN1_RXCAN,
+         MX35_PAD_SD2_DATA3__CAN1_TXCAN,
diff --git a/recipes/linux/linux-2.6.31/pcm043/add_mmc.diff b/recipes/linux/linux-2.6.31/pcm043/add_mmc.diff
new file mode 100644
index 0000000..fb3a3c7
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/add_mmc.diff
@@ -0,0 +1,1396 @@
+From: Wolfram Sang <w.sang@pengutronix.de>
+Subject: add preliminary MMC support to MX35
+
+WIP!
+
+This is the backported SDHCI-driver from top of tree with the modifications needed
+to make the esdhc-version from FSL work with it. There are still some issues left,
+especially stylewise, this is more a proof-of-concept for the approach.
+
+WIP!
+
+Not suitable for upstream (yet).
+
+Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
+---
+ arch/arm/mach-mx3/pcm043.c          |   30 ++++
+ drivers/mmc/host/Kconfig            |  137 +++++++++++++++++++--
+ drivers/mmc/host/Makefile           |   14 +-
+ drivers/mmc/host/sdhci-esdhc.c      |  215 +++++++++++++++++++++++++++++++++
+ drivers/mmc/host/sdhci-of-core.c    |  231 ++++++++++++++++++++++++++++++++++++
+ drivers/mmc/host/sdhci-of-hlwd.c    |   65 ++++++++++
+ drivers/mmc/host/sdhci-of.h         |   37 +++++
+ drivers/mmc/host/sdhci-pltfm-core.c |  187 +++++++++++++++++++++++++++++
+ drivers/mmc/host/sdhci.c            |   56 ++++----
+ drivers/mmc/host/sdhci.h            |   51 ++++---
+ 10 files changed, 964 insertions(+), 59 deletions(-)
+
+Index: drivers/mmc/host/Kconfig
+===================================================================
+--- drivers/mmc/host/Kconfig.orig
++++ drivers/mmc/host/Kconfig
+@@ -44,6 +44,19 @@ config MMC_SDHCI_IO_ACCESSORS
+ 	  This is silent Kconfig symbol that is selected by the drivers that
+ 	  need to overwrite SDHCI IO memory accessors.
+ 
++config MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
++	bool
++	select MMC_SDHCI_IO_ACCESSORS
++	help
++	  This option is selected by drivers running on big endian hosts
++	  and performing I/O to a SDHCI controller through a bus that
++	  implements a hardware byte swapper using a 32-bit datum.
++	  This endian mapping mode is called "data invariance" and
++	  has the effect of scrambling the addresses and formats of data
++	  accessed in sizes other than the datum size.
++
++	  This is the case for the Freescale eSDHC and Nintendo Wii SDHCI.
++
+ config MMC_SDHCI_PCI
+ 	tristate "SDHCI support on PCI bus"
+ 	depends on MMC_SDHCI && PCI
+@@ -72,14 +85,33 @@ config MMC_RICOH_MMC
+ 
+ 	  If unsure, say Y.
+ 
++config MMC_SDHCI_ESDHC
++	bool "SDHCI support for the Freescale eSDHC controller"
++	depends on MMC_SDHCI_OF || MMC_SDHCI_PLTFM
++	select MMC_SDHCI_IO_ACCESSORS
++	select MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER if MMC_SDHCI_OF
++	help
++	  This selects the Freescale eSDHC controller support.
++
++	  If unsure, say N.
++
+ config MMC_SDHCI_OF
+ 	tristate "SDHCI support on OpenFirmware platforms"
+ 	depends on MMC_SDHCI && PPC_OF
+-	select MMC_SDHCI_IO_ACCESSORS
+ 	help
+ 	  This selects the OF support for Secure Digital Host Controller
+-	  Interfaces. So far, only the Freescale eSDHC controller is known
+-	  to exist on OF platforms.
++	  Interfaces.
++
++	  If unsure, say N.
++
++config MMC_SDHCI_OF_HLWD
++	bool "SDHCI OF support for the Nintendo Wii SDHCI controllers"
++	depends on MMC_SDHCI_OF
++	select MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
++	help
++	  This selects the Secure Digital Host Controller Interface (SDHCI)
++	  found in the "Hollywood" chipset of the Nintendo Wii video game
++	  console.
+ 
+ 	  If unsure, say N.
+ 
+@@ -132,11 +164,11 @@ config MMC_OMAP
+ 
+ config MMC_OMAP_HS
+ 	tristate "TI OMAP High Speed Multimedia Card Interface support"
+-	depends on ARCH_OMAP2430 || ARCH_OMAP3
++	depends on ARCH_OMAP2430 || ARCH_OMAP3 || ARCH_OMAP4
+ 	help
+ 	  This selects the TI OMAP High Speed Multimedia card Interface.
+-	  If you have an OMAP2430 or OMAP3 board with a Multimedia Card slot,
+-	  say Y or M here.
++	  If you have an OMAP2430 or OMAP3 board or OMAP4 board with a
++	  Multimedia Card slot, say Y or M here.
+ 
+ 	  If unsure, say N.
+ 
+@@ -160,6 +192,12 @@ config MMC_AU1X
+ 
+ 	  If unsure, say N.
+ 
++choice
++	prompt "Atmel SD/MMC Driver"
++	default MMC_ATMELMCI if AVR32
++	help
++	  Choose which driver to use for the Atmel MCI Silicon
++
+ config MMC_AT91
+ 	tristate "AT91 SD/MMC Card Interface support"
+ 	depends on ARCH_AT91
+@@ -170,17 +208,19 @@ config MMC_AT91
+ 
+ config MMC_ATMELMCI
+ 	tristate "Atmel Multimedia Card Interface support"
+-	depends on AVR32
++	depends on AVR32 || ARCH_AT91
+ 	help
+ 	  This selects the Atmel Multimedia Card Interface driver. If
+-	  you have an AT32 (AVR32) platform with a Multimedia Card
+-	  slot, say Y or M here.
++	  you have an AT32 (AVR32) or AT91 platform with a Multimedia
++	  Card slot, say Y or M here.
+ 
+ 	  If unsure, say N.
+ 
++endchoice
++
+ config MMC_ATMELMCI_DMA
+ 	bool "Atmel MCI DMA support (EXPERIMENTAL)"
+-	depends on MMC_ATMELMCI && DMA_ENGINE && EXPERIMENTAL
++	depends on MMC_ATMELMCI && AVR32 && DMA_ENGINE && EXPERIMENTAL
+ 	help
+ 	  Say Y here to have the Atmel MCI driver use a DMA engine to
+ 	  do data transfers and thus increase the throughput and
+@@ -199,6 +239,13 @@ config MMC_IMX
+ 
+ 	  If unsure, say N.
+ 
++config MMC_MSM7X00A
++	tristate "Qualcomm MSM 7X00A SDCC Controller Support"
++	depends on MMC && ARCH_MSM
++	help
++	  This provides support for the SD/MMC cell found in the
++          MSM 7X00A controllers from Qualcomm.
++
+ config MMC_MXC
+ 	tristate "Freescale i.MX2/3 Multimedia Card Interface support"
+ 	depends on ARCH_MXC
+@@ -236,6 +283,14 @@ config MMC_MVSDIO
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called mvsdio.
+ 
++config MMC_DAVINCI
++        tristate "TI DAVINCI Multimedia Card Interface support"
++        depends on ARCH_DAVINCI
++        help
++          This selects the TI DAVINCI Multimedia card Interface.
++          If you have an DAVINCI board with a Multimedia Card slot,
++          say Y or M here.  If unsure, say N.
++
+ config MMC_SPI
+ 	tristate "MMC/SD/SDIO over SPI"
+ 	depends on SPI_MASTER && !HIGHMEM && HAS_DMA
+@@ -261,6 +316,47 @@ config MMC_S3C
+ 
+ 	  If unsure, say N.
+ 
++config MMC_S3C_HW_SDIO_IRQ
++       bool "Hardware support for SDIO IRQ"
++       depends on MMC_S3C
++       help
++         Enable the hardware support for SDIO interrupts instead of using
++	 the generic polling code.
++
++choice
++	prompt "Samsung S3C SD/MMC transfer code"
++	depends on MMC_S3C
++
++config MMC_S3C_PIO
++	bool "Use PIO transfers only"
++	help
++	  Use PIO to transfer data between memory and the hardware.
++
++	  PIO is slower than DMA as it requires CPU instructions to
++	  move the data. This has been the traditional default for
++	  the S3C MCI driver.
++
++config MMC_S3C_DMA
++	bool "Use DMA transfers only (EXPERIMENTAL)"
++	depends on EXPERIMENTAL
++	help
++	  Use DMA to transfer data between memory and the hardare.
++
++	  Currently, the DMA support in this driver seems to not be
++	  working properly and needs to be debugged before this
++	  option is useful.
++
++config MMC_S3C_PIODMA
++	bool "Support for both PIO and DMA (EXPERIMENTAL)"
++	help
++	  Compile both the PIO and DMA transfer routines into the
++	  driver and let the platform select at run-time which one
++	  is best.
++
++	  See notes for the DMA option.
++
++endchoice
++
+ config MMC_SDRICOH_CS
+ 	tristate "MMC/SD driver for Ricoh Bay1Controllers (EXPERIMENTAL)"
+ 	depends on EXPERIMENTAL && PCI && PCMCIA
+@@ -273,7 +369,7 @@ config MMC_SDRICOH_CS
+ 
+ config MMC_TMIO
+ 	tristate "Toshiba Mobile IO Controller (TMIO) MMC/SD function support"
+-	depends on MFD_TMIO || MFD_ASIC3
++	depends on MFD_TMIO || MFD_ASIC3 || SUPERH
+ 	help
+ 	  This provides support for the SD/MMC cell found in TC6393XB,
+ 	  T7L66XB and also HTC ASIC3
+@@ -301,3 +397,22 @@ config MMC_VIA_SDMMC
+ 	  If you have a controller with this interface, say Y or M here.
+ 
+ 	  If unsure, say N.
++
++config SDH_BFIN
++	tristate "Blackfin Secure Digital Host support"
++	depends on MMC && ((BF54x && !BF544) || (BF51x && !BF512))
++	help
++	  If you say yes here you will get support for the Blackfin on-chip
++	  Secure Digital Host interface.  This includes support for MMC and
++	  SD cards.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called bfin_sdh.
++
++	  If unsure, say N.
++
++config SDH_BFIN_MISSING_CMD_PULLUP_WORKAROUND
++	bool "Blackfin EZkit Missing SDH_CMD Pull Up Resistor Workaround"
++	depends on SDH_BFIN
++	help
++	  If you say yes here SD-Cards may work on the EZkit.
+Index: drivers/mmc/host/Makefile
+===================================================================
+--- drivers/mmc/host/Makefile.orig
++++ drivers/mmc/host/Makefile
+@@ -13,8 +13,6 @@ obj-$(CONFIG_MMC_MXC)		+= mxcmmc.o
+ obj-$(CONFIG_MMC_SDHCI)		+= sdhci.o
+ obj-$(CONFIG_MMC_SDHCI_PCI)	+= sdhci-pci.o
+ obj-$(CONFIG_MMC_RICOH_MMC)	+= ricoh_mmc.o
+-obj-$(CONFIG_MMC_SDHCI_OF)	+= sdhci-of.o
+-obj-$(CONFIG_MMC_SDHCI_PLTFM)	+= sdhci-pltfm.o
+ obj-$(CONFIG_MMC_SDHCI_S3C)	+= sdhci-s3c.o
+ obj-$(CONFIG_MMC_WBSD)		+= wbsd.o
+ obj-$(CONFIG_MMC_AU1X)		+= au1xmmc.o
+@@ -23,7 +21,9 @@ obj-$(CONFIG_MMC_OMAP_HS)	+= omap_hsmmc.
+ obj-$(CONFIG_MMC_AT91)		+= at91_mci.o
+ obj-$(CONFIG_MMC_ATMELMCI)	+= atmel-mci.o
+ obj-$(CONFIG_MMC_TIFM_SD)	+= tifm_sd.o
++obj-$(CONFIG_MMC_MSM7X00A)	+= msm_sdcc.o
+ obj-$(CONFIG_MMC_MVSDIO)	+= mvsdio.o
++obj-$(CONFIG_MMC_DAVINCI)       += davinci_mmc.o
+ obj-$(CONFIG_MMC_SPI)		+= mmc_spi.o
+ ifeq ($(CONFIG_OF),y)
+ obj-$(CONFIG_MMC_SPI)		+= of_mmc_spi.o
+@@ -33,6 +33,16 @@ obj-$(CONFIG_MMC_SDRICOH_CS)	+= sdricoh_
+ obj-$(CONFIG_MMC_TMIO)		+= tmio_mmc.o
+ obj-$(CONFIG_MMC_CB710)	+= cb710-mmc.o
+ obj-$(CONFIG_MMC_VIA_SDMMC)	+= via-sdmmc.o
++obj-$(CONFIG_SDH_BFIN)		+= bfin_sdh.o
++
++obj-$(CONFIG_MMC_SDHCI_OF)	+= sdhci-of.o
++sdhci-of-y				:= sdhci-of-core.o
++sdhci-of-$(CONFIG_MMC_SDHCI_ESDHC)	+= sdhci-esdhc.o
++sdhci-of-$(CONFIG_MMC_SDHCI_OF_HLWD)	+= sdhci-of-hlwd.o
++
++obj-$(CONFIG_MMC_SDHCI_PLTFM)	+= sdhci-pltfm.o
++sdhci-pltfm-y				:= sdhci-pltfm-core.o
++sdhci-pltfm-$(CONFIG_MMC_SDHCI_ESDHC)	+= sdhci-esdhc.o
+ 
+ ifeq ($(CONFIG_CB710_DEBUG),y)
+ 	CFLAGS-cb710-mmc	+= -DDEBUG
+Index: drivers/mmc/host/sdhci-esdhc.c
+===================================================================
+--- /dev/null
++++ drivers/mmc/host/sdhci-esdhc.c
+@@ -0,0 +1,215 @@
++/*
++ * Freescale eSDHC controller driver.
++ *
++ * Copyright (c) 2007 Freescale Semiconductor, Inc.
++ * Copyright (c) 2009 MontaVista Software, Inc.
++ *
++ * Authors: Xiaobo Xie <X.Xie@freescale.com>
++ *	    Anton Vorontsov <avorontsov@ru.mvista.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or (at
++ * your option) any later version.
++ */
++
++#include <linux/io.h>
++#include <linux/delay.h>
++#include <linux/mmc/host.h>
++#include "sdhci-of.h"
++#include "sdhci.h"
++
++/*
++ * Ops and quirks for the Freescale eSDHC controller.
++ */
++
++#define ESDHC_DMA_SYSCTL	0x40c
++#define ESDHC_DMA_SNOOP		0x00000040
++
++#define ESDHC_SYSTEM_CONTROL	0x2c
++#define ESDHC_CLOCK_MASK	0x0000fff0
++#define ESDHC_PREDIV_SHIFT	8
++#define ESDHC_DIVIDER_SHIFT	4
++#define ESDHC_CLOCK_PEREN	0x00000004
++#define ESDHC_CLOCK_HCKEN	0x00000002
++#define ESDHC_CLOCK_IPGEN	0x00000001
++
++#define ESDHC_HOST_CONTROL_RES	0x05
++
++#ifdef CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
++
++static u16 esdhc_readw_be(struct sdhci_host *host, int reg)
++{
++	u16 ret;
++
++	if (unlikely(reg == SDHCI_HOST_VERSION))
++		ret = in_be16(host->ioaddr + reg);
++	else
++		ret = sdhci_be32bs_readw(host, reg);
++	return ret;
++}
++
++static void esdhc_writew_be(struct sdhci_host *host, u16 val, int reg)
++{
++	if (reg == SDHCI_BLOCK_SIZE) {
++		/*
++		 * Two last DMA bits are reserved, and first one is used for
++		 * non-standard blksz of 4096 bytes that we don't support
++		 * yet. So clear the DMA boundary bits.
++		 */
++		val &= ~SDHCI_MAKE_BLKSZ(0x7, 0);
++	}
++	sdhci_be32bs_writew(host, val, reg);
++}
++
++static void esdhc_writeb_be(struct sdhci_host *host, u8 val, int reg)
++{
++	/* Prevent SDHCI core from writing reserved bits (e.g. HISPD). */
++	if (reg == SDHCI_HOST_CONTROL)
++		val &= ~ESDHC_HOST_CONTROL_RES;
++	sdhci_be32bs_writeb(host, val, reg);
++}
++
++static int esdhc_enable_dma(struct sdhci_host *host)
++{
++	u32 temp = sdhci_readl(host, ESDHC_DMA_SYSCTL);
++
++	temp |= ESDHC_DMA_SNOOP;
++	sdhci_writel(host, temp, ESDHC_DMA_SYSCTL);
++	return 0;
++}
++
++#else
++
++static inline void esdhc_clrset_le(struct sdhci_host *host, u32 mask, u32 val, int reg)
++{
++	void __iomem *base = host->ioaddr + (reg & ~0x3);
++	u32 shift = (reg & 0x3) * 8;
++
++	writel(((readl(base) & ~(mask << shift)) | (val << shift)), base);
++}
++
++static u16 esdhc_readw_le(struct sdhci_host *host, int reg)
++{
++	if (unlikely(reg == SDHCI_HOST_VERSION))
++		reg ^= 2;
++
++	return readw(host->ioaddr + reg);
++}
++
++static void esdhc_writew_le(struct sdhci_host *host, u16 val, int reg)
++{
++	static u16 ugh;
++
++	switch (reg) {
++	case SDHCI_TRANSFER_MODE:
++		/*
++		 * Postpone this write, we must do it together with a
++		 * command write that is down below.
++		 */
++		//of_host->xfer_mode_shadow = val;
++		ugh = val;
++		return;
++	case SDHCI_COMMAND:
++		writel(val << 16 | ugh, host->ioaddr + SDHCI_TRANSFER_MODE);
++		return;
++	case SDHCI_BLOCK_SIZE:
++		val &= ~SDHCI_MAKE_BLKSZ(0x7, 0);
++		break;
++	}
++	esdhc_clrset_le(host, 0xffff, val, reg);
++}
++
++static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
++{
++	switch (reg) {
++	case SDHCI_POWER_CONTROL:
++		/* FSL put the DMA bits there, so skip :( */
++		return;
++	case SDHCI_HOST_CONTROL:
++		val &= 0x07;
++		val |= 0x20;
++		break;
++	}
++	esdhc_clrset_le(host, 0xff, val, reg);
++}
++
++#endif /* CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER */
++
++static void esdhc_set_clock(struct sdhci_host *host, unsigned int clock)
++{
++	int pre_div = 2;
++	int div = 1;
++	u32 temp;
++
++	temp = sdhci_readl(host, ESDHC_SYSTEM_CONTROL);
++	temp &= ~(ESDHC_CLOCK_IPGEN | ESDHC_CLOCK_HCKEN | ESDHC_CLOCK_PEREN | ESDHC_CLOCK_MASK);
++	sdhci_writel(host, temp, ESDHC_SYSTEM_CONTROL);
++
++	if (clock == 0)
++		goto out;
++
++	while (host->max_clk / pre_div / 16 > clock && pre_div < 256)
++		pre_div *= 2;
++
++	while (host->max_clk / pre_div / div > clock && div < 16)
++		div++;
++
++	dev_dbg(mmc_dev(host->mmc), "desired SD clock: %d, actual: %d (%02x %02x)\n",
++		clock, host->max_clk / pre_div / div, pre_div, div);
++
++	pre_div >>= 1;
++	div--;
++
++	temp = sdhci_readl(host, ESDHC_SYSTEM_CONTROL);
++	temp |= (ESDHC_CLOCK_IPGEN | ESDHC_CLOCK_HCKEN | ESDHC_CLOCK_PEREN |
++		  div << ESDHC_DIVIDER_SHIFT | pre_div << ESDHC_PREDIV_SHIFT);
++	sdhci_writel(host, temp, ESDHC_SYSTEM_CONTROL);
++	mdelay(100);
++out:
++	host->clock = clock;
++}
++
++static unsigned int esdhc_get_max_clock(struct sdhci_host *host)
++{
++	struct sdhci_of_host *of_host = sdhci_priv(host);
++
++	return of_host->clock;
++}
++
++static unsigned int esdhc_get_min_clock(struct sdhci_host *host)
++{
++	struct sdhci_of_host *of_host = sdhci_priv(host);
++
++	return of_host->clock / 256 / 16;
++}
++
++struct sdhci_quirk_data sdhci_esdhc = {
++	.quirks = SDHCI_QUIRK_FORCE_BLK_SZ_2048 |
++		  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
++		  SDHCI_QUIRK_NO_BUSY_IRQ |
++		  SDHCI_QUIRK_NONSTANDARD_CLOCK |
++		  SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
++		  SDHCI_QUIRK_PIO_NEEDS_DELAY |
++		  SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET |
++		   SDHCI_QUIRK_BROKEN_TIMEOUT_VAL |
++		  SDHCI_QUIRK_NO_CARD_NO_RESET,
++	.ops = {
++#ifdef CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
++		.custom_readl = sdhci_be32bs_readl,
++		.custom_readw = esdhc_readw_be,
++		.custom_readb = sdhci_be32bs_readb,
++		.custom_writel = sdhci_be32bs_writel,
++		.custom_writew = esdhc_writew_be,
++		.custom_writeb = esdhc_writeb_be,
++		.enable_dma = esdhc_enable_dma,
++#else
++		.custom_readw = esdhc_readw_le,
++		.custom_writew = esdhc_writew_le,
++		.custom_writeb = esdhc_writeb_le,
++#endif
++		.set_clock = esdhc_set_clock,
++		.get_max_clock = esdhc_get_max_clock,
++		.get_min_clock = esdhc_get_min_clock,
++	},
++};
+Index: drivers/mmc/host/sdhci-of-core.c
+===================================================================
+--- /dev/null
++++ drivers/mmc/host/sdhci-of-core.c
+@@ -0,0 +1,231 @@
++/*
++ * OpenFirmware bindings for Secure Digital Host Controller Interface.
++ *
++ * Copyright (c) 2007 Freescale Semiconductor, Inc.
++ * Copyright (c) 2009 MontaVista Software, Inc.
++ *
++ * Authors: Xiaobo Xie <X.Xie@freescale.com>
++ *	    Anton Vorontsov <avorontsov@ru.mvista.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or (at
++ * your option) any later version.
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/io.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++#include <linux/of.h>
++#include <linux/of_platform.h>
++#include <linux/mmc/host.h>
++#include <asm/machdep.h>
++#include "sdhci-of.h"
++#include "sdhci.h"
++
++#ifdef CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
++
++/*
++ * These accessors are designed for big endian hosts doing I/O to
++ * little endian controllers incorporating a 32-bit hardware byte swapper.
++ */
++
++u32 sdhci_be32bs_readl(struct sdhci_host *host, int reg)
++{
++	return in_be32(host->ioaddr + reg);
++}
++
++u16 sdhci_be32bs_readw(struct sdhci_host *host, int reg)
++{
++	return in_be16(host->ioaddr + (reg ^ 0x2));
++}
++
++u8 sdhci_be32bs_readb(struct sdhci_host *host, int reg)
++{
++	return in_8(host->ioaddr + (reg ^ 0x3));
++}
++
++void sdhci_be32bs_writel(struct sdhci_host *host, u32 val, int reg)
++{
++	out_be32(host->ioaddr + reg, val);
++}
++
++void sdhci_be32bs_writew(struct sdhci_host *host, u16 val, int reg)
++{
++	struct sdhci_of_host *of_host = sdhci_priv(host);
++	int base = reg & ~0x3;
++	int shift = (reg & 0x2) * 8;
++
++	switch (reg) {
++	case SDHCI_TRANSFER_MODE:
++		/*
++		 * Postpone this write, we must do it together with a
++		 * command write that is down below.
++		 */
++		of_host->xfer_mode_shadow = val;
++		return;
++	case SDHCI_COMMAND:
++		sdhci_be32bs_writel(host, val << 16 | of_host->xfer_mode_shadow,
++				    SDHCI_TRANSFER_MODE);
++		return;
++	}
++	clrsetbits_be32(host->ioaddr + base, 0xffff << shift, val << shift);
++}
++
++void sdhci_be32bs_writeb(struct sdhci_host *host, u8 val, int reg)
++{
++	int base = reg & ~0x3;
++	int shift = (reg & 0x3) * 8;
++
++	clrsetbits_be32(host->ioaddr + base , 0xff << shift, val << shift);
++}
++#endif /* CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER */
++
++#ifdef CONFIG_PM
++
++static int sdhci_of_suspend(struct of_device *ofdev, pm_message_t state)
++{
++	struct sdhci_host *host = dev_get_drvdata(&ofdev->dev);
++
++	return mmc_suspend_host(host->mmc, state);
++}
++
++static int sdhci_of_resume(struct of_device *ofdev)
++{
++	struct sdhci_host *host = dev_get_drvdata(&ofdev->dev);
++
++	return mmc_resume_host(host->mmc);
++}
++
++#else
++
++#define sdhci_of_suspend NULL
++#define sdhci_of_resume NULL
++
++#endif
++
++static bool __devinit sdhci_of_wp_inverted(struct device_node *np)
++{
++	if (of_get_property(np, "sdhci,wp-inverted", NULL))
++		return true;
++
++	/* Old device trees don't have the wp-inverted property. */
++	return machine_is(mpc837x_rdb) || machine_is(mpc837x_mds);
++}
++
++static int __devinit sdhci_of_probe(struct of_device *ofdev,
++				 const struct of_device_id *match)
++{
++	struct device_node *np = ofdev->node;
++	struct sdhci_quirk_data *sdhci_of_data = match->data;
++	struct sdhci_host *host;
++	struct sdhci_of_host *of_host;
++	const u32 *clk;
++	int size;
++	int ret;
++
++	if (!of_device_is_available(np))
++		return -ENODEV;
++
++	host = sdhci_alloc_host(&ofdev->dev, sizeof(*of_host));
++	if (IS_ERR(host))
++		return -ENOMEM;
++
++	of_host = sdhci_priv(host);
++	dev_set_drvdata(&ofdev->dev, host);
++
++	host->ioaddr = of_iomap(np, 0);
++	if (!host->ioaddr) {
++		ret = -ENOMEM;
++		goto err_addr_map;
++	}
++
++	host->irq = irq_of_parse_and_map(np, 0);
++	if (!host->irq) {
++		ret = -EINVAL;
++		goto err_no_irq;
++	}
++
++	host->hw_name = dev_name(&ofdev->dev);
++	if (sdhci_of_data) {
++		host->quirks = sdhci_of_data->quirks;
++		host->ops = &sdhci_of_data->ops;
++	}
++
++	if (of_get_property(np, "sdhci,1-bit-only", NULL))
++		host->quirks |= SDHCI_QUIRK_FORCE_1_BIT_DATA;
++
++	if (sdhci_of_wp_inverted(np))
++		host->quirks |= SDHCI_QUIRK_INVERTED_WRITE_PROTECT;
++
++	clk = of_get_property(np, "clock-frequency", &size);
++	if (clk && size == sizeof(*clk) && *clk)
++		of_host->clock = *clk;
++
++	ret = sdhci_add_host(host);
++	if (ret)
++		goto err_add_host;
++
++	return 0;
++
++err_add_host:
++	irq_dispose_mapping(host->irq);
++err_no_irq:
++	iounmap(host->ioaddr);
++err_addr_map:
++	sdhci_free_host(host);
++	return ret;
++}
++
++static int __devexit sdhci_of_remove(struct of_device *ofdev)
++{
++	struct sdhci_host *host = dev_get_drvdata(&ofdev->dev);
++
++	sdhci_remove_host(host, 0);
++	sdhci_free_host(host);
++	irq_dispose_mapping(host->irq);
++	iounmap(host->ioaddr);
++	return 0;
++}
++
++static const struct of_device_id sdhci_of_match[] = {
++#ifdef CONFIG_MMC_SDHCI_OF_ESDHC
++	{ .compatible = "fsl,mpc8379-esdhc", .data = &sdhci_esdhc, },
++	{ .compatible = "fsl,mpc8536-esdhc", .data = &sdhci_esdhc, },
++	{ .compatible = "fsl,esdhc", .data = &sdhci_esdhc, },
++#endif
++#ifdef CONFIG_MMC_SDHCI_OF_HLWD
++	{ .compatible = "nintendo,hollywood-sdhci", .data = &sdhci_hlwd, },
++#endif
++	{ .compatible = "generic-sdhci", },
++	{},
++};
++MODULE_DEVICE_TABLE(of, sdhci_of_match);
++
++static struct of_platform_driver sdhci_of_driver = {
++	.driver.name = "sdhci-of",
++	.match_table = sdhci_of_match,
++	.probe = sdhci_of_probe,
++	.remove = __devexit_p(sdhci_of_remove),
++	.suspend = sdhci_of_suspend,
++	.resume	= sdhci_of_resume,
++};
++
++static int __init sdhci_of_init(void)
++{
++	return of_register_platform_driver(&sdhci_of_driver);
++}
++module_init(sdhci_of_init);
++
++static void __exit sdhci_of_exit(void)
++{
++	of_unregister_platform_driver(&sdhci_of_driver);
++}
++module_exit(sdhci_of_exit);
++
++MODULE_DESCRIPTION("Secure Digital Host Controller Interface OF driver");
++MODULE_AUTHOR("Xiaobo Xie <X.Xie@freescale.com>, "
++	      "Anton Vorontsov <avorontsov@ru.mvista.com>");
++MODULE_LICENSE("GPL");
+Index: drivers/mmc/host/sdhci-of-hlwd.c
+===================================================================
+--- /dev/null
++++ drivers/mmc/host/sdhci-of-hlwd.c
+@@ -0,0 +1,65 @@
++/*
++ * drivers/mmc/host/sdhci-of-hlwd.c
++ *
++ * Nintendo Wii Secure Digital Host Controller Interface.
++ * Copyright (C) 2009 The GameCube Linux Team
++ * Copyright (C) 2009 Albert Herranz
++ *
++ * Based on sdhci-of-esdhc.c
++ *
++ * Copyright (c) 2007 Freescale Semiconductor, Inc.
++ * Copyright (c) 2009 MontaVista Software, Inc.
++ *
++ * Authors: Xiaobo Xie <X.Xie@freescale.com>
++ *	    Anton Vorontsov <avorontsov@ru.mvista.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or (at
++ * your option) any later version.
++ */
++
++#include <linux/delay.h>
++#include <linux/mmc/host.h>
++#include "sdhci-of.h"
++#include "sdhci.h"
++
++/*
++ * Ops and quirks for the Nintendo Wii SDHCI controllers.
++ */
++
++/*
++ * We need a small delay after each write, or things go horribly wrong.
++ */
++#define SDHCI_HLWD_WRITE_DELAY	5 /* usecs */
++
++static void sdhci_hlwd_writel(struct sdhci_host *host, u32 val, int reg)
++{
++	sdhci_be32bs_writel(host, val, reg);
++	udelay(SDHCI_HLWD_WRITE_DELAY);
++}
++
++static void sdhci_hlwd_writew(struct sdhci_host *host, u16 val, int reg)
++{
++	sdhci_be32bs_writew(host, val, reg);
++	udelay(SDHCI_HLWD_WRITE_DELAY);
++}
++
++static void sdhci_hlwd_writeb(struct sdhci_host *host, u8 val, int reg)
++{
++	sdhci_be32bs_writeb(host, val, reg);
++	udelay(SDHCI_HLWD_WRITE_DELAY);
++}
++
++struct sdhci_quirk_data sdhci_hlwd = {
++	.quirks = SDHCI_QUIRK_32BIT_DMA_ADDR |
++		  SDHCI_QUIRK_32BIT_DMA_SIZE,
++	.ops = {
++		.readl = sdhci_be32bs_readl,
++		.readw = sdhci_be32bs_readw,
++		.readb = sdhci_be32bs_readb,
++		.writel = sdhci_hlwd_writel,
++		.writew = sdhci_hlwd_writew,
++		.writeb = sdhci_hlwd_writeb,
++	},
++};
+Index: drivers/mmc/host/sdhci-of.h
+===================================================================
+--- /dev/null
++++ drivers/mmc/host/sdhci-of.h
+@@ -0,0 +1,37 @@
++/*
++ * OpenFirmware bindings for Secure Digital Host Controller Interface.
++ *
++ * Copyright (c) 2007 Freescale Semiconductor, Inc.
++ * Copyright (c) 2009 MontaVista Software, Inc.
++ *
++ * Authors: Xiaobo Xie <X.Xie@freescale.com>
++ *	    Anton Vorontsov <avorontsov@ru.mvista.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or (at
++ * your option) any later version.
++ */
++
++#ifndef __SDHCI_OF_H
++#define __SDHCI_OF_H
++
++#include <linux/types.h>
++#include "sdhci.h"
++
++struct sdhci_of_host {
++	unsigned int clock;
++	u16 xfer_mode_shadow;
++};
++
++extern u32 sdhci_be32bs_readl(struct sdhci_host *host, int reg);
++extern u16 sdhci_be32bs_readw(struct sdhci_host *host, int reg);
++extern u8 sdhci_be32bs_readb(struct sdhci_host *host, int reg);
++extern void sdhci_be32bs_writel(struct sdhci_host *host, u32 val, int reg);
++extern void sdhci_be32bs_writew(struct sdhci_host *host, u16 val, int reg);
++extern void sdhci_be32bs_writeb(struct sdhci_host *host, u8 val, int reg);
++
++extern struct sdhci_quirk_data sdhci_esdhc;
++extern struct sdhci_quirk_data sdhci_hlwd;
++
++#endif /* __SDHCI_OF_H */
+Index: drivers/mmc/host/sdhci-pltfm-core.c
+===================================================================
+--- /dev/null
++++ drivers/mmc/host/sdhci-pltfm-core.c
+@@ -0,0 +1,187 @@
++/*
++ * sdhci-pltfm.c Support for SDHCI platform devices
++ * Copyright (c) 2009 Intel Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++/* Supports:
++ * SDHCI platform devices
++ *
++ * Inspired by sdhci-pci.c, by Pierre Ossman
++ */
++
++#include <linux/delay.h>
++#include <linux/highmem.h>
++#include <linux/platform_device.h>
++#include <linux/mmc/host.h>
++#include <linux/clk.h>
++#include <linux/io.h>
++
++#include "sdhci.h"
++#include "sdhci-of.h"
++
++/*****************************************************************************\
++ *                                                                           *
++ * Device probing/removal                                                    *
++ *                                                                           *
++\*****************************************************************************/
++
++static int __devinit sdhci_pltfm_probe(struct platform_device *pdev)
++{
++	struct sdhci_host *host;
++	struct resource *iomem;
++	struct sdhci_of_host *of_host;
++	struct clk *clk;
++	int ret;
++	struct sdhci_quirk_data *quirk = (struct sdhci_quirk_data *) 
++			platform_get_device_id(pdev)->driver_data;
++
++	BUG_ON(pdev == NULL);
++
++	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!iomem) {
++		ret = -ENOMEM;
++		goto err;
++	}
++
++	if (resource_size(iomem) != 0x100)
++		dev_err(&pdev->dev, "Invalid iomem size. You may "
++			"experience problems.\n");
++
++	if (pdev->dev.parent)
++		host = sdhci_alloc_host(pdev->dev.parent, sizeof(struct sdhci_of_host));
++	else
++		host = sdhci_alloc_host(&pdev->dev, sizeof(struct sdhci_of_host));
++
++	if (IS_ERR(host)) {
++		ret = PTR_ERR(host);
++		goto err;
++	}
++
++	of_host = sdhci_priv(host);
++	dev_set_drvdata(&pdev->dev, host);
++
++	host->hw_name = "platform";
++	host->irq = platform_get_irq(pdev, 0);
++
++	if (!request_mem_region(iomem->start, resource_size(iomem),
++		mmc_hostname(host->mmc))) {
++		dev_err(&pdev->dev, "cannot request region\n");
++		ret = -EBUSY;
++		goto err_request;
++	}
++
++	host->ioaddr = ioremap(iomem->start, resource_size(iomem));
++	if (!host->ioaddr) {
++		dev_err(&pdev->dev, "failed to remap registers\n");
++		ret = -ENOMEM;
++		goto err_remap;
++	}
++
++	if (quirk) {
++		host->quirks = quirk->quirks;
++		host->ops = &quirk->ops;
++	}
++
++	clk = clk_get(NULL, "sdhc");
++	if (IS_ERR(clk)) {
++		dev_err(&pdev->dev, "clk err\n");
++		return -ENODEV;
++	}
++	clk_enable(clk);
++	of_host->clock = clk_get_rate(clk);
++
++	ret = sdhci_add_host(host);
++	if (ret)
++		goto err_add_host;
++
++	platform_set_drvdata(pdev, host);
++	dev_info(&pdev->dev, "registered as %s\n", platform_get_device_id(pdev)->name);
++
++	return 0;
++
++err_add_host:
++	iounmap(host->ioaddr);
++err_remap:
++	release_mem_region(iomem->start, resource_size(iomem));
++err_request:
++	sdhci_free_host(host);
++err:
++	printk(KERN_ERR"Probing of sdhci-pltfm failed: %d\n", ret);
++	return ret;
++}
++
++static int __devexit sdhci_pltfm_remove(struct platform_device *pdev)
++{
++	struct sdhci_host *host = platform_get_drvdata(pdev);
++	struct resource *iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	int dead;
++	u32 scratch;
++
++	dead = 0;
++	scratch = readl(host->ioaddr + SDHCI_INT_STATUS);
++	if (scratch == (u32)-1)
++		dead = 1;
++
++	sdhci_remove_host(host, dead);
++	iounmap(host->ioaddr);
++	release_mem_region(iomem->start, resource_size(iomem));
++	sdhci_free_host(host);
++	platform_set_drvdata(pdev, NULL);
++
++	return 0;
++}
++
++static struct platform_device_id sdhci_id_table[] = {
++	{ "sdhci",		0, },
++#ifdef CONFIG_MMC_SDHCI_ESDHC
++	{ "sdhci-esdhc",	(kernel_ulong_t)&sdhci_esdhc, },
++#endif
++        { },
++};
++MODULE_DEVICE_TABLE(platform, sdhci_id_table);
++
++static struct platform_driver sdhci_pltfm_driver = {
++	.driver = {
++		.name	= "sdhci",
++		.owner	= THIS_MODULE,
++	},
++	.probe		= sdhci_pltfm_probe,
++	.remove		= __devexit_p(sdhci_pltfm_remove),
++	.id_table	= sdhci_id_table,
++};
++
++/*****************************************************************************\
++ *                                                                           *
++ * Driver init/exit                                                          *
++ *                                                                           *
++\*****************************************************************************/
++
++static int __init sdhci_drv_init(void)
++{
++	return platform_driver_register(&sdhci_pltfm_driver);
++}
++
++static void __exit sdhci_drv_exit(void)
++{
++	platform_driver_unregister(&sdhci_pltfm_driver);
++}
++
++module_init(sdhci_drv_init);
++module_exit(sdhci_drv_exit);
++
++MODULE_DESCRIPTION("Secure Digital Host Controller Interface platform driver");
++MODULE_AUTHOR("Mocean Laboratories <info@mocean-labs.com>");
++MODULE_LICENSE("GPL v2");
+Index: drivers/mmc/host/sdhci.c
+===================================================================
+--- drivers/mmc/host/sdhci.c.orig
++++ drivers/mmc/host/sdhci.c
+@@ -58,7 +58,7 @@ static void sdhci_dumpregs(struct sdhci_
+ 		sdhci_readw(host, SDHCI_TRANSFER_MODE));
+ 	printk(KERN_DEBUG DRIVER_NAME ": Present:  0x%08x | Host ctl: 0x%08x\n",
+ 		sdhci_readl(host, SDHCI_PRESENT_STATE),
+-		sdhci_readb(host, SDHCI_HOST_CONTROL));
++		sdhci_readl(host, SDHCI_HOST_CONTROL));
+ 	printk(KERN_DEBUG DRIVER_NAME ": Power:    0x%08x | Blk gap:  0x%08x\n",
+ 		sdhci_readb(host, SDHCI_POWER_CONTROL),
+ 		sdhci_readb(host, SDHCI_BLOCK_GAP_CONTROL));
+@@ -591,6 +591,9 @@ static u8 sdhci_calc_timeout(struct sdhc
+ 	target_timeout = data->timeout_ns / 1000 +
+ 		data->timeout_clks / host->clock;
+ 
++	if (host->quirks & SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK)
++		host->timeout_clk = host->clock / 1000;
++
+ 	/*
+ 	 * Figure out needed cycles.
+ 	 * We do this in steps in order to fit inside a 32 bit int.
+@@ -652,7 +655,7 @@ static void sdhci_prepare_data(struct sd
+ 	count = sdhci_calc_timeout(host, data);
+ 	sdhci_writeb(host, count, SDHCI_TIMEOUT_CONTROL);
+ 
+-	if (host->flags & SDHCI_USE_DMA)
++	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA))
+ 		host->flags |= SDHCI_REQ_USE_DMA;
+ 
+ 	/*
+@@ -991,8 +994,8 @@ static void sdhci_set_clock(struct sdhci
+ 	clk |= SDHCI_CLOCK_INT_EN;
+ 	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
+ 
+-	/* Wait max 10 ms */
+-	timeout = 10;
++	/* Wait max 20 ms */
++	timeout = 20;
+ 	while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL))
+ 		& SDHCI_CLOCK_INT_STABLE)) {
+ 		if (timeout == 0) {
+@@ -1597,7 +1600,7 @@ int sdhci_resume_host(struct sdhci_host 
+ {
+ 	int ret;
+ 
+-	if (host->flags & SDHCI_USE_DMA) {
++	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
+ 		if (host->ops->enable_dma)
+ 			host->ops->enable_dma(host);
+ 	}
+@@ -1678,23 +1681,20 @@ int sdhci_add_host(struct sdhci_host *ho
+ 	caps = sdhci_readl(host, SDHCI_CAPABILITIES);
+ 
+ 	if (host->quirks & SDHCI_QUIRK_FORCE_DMA)
+-		host->flags |= SDHCI_USE_DMA;
+-	else if (!(caps & SDHCI_CAN_DO_DMA))
+-		DBG("Controller doesn't have DMA capability\n");
++		host->flags |= SDHCI_USE_SDMA;
++	else if (!(caps & SDHCI_CAN_DO_SDMA))
++		DBG("Controller doesn't have SDMA capability\n");
+ 	else
+-		host->flags |= SDHCI_USE_DMA;
++		host->flags |= SDHCI_USE_SDMA;
+ 
+ 	if ((host->quirks & SDHCI_QUIRK_BROKEN_DMA) &&
+-		(host->flags & SDHCI_USE_DMA)) {
++		(host->flags & SDHCI_USE_SDMA)) {
+ 		DBG("Disabling DMA as it is marked broken\n");
+-		host->flags &= ~SDHCI_USE_DMA;
++		host->flags &= ~SDHCI_USE_SDMA;
+ 	}
+ 
+-	if (host->flags & SDHCI_USE_DMA) {
+-		if ((host->version >= SDHCI_SPEC_200) &&
+-				(caps & SDHCI_CAN_DO_ADMA2))
+-			host->flags |= SDHCI_USE_ADMA;
+-	}
++	if ((host->version >= SDHCI_SPEC_200) && (caps & SDHCI_CAN_DO_ADMA2))
++		host->flags |= SDHCI_USE_ADMA;
+ 
+ 	if ((host->quirks & SDHCI_QUIRK_BROKEN_ADMA) &&
+ 		(host->flags & SDHCI_USE_ADMA)) {
+@@ -1702,13 +1702,14 @@ int sdhci_add_host(struct sdhci_host *ho
+ 		host->flags &= ~SDHCI_USE_ADMA;
+ 	}
+ 
+-	if (host->flags & SDHCI_USE_DMA) {
++	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
+ 		if (host->ops->enable_dma) {
+ 			if (host->ops->enable_dma(host)) {
+ 				printk(KERN_WARNING "%s: No suitable DMA "
+ 					"available. Falling back to PIO.\n",
+ 					mmc_hostname(mmc));
+-				host->flags &= ~(SDHCI_USE_DMA | SDHCI_USE_ADMA);
++				host->flags &=
++					~(SDHCI_USE_SDMA | SDHCI_USE_ADMA);
+ 			}
+ 		}
+ 	}
+@@ -1736,7 +1737,7 @@ int sdhci_add_host(struct sdhci_host *ho
+ 	 * mask, but PIO does not need the hw shim so we set a new
+ 	 * mask here in that case.
+ 	 */
+-	if (!(host->flags & SDHCI_USE_DMA)) {
++	if (!(host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA))) {
+ 		host->dma_mask = DMA_BIT_MASK(64);
+ 		mmc_dev(host->mmc)->dma_mask = &host->dma_mask;
+ 	}
+@@ -1757,13 +1758,15 @@ int sdhci_add_host(struct sdhci_host *ho
+ 	host->timeout_clk =
+ 		(caps & SDHCI_TIMEOUT_CLK_MASK) >> SDHCI_TIMEOUT_CLK_SHIFT;
+ 	if (host->timeout_clk == 0) {
+-		if (!host->ops->get_timeout_clock) {
++		if (host->ops->get_timeout_clock) {
++			host->timeout_clk = host->ops->get_timeout_clock(host);
++		} else if (!(host->quirks &
++				SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK)) {
+ 			printk(KERN_ERR
+ 			       "%s: Hardware doesn't specify timeout clock "
+ 			       "frequency.\n", mmc_hostname(mmc));
+ 			return -ENODEV;
+ 		}
+-		host->timeout_clk = host->ops->get_timeout_clock(host);
+ 	}
+ 	if (caps & SDHCI_TIMEOUT_CLK_UNIT)
+ 		host->timeout_clk *= 1000;
+@@ -1772,7 +1775,8 @@ int sdhci_add_host(struct sdhci_host *ho
+ 	 * Set host parameters.
+ 	 */
+ 	mmc->ops = &sdhci_ops;
+-	if (host->ops->get_min_clock)
++	if (host->quirks & SDHCI_QUIRK_NONSTANDARD_CLOCK &&
++			host->ops->set_clock && host->ops->get_min_clock)
+ 		mmc->f_min = host->ops->get_min_clock(host);
+ 	else
+ 		mmc->f_min = host->max_clk / 256;
+@@ -1810,7 +1814,7 @@ int sdhci_add_host(struct sdhci_host *ho
+ 	 */
+ 	if (host->flags & SDHCI_USE_ADMA)
+ 		mmc->max_hw_segs = 128;
+-	else if (host->flags & SDHCI_USE_DMA)
++	else if (host->flags & SDHCI_USE_SDMA)
+ 		mmc->max_hw_segs = 1;
+ 	else /* PIO */
+ 		mmc->max_hw_segs = 128;
+@@ -1893,10 +1897,10 @@ int sdhci_add_host(struct sdhci_host *ho
+ 
+ 	mmc_add_host(mmc);
+ 
+-	printk(KERN_INFO "%s: SDHCI controller on %s [%s] using %s%s\n",
++	printk(KERN_INFO "%s: SDHCI controller on %s [%s] using %s\n",
+ 		mmc_hostname(mmc), host->hw_name, dev_name(mmc_dev(mmc)),
+-		(host->flags & SDHCI_USE_ADMA)?"A":"",
+-		(host->flags & SDHCI_USE_DMA)?"DMA":"PIO");
++		(host->flags & SDHCI_USE_ADMA) ? "ADMA" :
++		(host->flags & SDHCI_USE_SDMA) ? "DMA" : "PIO");
+ 
+ 	sdhci_enable_card_detection(host);
+ 
+Index: drivers/mmc/host/sdhci.h
+===================================================================
+--- drivers/mmc/host/sdhci.h.orig
++++ drivers/mmc/host/sdhci.h
+@@ -8,6 +8,8 @@
+  * the Free Software Foundation; either version 2 of the License, or (at
+  * your option) any later version.
+  */
++#ifndef __SDHCI_H
++#define __SDHCI_H
+ 
+ #include <linux/scatterlist.h>
+ #include <linux/compiler.h>
+@@ -143,7 +145,7 @@
+ #define  SDHCI_CAN_DO_ADMA2	0x00080000
+ #define  SDHCI_CAN_DO_ADMA1	0x00100000
+ #define  SDHCI_CAN_DO_HISPD	0x00200000
+-#define  SDHCI_CAN_DO_DMA	0x00400000
++#define  SDHCI_CAN_DO_SDMA	0x00400000
+ #define  SDHCI_CAN_VDD_330	0x01000000
+ #define  SDHCI_CAN_VDD_300	0x02000000
+ #define  SDHCI_CAN_VDD_180	0x04000000
+@@ -232,6 +234,8 @@ struct sdhci_host {
+ #define SDHCI_QUIRK_FORCE_1_BIT_DATA			(1<<22)
+ /* Controller needs 10ms delay between applying power and clock */
+ #define SDHCI_QUIRK_DELAY_AFTER_POWER			(1<<23)
++/* Controller uses SDCLK instead of TMCLK for data timeouts */
++#define SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK		(1<<24)
+ 
+ 	int			irq;		/* Device IRQ */
+ 	void __iomem *		ioaddr;		/* Mapped address */
+@@ -250,7 +254,7 @@ struct sdhci_host {
+ 	spinlock_t		lock;		/* Mutex */
+ 
+ 	int			flags;		/* Host attributes */
+-#define SDHCI_USE_DMA		(1<<0)		/* Host is DMA capable */
++#define SDHCI_USE_SDMA		(1<<0)		/* Host is SDMA capable */
+ #define SDHCI_USE_ADMA		(1<<1)		/* Host is ADMA capable */
+ #define SDHCI_REQ_USE_DMA	(1<<2)		/* Use DMA for this req. */
+ #define SDHCI_DEVICE_DEAD	(1<<3)		/* Device unresponsive */
+@@ -290,12 +294,12 @@ struct sdhci_host {
+ 
+ struct sdhci_ops {
+ #ifdef CONFIG_MMC_SDHCI_IO_ACCESSORS
+-	u32		(*readl)(struct sdhci_host *host, int reg);
+-	u16		(*readw)(struct sdhci_host *host, int reg);
+-	u8		(*readb)(struct sdhci_host *host, int reg);
+-	void		(*writel)(struct sdhci_host *host, u32 val, int reg);
+-	void		(*writew)(struct sdhci_host *host, u16 val, int reg);
+-	void		(*writeb)(struct sdhci_host *host, u8 val, int reg);
++	u32		(*custom_readl)(struct sdhci_host *host, int reg);
++	u16		(*custom_readw)(struct sdhci_host *host, int reg);
++	u8		(*custom_readb)(struct sdhci_host *host, int reg);
++	void		(*custom_writel)(struct sdhci_host *host, u32 val, int reg);
++	void		(*custom_writew)(struct sdhci_host *host, u16 val, int reg);
++	void		(*custom_writeb)(struct sdhci_host *host, u8 val, int reg);
+ #endif
+ 
+ 	void	(*set_clock)(struct sdhci_host *host, unsigned int clock);
+@@ -310,48 +314,48 @@ struct sdhci_ops {
+ 
+ static inline void sdhci_writel(struct sdhci_host *host, u32 val, int reg)
+ {
+-	if (unlikely(host->ops->writel))
+-		host->ops->writel(host, val, reg);
++	if (unlikely(host->ops->custom_writel))
++		host->ops->custom_writel(host, val, reg);
+ 	else
+ 		writel(val, host->ioaddr + reg);
+ }
+ 
+ static inline void sdhci_writew(struct sdhci_host *host, u16 val, int reg)
+ {
+-	if (unlikely(host->ops->writew))
+-		host->ops->writew(host, val, reg);
++	if (unlikely(host->ops->custom_writew))
++		host->ops->custom_writew(host, val, reg);
+ 	else
+ 		writew(val, host->ioaddr + reg);
+ }
+ 
+ static inline void sdhci_writeb(struct sdhci_host *host, u8 val, int reg)
+ {
+-	if (unlikely(host->ops->writeb))
+-		host->ops->writeb(host, val, reg);
++	if (unlikely(host->ops->custom_writeb))
++		host->ops->custom_writeb(host, val, reg);
+ 	else
+ 		writeb(val, host->ioaddr + reg);
+ }
+ 
+ static inline u32 sdhci_readl(struct sdhci_host *host, int reg)
+ {
+-	if (unlikely(host->ops->readl))
+-		return host->ops->readl(host, reg);
++	if (unlikely(host->ops->custom_readl))
++		return host->ops->custom_readl(host, reg);
+ 	else
+ 		return readl(host->ioaddr + reg);
+ }
+ 
+ static inline u16 sdhci_readw(struct sdhci_host *host, int reg)
+ {
+-	if (unlikely(host->ops->readw))
+-		return host->ops->readw(host, reg);
++	if (unlikely(host->ops->custom_readw))
++		return host->ops->custom_readw(host, reg);
+ 	else
+ 		return readw(host->ioaddr + reg);
+ }
+ 
+ static inline u8 sdhci_readb(struct sdhci_host *host, int reg)
+ {
+-	if (unlikely(host->ops->readb))
+-		return host->ops->readb(host, reg);
++	if (unlikely(host->ops->custom_readb))
++		return host->ops->custom_readb(host, reg);
+ 	else
+ 		return readb(host->ioaddr + reg);
+ }
+@@ -390,6 +394,11 @@ static inline u8 sdhci_readb(struct sdhc
+ 
+ #endif /* CONFIG_MMC_SDHCI_IO_ACCESSORS */
+ 
++struct sdhci_quirk_data {
++	unsigned int quirks;
++	struct sdhci_ops ops;
++};
++
+ extern struct sdhci_host *sdhci_alloc_host(struct device *dev,
+ 	size_t priv_size);
+ extern void sdhci_free_host(struct sdhci_host *host);
+@@ -406,3 +415,5 @@ extern void sdhci_remove_host(struct sdh
+ extern int sdhci_suspend_host(struct sdhci_host *host, pm_message_t state);
+ extern int sdhci_resume_host(struct sdhci_host *host);
+ #endif
++
++#endif /* __SDHCI_H */
+Index: arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- arch/arm/mach-mx3/pcm043.c.orig
++++ arch/arm/mach-mx3/pcm043.c
+@@ -279,6 +279,34 @@ static struct pad_desc pcm043_pads[] = {
+         MX35_PAD_SD2_DATA1__GPIO2_3,
+   	MX35_PAD_TX5_RX0__CAN2_TXCAN,
+   	MX35_PAD_TX4_RX1__CAN2_RXCAN,
++       /* esdhc */
++        MX35_PAD_SD1_CMD__ESDHC1_CMD,
++        MX35_PAD_SD1_CLK__ESDHC1_CLK,
++        MX35_PAD_SD1_DATA0__ESDHC1_DAT0,
++        MX35_PAD_SD1_DATA1__ESDHC1_DAT1,
++        MX35_PAD_SD1_DATA2__ESDHC1_DAT2,
++        MX35_PAD_SD1_DATA3__ESDHC1_DAT3,
++};
++
++#include <linux/mmc/host.h>
++
++static struct resource sdhci_resources[] = {
++       {
++               .start          = 0x53fb4000,
++               .end            = 0x53fb4000 + 0xff,
++               .flags          = IORESOURCE_MEM,
++       }, {
++               .start          = MX35_INT_MMC_SDHC1,
++               .end            = MX35_INT_MMC_SDHC1,
++               .flags          = IORESOURCE_IRQ,
++       },
++};
++
++static struct platform_device sdhci_device = {
++       .name           = "sdhci-esdhc",
++       .id             = 0,
++       .num_resources  = ARRAY_SIZE(sdhci_resources),
++       .resource       = sdhci_resources,
+ };
+ 
+ static int pcm043_usbh1_init(struct platform_device *pdev)
+@@ -516,6 +544,8 @@ static void __init mxc_board_init(void)
+         gpio_request (32 + 3, "can");
+         gpio_direction_output (32 + 3, 1);
+         gpio_set_value (32 + 3, 1);
++
++        platform_device_register(&sdhci_device);
+ }
+ 
+ static void __init pcm043_timer_init(void)
diff --git a/recipes/linux/linux-2.6.31/pcm043/fix_can.patch b/recipes/linux/linux-2.6.31/pcm043/fix_can.patch
new file mode 100644
index 0000000..c8ca166
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/fix_can.patch
@@ -0,0 +1,16 @@
+Fix problem with send and recive of can packets.
+
+Signed-off-by: Teresa Gámez <t.gamez@phytec.de>
+---
+Index: linux-2.6.31.6/drivers/net/can/flexcan/drv.c
+===================================================================
+--- linux-2.6.31.6.orig/drivers/net/can/flexcan/drv.c	2010-09-16 14:35:16.596367462 +0200
++++ linux-2.6.31.6/drivers/net/can/flexcan/drv.c	2010-09-16 14:36:07.946447792 +0200
+@@ -136,7 +136,6 @@
+ 		reg &= ~__MCR_AEN;
+ 
+ 	reg |= (flexcan->maxmb << __MCR_MAX_MB_OFFSET);
+-	reg |= __MCR_DOZE | __MCR_MAX_IDAM_C;
+ 	__raw_writel(reg, flexcan->io_base + CAN_HW_REG_MCR);
+ }
+ 
diff --git a/recipes/linux/linux-2.6.31/pcm043/fix_clock_calc.patch b/recipes/linux/linux-2.6.31/pcm043/fix_clock_calc.patch
new file mode 100644
index 0000000..244ab06
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/fix_clock_calc.patch
@@ -0,0 +1,27 @@
+Fix claculation, if "ARM sel" is set a 532Mhz PLL result to a 399MHz ARM clock
+Also th AHB clock is based on this ARM clock
+
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+Index: linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/clock-imx35.c	2009-12-15 13:15:35.335242329 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c	2009-12-15 13:17:59.496030198 +0100
+@@ -155,7 +155,7 @@
+ 
+ 	aad = &clk_consumer[(pdr0 >> 16) & 0xf];
+ 	if (aad->sel)
+-		fref = fref * 2 / 3;
++		fref = fref * 3 / 4;
+ 
+ 	return fref / aad->arm;
+ }
+@@ -164,7 +164,7 @@
+ {
+ 	unsigned long pdr0 = __raw_readl(CCM_BASE + CCM_PDR0);
+ 	struct arm_ahb_div *aad;
+-	unsigned long fref = get_rate_mpll();
++	unsigned long fref = get_rate_arm();
+ 
+ 	aad = &clk_consumer[(pdr0 >> 16) & 0xf];
+ 
diff --git a/recipes/linux/linux-2.6.31/pcm043/fix_max7301.patch b/recipes/linux/linux-2.6.31/pcm043/fix_max7301.patch
new file mode 100644
index 0000000..a6854e1
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/fix_max7301.patch
@@ -0,0 +1,28 @@
+Fix wrong setting of portconfig register.
+mask size is 2bits, so shift must be twice offset
+direction input value is 2
+
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+Index: linux-2.6.28/drivers/gpio/max7301.c
+===================================================================
+--- linux-2.6.28.orig/drivers/gpio/max7301.c
++++ linux-2.6.28/drivers/gpio/max7301.c
+@@ -123,7 +123,7 @@ static int max7301_direction_input(struc
+ 
+ 	/* Standard GPIO API doesn't support pull-ups, has to be extended.
+ 	 * Hard-coding no pollup for now. */
+-	*config = (*config & ~(3 << (offset & 3))) | (1 << (offset & 3));
++	*config = (*config & ~(3 << (2*(offset & 3)))) | (2 << (2*(offset & 3)));
+ 
+ 	ret = max7301_write(ts->spi, 0x08 + (offset >> 2), *config);
+ 
+@@ -157,7 +157,7 @@ static int max7301_direction_output(stru
+ 
+ 	mutex_lock(&ts->lock);
+ 
+-	*config = (*config & ~(3 << (offset & 3))) | (1 << (offset & 3));
++	*config = (*config & ~(3 << (2*(offset & 3)))) | (1 << (2*(offset & 3)));
+ 
+ 	ret = __max7301_set(ts, offset, value);
+ 
diff --git a/recipes/linux/linux-2.6.31/pcm043/fix_mmc_for_highspeed.diff b/recipes/linux/linux-2.6.31/pcm043/fix_mmc_for_highspeed.diff
new file mode 100644
index 0000000..2f1834b
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/fix_mmc_for_highspeed.diff
@@ -0,0 +1,63 @@
+From: Wolfram Sang <w.sang@pengutronix.de>
+Subject: fix esdhc-WIP for highspeed-cards
+
+Freescale has really messed up the control register, so we have to take care
+the SDHCI-core does not accidently set standard bits which have a different
+meaning here :( Previously highspeed (not necessarily HC) cards caused
+a wrong bus-width setting.
+
+Also, mark the ADMA-engine as broken because FSL themselves don't know yet if
+it is really working. Shouldn't harm much as MX35 has just ADMA1 anyway.
+
+Furthermore, disable multi-block accesses. This might affect the throughput,
+but this part seems to be broken, too, according to the errata. We better play
+safe here, it really helps with some cards.
+
+Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
+---
+ drivers/mmc/host/sdhci-esdhc.c |   11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+Index: linux-2.6.31.6/drivers/mmc/host/sdhci-esdhc.c
+===================================================================
+--- linux-2.6.31.6.orig/drivers/mmc/host/sdhci-esdhc.c	2010-09-13 11:13:43.476519017 +0200
++++ linux-2.6.31.6/drivers/mmc/host/sdhci-esdhc.c	2010-09-13 11:13:43.496492387 +0200
+@@ -34,6 +34,7 @@
+ #define ESDHC_CLOCK_HCKEN	0x00000002
+ #define ESDHC_CLOCK_IPGEN	0x00000001
+ 
++#define ESDHC_HOST_CONTROL_LE	0x20
+ #define ESDHC_HOST_CONTROL_RES	0x05
+ 
+ #ifdef CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
+@@ -127,8 +128,10 @@
+ 		/* FSL put the DMA bits there, so skip :( */
+ 		return;
+ 	case SDHCI_HOST_CONTROL:
+-		val &= 0x07;
+-		val |= 0x20;
++		/* FSL really messed up here, so we can just keep those */
++		val &= SDHCI_CTRL_LED | SDHCI_CTRL_4BITBUS;
++		/* and ensure the endianess */
++		val |= ESDHC_HOST_CONTROL_LE;
+ 		break;
+ 	}
+ 	esdhc_clrset_le(host, 0xff, val, reg);
+@@ -163,7 +166,7 @@
+ 
+ 	temp = sdhci_readl(host, ESDHC_SYSTEM_CONTROL);
+ 	temp |= (ESDHC_CLOCK_IPGEN | ESDHC_CLOCK_HCKEN | ESDHC_CLOCK_PEREN |
+-		  div << ESDHC_DIVIDER_SHIFT | pre_div << ESDHC_PREDIV_SHIFT);
++		  (div << ESDHC_DIVIDER_SHIFT) | (pre_div << ESDHC_PREDIV_SHIFT));
+ 	sdhci_writel(host, temp, ESDHC_SYSTEM_CONTROL);
+ 	mdelay(100);
+ out:
+@@ -193,6 +196,8 @@
+ 		  SDHCI_QUIRK_PIO_NEEDS_DELAY |
+ 		  SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET |
+ 		   SDHCI_QUIRK_BROKEN_TIMEOUT_VAL |
++		  SDHCI_QUIRK_NO_MULTIBLOCK |
++		  SDHCI_QUIRK_BROKEN_ADMA |
+ 		  SDHCI_QUIRK_NO_CARD_NO_RESET,
+ 	.ops = {
+ #ifdef CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
diff --git a/recipes/linux/linux-2.6.31/pcm043/fix_oob_layout.diff b/recipes/linux/linux-2.6.31/pcm043/fix_oob_layout.diff
new file mode 100644
index 0000000..d8e1b1d
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/fix_oob_layout.diff
@@ -0,0 +1,67 @@
+---
+ drivers/mtd/nand/mxc_nand_v2.c |   24 +++++++++++++++++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+Index: drivers/mtd/nand/mxc_nand_v2.c
+===================================================================
+--- drivers/mtd/nand/mxc_nand_v2.c.orig
++++ drivers/mtd/nand/mxc_nand_v2.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright 2004-2008 Freescale Semiconductor, Inc. All Rights Reserved.
+  * Copyright 2009 Sascha Hauer, kernel@pengutronix.de
++ * Copyright 2009 Juergen Beisert, kernel@pengutronix.de
+  *
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU General Public License
+@@ -130,6 +131,19 @@ struct mxc_nand_host {
+  *      User             ECC
+  *
+  * For pages larger than 512 bytes, n structures of this type will be used.
++ *
++ * Bad block detection:
++ * As long we do not overwrite the badblock_pattern structure member, the
++ * framework will use the description 'smallpage_flashbased' in file
++ * nand_bbt.c for page sizes with 512 bytes and description
++ * 'largepage_flashbased' in the same file for page sizes larger than
++ * 512 bytes.
++ *
++ * 'smallpage_flashbased' describes the bad block marker in the byte at offset
++ * five, 'largepage_flashbased' describes theses markers at offset 0 and 1
++ * in the OOB.
++ *
++ * So, we must keep these bytes free for bad block marker usage.
+  */
+ 
+ /* OOB description for 512 byte pages with 16 byte OOB */
+@@ -139,7 +153,9 @@ static struct nand_ecclayout nand_hw_ecc
+ 		 7,  8,  9, 10, 11, 12, 13, 14, 15
+ 	},
+ 	.oobfree = {
+-		{.offset = 0, .length = 7}
++		{.offset = 0, .length = 5},
++		/* keep offset 5 free for bad block marker usage */
++		{.offset = 6, .length = 1}
+ 	}
+ };
+ 
+@@ -153,7 +169,8 @@ static struct nand_ecclayout nand_hw_ecc
+ 		55, 56, 57, 58, 59, 60, 61, 62, 63
+ 	},
+ 	.oobfree = {
+-		{.offset = 0, .length = 7},
++		/* keep offset 0,1 free for bad block marker usage */
++		{.offset = 2, .length = 5},
+ 		{.offset = 16, .length = 7},
+ 		{.offset = 32, .length = 7},
+ 		{.offset = 48, .length = 7}
+@@ -175,7 +192,8 @@ static struct nand_ecclayout nand_hw_ecc
+ /*		119, 120, 121, 122, 123, 124, 125, 126, 127 */
+ 	},
+ 	.oobfree = {
+-		{.offset = 0, .length = 7},
++		/* keep offset 0,1 free for bad block marker usage */
++		{.offset = 2, .length = 5},
+ 		{.offset = 16, .length = 7},
+ 		{.offset = 32, .length = 7},
+ 		{.offset = 48, .length = 7},
diff --git a/recipes/linux/linux-2.6.31/pcm043/fix_owire_clk.patch b/recipes/linux/linux-2.6.31/pcm043/fix_owire_clk.patch
new file mode 100644
index 0000000..4d50ab4
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/fix_owire_clk.patch
@@ -0,0 +1,17 @@
+Fix the owire_clk dev_id
+
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+Index: linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/clock-imx35.c	2009-12-14 16:50:18.915973719 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c	2009-12-14 16:51:06.835549332 +0100
+@@ -453,7 +453,7 @@
+ 	_REGISTER_CLOCK(NULL, "kpp", kpp_clk)
+ 	_REGISTER_CLOCK(NULL, "mlb", mlb_clk)
+ 	_REGISTER_CLOCK(NULL, "mshc", mshc_clk)
+-	_REGISTER_CLOCK("mxc_w1", NULL, owire_clk)
++	_REGISTER_CLOCK("mxc_w1.0", NULL, owire_clk)
+ 	_REGISTER_CLOCK(NULL, "pwm", pwm_clk)
+ 	_REGISTER_CLOCK(NULL, "rngc", rngc_clk)
+ 	_REGISTER_CLOCK(NULL, "rtc", rtc_clk)
diff --git a/recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-flexcan.patch b/recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-flexcan.patch
new file mode 100644
index 0000000..a3c37cb
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-flexcan.patch
@@ -0,0 +1,2168 @@
+Add support for i.MX35 on-board CAN
+Signed-off-by: Sven Dyroff <s.dyroff@phytec.de>
+---
+Index: linux-2.6.31.6/drivers/net/can/flexcan/Makefile
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/net/can/flexcan/Makefile	2009-12-16 17:34:40.585687608 +0100
+@@ -0,0 +1,3 @@
++obj-$(CONFIG_CAN_FLEXCAN)	+= flexcan.o
++
++flexcan-y := dev.o drv.o mbm.o
+Index: linux-2.6.31.6/drivers/net/can/flexcan/dev.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/net/can/flexcan/dev.c	2009-12-16 17:34:40.585687608 +0100
+@@ -0,0 +1,675 @@
++/*
++ * Copyright 2008 Freescale Semiconductor, Inc. All Rights Reserved.
++ */
++
++/*
++ * The code contained herein is licensed under the GNU General Public
++ * License. You may obtain a copy of the GNU General Public License
++ * Version 2 or later at the following locations:
++ *
++ * http://www.opensource.org/licenses/gpl-license.html
++ * http://www.gnu.org/copyleft/gpl.html
++ */
++
++/*!
++ * @file dev.c
++ *
++ * @brief Driver for Freescale CAN Controller FlexCAN.
++ *
++ * @ingroup can
++ */
++#include <linux/kernel.h>
++#include <linux/string.h>
++#include <linux/errno.h>
++#include <linux/unistd.h>
++#include <linux/init.h>
++#include <linux/delay.h>
++#include <linux/netdevice.h>
++#include <linux/spinlock.h>
++#include <linux/device.h>
++
++#include <linux/module.h>
++#include "flexcan.h"
++
++enum {
++//	FLEXCAN_ATTR_STATE = 0,
++//	FLEXCAN_ATTR_BITRATE,
++//	FLEXCAN_ATTR_BR_PRESDIV,
++//	FLEXCAN_ATTR_BR_RJW,
++//	FLEXCAN_ATTR_BR_PROPSEG,    ~~~~~sven~~~~~
++//	FLEXCAN_ATTR_BR_PSEG1,
++//	FLEXCAN_ATTR_BR_PSEG2,
++	FLEXCAN_ATTR_BR_CLKSRC = 0,
++	FLEXCAN_ATTR_MAXMB,
++	FLEXCAN_ATTR_XMIT_MAXMB,
++	FLEXCAN_ATTR_FIFO,
++	FLEXCAN_ATTR_WAKEUP,
++	FLEXCAN_ATTR_SRX_DIS,
++	FLEXCAN_ATTR_WAK_SRC,
++	FLEXCAN_ATTR_BCC,
++	FLEXCAN_ATTR_LOCAL_PRIORITY,
++	FLEXCAN_ATTR_ABORT,
++	FLEXCAN_ATTR_LOOPBACK,
++	FLEXCAN_ATTR_SMP,
++	FLEXCAN_ATTR_BOFF_REC,
++	FLEXCAN_ATTR_TSYN,
++	FLEXCAN_ATTR_LISTEN,
++	FLEXCAN_ATTR_EXTEND_MSG,
++	FLEXCAN_ATTR_STANDARD_MSG,
++#ifdef CONFIG_CAN_DEBUG_DEVICES
++	FLEXCAN_ATTR_DUMP_REG,
++	FLEXCAN_ATTR_DUMP_XMIT_MB,
++	FLEXCAN_ATTR_DUMP_RX_MB,
++#endif
++	FLEXCAN_ATTR_MAX
++};
++
++static ssize_t flexcan_show_attr(struct device *dev,
++				 struct device_attribute *attr, char *buf);
++static ssize_t flexcan_set_attr(struct device *dev,
++				struct device_attribute *attr, const char *buf,
++				size_t count);
++
++static struct device_attribute flexcan_dev_attr[FLEXCAN_ATTR_MAX] = {
++/*  ~~~~~sven~~~~~
++	[FLEXCAN_ATTR_STATE] = __ATTR(state, 0444, flexcan_show_attr, NULL),
++	[FLEXCAN_ATTR_BITRATE] =
++	    __ATTR(bitrate, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BR_PRESDIV] =
++	    __ATTR(br_presdiv, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BR_RJW] =
++	    __ATTR(br_rjw, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BR_PROPSEG] =
++	    __ATTR(br_propseg, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BR_PSEG1] =
++	    __ATTR(br_pseg1, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BR_PSEG2] =
++	    __ATTR(br_pseg2, 0644, flexcan_show_attr, flexcan_set_attr),
++*/
++	[FLEXCAN_ATTR_BR_CLKSRC] =
++	    __ATTR(br_clksrc, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_MAXMB] =
++	    __ATTR(maxmb, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_XMIT_MAXMB] =
++	    __ATTR(xmit_maxmb, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_FIFO] =
++	    __ATTR(fifo, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_WAKEUP] =
++	    __ATTR(wakeup, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_SRX_DIS] =
++	    __ATTR(srx_dis, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_WAK_SRC] =
++	    __ATTR(wak_src, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BCC] =
++	    __ATTR(bcc, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_LOCAL_PRIORITY] =
++	    __ATTR(local_priority, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_ABORT] =
++	    __ATTR(abort, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_LOOPBACK] =
++	    __ATTR(loopback, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_SMP] =
++	    __ATTR(smp, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_BOFF_REC] =
++	    __ATTR(boff_rec, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_TSYN] =
++	    __ATTR(tsyn, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_LISTEN] =
++	    __ATTR(listen, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_EXTEND_MSG] =
++	    __ATTR(ext_msg, 0644, flexcan_show_attr, flexcan_set_attr),
++	[FLEXCAN_ATTR_STANDARD_MSG] =
++	    __ATTR(std_msg, 0644, flexcan_show_attr, flexcan_set_attr),
++#ifdef CONFIG_CAN_DEBUG_DEVICES
++	[FLEXCAN_ATTR_DUMP_REG] =
++	    __ATTR(dump_reg, 0444, flexcan_show_attr, NULL),
++	[FLEXCAN_ATTR_DUMP_XMIT_MB] =
++	    __ATTR(dump_xmit_mb, 0444, flexcan_show_attr, NULL),
++	[FLEXCAN_ATTR_DUMP_RX_MB] =
++	    __ATTR(dump_rx_mb, 0444, flexcan_show_attr, NULL),
++#endif
++};
++
++//~~~~~~~~~~~~~~sven~~~~~~~~~~~~~~~~
++// static void flexcan_set_bitrate (struct flexcan_device *flexcan, int bitrate) {
++	/* TODO:: implement in future
++	 * based on the bitrate to get the timing of
++	 * presdiv, pseg1, pseg2, propseg
++	 */
++//}
++/*
++static void flexcan_update_bitrate (struct flexcan_device *flexcan) {
++        struct can_priv *priv = (can_priv *) flexcan;
++        struct can_bittiming *bt = &priv -> bittiming;
++
++        int rate, div;
++
++        if (flexcan -> br_clksrc)
++                rate = clk_get_rate (flexcan -> clk);
++        else {
++                struct clk *clk;
++                clk = clk_get (NULL, "ckih");
++                if (!clk)
++                        return;
++                rate = clk_get_rate (clk);
++                clk_put (clk);
++        }
++        if (!rate)
++                return;
++
++        div = (bt -> tq + 1);
++        div *= (bt -> prop_seg + bt -> phase_seg1 + bt -> phase_seg2 + 4);
++        bt -> bitrate = (rate + div - 1) / div;
++}
++*/
++//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++#ifdef CONFIG_CAN_DEBUG_DEVICES
++static int flexcan_dump_reg(struct flexcan_device *flexcan, char *buf)
++{
++	int ret = 0;
++	unsigned int reg;
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	ret += sprintf(buf + ret, "MCR::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_CTRL);
++	ret += sprintf(buf + ret, "CTRL::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_RXGMASK);
++	ret += sprintf(buf + ret, "RXGMASK::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_RX14MASK);
++	ret += sprintf(buf + ret, "RX14MASK::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_RX15MASK);
++	ret += sprintf(buf + ret, "RX15MASK::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_ECR);
++	ret += sprintf(buf + ret, "ECR::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_ESR);
++	ret += sprintf(buf + ret, "ESR::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_IMASK2);
++	ret += sprintf(buf + ret, "IMASK2::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_IMASK1);
++	ret += sprintf(buf + ret, "IMASK1::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_IFLAG2);
++	ret += sprintf(buf + ret, "IFLAG2::0x%x\n", reg);
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_IFLAG1);
++	ret += sprintf(buf + ret, "IFLAG1::0x%x\n", reg);
++	return ret;
++}
++
++static int flexcan_dump_xmit_mb(struct flexcan_device *flexcan, char *buf)
++{
++	int ret = 0, i;
++	i = flexcan->xmit_maxmb + 1;
++	for (; i <= flexcan->maxmb; i++)
++		ret +=
++		    sprintf(buf + ret,
++			    "mb[%d]::CS:0x%x ID:0x%x DATA[1~2]:0x%02x,0x%02x\n",
++			    i, flexcan->hwmb[i].mb_cs.data,
++			    flexcan->hwmb[i].mb_id, flexcan->hwmb[i].mb_data[1],
++			    flexcan->hwmb[i].mb_data[2]);
++	return ret;
++}
++
++static int flexcan_dump_rx_mb(struct flexcan_device *flexcan, char *buf)
++{
++	int ret = 0, i;
++	for (i = 0; i <= flexcan->xmit_maxmb; i++)
++		ret +=
++		    sprintf(buf + ret,
++			    "mb[%d]::CS:0x%x ID:0x%x DATA[1~2]:0x%02x,0x%02x\n",
++			    i, flexcan->hwmb[i].mb_cs.data,
++			    flexcan->hwmb[i].mb_id, flexcan->hwmb[i].mb_data[1],
++			    flexcan->hwmb[i].mb_data[2]);
++	return ret;
++}
++#endif
++
++//~~~~~~~~~~sven~~~~~~~~~
++static int flexcan_get_state (struct net_device *net, enum can_state *state) {
++        struct flexcan_device *flexcan = netdev_priv (net);
++        int esr;
++
++        *state = (netif_running (net) ? CAN_STATE_ERROR_ACTIVE : CAN_STATE_STOPPED);
++        if (netif_carrier_ok (net)) {
++                esr = __raw_readl (flexcan -> io_base + CAN_HW_REG_ESR);
++                switch ((esr & __ESR_FLT_CONF_MASK) >> __ESR_FLT_CONF_OFF) {
++                        case 0: break;
++                        case 1: *state = CAN_STATE_ERROR_PASSIVE; break;
++                        default: *state = CAN_STATE_BUS_OFF;
++                }
++        } else
++                *state = CAN_STATE_BUS_OFF;
++
++        return 0;
++}
++//~~~~~~~~~~~~~~~~~~~~~~~
++
++static ssize_t flexcan_show_attr(struct device *dev,
++				 struct device_attribute *attr, char *buf)
++{
++	int attr_id;
++	struct net_device *net;
++	struct flexcan_device *flexcan;
++
++	net = dev_get_drvdata(dev);
++	BUG_ON(!net);
++	flexcan = netdev_priv(net);
++	BUG_ON(!flexcan);
++
++	attr_id = attr - flexcan_dev_attr;
++	switch (attr_id) {
++/*    ~~~~~sven~~~~~
++	case FLEXCAN_ATTR_STATE:
++		return flexcan_show_state(net, buf);
++	case FLEXCAN_ATTR_BITRATE:
++		return sprintf(buf, "%d\n", flexcan->bitrate);
++	case FLEXCAN_ATTR_BR_PRESDIV:
++		return sprintf(buf, "%d\n", flexcan->br_presdiv + 1);
++	case FLEXCAN_ATTR_BR_RJW:
++		return sprintf(buf, "%d\n", flexcan->br_rjw);
++	case FLEXCAN_ATTR_BR_PROPSEG:
++		return sprintf(buf, "%d\n", flexcan->br_propseg + 1);
++	case FLEXCAN_ATTR_BR_PSEG1:
++		return sprintf(buf, "%d\n", flexcan->br_pseg1 + 1);
++	case FLEXCAN_ATTR_BR_PSEG2:
++		return sprintf(buf, "%d\n", flexcan->br_pseg2 + 1);
++*/
++	case FLEXCAN_ATTR_BR_CLKSRC:
++		return sprintf(buf, "%s\n", flexcan->br_clksrc ? "bus" : "osc");
++	case FLEXCAN_ATTR_MAXMB:
++		return sprintf(buf, "%d\n", flexcan->maxmb + 1);
++	case FLEXCAN_ATTR_XMIT_MAXMB:
++		return sprintf(buf, "%d\n", flexcan->xmit_maxmb + 1);
++	case FLEXCAN_ATTR_FIFO:
++		return sprintf(buf, "%d\n", flexcan->fifo);
++	case FLEXCAN_ATTR_WAKEUP:
++		return sprintf(buf, "%d\n", flexcan->wakeup);
++	case FLEXCAN_ATTR_SRX_DIS:
++		return sprintf(buf, "%d\n", flexcan->srx_dis);
++	case FLEXCAN_ATTR_WAK_SRC:
++		return sprintf(buf, "%d\n", flexcan->wak_src);
++	case FLEXCAN_ATTR_BCC:
++		return sprintf(buf, "%d\n", flexcan->bcc);
++	case FLEXCAN_ATTR_LOCAL_PRIORITY:
++		return sprintf(buf, "%d\n", flexcan->lprio);
++	case FLEXCAN_ATTR_ABORT:
++		return sprintf(buf, "%d\n", flexcan->abort);
++	case FLEXCAN_ATTR_LOOPBACK:
++		return sprintf(buf, "%d\n", flexcan->loopback);
++	case FLEXCAN_ATTR_SMP:
++		return sprintf(buf, "%d\n", flexcan->smp);
++	case FLEXCAN_ATTR_BOFF_REC:
++		return sprintf(buf, "%d\n", flexcan->boff_rec);
++	case FLEXCAN_ATTR_TSYN:
++		return sprintf(buf, "%d\n", flexcan->tsyn);
++	case FLEXCAN_ATTR_LISTEN:
++		return sprintf(buf, "%d\n", flexcan->listen);
++	case FLEXCAN_ATTR_EXTEND_MSG:
++		return sprintf(buf, "%d\n", flexcan->ext_msg);
++	case FLEXCAN_ATTR_STANDARD_MSG:
++		return sprintf(buf, "%d\n", flexcan->std_msg);
++#ifdef CONFIG_CAN_DEBUG_DEVICES
++	case FLEXCAN_ATTR_DUMP_REG:
++		return flexcan_dump_reg(flexcan, buf);
++	case FLEXCAN_ATTR_DUMP_XMIT_MB:
++		return flexcan_dump_xmit_mb(flexcan, buf);
++	case FLEXCAN_ATTR_DUMP_RX_MB:
++		return flexcan_dump_rx_mb(flexcan, buf);
++#endif
++	default:
++		return sprintf(buf, "%s:%p->%p\n", __func__, flexcan_dev_attr,
++			       attr);
++	}
++}
++
++static ssize_t flexcan_set_attr(struct device *dev,
++				struct device_attribute *attr, const char *buf,
++				size_t count)
++{
++	int attr_id, tmp;
++	struct net_device *net;
++	struct flexcan_device *flexcan;
++
++	net = dev_get_drvdata(dev);
++	BUG_ON(!net);
++	flexcan = netdev_priv(net);
++	BUG_ON(!flexcan);
++
++	attr_id = attr - flexcan_dev_attr;
++
++	if (mutex_lock_interruptible(&flexcan->mutex))
++		return count;
++
++	if (netif_running(net))
++		goto set_finish;
++
++	if (attr_id == FLEXCAN_ATTR_BR_CLKSRC) {
++		if (!strcasecmp(buf, "bus"))
++			flexcan->br_clksrc = 1;
++		else if (!strcasecmp(buf, "osc"))
++			flexcan->br_clksrc = 0;
++		goto set_finish;
++	}
++
++	tmp = simple_strtoul(buf, NULL, 0);
++	switch (attr_id) {
++/*    ~~~~~sven~~~~~
++	case FLEXCAN_ATTR_BITRATE:
++		flexcan_set_bitrate(flexcan, tmp);
++		break;
++	case FLEXCAN_ATTR_BR_PRESDIV:
++		if ((tmp > 0) && (tmp <= FLEXCAN_MAX_PRESDIV)) {
++			flexcan->br_presdiv = tmp - 1;
++			flexcan_update_bitrate(flexcan);
++		}
++		break;
++	case FLEXCAN_ATTR_BR_RJW:
++		if ((tmp > 0) && (tmp <= FLEXCAN_MAX_RJW))
++			flexcan->br_rjw = tmp - 1;
++		break;
++	case FLEXCAN_ATTR_BR_PROPSEG:
++		if ((tmp > 0) && (tmp <= FLEXCAN_MAX_PROPSEG)) {
++			flexcan->br_propseg = tmp - 1;
++			flexcan_update_bitrate(flexcan);
++		}
++		break;
++	case FLEXCAN_ATTR_BR_PSEG1:
++		if ((tmp > 0) && (tmp <= FLEXCAN_MAX_PSEG1)) {
++			flexcan->br_pseg1 = tmp - 1;
++			flexcan_update_bitrate(flexcan);
++		}
++		break;
++	case FLEXCAN_ATTR_BR_PSEG2:
++		if ((tmp > 0) && (tmp <= FLEXCAN_MAX_PSEG2)) {
++			flexcan->br_pseg2 = tmp - 1;
++			flexcan_update_bitrate(flexcan);
++		}
++		break;
++*/
++	case FLEXCAN_ATTR_MAXMB:
++		if ((tmp > 0) && (tmp <= FLEXCAN_MAX_MB)) {
++			if (flexcan->maxmb != (tmp - 1)) {
++				flexcan->maxmb = tmp - 1;
++				if (flexcan->xmit_maxmb < flexcan->maxmb)
++					flexcan->xmit_maxmb = flexcan->maxmb;
++			}
++		}
++		break;
++	case FLEXCAN_ATTR_XMIT_MAXMB:
++		if ((tmp > 0) && (tmp <= (flexcan->maxmb + 1))) {
++			if (flexcan->xmit_maxmb != (tmp - 1))
++				flexcan->xmit_maxmb = tmp - 1;
++		}
++		break;
++	case FLEXCAN_ATTR_FIFO:
++		flexcan->fifo = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_WAKEUP:
++		flexcan->wakeup = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_SRX_DIS:
++		flexcan->srx_dis = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_WAK_SRC:
++		flexcan->wak_src = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_BCC:
++		flexcan->bcc = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_LOCAL_PRIORITY:
++		flexcan->lprio = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_ABORT:
++		flexcan->abort = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_LOOPBACK:
++		flexcan->loopback = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_SMP:
++		flexcan->smp = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_BOFF_REC:
++		flexcan->boff_rec = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_TSYN:
++		flexcan->tsyn = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_LISTEN:
++		flexcan->listen = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_EXTEND_MSG:
++		flexcan->ext_msg = tmp ? 1 : 0;
++		break;
++	case FLEXCAN_ATTR_STANDARD_MSG:
++		flexcan->std_msg = tmp ? 1 : 0;
++		break;
++	}
++      set_finish:
++	mutex_unlock(&flexcan->mutex);
++	return count;
++}
++
++static void flexcan_device_default(struct flexcan_device *dev)
++{
++	dev->br_clksrc = 1;
++//        dev->br_rjw = 2;         ~~~~~sven~~~~~
++//        dev->br_presdiv = 6;     ~~~~~sven~~~~~
++//        dev->br_propseg = 4;     ~~~~~sven~~~~~
++//        dev->br_pseg1 = 4;       ~~~~~sven~~~~~
++//        dev->br_pseg2 = 7;       ~~~~~sven~~~~~
++
++	dev->bcc = 1;
++	dev->srx_dis = 1;
++	dev->smp = 1;
++	dev->boff_rec = 1;
++
++	dev->maxmb = FLEXCAN_MAX_MB - 1;
++	dev->xmit_maxmb = (FLEXCAN_MAX_MB >> 1) - 1;
++	dev->xmit_mb = dev->maxmb - dev->xmit_maxmb;
++
++	dev->ext_msg = 1;
++	dev->std_msg = 1;
++}
++
++static int flexcan_device_attach(struct flexcan_device *flexcan)
++{
++	int ret;
++	struct resource *res;
++#ifdef REGULATOR
++	struct platform_device *pdev = flexcan->dev;
++	struct flexcan_platform_data *plat_data = (pdev->dev).platform_data;
++#endif
++
++	res = platform_get_resource(flexcan->dev, IORESOURCE_MEM, 0);
++	if (!res)
++		return -ENODEV;
++
++	flexcan->io_base = ioremap(res->start, res->end - res->start + 1);
++	if (!flexcan->io_base)
++		return -ENOMEM;
++
++	flexcan->irq = platform_get_irq(flexcan->dev, 0);
++	if (!flexcan->irq) {
++		ret = -ENODEV;
++		goto no_irq_err;
++	}
++
++	ret = -EINVAL;
++#ifdef REGULATOR
++	if (plat_data) {
++		if (plat_data->core_reg) {
++			flexcan->core_reg = regulator_get(&pdev->dev,
++							  plat_data->core_reg);
++			if (!flexcan->core_reg)
++				goto plat_err;
++		}
++
++		if (plat_data->io_reg) {
++			flexcan->io_reg = regulator_get(&pdev->dev,
++							plat_data->io_reg);
++			if (!flexcan->io_reg)
++				goto plat_err;
++		}
++	}
++#endif
++	flexcan->clk = clk_get(&(flexcan->dev)->dev, "can_clk");
++	flexcan->hwmb = (struct can_hw_mb *)(flexcan->io_base + CAN_MB_BASE);
++	flexcan->rx_mask = (unsigned int *)(flexcan->io_base + CAN_RXMASK_BASE);
++	return 0;
++
++#ifdef REGULATOR
++      plat_err:
++	if (flexcan->core_reg) {
++		regulator_put(flexcan->core_reg, &pdev->dev);
++		flexcan->core_reg = NULL;
++	}
++#endif
++
++      no_irq_err:
++	if (flexcan->io_base)
++		iounmap(flexcan->io_base);
++	return ret;
++}
++
++static void flexcan_device_detach(struct flexcan_device *flexcan)
++{
++#ifdef REGULATOR
++	struct platform_device *pdev = flexcan->dev;
++#endif
++	if (flexcan->clk) {
++		clk_put(flexcan->clk);
++		flexcan->clk = NULL;
++	}
++#ifdef REGULATOR
++	if (flexcan->io_reg) {
++		regulator_put(flexcan->io_reg, &pdev->dev);
++		flexcan->io_reg = NULL;
++	}
++
++	if (flexcan->core_reg) {
++		regulator_put(flexcan->core_reg, &pdev->dev);
++		flexcan->core_reg = NULL;
++	}
++#endif
++
++	if (flexcan->io_base)
++		iounmap(flexcan->io_base);
++}
++
++
++//~~~~~~~~~~~~~~sven~~~~~~~~~~~~~~~~
++static struct can_bittiming_const flexcan_bittiming_const = {
++  .tseg1_min = 4,
++  .tseg1_max = 16,
++  .tseg2_min = 2,
++  .tseg2_max = 8,
++  .sjw_max = 4,
++  .brp_min = 1,
++  .brp_max = 256,
++  .brp_inc = 1,
++};
++//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++
++/*!
++ * @brief The function allocates can device.
++ *
++ * @param pdev	the pointer of platform device.
++ * @param setup	the initial function pointer of network device.
++ *
++ * @return none
++ */
++struct net_device *flexcan_device_alloc(struct platform_device *pdev,
++					void (*setup) (struct net_device *dev))
++{
++	struct flexcan_device *flexcan;
++	struct net_device *net;
++	int i, num;
++
++	net = alloc_netdev(sizeof(*flexcan), "can%d", setup);
++	if (net == NULL) {
++		printk(KERN_ERR "Allocate netdevice for FlexCAN fail!\n");
++		return NULL;
++	}
++	flexcan = netdev_priv(net);
++	memset(flexcan, 0, sizeof(*flexcan));
++
++	mutex_init(&flexcan->mutex);
++	init_timer(&flexcan->timer);
++
++	flexcan->dev = pdev;
++	if (flexcan_device_attach(flexcan)) {
++		printk(KERN_ERR "Attach FlexCAN fail!\n");
++		free_netdev(net);
++		return NULL;
++	}
++	flexcan_device_default(flexcan);
++//	flexcan_update_bitrate(flexcan);   ~~~~~sven~~~~~
++
++	num = ARRAY_SIZE(flexcan_dev_attr);
++
++	for (i = 0; i < num; i++) {
++		if (device_create_file(&pdev->dev, flexcan_dev_attr + i)) {
++			printk(KERN_ERR "Create attribute file fail!\n");
++			break;
++		}
++	}
++
++	if (i != num) {
++		for (; i >= 0; i--)
++			device_remove_file(&pdev->dev, flexcan_dev_attr + i);
++		free_netdev(net);
++		return NULL;
++	}
++	dev_set_drvdata(&pdev->dev, net);
++
++//~~~~~~~~~~~~~~sven~~~~~~~~~~~~~~~~
++
++        SET_NETDEV_DEV (net, &pdev -> dev);
++
++        flexcan -> can.bittiming_const = &flexcan_bittiming_const;
++        flexcan -> can.do_set_bittiming = flexcan_set_bittiming;
++        flexcan -> can.do_get_state = (void *) flexcan_get_state;
++
++        if (flexcan -> br_clksrc)
++                flexcan -> can.clock.freq = clk_get_rate (flexcan -> clk);
++        else {
++                struct clk *clk;
++                clk = clk_get (NULL, "ckih");
++                if (clk) {
++                        flexcan -> can.clock.freq = clk_get_rate (clk);
++                        clk_put (clk);
++                }
++        }
++
++        flexcan -> can.state = CAN_STATE_STOPPED;   // !!! Nur provisorisch !!!
++
++//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++	return net;
++}
++
++/*!
++ * @brief The function frees can device.
++ *
++ * @param pdev	the pointer of platform device.
++ *
++ * @return none
++ */
++void flexcan_device_free(struct platform_device *pdev)
++{
++	struct net_device *net;
++	struct flexcan_device *flexcan;
++	int i, num;
++	net = (struct net_device *)dev_get_drvdata(&pdev->dev);
++
++	unregister_candev(net);   // ~~~~~sven~~~~~
++	flexcan = netdev_priv(net);
++	del_timer(&flexcan->timer);
++
++	num = ARRAY_SIZE(flexcan_dev_attr);
++
++	for (i = 0; i < num; i++)
++		device_remove_file(&pdev->dev, flexcan_dev_attr + i);
++
++	flexcan_device_detach(netdev_priv(net));
++	free_netdev(net);
++}
+Index: linux-2.6.31.6/drivers/net/can/flexcan/drv.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/net/can/flexcan/drv.c	2009-12-16 17:34:40.585687608 +0100
+@@ -0,0 +1,657 @@
++/*
++ * Copyright 2008 Freescale Semiconductor, Inc. All Rights Reserved.
++ */
++
++/*
++ * The code contained herein is licensed under the GNU General Public
++ * License. You may obtain a copy of the GNU General Public License
++ * Version 2 or later at the following locations:
++ *
++ * http://www.opensource.org/licenses/gpl-license.html
++ * http://www.gnu.org/copyleft/gpl.html
++ */
++
++/*!
++ * @file drv.c
++ *
++ * @brief Driver for Freescale CAN Controller FlexCAN.
++ *
++ * @ingroup can
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/slab.h>
++#include <linux/netdevice.h>
++#include <linux/if_arp.h>
++#include <linux/if_ether.h>
++#include <linux/platform_device.h>
++#ifdef REGULATOR
++	#include <linux/regulator/regulator.h>
++#endif
++#include <linux/clk.h>
++
++#include <asm/io.h>
++#include <asm/irq.h>
++//#include <mach/hardware.h>	//TBD asm/hardware.h
++#include <mach/mxc_flexcan.h>
++#include "flexcan.h"
++
++static void flexcan_hw_start(struct flexcan_device *flexcan)
++{
++	unsigned int reg;
++	if ((flexcan->maxmb + 1) > 32) {
++		__raw_writel(0xFFFFFFFF, flexcan->io_base + CAN_HW_REG_IMASK1);
++		reg = (1 << (flexcan->maxmb - 31)) - 1;
++		__raw_writel(reg, flexcan->io_base + CAN_HW_REG_IMASK2);
++	} else {
++		reg = (1 << (flexcan->maxmb + 1)) - 1;
++		__raw_writel(reg, flexcan->io_base + CAN_HW_REG_IMASK1);
++		__raw_writel(0, flexcan->io_base + CAN_HW_REG_IMASK2);
++	}
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR) & (~__MCR_HALT);
++	__raw_writel(reg, flexcan->io_base + CAN_HW_REG_MCR);
++}
++
++static void flexcan_hw_stop(struct flexcan_device *flexcan)
++{
++	unsigned int reg;
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	__raw_writel(reg | __MCR_HALT, flexcan->io_base + CAN_HW_REG_MCR);
++}
++
++static int flexcan_hw_reset(struct flexcan_device *flexcan)
++{
++	unsigned int reg;
++	int timeout = 100000;
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	__raw_writel(reg | __MCR_MDIS, flexcan->io_base + CAN_HW_REG_MCR);
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_CTRL);
++	if (flexcan->br_clksrc)
++		reg |= __CTRL_CLK_SRC;
++	else
++		reg &= ~__CTRL_CLK_SRC;
++	__raw_writel(reg, flexcan->io_base + CAN_HW_REG_CTRL);
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR) & (~__MCR_MDIS);
++	__raw_writel(reg, flexcan->io_base + CAN_HW_REG_MCR);
++	reg |= __MCR_SOFT_RST;
++	__raw_writel(reg, flexcan->io_base + CAN_HW_REG_MCR);
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	while (reg & __MCR_SOFT_RST) {
++		if (--timeout <= 0) {
++			printk(KERN_ERR "Flexcan software Reset Timeouted\n");
++			return -1;
++		}
++		udelay(10);
++		reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	}
++	return 0;
++}
++
++static inline void flexcan_mcr_setup(struct flexcan_device *flexcan)
++{
++	unsigned int reg;
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	reg &= ~(__MCR_MAX_MB_MASK | __MCR_WAK_MSK | __MCR_MAX_IDAM_MASK);
++
++	if (flexcan->fifo)
++		reg |= __MCR_FEN;
++	else
++		reg &= ~__MCR_FEN;
++
++	if (flexcan->wakeup)
++		reg |= __MCR_SLF_WAK | __MCR_WAK_MSK;
++	else
++		reg &= ~(__MCR_SLF_WAK | __MCR_WAK_MSK);
++
++	if (flexcan->wak_src)
++		reg |= __MCR_WAK_SRC;
++	else
++		reg &= ~__MCR_WAK_SRC;
++
++	if (flexcan->srx_dis)
++		reg |= __MCR_SRX_DIS;
++	else
++		reg &= ~__MCR_SRX_DIS;
++
++	if (flexcan->bcc)
++		reg |= __MCR_BCC;
++	else
++		reg &= ~__MCR_BCC;
++
++	if (flexcan->lprio)
++		reg |= __MCR_LPRIO_EN;
++	else
++		reg &= ~__MCR_LPRIO_EN;
++
++	if (flexcan->abort)
++		reg |= __MCR_AEN;
++	else
++		reg &= ~__MCR_AEN;
++
++	reg |= (flexcan->maxmb << __MCR_MAX_MB_OFFSET);
++	reg |= __MCR_DOZE | __MCR_MAX_IDAM_C;
++	__raw_writel(reg, flexcan->io_base + CAN_HW_REG_MCR);
++}
++
++//~~~~~~~~~~~~~~sven~~~~~~~~~~~~~~~~
++static inline void flexcan_ctrl_setup (struct flexcan_device *flexcan) {
++        struct can_priv *priv = (struct can_priv *) flexcan;
++        struct can_bittiming *bt = &priv -> bittiming;
++
++        unsigned int reg;
++
++        reg = __raw_readl (flexcan -> io_base + CAN_HW_REG_CTRL);
++        reg &= ~(__CTRL_PRESDIV_MASK | __CTRL_RJW_MASK | __CTRL_PSEG1_MASK |
++                 __CTRL_PSEG2_MASK | __CTRL_PROPSEG_MASK);
++
++        if (flexcan -> loopback)
++                reg |= __CTRL_LPB;
++        else
++                reg &= ~__CTRL_LPB;
++
++        if (flexcan -> smp)
++                reg |= __CTRL_SMP;
++        else
++                reg &= ~__CTRL_SMP;
++
++        if (flexcan -> boff_rec)
++                reg |= __CTRL_BOFF_REC;
++        else
++                reg &= ~__CTRL_BOFF_REC;
++
++        if (flexcan -> tsyn)
++                reg |= __CTRL_TSYN;
++        else
++                reg &= ~__CTRL_TSYN;
++
++        if (flexcan -> listen)
++                reg |= __CTRL_LOM;
++        else
++                reg &= ~__CTRL_LOM;
++
++        reg |= ((bt -> brp - 1) << __CTRL_PRESDIV_OFFSET) |
++            ((bt -> sjw - 1) << __CTRL_RJW_OFFSET) |
++            ((bt -> phase_seg1 - 1) << __CTRL_PSEG1_OFFSET) |
++            ((bt -> phase_seg2 - 1) << __CTRL_PSEG2_OFFSET) |
++            ((bt -> prop_seg - 1) << __CTRL_PROPSEG_OFFSET);
++
++        reg &= ~__CTRL_LBUF;
++
++        reg |= __CTRL_TWRN_MSK | __CTRL_RWRN_MSK | __CTRL_BOFF_MSK |
++            __CTRL_ERR_MSK;
++
++        __raw_writel (reg, flexcan -> io_base + CAN_HW_REG_CTRL);
++}
++
++int flexcan_set_bittiming (struct net_device *dev) {
++        flexcan_ctrl_setup (netdev_priv (dev));
++        return 0;
++}
++
++EXPORT_SYMBOL (flexcan_set_bittiming);
++//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++static int flexcan_hw_restart(struct net_device *dev)
++{
++	unsigned int reg;
++	struct flexcan_device *flexcan = netdev_priv(dev);
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	if (reg & __MCR_SOFT_RST)
++		return 1;
++
++	flexcan_mcr_setup(flexcan);
++
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_IMASK2);
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_IMASK1);
++
++	__raw_writel(0xFFFFFFFF, flexcan->io_base + CAN_HW_REG_IFLAG2);
++	__raw_writel(0xFFFFFFFF, flexcan->io_base + CAN_HW_REG_IFLAG1);
++
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_ECR);
++
++	flexcan_mbm_init(flexcan);
++	netif_carrier_on(dev);
++	flexcan_hw_start(flexcan);
++
++	if (netif_queue_stopped(dev))
++		netif_start_queue(dev);
++
++	return 0;
++}
++
++static void flexcan_hw_watch(unsigned long data)
++{
++	unsigned int reg, ecr;
++	struct net_device *dev = (struct net_device *)data;
++	struct flexcan_device *flexcan = dev ? netdev_priv(dev) : NULL;
++
++	BUG_ON(!flexcan);
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	if (reg & __MCR_MDIS) {
++		if (flexcan_hw_restart(dev))
++			mod_timer(&flexcan->timer, HZ / 20);
++		return;
++	}
++	ecr = __raw_readl(flexcan->io_base + CAN_HW_REG_ECR);
++	if (flexcan->boff_rec) {
++		if (((reg & __ESR_FLT_CONF_MASK) >> __ESR_FLT_CONF_OFF) > 1) {
++			reg |= __MCR_SOFT_RST;
++			__raw_writel(reg, flexcan->io_base + CAN_HW_REG_MCR);
++			mod_timer(&flexcan->timer, HZ / 20);
++			return;
++		}
++		netif_carrier_on(dev);
++	}
++}
++
++static void flexcan_hw_busoff(struct net_device *dev)
++{
++	struct flexcan_device *flexcan = netdev_priv(dev);
++	unsigned int reg;
++
++	netif_carrier_off(dev);
++
++	flexcan->timer.function = flexcan_hw_watch;
++	flexcan->timer.data = (unsigned long)dev;
++
++	if (flexcan->boff_rec) {
++		mod_timer(&flexcan->timer, HZ / 10);
++		return;
++	}
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_MCR);
++	__raw_writel(reg | __MCR_SOFT_RST, flexcan->io_base + CAN_HW_REG_MCR);
++	mod_timer(&flexcan->timer, HZ / 20);
++}
++
++static int flexcan_hw_open (struct net_device *dev) {         // ~~~~~sven~~~~~
++        struct flexcan_device *flexcan = netdev_priv (dev);   // ~~~~~sven~~~~~
++	int err;                                              // ~~~~~sven~~~~~
++
++	if (flexcan_hw_reset(flexcan))
++		return -EFAULT;
++
++	flexcan_mcr_setup(flexcan);
++
++//~~~~~~~~~~~~~~sven~~~~~~~~~~~~~~~~
++
++        err = open_candev (dev);
++        if (err)
++                return err;
++
++        flexcan_ctrl_setup (netdev_priv (dev));    // determine and set bittime
++
++//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_IMASK2);
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_IMASK1);
++
++	__raw_writel(0xFFFFFFFF, flexcan->io_base + CAN_HW_REG_IFLAG2);
++	__raw_writel(0xFFFFFFFF, flexcan->io_base + CAN_HW_REG_IFLAG1);
++
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_ECR);
++	return 0;
++}
++
++static void flexcan_err_handler(struct net_device *dev)
++{
++	struct flexcan_device *flexcan = netdev_priv(dev);
++	struct sk_buff *skb;
++	struct can_frame *frame;
++	unsigned int esr, ecr;
++
++	esr = __raw_readl(flexcan->io_base + CAN_HW_REG_ESR);
++	__raw_writel(esr & __ESR_INTERRUPTS, flexcan->io_base + CAN_HW_REG_ESR);
++
++	if (esr & __ESR_WAK_INT)
++		return;
++
++	skb = dev_alloc_skb(sizeof(struct can_frame));
++	if (!skb) {
++		printk(KERN_ERR "%s: allocates skb fail in\n", __func__);
++		return;
++	}
++	frame = (struct can_frame *)skb_put(skb, sizeof(*frame));
++	memset(frame, 0, sizeof(*frame));
++	frame->can_id = CAN_ERR_FLAG | CAN_ERR_CRTL;
++	frame->can_dlc = CAN_ERR_DLC;
++
++	if (esr & __ESR_TWRN_INT)
++		frame->data[1] |= CAN_ERR_CRTL_TX_WARNING;
++
++	if (esr & __ESR_RWRN_INT)
++		frame->data[1] |= CAN_ERR_CRTL_RX_WARNING;
++
++	if (esr & __ESR_BOFF_INT)
++		frame->can_id |= CAN_ERR_BUSOFF;
++
++	if (esr & __ESR_ERR_INT) {
++		if (esr & __ESR_BIT1_ERR)
++			frame->data[2] |= CAN_ERR_PROT_BIT1;
++
++		if (esr & __ESR_BIT0_ERR)
++			frame->data[2] |= CAN_ERR_PROT_BIT0;
++
++		if (esr & __ESR_ACK_ERR)
++			frame->can_id |= CAN_ERR_ACK;
++
++		/*TODO:// if (esr & __ESR_CRC_ERR) */
++
++		if (esr & __ESR_FRM_ERR)
++			frame->data[2] |= CAN_ERR_PROT_FORM;
++
++		if (esr & __ESR_STF_ERR)
++			frame->data[2] |= CAN_ERR_PROT_STUFF;
++
++		ecr = __raw_readl(flexcan->io_base + CAN_HW_REG_ECR);
++		switch ((esr & __ESR_FLT_CONF_MASK) >> __ESR_FLT_CONF_OFF) {
++		case 0:
++			if (__ECR_TX_ERR_COUNTER(ecr) >= __ECR_ACTIVE_THRESHOLD)
++				frame->data[1] |= CAN_ERR_CRTL_TX_WARNING;
++			if (__ECR_RX_ERR_COUNTER(ecr) >= __ECR_ACTIVE_THRESHOLD)
++				frame->data[1] |= CAN_ERR_CRTL_RX_WARNING;
++			break;
++		case 1:
++			if (__ECR_TX_ERR_COUNTER(ecr) >=
++			    __ECR_PASSIVE_THRESHOLD)
++				frame->data[1] |= CAN_ERR_CRTL_TX_PASSIVE;
++
++			if (__ECR_RX_ERR_COUNTER(ecr) >=
++			    __ECR_PASSIVE_THRESHOLD)
++				frame->data[1] |= CAN_ERR_CRTL_RX_PASSIVE;
++			break;
++		default:
++			frame->can_id |= CAN_ERR_BUSOFF;
++		}
++	}
++
++	if (frame->can_id & CAN_ERR_BUSOFF)
++		flexcan_hw_busoff(dev);
++
++	skb->dev = dev;
++	skb->ip_summed = CHECKSUM_UNNECESSARY;
++	netif_receive_skb(skb);
++}
++
++static irqreturn_t flexcan_irq_handler(int irq, void *data)
++{
++	struct net_device *dev = (struct net_device *)data;
++	struct flexcan_device *flexcan = dev ? netdev_priv(dev) : NULL;
++	unsigned int reg;
++
++	BUG_ON(!flexcan);
++
++	reg = __raw_readl(flexcan->io_base + CAN_HW_REG_ESR);
++	if (reg & __ESR_INTERRUPTS) {
++		flexcan_err_handler(dev);
++		return IRQ_HANDLED;
++	}
++
++	flexcan_mbm_isr(dev);
++	return IRQ_HANDLED;
++}
++
++static int flexcan_start_xmit(struct sk_buff *skb, struct net_device *dev)
++{
++	struct can_frame *frame = (struct can_frame *) (skb -> data);
++	struct flexcan_device *flexcan = netdev_priv(dev);
++	struct net_device_stats *stats = (struct net_device_stats *) dev_get_stats (dev);    // ~~~~~~~sven~~~~~~~~
++
++	BUG_ON(!flexcan);
++
++	if (frame->can_dlc > 8)
++		return -EINVAL;
++
++	if (!flexcan_mbm_xmit(flexcan, frame)) {
++		dev_kfree_skb(skb);
++		stats->tx_bytes += frame->can_dlc;
++		stats->tx_packets++;
++		dev->trans_start = jiffies;
++		return NETDEV_TX_OK;
++	}
++	netif_stop_queue(dev);
++	return NETDEV_TX_BUSY;
++}
++
++static int flexcan_open(struct net_device *dev)
++{
++	struct flexcan_device *flexcan;
++	struct platform_device *pdev;
++	struct flexcan_platform_data *plat_data;
++
++	flexcan = netdev_priv(dev);
++	BUG_ON(!flexcan);
++
++	pdev = flexcan->dev;
++	plat_data = (pdev->dev).platform_data;
++	if (plat_data && plat_data->active)
++		plat_data->active(pdev->id);
++
++	if (flexcan->clk)
++		if (clk_enable(flexcan->clk))
++			goto clk_err;
++#ifdef REGULATOR
++	if (flexcan->core_reg)
++		if (regulator_enable(flexcan->core_reg))
++			goto core_reg_err;
++
++	if (flexcan->io_reg)
++		if (regulator_enable(flexcan->io_reg))
++			goto io_reg_err;
++#endif
++	if (plat_data && plat_data->xcvr_enable)
++		plat_data->xcvr_enable(pdev->id, 1);
++
++	if (request_irq(flexcan->irq, flexcan_irq_handler, IRQF_SAMPLE_RANDOM,
++			dev->name, dev))
++		goto irq_err;
++
++	if (flexcan_hw_open (dev))   // ~~~~~sven~~~~~
++		goto open_err;
++
++	flexcan_mbm_init(flexcan);
++	netif_carrier_on(dev);
++	flexcan_hw_start(flexcan);
++	return 0;
++      open_err:
++	free_irq(flexcan->irq, dev);
++      irq_err:
++	if (plat_data && plat_data->xcvr_enable)
++		plat_data->xcvr_enable(pdev->id, 0);
++#ifdef REGULATOR
++	if (flexcan->io_reg)
++		regulator_disable(flexcan->io_reg);
++      io_reg_err:
++	if (flexcan->core_reg)
++		regulator_disable(flexcan->core_reg);
++      core_reg_err:
++#endif
++	if (flexcan->clk)
++		clk_disable(flexcan->clk);
++      clk_err:
++	if (plat_data && plat_data->inactive)
++		plat_data->inactive(pdev->id);
++	return -ENODEV;
++}
++
++static int flexcan_stop(struct net_device *dev)
++{
++	struct flexcan_device *flexcan;
++	struct platform_device *pdev;
++	struct flexcan_platform_data *plat_data;
++
++	flexcan = netdev_priv(dev);
++
++	BUG_ON(!flexcan);
++
++	pdev = flexcan->dev;
++	plat_data = (pdev->dev).platform_data;
++
++	flexcan_hw_stop(flexcan);
++
++	free_irq(flexcan->irq, dev);
++
++	if (plat_data && plat_data->xcvr_enable)
++		plat_data->xcvr_enable(pdev->id, 0);
++
++#ifdef REGULATOR
++	if (flexcan->io_reg)
++		regulator_disable(flexcan->io_reg);
++	if (flexcan->core_reg)
++		regulator_disable(flexcan->core_reg);
++#endif
++	if (flexcan->clk)
++		clk_disable(flexcan->clk);
++	if (plat_data && plat_data->inactive)
++		plat_data->inactive(pdev->id);
++	return 0;
++}
++
++static const struct net_device_ops flexcan_netdev_ops = {
++       .ndo_open               = flexcan_open,
++       .ndo_stop               = flexcan_stop,
++       .ndo_start_xmit         = flexcan_start_xmit,
++};
++
++static void flexcan_setup(struct net_device *dev)
++{
++	dev->type = ARPHRD_CAN;
++	dev->mtu = sizeof(struct can_frame);
++	dev->hard_header_len = 0;
++	dev->addr_len = 0;
++	dev->tx_queue_len = FLEXCAN_MAX_MB;
++	dev->flags = IFF_NOARP;
++	dev->features = NETIF_F_NO_CSUM;
++
++        dev->netdev_ops = &flexcan_netdev_ops;
++}
++
++static int flexcan_probe(struct platform_device *pdev)
++{
++	struct net_device *net;
++	net = flexcan_device_alloc(pdev, flexcan_setup);
++	if (!net)
++		return -ENOMEM;
++
++	if (register_candev(net)) {   // ~~~~~sven~~~~~
++		flexcan_device_free(pdev);
++		return -ENODEV;
++	}
++	return 0;
++}
++
++static int flexcan_remove(struct platform_device *pdev)
++{
++	flexcan_device_free(pdev);
++	return 0;
++}
++
++static int flexcan_suspend(struct platform_device *pdev, pm_message_t state)
++{
++	struct net_device *net;
++	struct flexcan_device *flexcan;
++	struct flexcan_platform_data *plat_data;
++	net = (struct net_device *)dev_get_drvdata(&pdev->dev);
++	flexcan = netdev_priv(net);
++
++	BUG_ON(!flexcan);
++
++	if (!(net->flags & IFF_UP))
++		return 0;
++	if (flexcan->wakeup)
++		set_irq_wake(flexcan->irq, 1);
++	else {
++		plat_data = (pdev->dev).platform_data;
++
++		if (plat_data && plat_data->xcvr_enable)
++			plat_data->xcvr_enable(pdev->id, 0);
++#ifdef REGULATOR
++		if (flexcan->io_reg)
++			regulator_disable(flexcan->io_reg);
++		if (flexcan->core_reg)
++			regulator_disable(flexcan->core_reg);
++#endif
++		if (flexcan->clk)
++			clk_disable(flexcan->clk);
++		if (plat_data && plat_data->inactive)
++			plat_data->inactive(pdev->id);
++	}
++	return 0;
++}
++
++static int flexcan_resume(struct platform_device *pdev)
++{
++	struct net_device *net;
++	struct flexcan_device *flexcan;
++	struct flexcan_platform_data *plat_data;
++	net = (struct net_device *)dev_get_drvdata(&pdev->dev);
++	flexcan = netdev_priv(net);
++
++	BUG_ON(!flexcan);
++
++	if (!(net->flags & IFF_UP))
++		return 0;
++
++	if (flexcan->wakeup)
++		set_irq_wake(flexcan->irq, 0);
++	else {
++		plat_data = (pdev->dev).platform_data;
++		if (plat_data && plat_data->active)
++			plat_data->active(pdev->id);
++
++		if (flexcan->clk) {
++			if (clk_enable(flexcan->clk))
++				printk(KERN_ERR "%s:enable clock fail\n",
++				       __func__);
++		}
++#ifdef REGULATOR
++		if (flexcan->core_reg) {
++			if (regulator_enable(flexcan->core_reg))
++				printk(KERN_ERR "%s:enable core voltage\n",
++				       __func__);
++		}
++		if (flexcan->io_reg) {
++			if (regulator_enable(flexcan->io_reg))
++				printk(KERN_ERR "%s:enable io voltage\n",
++				       __func__);
++		}
++#endif
++		if (plat_data && plat_data->xcvr_enable)
++			plat_data->xcvr_enable(pdev->id, 1);
++	}
++	return 0;
++}
++
++static struct platform_driver flexcan_driver = {
++	.driver = {
++		   .name = FLEXCAN_DEVICE_NAME,
++		   },
++	.probe = flexcan_probe,
++	.remove = flexcan_remove,
++	.suspend = flexcan_suspend,
++	.resume = flexcan_resume,
++};
++
++static __init int flexcan_init(void)
++{
++	pr_info("Freescale FlexCAN Driver \n");
++	return platform_driver_register(&flexcan_driver);
++}
++
++static __exit void flexcan_exit(void)
++{
++	return platform_driver_unregister(&flexcan_driver);
++}
++
++module_init(flexcan_init);
++module_exit(flexcan_exit);
++
++MODULE_LICENSE("GPL");
+Index: linux-2.6.31.6/drivers/net/can/flexcan/flexcan.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/net/can/flexcan/flexcan.h	2009-12-16 17:34:40.585687608 +0100
+@@ -0,0 +1,230 @@
++/*
++ * Copyright 2008 Freescale Semiconductor, Inc. All Rights Reserved.
++ */
++
++/*
++ * The code contained herein is licensed under the GNU General Public
++ * License. You may obtain a copy of the GNU General Public License
++ * Version 2 or later at the following locations:
++ *
++ * http://www.opensource.org/licenses/gpl-license.html
++ * http://www.gnu.org/copyleft/gpl.html
++ */
++
++/*!
++ * @file flexcan.h
++ *
++ * @brief FlexCan definitions.
++ *
++ * @ingroup can
++ */
++
++#ifndef __CAN_FLEXCAN_H__
++#define __CAN_FLEXCAN_H__
++
++#include <linux/list.h>
++#include <linux/platform_device.h>
++#ifdef REGULATOR
++	#include <linux/regulator/regulator.h>
++#endif
++#include <linux/clk.h>
++#include <linux/can.h>
++#include <linux/can/core.h>
++#include <linux/can/error.h>
++#include <linux/can/dev.h>
++
++#define FLEXCAN_DEVICE_NAME	"FlexCAN"
++
++struct can_mb_cs {
++	unsigned int time_stamp:16;
++	unsigned int length:4;
++	unsigned int rtr:1;
++	unsigned int ide:1;
++	unsigned int srr:1;
++	unsigned int nouse1:1;
++	unsigned int code:4;
++	unsigned int nouse2:4;
++};
++
++#define CAN_MB_RX_INACTIVE	0x0
++#define CAN_MB_RX_EMPTY		0x4
++#define CAN_MB_RX_FULL		0x2
++#define CAN_MB_RX_OVERRUN	0x6
++#define CAN_MB_RX_BUSY		0x1
++
++#define CAN_MB_TX_INACTIVE	0x8
++#define CAN_MB_TX_ABORT		0x9
++#define CAN_MB_TX_ONCE		0xC
++#define CAN_MB_TX_REMOTE	0xA
++
++struct can_hw_mb {
++	union {
++		struct can_mb_cs cs;
++		unsigned int data;
++	} mb_cs;
++	unsigned int mb_id;
++	unsigned char mb_data[8];
++};
++
++#define CAN_HW_REG_MCR		0x00
++#define CAN_HW_REG_CTRL		0x04
++#define CAN_HW_REG_TIMER	0x08
++#define CAN_HW_REG_RXGMASK	0x10
++#define CAN_HW_REG_RX14MASK	0x14
++#define CAN_HW_REG_RX15MASK	0x18
++#define CAN_HW_REG_ECR		0x1C
++#define CAN_HW_REG_ESR		0x20
++#define CAN_HW_REG_IMASK2	0x24
++#define CAN_HW_REG_IMASK1	0x28
++#define CAN_HW_REG_IFLAG2	0x2C
++#define CAN_HW_REG_IFLAG1	0x30
++
++#define CAN_MB_BASE	0x0080
++#define CAN_RXMASK_BASE	0x0880
++#define CAN_FIFO_BASE	0xE0
++
++#define __MCR_MDIS		(1 << 31)
++#define __MCR_FRZ		(1 << 30)
++#define __MCR_FEN		(1 << 29)
++#define __MCR_HALT		(1 << 28)
++#define __MCR_NOTRDY		(1 << 27)
++#define __MCR_WAK_MSK		(1 << 26)
++#define __MCR_SOFT_RST		(1 << 25)
++#define __MCR_FRZ_ACK		(1 << 24)
++#define __MCR_SLF_WAK		(1 << 22)
++#define __MCR_WRN_EN		(1 << 21)
++#define __MCR_LPM_ACK		(1 << 20)
++#define __MCR_WAK_SRC		(1 << 19)
++#define __MCR_DOZE		(1 << 18)
++#define __MCR_SRX_DIS		(1 << 17)
++#define __MCR_BCC		(1 << 16)
++#define __MCR_LPRIO_EN		(1 << 13)
++#define __MCR_AEN		(1 << 12)
++#define __MCR_MAX_IDAM_OFFSET 	8
++#define __MCR_MAX_IDAM_MASK 	(0x3 << __MCR_MAX_IDAM_OFFSET)
++#define __MCR_MAX_IDAM_A	(0x0 << __MCR_MAX_IDAM_OFFSET)
++#define __MCR_MAX_IDAM_B	(0x1 << __MCR_MAX_IDAM_OFFSET)
++#define __MCR_MAX_IDAM_C	(0x2 << __MCR_MAX_IDAM_OFFSET)
++#define __MCR_MAX_IDAM_D	(0x3 << __MCR_MAX_IDAM_OFFSET)
++#define __MCR_MAX_MB_OFFSET 	0
++#define __MCR_MAX_MB_MASK 	(0x3F)
++
++#define __CTRL_PRESDIV_OFFSET	24
++#define __CTRL_PRESDIV_MASK	(0xFF << __CTRL_PRESDIV_OFFSET)
++#define __CTRL_RJW_OFFSET	22
++#define __CTRL_RJW_MASK		(0x3 << __CTRL_RJW_OFFSET)
++#define __CTRL_PSEG1_OFFSET	19
++#define __CTRL_PSEG1_MASK	(0x7 << __CTRL_PSEG1_OFFSET)
++#define __CTRL_PSEG2_OFFSET	16
++#define __CTRL_PSEG2_MASK	(0x7 << __CTRL_PSEG2_OFFSET)
++#define __CTRL_BOFF_MSK		(0x1 << 15)
++#define __CTRL_ERR_MSK		(0x1 << 14)
++#define __CTRL_CLK_SRC		(0x1 << 13)
++#define __CTRL_LPB		(0x1 << 12)
++#define __CTRL_TWRN_MSK		(0x1 << 11)
++#define __CTRL_RWRN_MSK		(0x1 << 10)
++#define __CTRL_SMP		(0x1 << 7)
++#define __CTRL_BOFF_REC		(0x1 << 6)
++#define __CTRL_TSYN		(0x1 << 5)
++#define __CTRL_LBUF		(0x1 << 4)
++#define __CTRL_LOM		(0x1 << 3)
++#define __CTRL_PROPSEG_OFFSET	0
++#define __CTRL_PROPSEG_MASK	(0x7)
++
++#define __ECR_TX_ERR_COUNTER(x) ((x) & 0xFF)
++#define __ECR_RX_ERR_COUNTER(x) (((x) >> 8) & 0xFF)
++#define __ECR_PASSIVE_THRESHOLD	128
++#define __ECR_ACTIVE_THRESHOLD	96
++
++#define __ESR_TWRN_INT		(0x1 << 17)
++#define __ESR_RWRN_INT		(0x1 << 16)
++#define __ESR_BIT1_ERR		(0x1 << 15)
++#define __ESR_BIT0_ERR		(0x1 << 14)
++#define __ESR_ACK_ERR		(0x1 << 13)
++#define __ESR_CRC_ERR		(0x1 << 12)
++#define __ESR_FRM_ERR		(0x1 << 11)
++#define __ESR_STF_ERR		(0x1 << 10)
++#define __ESR_TX_WRN		(0x1 << 9)
++#define __ESR_RX_WRN		(0x1 << 8)
++#define __ESR_IDLE		(0x1 << 7)
++#define __ESR_TXRX		(0x1 << 6)
++#define __ESR_FLT_CONF_OFF	4
++#define __ESR_FLT_CONF_MASK	(0x3 << __ESR_FLT_CONF_OFF)
++#define __ESR_BOFF_INT		(0x1 << 2)
++#define __ESR_ERR_INT		(0x1 << 1)
++#define __ESR_WAK_INT		(0x1)
++
++#define __ESR_INTERRUPTS	(__ESR_WAK_INT | __ESR_ERR_INT | \
++				__ESR_BOFF_INT | __ESR_TWRN_INT | \
++				__ESR_RWRN_INT)
++
++#define __FIFO_OV_INT		0x0080
++#define __FIFO_WARN_INT		0x0040
++#define __FIFO_RDY_INT		0x0020
++
++struct flexcan_device {
++	struct can_priv can;    /* FIXME:new must be the first member! */
++	struct mutex mutex;
++	void *io_base;
++	struct can_hw_mb *hwmb;
++	unsigned int *rx_mask;
++	unsigned int xmit_mb;
++//        unsigned int bitrate;        ~~~~~sven~~~~~
++	/* word 1 */
++//        unsigned int br_presdiv:8;   ~~~~~sven~~~~~
++//        unsigned int br_rjw:2;       ~~~~~sven~~~~~
++//        unsigned int br_propseg:3;   ~~~~~sven~~~~~
++//        unsigned int br_pseg1:3;     ~~~~~sven~~~~~
++//        unsigned int br_pseg2:3;     ~~~~~sven~~~~~
++	unsigned int maxmb:6;
++	unsigned int xmit_maxmb:6;
++	unsigned int wd1_resv:1;
++
++	/* word 2 */
++	unsigned int fifo:1;
++	unsigned int wakeup:1;
++	unsigned int srx_dis:1;
++	unsigned int wak_src:1;
++	unsigned int bcc:1;
++	unsigned int lprio:1;
++	unsigned int abort:1;
++	unsigned int br_clksrc:1;
++	unsigned int loopback:1;
++	unsigned int smp:1;
++	unsigned int boff_rec:1;
++	unsigned int tsyn:1;
++	unsigned int listen:1;
++
++	unsigned int ext_msg:1;
++	unsigned int std_msg:1;
++
++	struct timer_list timer;
++	struct platform_device *dev;
++	struct regulator *core_reg;
++	struct regulator *io_reg;
++	struct clk *clk;
++	int irq;
++};
++
++#define FLEXCAN_MAX_FIFO_MB	8
++#define FLEXCAN_MAX_MB		64
++#define FLEXCAN_MAX_PRESDIV	256
++#define FLEXCAN_MAX_RJW		4
++#define FLEXCAN_MAX_PSEG1	8
++#define FLEXCAN_MAX_PSEG2	8
++#define FLEXCAN_MAX_PROPSEG	8
++#define FLEXCAN_MAX_BITRATE	1000000
++
++extern struct net_device *flexcan_device_alloc(struct platform_device *pdev,
++					       void (*setup) (struct net_device
++							      *dev));
++extern void flexcan_device_free(struct platform_device *pdev);
++
++extern void flexcan_mbm_init(struct flexcan_device *flexcan);
++extern void flexcan_mbm_isr(struct net_device *dev);
++extern int flexcan_mbm_xmit(struct flexcan_device *flexcan,
++			    struct can_frame *frame);
++
++extern int flexcan_set_bittiming (struct net_device *dev);      // ~~~~~sven~~~~~
++
++#endif				/* __CAN_FLEXCAN_H__ */
+Index: linux-2.6.31.6/drivers/net/can/flexcan/mbm.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/drivers/net/can/flexcan/mbm.c	2009-12-16 17:34:40.585687608 +0100
+@@ -0,0 +1,350 @@
++/*
++ * Copyright 2008 Freescale Semiconductor, Inc. All Rights Reserved.
++ */
++
++/*
++ * The code contained herein is licensed under the GNU General Public
++ * License. You may obtain a copy of the GNU General Public License
++ * Version 2 or later at the following locations:
++ *
++ * http://www.opensource.org/licenses/gpl-license.html
++ * http://www.gnu.org/copyleft/gpl.html
++ */
++
++/*!
++ * @file mbm.c
++ *
++ * @brief Driver for Freescale CAN Controller FlexCAN.
++ *
++ * @ingroup can
++ */
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/slab.h>
++#include <linux/netdevice.h>
++#include <linux/if_arp.h>
++#include <linux/if_ether.h>
++#include <linux/platform_device.h>
++
++#include <asm/io.h>
++#include <asm/irq.h>
++#include "flexcan.h"
++
++#define flexcan_swab32(x)	\
++	(((x) << 24) | ((x) >> 24) |\
++		(((x) & (__u32)0x0000ff00UL) << 8) |\
++		(((x) & (__u32)0x00ff0000UL) >> 8))
++
++static inline void flexcan_memcpy(void *dst, void *src, int len)
++{
++	int i;
++	unsigned int *d = (unsigned int *)dst, *s = (unsigned int *)src;
++	len = (len + 3) >> 2;
++	for (i = 0; i < len; i++, s++, d++)
++		*d = flexcan_swab32(*s);
++}
++
++static void flexcan_mb_bottom(struct net_device *dev, int index)
++{
++	struct flexcan_device *flexcan = netdev_priv(dev);
++	struct net_device_stats *stats = (struct net_device_stats *) dev_get_stats (dev);  // ~~~~~sven~~~~~
++	struct can_hw_mb *hwmb;
++	struct can_frame *frame;
++	struct sk_buff *skb;
++	unsigned int tmp;
++
++	hwmb = flexcan->hwmb + index;
++	if (flexcan->fifo || (index >= (flexcan->maxmb - flexcan->xmit_maxmb))) {
++		if (hwmb->mb_cs.cs.code == CAN_MB_TX_ABORT)
++			hwmb->mb_cs.cs.code = CAN_MB_TX_INACTIVE;
++
++		if (hwmb->mb_cs.cs.code & CAN_MB_TX_INACTIVE) {
++			if (netif_queue_stopped(dev))
++				netif_start_queue(dev);
++			return;
++		}
++	}
++	skb = dev_alloc_skb(sizeof(struct can_frame));
++	if (skb) {
++		frame = (struct can_frame *)skb_put(skb, sizeof(*frame));
++		memset(frame, 0, sizeof(*frame));
++		if (hwmb->mb_cs.cs.ide)
++			frame->can_id =
++			    (hwmb->mb_id & CAN_EFF_MASK) | CAN_EFF_FLAG;
++		else
++			frame->can_id = (hwmb->mb_id >> 18) & CAN_SFF_MASK;
++
++		if (hwmb->mb_cs.cs.rtr)
++			frame->can_id |= CAN_RTR_FLAG;
++
++		frame->can_dlc = hwmb->mb_cs.cs.length;
++
++		if (frame->can_dlc && frame->can_dlc)
++			flexcan_memcpy(frame->data, hwmb->mb_data,
++				       frame->can_dlc);
++
++		if (flexcan->fifo
++		    || (index >= (flexcan->maxmb - flexcan->xmit_maxmb))) {
++			hwmb->mb_cs.cs.code = CAN_MB_TX_INACTIVE;
++			if (netif_queue_stopped(dev))
++				netif_start_queue(dev);
++		}
++
++		tmp = __raw_readl(flexcan->io_base + CAN_HW_REG_TIMER);
++
++		dev->last_rx = jiffies;
++		stats->rx_packets++;
++		stats->rx_bytes += frame->can_dlc;
++
++		skb->dev = dev;
++		skb->protocol = __constant_htons(ETH_P_CAN);
++		skb->ip_summed = CHECKSUM_UNNECESSARY;
++                // netif_receive_skb (skb);   ~~~~~sven~~~~~
++                netif_rx (skb);             //~~~~~sven~~~~~
++	} else {
++		tmp = hwmb->mb_cs.data;
++		tmp = hwmb->mb_id;
++		tmp = hwmb->mb_data[0];
++		if (flexcan->fifo
++		    || (index >= (flexcan->maxmb - flexcan->xmit_maxmb))) {
++
++			hwmb->mb_cs.cs.code = CAN_MB_TX_INACTIVE;
++			if (netif_queue_stopped(dev))
++				netif_start_queue(dev);
++		}
++		tmp = __raw_readl(flexcan->io_base + CAN_HW_REG_TIMER);
++		stats->rx_dropped++;
++	}
++}
++
++static void flexcan_fifo_isr(struct net_device *dev, unsigned int iflag1)
++{
++	struct flexcan_device *flexcan = dev ? netdev_priv(dev) : NULL;
++	struct net_device_stats *stats = (struct net_device_stats *) dev_get_stats (dev);  // ~~~~~sven~~~~~
++	struct sk_buff *skb;
++	struct can_hw_mb *hwmb = flexcan->hwmb;
++	struct can_frame *frame;
++	unsigned int tmp;
++
++	if (iflag1 & __FIFO_RDY_INT) {
++		skb = dev_alloc_skb(sizeof(struct can_frame));
++		if (skb) {
++			frame =
++			    (struct can_frame *)skb_put(skb, sizeof(*frame));
++			memset(frame, 0, sizeof(*frame));
++			if (hwmb->mb_cs.cs.ide)
++				frame->can_id =
++				    (hwmb->mb_id & CAN_EFF_MASK) | CAN_EFF_FLAG;
++			else
++				frame->can_id =
++				    (hwmb->mb_id >> 18) & CAN_SFF_MASK;
++
++			if (hwmb->mb_cs.cs.rtr)
++				frame->can_id |= CAN_RTR_FLAG;
++
++			frame->can_dlc = hwmb->mb_cs.cs.length;
++
++			if (frame->can_dlc && (frame->can_dlc <= 8))
++				flexcan_memcpy(frame->data, hwmb->mb_data,
++					       frame->can_dlc);
++			tmp = __raw_readl(flexcan->io_base + CAN_HW_REG_TIMER);
++
++			dev->last_rx = jiffies;
++
++			stats->rx_packets++;
++			stats->rx_bytes += frame->can_dlc;
++
++			skb->dev = dev;
++			skb->protocol = __constant_htons(ETH_P_CAN);
++			skb->ip_summed = CHECKSUM_UNNECESSARY;
++                        //netif_receive_skb (skb);   ~~~~~sven~~~~~
++                        netif_rx (skb);            //~~~~~sven~~~~~
++		} else {
++			tmp = hwmb->mb_cs.data;
++			tmp = hwmb->mb_id;
++			tmp = hwmb->mb_data[0];
++			tmp = __raw_readl(flexcan->io_base + CAN_HW_REG_TIMER);
++		}
++	}
++
++	if (iflag1 & (__FIFO_OV_INT | __FIFO_WARN_INT)) {
++		skb = dev_alloc_skb(sizeof(struct can_frame));
++		if (skb) {
++			frame =
++			    (struct can_frame *)skb_put(skb, sizeof(*frame));
++			memset(frame, 0, sizeof(*frame));
++			frame->can_id = CAN_ERR_FLAG | CAN_ERR_CRTL;
++			frame->can_dlc = CAN_ERR_DLC;
++			if (iflag1 & __FIFO_WARN_INT)
++				frame->data[1] |=
++				    CAN_ERR_CRTL_TX_WARNING |
++				    CAN_ERR_CRTL_RX_WARNING;
++			if (iflag1 & __FIFO_OV_INT)
++				frame->data[1] |= CAN_ERR_CRTL_RX_OVERFLOW;
++
++			skb->dev = dev;
++			skb->protocol = __constant_htons(ETH_P_CAN);
++			skb->ip_summed = CHECKSUM_UNNECESSARY;
++                        //netif_receive_skb (skb);    ~~~~~sven~~~~~
++                        netif_rx (skb);             //~~~~~sven~~~~~
++		}
++	}
++}
++
++/*!
++ * @brief The function call by CAN ISR to handle mb events.
++ *
++ * @param dev		the pointer of network device.
++ *
++ * @return none
++ */
++void flexcan_mbm_isr(struct net_device *dev)
++{
++	int i, iflag1, iflag2, maxmb;
++	struct flexcan_device *flexcan = dev ? netdev_priv(dev) : NULL;
++
++	if (flexcan->maxmb > 31) {
++		maxmb = flexcan->maxmb + 1 - 32;
++		iflag1 = __raw_readl(flexcan->io_base + CAN_HW_REG_IFLAG1) &
++		    __raw_readl(flexcan->io_base + CAN_HW_REG_IMASK1);
++		iflag2 = __raw_readl(flexcan->io_base + CAN_HW_REG_IFLAG2) &
++		    __raw_readl(flexcan->io_base + CAN_HW_REG_IMASK2);
++		iflag2 &= (1 << maxmb) - 1;
++		maxmb = 32;
++	} else {
++		maxmb = flexcan->maxmb + 1;
++		iflag1 = __raw_readl(flexcan->io_base + CAN_HW_REG_IFLAG1) &
++		    __raw_readl(flexcan->io_base + CAN_HW_REG_IMASK1);
++		iflag1 &= (1 << maxmb) - 1;
++		iflag2 = 0;
++	}
++
++	__raw_writel(iflag1, flexcan->io_base + CAN_HW_REG_IFLAG1);
++	__raw_writel(iflag2, flexcan->io_base + CAN_HW_REG_IFLAG2);
++
++	if (flexcan->fifo) {
++		flexcan_fifo_isr(dev, iflag1);
++		iflag1 &= 0xFFFFFF00;
++	}
++	for (i = 0; iflag1 && (i < maxmb); i++) {
++		if (iflag1 & (1 << i)) {
++			iflag1 &= ~(1 << i);
++			flexcan_mb_bottom(dev, i);
++		}
++	}
++
++	for (i = maxmb; iflag2 && (i <= flexcan->maxmb); i++) {
++		if (iflag2 & (1 << (i - 32))) {
++			iflag2 &= ~(1 << (i - 32));
++			flexcan_mb_bottom(dev, i);
++		}
++	}
++}
++
++/*!
++ * @brief function to xmit message buffer
++ *
++ * @param flexcan	the pointer of can hardware device.
++ * @param frame		the pointer of can message frame.
++ *
++ * @return	Returns 0 if xmit is success. otherwise returns non-zero.
++ */
++int flexcan_mbm_xmit(struct flexcan_device *flexcan, struct can_frame *frame)
++{
++	int i = flexcan->xmit_mb;
++	struct can_hw_mb *hwmb = flexcan->hwmb;
++
++	do {
++		if (hwmb[i].mb_cs.cs.code == CAN_MB_TX_INACTIVE)
++			break;
++		if ((++i) > flexcan->maxmb) {
++			if (flexcan->fifo)
++				i = FLEXCAN_MAX_FIFO_MB;
++			else
++				i = flexcan->xmit_maxmb + 1;
++		}
++		if (i == flexcan->xmit_mb)
++			return -1;
++	} while (1);
++
++	flexcan->xmit_mb = i + 1;
++	if (flexcan->xmit_mb > flexcan->maxmb) {
++		if (flexcan->fifo)
++			flexcan->xmit_mb = FLEXCAN_MAX_FIFO_MB;
++		else
++			flexcan->xmit_mb = flexcan->xmit_maxmb + 1;
++	}
++
++	if (frame->can_id & CAN_RTR_FLAG)
++		hwmb[i].mb_cs.cs.rtr = 1;
++	else
++		hwmb[i].mb_cs.cs.rtr = 0;
++
++	if (frame->can_id & CAN_EFF_FLAG) {
++		hwmb[i].mb_cs.cs.ide = 1;
++		hwmb[i].mb_cs.cs.srr = 1;
++		hwmb[i].mb_id = frame->can_id & CAN_EFF_MASK;
++	} else {
++		hwmb[i].mb_cs.cs.ide = 0;
++		hwmb[i].mb_id = (frame->can_id & CAN_SFF_MASK) << 18;
++	}
++
++	hwmb[i].mb_cs.cs.length = frame->can_dlc;
++	flexcan_memcpy(hwmb[i].mb_data, frame->data, frame->can_dlc);
++	hwmb[i].mb_cs.cs.code = CAN_MB_TX_ONCE;
++	return 0;
++}
++
++/*!
++ * @brief function to initial message buffer
++ *
++ * @param flexcan	the pointer of can hardware device.
++ *
++ * @return	none
++ */
++void flexcan_mbm_init(struct flexcan_device *flexcan)
++{
++	struct can_hw_mb *hwmb;
++	int rx_mb, i;
++
++	/* Set global mask to receive all messages */
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_RXGMASK);
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_RX14MASK);
++	__raw_writel(0, flexcan->io_base + CAN_HW_REG_RX15MASK);
++
++	memset(flexcan->hwmb, 0, sizeof(*hwmb) * FLEXCAN_MAX_MB);
++	/* Set individual mask to receive all messages */
++	memset(flexcan->rx_mask, 0, sizeof(unsigned int) * FLEXCAN_MAX_MB);
++
++	if (flexcan->fifo)
++		rx_mb = FLEXCAN_MAX_FIFO_MB;
++	else
++		rx_mb = flexcan->maxmb - flexcan->xmit_maxmb;
++
++	hwmb = flexcan->hwmb;
++	if (flexcan->fifo) {
++		unsigned long *id_table = flexcan->io_base + CAN_FIFO_BASE;
++		for (i = 0; i < rx_mb; i++)
++			id_table[i] = 0;
++	} else {
++		for (i = 0; i < rx_mb; i++) {
++			hwmb[i].mb_cs.cs.code = CAN_MB_RX_EMPTY;
++			/*
++			 * IDE bit can not control by mask registers
++			 * So set message buffer to receive extend
++			 * or standard message.
++			 */
++			if (flexcan->ext_msg && flexcan->std_msg)
++				hwmb[i].mb_cs.cs.ide = i & 1;
++			else {
++				if (flexcan->ext_msg)
++					hwmb[i].mb_cs.cs.ide = 1;
++			}
++		}
++	}
++
++	for (; i <= flexcan->maxmb; i++)
++		hwmb[i].mb_cs.cs.code = CAN_MB_TX_INACTIVE;
++
++	flexcan->xmit_mb = rx_mb;
++}
+Index: linux-2.6.31.6/drivers/net/can/Kconfig
+===================================================================
+--- linux-2.6.31.6.orig/drivers/net/can/Kconfig	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/net/can/Kconfig	2009-12-16 17:34:40.585687608 +0100
+@@ -84,4 +84,13 @@
+ 	  a problem with CAN support and want to see more of what is going
+ 	  on.
+ 
++config CAN_FLEXCAN
++	tristate "Freescale FlexCAN"
++	depends on CAN && ARCH_MX35
++	default m
++	---help---
++	  This select the support of Freescale CAN(FlexCAN).
++	  This driver can also be built as a module.
++	  If unsure, say N.
++
+ endmenu
+Index: linux-2.6.31.6/drivers/net/can/Makefile
+===================================================================
+--- linux-2.6.31.6.orig/drivers/net/can/Makefile	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/drivers/net/can/Makefile	2009-12-16 17:34:40.585687608 +0100
+@@ -9,4 +9,6 @@
+ 
+ obj-$(CONFIG_CAN_SJA1000)	+= sja1000/
+ 
++obj-$(CONFIG_CAN_FLEXCAN)	+= flexcan/
++
+ ccflags-$(CONFIG_CAN_DEBUG_DEVICES) := -DDEBUG
+Index: linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mxc_flexcan.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mxc_flexcan.h	2009-12-16 17:34:40.585687608 +0100
+@@ -0,0 +1,29 @@
++/*
++ *      Copyright (C) 2009 Jan Weitzel <armlinux@phytec.de>
++ *	Copyright 2004-2009 Freescale Semiconductor, Inc. All Rights Reserved.
++ *
++ *      This program is free software; you can redistribute it and/or modify
++ *      it under the terms of the GNU General Public License as published by
++ *      the Free Software Foundation; either version 2 of the License, or
++ *      (at your option) any later version.
++ *
++ *      This program is distributed in the hope that it will be useful,
++ *      but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *      GNU General Public License for more details.
++ */
++
++#ifndef __ASM_ARCH_MXC_FLEXCAN
++#define __ASM_ARCH_MXC_FLEXCAN
++
++struct flexcan_platform_data {
++#ifdef REGULATOR
++        char *core_reg;
++        char *io_reg;
++#endif
++        void (*xcvr_enable) (int id, int en);
++        void (*active) (int id);
++        void (*inactive) (int id);
++};
++
++#endif /* __ASM_ARCH_MXC_FLEXCAN  */
+Index: linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/pcm043.c	2009-12-16 17:34:40.295686175 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c	2009-12-17 12:45:43.254686159 +0100
+@@ -49,6 +49,7 @@
+ #include <mach/audmux.h>
+ #include <mach/ssi.h>
+ #include <mach/mxc_nand.h>
++#include <mach/mxc_flexcan.h>
+ 
+ #include "devices.h"
+ 
+@@ -150,6 +151,34 @@
+ 	&mxc_fec_device,
+ };
+ 
++static void flexcan_xcvr_enable(int id, int en)
++{
++	static int pwdn;
++
++	if (id < 0 || id > 1)
++		return;
++
++	if (en) {
++		if (!(pwdn++))
++			;//pmic_gpio_set_bit_val(MCU_GPIO_REG_GPIO_CONTROL_2, 1, 0);
++	} else {
++		if (!(--pwdn))
++			;//pmic_gpio_set_bit_val(MCU_GPIO_REG_GPIO_CONTROL_2, 1, 1);
++	}
++}
++
++struct flexcan_platform_data flexcan_data0 = {
++	.xcvr_enable = flexcan_xcvr_enable,
++//	.active = gpio_can_active,
++//	.inactive = gpio_can_inactive,
++};
++
++struct flexcan_platform_data flexcan_data1 = {
++	.xcvr_enable = flexcan_xcvr_enable,
++//	.active = gpio_can_active,
++//	.inactive = gpio_can_inactive,
++};
++
+ static struct pad_desc pcm043_pads[] = {
+ 	/* UART1 */
+ 	MX35_PAD_CTS1__UART1_CTS,
+@@ -218,6 +247,12 @@
+ 	MX35_PAD_STXD4__AUDMUX_AUD4_TXD,
+ 	MX35_PAD_SRXD4__AUDMUX_AUD4_RXD,
+ 	MX35_PAD_SCK4__AUDMUX_AUD4_TXC,
++  	/* CAN */
++        MX35_PAD_SD2_DATA2__CAN1_RXCAN,
++        MX35_PAD_SD2_DATA3__CAN1_TXCAN,
++        MX35_PAD_SD2_DATA1__GPIO2_3,
++  	MX35_PAD_TX5_RX0__CAN2_TXCAN,
++  	MX35_PAD_TX4_RX1__CAN2_RXCAN,
+ };
+ 
+ static int pcm043_usbh1_init(struct platform_device *pdev)
+@@ -414,6 +449,14 @@
+ 		mxc_register_device(&mxc_otg, &otg_pdata);
+ 	else
+ 		mxc_register_device(&mxc_otg_udc_device, &usb_data);
++
++ 	mxc_register_device (&flexcan_device0, &flexcan_data0);
++ 	mxc_register_device (&flexcan_device1, &flexcan_data1);
++
++        // Activate CAN-port on mapper
++        gpio_request (32 + 3, "can");
++        gpio_direction_output (32 + 3, 1);
++        gpio_set_value (32 + 3, 1);
+ }
+ 
+ static void __init pcm043_timer_init(void)
+Index: linux-2.6.31.6/arch/arm/mach-mx3/devices.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/devices.c	2009-12-16 17:34:40.234637457 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/devices.c	2009-12-16 17:34:40.595627212 +0100
+@@ -475,6 +475,46 @@
+ 	.num_resources = ARRAY_SIZE(mxc_fec_resources),
+ 	.resource = mxc_fec_resources,
+ };
++
++static struct resource flexcan0_resources[] = {
++	{
++		.start = MX35_CAN1_BASE_ADDR,
++		.end = MX35_CAN1_BASE_ADDR + 0x97F,
++		.flags = IORESOURCE_MEM
++	}, {
++		.start = MXC_INT_CAN1,
++		.end = MXC_INT_CAN1,
++		.flags = IORESOURCE_IRQ
++	}
++};
++
++static struct resource flexcan1_resources[] = {
++	{
++		.start = MX35_CAN2_BASE_ADDR,
++		.end = MX35_CAN2_BASE_ADDR + 0x97F,
++		.flags = IORESOURCE_MEM
++	}, {
++		.start = MXC_INT_CAN2,
++		.end = MXC_INT_CAN2,
++		.flags = IORESOURCE_IRQ
++	}
++};
++
++struct platform_device flexcan_device0 = {
++	.name = "FlexCAN",
++	.id = 0,
++	.num_resources = ARRAY_SIZE(flexcan0_resources),
++	.resource = flexcan0_resources,
++	//FIXME.dev = { .release = mxc_nop_release
++};
++
++struct platform_device flexcan_device1 = {
++	.name = "FlexCAN",
++	.id = 1,
++	.num_resources = ARRAY_SIZE(flexcan1_resources),
++	.resource = flexcan1_resources,
++};
++
+ #endif
+ 
+ static struct resource imx_ssi_resources0[] = {
+Index: linux-2.6.31.6/arch/arm/mach-mx3/devices.h
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/devices.h	2009-12-16 17:34:39.985630161 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/devices.h	2009-12-16 17:34:40.595627212 +0100
+@@ -25,3 +25,5 @@
+ extern struct platform_device imx_spi_device0;
+ extern struct platform_device imx_spi_device1;
+ extern struct platform_device imx_spi_device2;
++extern struct platform_device flexcan_device0;
++extern struct platform_device flexcan_device1;
+Index: linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx35.h
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/plat-mxc/include/mach/mx35.h	2009-12-16 17:34:40.055669053 +0100
++++ linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx35.h	2009-12-16 17:34:40.595627212 +0100
+@@ -7,6 +7,8 @@
+ #define MXC_FEC_BASE_ADDR	0x50038000
+ #define MX35_OTG_BASE_ADDR	0x53ff4000
+ #define MX35_NFC_BASE_ADDR	0xBB000000
++#define MX35_CAN1_BASE_ADDR     0x53FE4000
++#define MX35_CAN2_BASE_ADDR     0x53FE8000
+ 
+ /*
+  * Interrupt numbers
+Index: linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/clock-imx35.c	2009-12-16 17:34:40.245728272 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/clock-imx35.c	2009-12-17 12:46:53.565502506 +0100
+@@ -478,6 +478,8 @@
+ 	_REGISTER_CLOCK(NULL, "iim", iim_clk)
+ 	_REGISTER_CLOCK(NULL, "gpu2d", gpu2d_clk)
+ 	_REGISTER_CLOCK("mxc_nand.0", NULL, nfc_clk)
++ 	_REGISTER_CLOCK("FlexCAN.0", "can_clk", can1_clk)
++ 	_REGISTER_CLOCK("FlexCAN.1", "can_clk", can2_clk)
+ };
+ 
+ int __init mx35_clocks_init()
diff --git a/recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-spi.patch b/recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-spi.patch
new file mode 100644
index 0000000..a49f05b
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/linux-2.6.31.6-spi.patch
@@ -0,0 +1,116 @@
+Add support for SPI and MAX7301
+Signed-off-by: Sven Dyroff <s.dyroff@phytec.de>
+
+rebased to 2.6.31.6
+Signed-off-by: Andreas Adam <a.adam@phytec.de>
+---
+Index: linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/pcm043.c	2009-12-11 13:58:49.894701069 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c	2009-12-11 14:01:08.704700136 +0100
+@@ -30,6 +30,12 @@
+ #include <linux/i2c/at24.h>
+ #include <linux/fsl_devices.h>
+ #include <linux/delay.h>
++#ifdef CONFIG_SPI
++#include <linux/spi/spi.h>
++#endif
++#ifdef CONFIG_GPIO_MAX7301
++#include <linux/spi/max7301.h>
++#endif
+ 
+ #include <asm/mach-types.h>
+ #include <asm/mach/arch.h>
+@@ -42,6 +48,9 @@
+ #if defined CONFIG_I2C_IMX || defined CONFIG_I2C_IMX_MODULE
+ #include <mach/i2c.h>
+ #endif
++#ifdef CONFIG_SPI
++#include <mach/spi.h>
++#endif
+ #include <mach/iomux-mx35.h>
+ #include <mach/ipu.h>
+ #include <mach/mx3fb.h>
+@@ -243,6 +252,18 @@
+ 	/* USB host */
+ 	MX35_PAD_I2C2_CLK__USB_TOP_USBH2_PWR,
+ 	MX35_PAD_I2C2_DAT__USB_TOP_USBH2_OC,
++	/* SPI */
++	MX35_PAD_CSPI1_SS0__CSPI1_SS0,
++	MX35_PAD_CSPI1_SS1__CSPI1_SS1,
++	MX35_PAD_CSPI1_MISO__CSPI1_MISO,
++	MX35_PAD_CSPI1_MOSI__CSPI1_MOSI,
++	MX35_PAD_CSPI1_SCLK__CSPI1_SCLK,
++	MX35_PAD_CSPI1_SPI_RDY__CSPI1_RDY,
++	MX35_PAD_STXD5__CSPI2_MOSI,
++	MX35_PAD_SRXD5__CSPI2_MISO,
++	MX35_PAD_SCK5__CSPI2_SCLK,
++	MX35_PAD_STXFS5__CSPI2_RDY,
++	MX35_PAD_HCKR__CSPI2_SS0,
+ 	/* SSI */
+ 	MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS,
+ 	MX35_PAD_STXD4__AUDMUX_AUD4_TXD,
+@@ -305,6 +326,33 @@
+ 	.phy_mode	= FSL_USB2_PHY_UTMI,
+ };
+ 
++#ifdef CONFIG_SPI
++static unsigned int pcm043_spi_cs [] = {MXC_SPI_CS(0), };
++
++static struct spi_imx_master pcm043_spi_1_data = {
++	.chipselect = pcm043_spi_cs,
++	.num_chipselect = ARRAY_SIZE (pcm043_spi_cs),
++};
++#endif /* CONFIG_SPI */
++
++#ifdef CONFIG_GPIO_MAX7301
++static struct max7301_platform_data max7301_info = {
++        .base = -1,
++};
++
++// bus_num must match id in imx_spi_device struct
++static struct spi_board_info spi_board_info [] __initdata = {
++        {
++                .modalias       = "max7301",
++                .platform_data  = &max7301_info,
++                .max_speed_hz   = 13000000,
++                .bus_num        = 1,
++                .chip_select    = 0,
++                .mode           = SPI_MODE_0,
++        },
++};
++#endif /* CONFIG_GPIO_MAX7301 */
++
+ static int otg_mode_host;
+ 
+ static int __init pcm043_otg_mode(char *options)
+@@ -454,7 +502,13 @@
+ 		mxc_register_device(&mxc_otg, &otg_pdata);
+ 	else
+ 		mxc_register_device(&mxc_otg_udc_device, &usb_data);
+-
++#ifdef CONFIG_SPI
++	mxc_register_device (&imx_spi_device1, &pcm043_spi_1_data);
++#endif
++#ifdef CONFIG_GPIO_MAX7301
++	spi_register_board_info (spi_board_info,
++				ARRAY_SIZE (spi_board_info));
++#endif
+  	mxc_register_device (&flexcan_device0, &flexcan_data0);
+  	mxc_register_device (&flexcan_device1, &flexcan_data1);
+ 
+Index: linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx3x.h
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/plat-mxc/include/mach/mx3x.h	2009-11-10 01:32:31.000000000 +0100
++++ linux-2.6.31.6/arch/arm/plat-mxc/include/mach/mx3x.h	2009-12-11 13:59:13.976022108 +0100
+@@ -279,8 +279,8 @@
+ 
+ /* Mandatory defines used globally */
+ 
+-/* this CPU supports up to 96 GPIOs */
+-#define ARCH_NR_GPIOS		96
++/* this CPU supports up to 96 GPIOs (don't forget the gpio expander!) */
++#define ARCH_NR_GPIOS		(96 + 28)
+ 
+ #if !defined(__ASSEMBLY__) && !defined(__MXC_BOOT_UNCOMPRESS)
+ 
diff --git a/recipes/linux/linux-2.6.31/pcm043/w1_master.patch b/recipes/linux/linux-2.6.31/pcm043/w1_master.patch
new file mode 100644
index 0000000..d16cc9c
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/pcm043/w1_master.patch
@@ -0,0 +1,26 @@
+Add 1-wire
+Signed-off-by: Jan Weitzel <J.Weitzel@phytec.de>
+---
+Index: linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c
+===================================================================
+--- linux-2.6.31.6.orig/arch/arm/mach-mx3/pcm043.c	2009-12-11 13:52:55.964646780 +0100
++++ linux-2.6.31.6/arch/arm/mach-mx3/pcm043.c	2009-12-11 13:55:28.858433047 +0100
+@@ -149,6 +149,7 @@
+ static struct platform_device *devices[] __initdata = {
+ 	&pcm043_flash,
+ 	&mxc_fec_device,
++	&mxc_w1_master_device,
+ };
+ 
+ static void flexcan_xcvr_enable(int id, int en)
+@@ -247,7 +248,9 @@
+ 	MX35_PAD_STXD4__AUDMUX_AUD4_TXD,
+ 	MX35_PAD_SRXD4__AUDMUX_AUD4_RXD,
+ 	MX35_PAD_SCK4__AUDMUX_AUD4_TXC,
+-  	/* CAN */
++  	/* 1-Wire*/
++	MX35_PAD_GPIO1_0__OWIRE_LINE,
++	/* CAN */
+         MX35_PAD_SD2_DATA2__CAN1_RXCAN,
+         MX35_PAD_SD2_DATA3__CAN1_TXCAN,
+         MX35_PAD_SD2_DATA1__GPIO2_3,
diff --git a/recipes/linux/linux/pcm043/defconfig b/recipes/linux/linux/pcm043/defconfig
new file mode 100644
index 0000000..72334d3
--- /dev/null
+++ b/recipes/linux/linux/pcm043/defconfig
@@ -0,0 +1,1659 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.31.6
+#
+CONFIG_ARM=y
+CONFIG_HAVE_PWM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_MMU=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_FIQ=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_LOCK_KERNEL=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+# CONFIG_CLASSIC_RCU is not set
+CONFIG_TREE_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_GROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=y
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+
+#
+# Performance Counters
+#
+CONFIG_VM_EVENT_COUNTERS=y
+# CONFIG_STRIP_ASM_SYMS is not set
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+# CONFIG_IOSCHED_AS is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_DEFAULT_AS is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_FREEZER is not set
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+CONFIG_ARCH_MXC=y
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+
+#
+# Freescale MXC Implementations
+#
+# CONFIG_ARCH_MX1 is not set
+# CONFIG_ARCH_MX2 is not set
+CONFIG_ARCH_MX3=y
+CONFIG_ARCH_MX35=y
+
+#
+# MX3 platforms:
+#
+# CONFIG_MACH_MX31ADS is not set
+# CONFIG_MACH_PCM037 is not set
+# CONFIG_MACH_MX31LITE is not set
+# CONFIG_MACH_MX31_3DS is not set
+# CONFIG_MACH_MX31MOBOARD is not set
+# CONFIG_MACH_MX31LILLY is not set
+# CONFIG_MACH_QONG is not set
+CONFIG_MACH_PCM043=y
+# CONFIG_MACH_ARMADILLO5X0 is not set
+# CONFIG_MACH_MX35_3DS is not set
+# CONFIG_MXC_IRQ_PRIOR is not set
+CONFIG_MXC_PWM=y
+CONFIG_ARCH_MXC_IOMUX_V3=y
+CONFIG_ARCH_MXC_AUDMUX_V2=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_V6=y
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=y
+CONFIG_CPU_ABRT_EV6=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_V6=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V6=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_OUTER_CACHE=y
+CONFIG_CACHE_L2X0=y
+# CONFIG_ARM_ERRATA_411920 is not set
+CONFIG_COMMON_CLKDEV=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT=y
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="noinitrd console=ttymxc0,115200 root=/dev/mtdblock2 rw ip=off"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_VFP=y
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+# CONFIG_IP_PNP_BOOTP is not set
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+CONFIG_CAN=y
+CONFIG_CAN_RAW=y
+# CONFIG_CAN_BCM is not set
+
+#
+# CAN Device Drivers
+#
+# CONFIG_CAN_VCAN is not set
+CONFIG_CAN_DEV=y
+CONFIG_CAN_CALC_BITTIMING=y
+CONFIG_CAN_SJA1000=y
+CONFIG_CAN_SJA1000_PLATFORM=y
+# CONFIG_CAN_DEBUG_DEVICES is not set
+CONFIG_CAN_FLEXCAN=y
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=m
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+CONFIG_MTD_RAM=y
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+# CONFIG_MTD_XIP is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+CONFIG_MTD_PLATRAM=y
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+CONFIG_MTD_NAND_MXC_V2=y
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+# CONFIG_BLK_DEV is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+CONFIG_EEPROM_AT24=y
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_MAX6875 is not set
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_SCSI_PROC_FS is not set
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_KS8842 is not set
+# CONFIG_KS8851 is not set
+CONFIG_FEC=y
+# CONFIG_FEC2 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+CONFIG_USB_USBNET=y
+CONFIG_USB_NET_AX8817X=y
+CONFIG_USB_NET_CDCETHER=y
+# CONFIG_USB_NET_CDC_EEM is not set
+# CONFIG_USB_NET_DM9601 is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+CONFIG_USB_NET_NET1080=y
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+CONFIG_USB_NET_CDC_SUBSET=y
+# CONFIG_USB_ALI_M5632 is not set
+# CONFIG_USB_AN2720 is not set
+CONFIG_USB_BELKIN=y
+CONFIG_USB_ARMLINUX=y
+# CONFIG_USB_EPSON2888 is not set
+# CONFIG_USB_KC2190 is not set
+CONFIG_USB_NET_ZAURUS=y
+# CONFIG_USB_NET_INT51X1 is not set
+# CONFIG_WAN is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_PS2=y
+CONFIG_MOUSE_PS2_ALPS=y
+CONFIG_MOUSE_PS2_LOGIPS2PP=y
+CONFIG_MOUSE_PS2_SYNAPTICS=y
+CONFIG_MOUSE_PS2_TRACKPOINT=y
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+CONFIG_TOUCHSCREEN_WM97XX=y
+# CONFIG_TOUCHSCREEN_WM9705 is not set
+CONFIG_TOUCHSCREEN_WM9712=y
+# CONFIG_TOUCHSCREEN_WM9713 is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_IMX=y
+CONFIG_SERIAL_IMX_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_GPIO is not set
+CONFIG_I2C_IMX=y
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_BITBANG=y
+# CONFIG_SPI_GPIO is not set
+CONFIG_SPI_IMX=y
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+CONFIG_W1=y
+
+#
+# 1-wire Bus Masters
+#
+# CONFIG_W1_MASTER_DS2490 is not set
+# CONFIG_W1_MASTER_DS2482 is not set
+CONFIG_W1_MASTER_MXC=y
+# CONFIG_W1_MASTER_DS1WM is not set
+# CONFIG_W1_MASTER_GPIO is not set
+
+#
+# 1-wire Slaves
+#
+CONFIG_W1_SLAVE_THERM=y
+# CONFIG_W1_SLAVE_SMEM is not set
+# CONFIG_W1_SLAVE_DS2431 is not set
+CONFIG_W1_SLAVE_DS2433=y
+# CONFIG_W1_SLAVE_DS2433_CRC is not set
+# CONFIG_W1_SLAVE_DS2760 is not set
+# CONFIG_W1_SLAVE_BQ27000 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_CORE=y
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+CONFIG_MFD_MC13783=y
+# CONFIG_AB3100_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_TMIO is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+CONFIG_FB_MX3=y
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+# CONFIG_LOGO is not set
+CONFIG_SOUND=y
+# CONFIG_SOUND_OSS_CORE is not set
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_JACK=y
+# CONFIG_SND_SEQUENCER is not set
+# CONFIG_SND_MIXER_OSS is not set
+# CONFIG_SND_PCM_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+# CONFIG_SND_SPI is not set
+CONFIG_SND_USB=y
+# CONFIG_SND_USB_AUDIO is not set
+# CONFIG_SND_USB_CAIAQ is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_AC97_BUS=y
+CONFIG_SND_IMX_SOC=y
+CONFIG_SND_MXC_SOC_SSI=y
+CONFIG_SND_SOC_PHYCORE_AC97=y
+CONFIG_SND_SOC_I2C_AND_SPI=y
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM9712=y
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=y
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+CONFIG_HID_DEBUG=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=y
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+CONFIG_USB_EHCI_MXC=y
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+CONFIG_USB_GADGET_FSL_USB2=y
+CONFIG_USB_FSL_USB2=y
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C_HSOTG is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_LANGWELL is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_GADGETFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_IO_ACCESSORS=y
+CONFIG_MMC_SDHCI_ESDHC=y
+CONFIG_MMC_SDHCI_PLTFM=y
+# CONFIG_MMC_AT91 is not set
+# CONFIG_MMC_ATMELMCI is not set
+# CONFIG_MMC_MXC is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_NEW_LEDS is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+CONFIG_RTC_DRV_PCF8563=y
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_DMADEVICES=y
+
+#
+# DMA Devices
+#
+CONFIG_MX3_IPU=y
+CONFIG_MX3_IPU_IRQS=4
+CONFIG_DMA_ENGINE=y
+
+#
+# DMA Clients
+#
+# CONFIG_NET_DMA is not set
+# CONFIG_ASYNC_TX_DMA is not set
+# CONFIG_DMATEST is not set
+# CONFIG_AUXDISPLAY is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+CONFIG_MINIX_FS=y
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+CONFIG_RPCSEC_GSS_KRB5=y
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_15=y
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_DETECT_SOFTLOCKUP is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+# CONFIG_PAGE_POISONING is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=y
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=y
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=y
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_RATIONAL=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
-- 
1.7.3.4



