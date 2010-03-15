Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1Nr9HQ-0000dm-67
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 13:20:27 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o2FCFU827829; 
	Mon, 15 Mar 2010 13:15:31 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 15 Mar 2010 12:57:22 +0100 (MET)
Received: from localhost.localdomain ([10.159.245.201])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o2FCFDg18321; 
	Mon, 15 Mar 2010 13:15:13 +0100 (MET)
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: openembedded-devel@lists.openembedded.org, ulf.samuelsson@atmel.com,
	marcin@juszkiewicz.com.pl
Date: Mon, 15 Mar 2010 14:28:46 +0100
Message-Id: <1268659726-20887-1-git-send-email-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <201003150738.22158.marcin@juszkiewicz.com.pl>
References: <201003150738.22158.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-2.6.30: add linux4sam patches
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
X-List-Received-Date: Mon, 15 Mar 2010 12:20:30 -0000

Introduce support for:

+	at91sam9260ek
+	at91sam9261ek
+	at91sam9g10ek
+	at91sam9g20ek
+	at91sam9g20ek_2mmc
+	at91sam9g45ekes
+	at91sam9m10ekes
+	at91sam9rlek
+	at91sam9xeek

and apply the Atmel experimental patch series from Linux4sam.org. A different
SRC_URI is created and the patches are bundled in a patch archive.

AT91 specific bits are removed from the common 2.6.30 rule.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
Marcin, what do you think of this patch architecture and URI management?

The defconfig are not included in this patch and shall be sent in another
patch series.

 recipes/linux/linux-at91_2.6.30.inc |  118 +++++++++++++++++++++++++++++++++++
 recipes/linux/linux_2.6.30.bb       |    6 +-
 2 files changed, 120 insertions(+), 4 deletions(-)
 create mode 100644 recipes/linux/linux-at91_2.6.30.inc

