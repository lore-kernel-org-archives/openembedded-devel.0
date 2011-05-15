Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWiD-0002Bz-0R
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:30:05 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id ACB9DEAC54
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:59:23 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj1YAI6Gz01T4zkqPGdsb2JhbACJH5x1CwEBAQE3MrxFAYwPhhkEkBGOdw
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="189787484"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 15 May 2011 09:59:23 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:59:14 +0200
Message-Id: <1305446355-4779-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1305446355-4779-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1305446355-4779-1-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 2/3] Add at91 support for linux-2.6.38
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
X-List-Received-Date: Sun, 15 May 2011 08:30:05 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/linux/linux_2.6.38.bb |   45 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 44 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.38.bb b/recipes/linux/linux_2.6.38.bb
index 186f987..8c551bd 100644
--- a/recipes/linux/linux_2.6.38.bb
+++ b/recipes/linux/linux_2.6.38.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r3"
+PR = "r4"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -12,11 +12,54 @@ DEFAULT_PREFERENCE_poodle = "1"
 DEFAULT_PREFERENCE_spitz = "1"
 DEFAULT_PREFERENCE_tosa = "1"
 DEFAULT_PREFERENCE_ts72xx = "1"
+DEFAULT_PREFERENCE_at572d940hfek = "4"
+DEFAULT_PREFERENCE_at91cap9adk = "4"
+DEFAULT_PREFERENCE_at91rm9200 = "4"
+DEFAULT_PREFERENCE_at91rm9200dk = "4"
+DEFAULT_PREFERENCE_at91rm9200ek = "4"
+DEFAULT_PREFERENCE_at91sam9260ek = "4"
+DEFAULT_PREFERENCE_at91sam9261ek = "4"
+DEFAULT_PREFERENCE_at91sam9263ek = "4"
+DEFAULT_PREFERENCE_at91sam9g10ek = "4"
+DEFAULT_PREFERENCE_at91sam9g20ek = "4"
+DEFAULT_PREFERENCE_at91sam9g20ek_2mmc = "4"
+DEFAULT_PREFERENCE_at91sam9g45ekes = "4"
+DEFAULT_PREFERENCE_at91sam9m10ekes = "4"
+DEFAULT_PREFERENCE_at91sam9m10g45ek = "4"
+DEFAULT_PREFERENCE_at91sam9rlek = "4"
+DEFAULT_PREFERENCE_at91sam9xeek = "4"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
            file://defconfig "
 
+SRC_URI_at91 = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+	file://0001-Maxim-patch-updated-from-2.6.30-to-2.6.38.patch;apply=yes \
+	file://0002-Add-MACB-TX-Buffer-in-SRAM-support.patch;apply=yes \
+	file://0003-AT91-atmel-mci-Platform-configuration-to-the-the-atm.patch;apply=yes \
+	file://0004-at91_mci-Do-a-reset-after-each-request.patch;apply=yes \
+	file://0005-at91-at91sam9g20ek-modify-dual-slot-evaluation-kit.patch;apply=yes \
+	file://0006-at91-add-gpio-buttons-to-at91sam9g20-ek-2mmc.patch;apply=yes \
+	file://0007-Bug-workaround-for-channel-in-ac97.patch;apply=yes \
+	file://0008-input-atmel_tsadcc-report-fake-pressure-measure.patch;apply=yes \
+	file://0009-at91-No-more-SD-MMC-Write-Protect-pin-connected-on-a.patch;apply=yes \
+	file://0010-net-macb-modify-SRAM-location-of-descriptor-buffers-.patch;apply=yes \
+	file://0011-at91-add-pwm-support-in-Kconfig-for-at91sam9g45.patch;apply=yes \
+	file://0012-at91-add-I2C-definitions-for-at91sam9g20ek-boards.patch;apply=yes \
+	file://0013-at91-add-at91sam9g10ek-defconfig-file.patch;apply=yes \
+	file://0014-t91-add-at91sam9m10ekes-support.patch;apply=yes \
+	file://0015-at91-at91sam9m10-add-dma-touchscreen-mmc-usb-host-an.patch;apply=yes \
+	file://0016-at91-at91sam9m10-add-video-decoder-clock.patch;apply=yes \
+	file://0017-at91sam9m10-add-on2-8170-gpl-modules.patch;apply=yes \
+	file://0018-sound-atmel-ac97-add-warm-reset-if-no-reset-pin.patch;apply=yes \
+	file://0019-at91-introduce-at91sam9m10g45ek-board.patch;apply=yes \
+	file://0020-input-atmel_tsadcc-introduce-changes-needed-for-at91.patch;apply=yes \
+	file://0021-at91-Clean-up-choiuce-of-sam9m10-g45-boards.patch;apply=yes \
+	file://0022-at91-Add-support-for-configurable-NAND-flash-partiti.patch;apply=yes \
+	file://0023-at91-Update-defconfig-s-for-atmel-at91-boards.patch;apply=yes \
+	file://0024-at91-Cleanup-of-defconfig-s.patch;apply=yes \
+	file://defconfig "
+
 SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_c7x0 = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_collie = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
-- 
1.7.4.1