diff --git a/recipes/linux/linux-at91_2.6.30.inc b/recipes/linux/linux-at91_2.6.30.inc
new file mode 100644
index 0000000..92733e0
--- /dev/null
+++ b/recipes/linux/linux-at91_2.6.30.inc
@@ -0,0 +1,118 @@
+# include file for AT91 kernel building
+
+DEFAULT_PREFERENCE_at91sam9260ek   = "30"
+DEFAULT_PREFERENCE_at91sam9261ek   = "30"
+DEFAULT_PREFERENCE_at91sam9263ek   = "30"
+DEFAULT_PREFERENCE_at91sam9rlek    = "30"
+DEFAULT_PREFERENCE_at91sam9g20ek   = "30"
+DEFAULT_PREFERENCE_at91sam9g20ek_2mmc = "30"
+DEFAULT_PREFERENCE_at91sam9g10ek   = "30"
+DEFAULT_PREFERENCE_at91sam9g45ekes = "30"
+DEFAULT_PREFERENCE_at91sam9xeek    = "30"
+DEFAULT_PREFERENCE_at91sam9m10ekes = "30"
+
+
+at91_kernel = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
+	http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;patch=1 \
+	file://defconfig "
+
+lnx4sam_exp3 = " \
+	ftp://ftp.linux4sam.org/pub/linux/2.6.30-at91/2.6.30-at91-exp.3.tar.gz;name=lnx4sam_exp3 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0001-at91-dm9000-initialization-update.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0002-at91-add-gpio-button-support-for-at91sam9g20ek.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0003-at91-add-gpio-button-and-leds-support-for-at91sam9r.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0004-at91-at91sam9rlek-lcd-interface-correction.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0005-avr32-add-two-new-at91-to-cpu.h-definition.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0006-5438-1-AT91-manage-clock-by-functionality-instead.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0007-atmel_serial-fix-hang-in-set_termios-when-crtscts-i.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0008-USB-atmel_usba_udc-change-way-of-specifying-bias-f.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0009-Add-MACB-TX-Buffer-in-SRAM-support.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0010-5569-1-at91-Support-for-at91sam9g45-clocks-manage.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0011-5571-1-at91-Basic-support-for-at91sam9g45-series.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0012-5572-1-at91-Support-for-at91sam9g45-series-core-c.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0013-ARM-5622-1-at91-at91sam9g45-headers-DMA-peripher.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0014-5567-1-at91-Support-for-at91sam9g10-clocks-manage.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0015-5568-1-at91-Basic-support-for-at91sam9g10-header.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0016-5570-1-at91-Support-for-at91sam9g10-core-chip-b.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0017-5614-1-at91-atmel_lcdfb-add-at91sam9g10-support-t.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0018-USB-at91-Add-USB-EHCI-driver-for-at91sam9g45-serie.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0019-USB-at91-Add-USB-gadget-driver-selection-for-at91s.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0020-USB-at91-modify-OHCI-driver-to-allow-shared-interr.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0021-at91-USB-at91sam9g45-series-USB-host-integration.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0022-at91-USB-USB-drivers-modifications-for-at91sam9g10.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0023-dmaengine-at_hdmac-new-driver-for-the-Atmel-AHB-DM.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0024-dmaengine-at_hdmac-add-DMA-slave-transfers.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0025-at91-dmaengine-integration-of-at_hdmac-driver-in-at.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0026-at91-dmaengine-integration-of-at_hdmac-driver-in-at.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0027-atmel-mci-Integrate-AT91-specific-definition-in-hea.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0028-atmel-mci-add-MCI2-register-definitions.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0029-atmel-mci-Unified-Atmel-MCI-drivers-AVR32-AT91.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0030-AT91-atmel-mci-Platform-configuration-to-the-the-a.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0031-atmel-mci-change-use-of-dma-slave-interface.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0032-mmc-atmel-mci-New-MCI2-module-support-in-atmel-mci.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0033-at91-atmel-mci-inclusion-of-sd-mmc-driver-in-at91sa.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0034-MCI2-High-speed-mode-support.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0035-at91_mci-Enable-MMC_CAP_SDIO_IRQ-only-when-it-actua.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0036-at91_mci-Do-a-reset-after-each-request.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0037-at91_mci-introduce-per-mci-revision-conditional-cod.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0038-dmaengine-Move-all-map_sg-unmap_sg-for-slave-channe.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0039-AC97-atmel-add-support-for-AT91-common-with-AVR32.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0040-AT91-modify-the-support-of-AC97-on-the-at91sam9263.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0041-AT91-correct-AC97-reset-line-in-at91sam9263ek-board.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0042-at91-add-AC97-support-to-at91sam9rl-and-at91sam9rle.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0043-at91-add-AC97-support-to-at91sam9g45-series-and-at9.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0044-input-atmel_tsadcc-touchscreen-rework-setting-capa.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0045-input-atmel_tsadcc-touchscreen-use-platform-paramet.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0046-at91-input-platform-parameters-for-atmel_tsadcc-in.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0047-at91-input-touchscreen-support-for-at91sam9g45ekes.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0048-at91-extend-power-management-to-at91sam9g45-chip.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0049-at91-at91sam9g45-family-identify-several-chip-vers.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0050-atmel_lcdfb-New-alternate-pixel-clock-formula.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0051-mach-types-add-2MMC-slot-9g20-board.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0052-at91-at91sam9g20ek-add-card-detect-signal-to-sd-mmc.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0053-at91-at91sam9g20ek-modify-dual-slot-evaluation-kit.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0054-at91-add-gpio-buttons-to-at91sam9g20-ek-2mmc.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0055-Bug-workaround-for-channel-in-ac97.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0056-input-atmel_tsadcc-report-fake-pressure-measure.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0057-at91-No-more-SD-MMC-Write-Protect-pin-connected-on.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0058-net-macb-modify-SRAM-location-of-descriptor-buffer.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0059-at91-add-pwm-support-in-Kconfig-for-at91sam9g45.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0060-at91-update-at91sam9263ek-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0061-at91-add-at91sam9g45ekes-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0062-at91-update-at91sam9g20ek-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0063-at91-update-at91sam9261ek-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0064-at91-update-at91sam9260ek-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0065-at91-update-at91sam9rlek-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0066-sound-soc-update-soc-support-to-2.6.32-rc3-alsa.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0067-sound-at91sam9g20ek_2mmc-board-uses-same-audio-conn.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0068-at91-add-I2C-definitions-for-at91sam9g20ek-boards.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0069-at91-add-at91sam9g10ek-defconfig-file.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0070-at91-update-at91sam9260ek_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0071-at91-update-at91sam9261ek_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0072-at91-update-at91sam9263ek_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0073-at91-update-at91sam9g20ek_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0074-at91-update-at91sam9g20ek_2mmc_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0075-at91-update-at91sam9g45ekes_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0076-at91-update-at91sam9rlek_defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0077-at91-add-at91sam9xeek-defconfig.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0078-t91-add-at91sam9m10ekes-support.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0079-at91-at91sam9m10-add-dma-touchscreen-mmc-usb-host-a.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0080-at91-at91sam9m10-add-video-decoder-clock.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0081-at91sam9m10-add-on2-8170-gpl-modules.patch;patch=1 \
+	file://${WORKDIR}/2.6.30-at91-exp.3/2.6.30-at91-exp.3-0082-Final-release-for-2.6.30-at91-exp.3.patch;patch=1 \
+	"
+
+SRC_URI[lnx4sam_exp3.md5sum] = "6577b0311f097358913d162428b78f06"
+SRC_URI[lnx4sam_exp3.sha256sum] = "145e34cc90dbd4d7e4cfb94a82c67ea782ec9ebb6303fe5c881eb8dfe5a8a006"
+
+SRC_URI_at91sam9260ek = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9261ek = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9263ek = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9rlek = "${at91_kernel} ${lnx4sam_exp3} "
+SRC_URI_at91sam9g20ek = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9g20ek_2mmc = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9g10ek = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9xeek = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9g45ekes = "${at91_kernel} ${lnx4sam_exp3}"
+SRC_URI_at91sam9m10ekes = "${at91_kernel} ${lnx4sam_exp3}"
+
diff --git a/recipes/linux/linux_2.6.30.bb b/recipes/linux/linux_2.6.30.bb
index 19247e2..a620f90 100644
--- a/recipes/linux/linux_2.6.30.bb
+++ b/recipes/linux/linux_2.6.30.bb
@@ -1,6 +1,7 @@
 require linux.inc
+require linux-at91_2.6.30.inc
 
-PR = "r5"
+PR = "r6"
 
 S = "${WORKDIR}/linux-${PV}"
 
@@ -17,11 +18,8 @@ DEFAULT_PREFERENCE_tosa = "-1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.bz2;patch=1 \
-           http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;patch=1 \
            file://aufs2-30.patch;patch=1 \
            file://defconfig"
 
 SRC_URI_append_mpc8315e-rdb = " file://mpc8315erdb-add-msi-to-dts.patch;patch=1"
 
-SRC_URI_append_at91sam9263ek = " file://hrw-linux-2.6.30-exp.patch;patch=1 "
-
-- 
1.5.6.5



