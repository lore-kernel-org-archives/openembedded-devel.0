Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id ADCAC6102E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 22:01:46 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2264447eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 15:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tTbgEV8fX4ngai6EylE2u6eayZPYmlzM6chuyRBkTAE=;
	b=EOeEBoZt7va06z49Wjn3GJYaQCHF6t/rjppKYscJFG2h01VpVNIlkWZU0QFa5XesrG
	i866pLYYrEPGvXmpxJkon6+ZilBpAVIUX9J8ihFXG6exTX/Zi7NStStPbd9mT7uPJ+0Q
	WNV51putrwUelPh61MP8XCrskri3jF4cq6d/jplDodZ/Y+FYiyuSmDRE7j9V4qLk2d7G
	rWMLw9hwxLNFOntH2D9zEHbZ/ZKDMrevKSBS5hZ7kQzxpfFJL6tSUzD0fNi1lzHHzPsP
	uZOCe59fYhG4LBc5RVkkbLBIb+DAJuDXaz3sRIKh/djezZdBhVdv0el3tWMTbGuuhd96
	V9+A==
X-Received: by 10.15.64.1 with SMTP id n1mr32283823eex.15.1380492107938;
	Sun, 29 Sep 2013 15:01:47 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id h52sm43775430eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Sep 2013 15:01:47 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Sep 2013 00:01:40 +0200
Message-Id: <1380492100-3097-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux: archive obsolete kernel recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Sep 2013 22:01:47 -0000

The recipes are still parseable and buildable
but a major cleanup is awaited.
Please extend the linux-yocto most recent .bbappend
for your device instead of committing a new recipe.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...--ARM-5407-1-SA1100-drop-broken-for-ages-iPAQ-h380.patch |   0
 ...2--ARM-5408-1-SA1100-update-defconfigs-after-h3800.patch |   0
 ...--ARM-5423-1-SA1100-remove-unused-H3600_SLEEVE-Kco.patch |   0
 ...04--ARM-5424-1-h3600-clean-up-mtd-partitions-table.patch |   0
 ...--ARM-5425-1-h3600-first-stage-of-ipaq_model_ops-c.patch |   0
 ...--ARM-5426-1-h3600-remove-clr_h3600_egpio-set_h360.patch |   0
 ...007--ARM-5427-1-h3600-ipaq_model_ops-final-cleanup.patch |   0
 ...LSA-drop-outdated-and-broken-sa11xx-uda1341-driver.patch |   0
 .../0009-mtd-remove-obsolete-ipaq-flash-driver.patch        |   0
 .../0010-h3600-introduce-new-set-of-GPIO-defines.patch      |   0
 .../02_cleanup_wip/0011-h3600-remove-unused-includes.patch  |   0
 .../0012-h3600-add-include-linux-gpio.h.patch               |   0
 .../0013-h3600-split-common-h3xxx_lcd_power.patch           |   0
 .../0014-h3600-split-common-h3xxx_mach_init.patch           |   0
 ...3600-remove-IRDA-tranceiver-stuff-from-serial-PM-c.patch |   0
 ...h3600-switch-serial-hooks-to-use-gpiolib-functions.patch |   0
 ...3600-remove-unused-set_wake-callback-from-sa1100_p.patch |   0
 ...8-serial-remove-unused-set_wake-from-sa1100_serial.patch |   0
 ...9-h3600-add-gpio-keys-for-Power-and-Action-buttons.patch |   0
 ...-input-fix-compilation-of-h3600-touchscreen-driver.patch |   0
 .../0021-input-fix-h3600_ts_input-kconfig-dependency.patch  |   0
 ...MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3600.patch |   0
 ...input-driver-for-keys-connected-to-microcontroller.patch |   0
 ...4-input-driver-for-touchscreen-on-iPaq-h3600-h3100.patch |   0
 ...power-add-driver-for-battery-reading-on-iPaq-h3600.patch |   0
 .../0026-h3600-add-micro-platform-device.patch              |   0
 .../03_add_features/0027-USB-add-sa1100_udc-driver.patch    |   0
 .../h3600/03_add_features/0028-h3600-fix-suspend-HACK.patch |   0
 ...9-pcmcia-fix-oops-on-suspend-in-sa1100_pcmcia-HACK.patch |   0
 .../linux/{ => obsolete}/linux-2.6.29/h3600/defconfig       |   0
 .../0005-SA1100-enable-second-serial-port-on-h3600.patch    |   0
 ...d-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch |   0
 .../linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch         |   0
 ...ly-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch |   0
 ...d-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch |   0
 .../linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch   |   0
 .../{ => obsolete}/linux-3.0.1/hx4700/0006-suspend.patch    |   0
 .../hx4700/0007-hx4700-change-led-trigger-assignments.patch |   0
 .../linux/{ => obsolete}/linux-3.0.1/hx4700/defconfig       |   0
 .../0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch     |   0
 .../linux-3.1/h1940/0002-s3cmci-minor-fixups.patch          |   0
 ...ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch |   0
 .../0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch    |   0
 .../h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch  |   0
 .../h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch  |   0
 .../0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch     |   0
 .../h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch |   0
 .../linux-3.1/h1940/0009-rfkill-add-IR-type.patch           |   0
 .../0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch   |   0
 .../linux-3.1/h1940/0011-ARM-h1940-add-IR-switch.patch      |   0
 .../h1940/0012-ARM-h1940-increase-oversampling-shift.patch  |   0
 .../linux/{ => obsolete}/linux-3.1/h1940/defconfig          |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmld/defconfig      |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmt650/defconfig    |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmtc/defconfig      |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmtt3/defconfig     |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmtt5/defconfig     |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmtx/busybox-config |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmtx/defconfig      |   0
 .../linux/{ => obsolete}/linux-hackndev-2.6/palmtx/init     |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmtx/initramfs_list |   0
 .../{ => obsolete}/linux-hackndev-2.6/palmz72/defconfig     |   0
 .../linux/{ => obsolete}/linux-hackndev-2.6_git.bb          |   0
 ...-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch |   0
 .../linux-handhelds-2.6-2.6.21/asus620/defconfig            |   0
 .../linux-handhelds-2.6-2.6.21/asus730/defconfig            |   0
 .../linux-handhelds-2.6-2.6.21/aximx50/defconfig            |   0
 .../linux-handhelds-2.6-2.6.21/eteng500/defconfig           |   0
 .../linux-handhelds-2.6-2.6.21/gcc4x-limits.patch           |   0
 .../linux-handhelds-2.6-2.6.21/h1910/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/h2200/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/h3600/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/h3800/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/h3900/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/h4000/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/h5000/defconfig              |   0
 .../linux-handhelds-2.6-2.6.21/htcalpine/defconfig          |   0
 .../linux-handhelds-2.6-2.6.21/htcapache/defconfig          |   0
 .../linux-handhelds-2.6-2.6.21/htcbeetles/defconfig         |   0
 .../linux-handhelds-2.6-2.6.21/htcblueangel/defconfig       |   0
 .../linux-handhelds-2.6-2.6.21/htchimalaya/defconfig        |   0
 .../linux-handhelds-2.6-2.6.21/htcsable/defconfig           |   0
 .../linux-handhelds-2.6-2.6.21/htcuniversal/defconfig       |   0
 .../linux-handhelds-2.6-2.6.21/htcwallaby/defconfig         |   0
 .../linux-handhelds-2.6-2.6.21/hx4700/defconfig             |   0
 ...x-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch |   0
 .../linux-handhelds-2.6-2.6.21/looxc550/defconfig           |   0
 .../linux-handhelds-2.6-2.6.21/magician/defconfig           |   0
 .../linux-handhelds-2.6-2.6.21/makefile-implicit.patch      |   0
 .../linux-handhelds-2.6-2.6.21/rx1950/defconfig             |   0
 .../linux-handhelds-2.6-2.6.21/rx3000/defconfig             |   0
 recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6.inc |   0
 .../linux/{ => obsolete}/linux-handhelds-2.6_2.6.21-hh20.bb |   0
 .../linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote     |   0
 .../fix-gcc-4.6.0-build-errors.patch                        |   0
 .../linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch        |   0
 .../logo_linux_clut224.tar.gz                               | Bin
 .../linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch     |   0
 .../linux/{ => obsolete}/linux-jlime-ben-nanonote_2.6.36.bb |   0
 .../linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch      |   0
 .../linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch   |   0
 .../linux-jlime-jornada6xx-2.6.17/defconfig_jlime           |   0
 .../linux-jlime-jornada6xx-2.6.17/io.h-fix.patch            |   0
 .../keyboard-fix-deadkeys.patch                             |   0
 .../linux-jlime-jornada6xx-2.6.17/keymap-fix.patch          |   0
 .../linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch          |   0
 .../linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch  |   0
 .../linux/{ => obsolete}/linux-jlime-jornada6xx_2.6.17.bb   |   0
 .../{ => obsolete}/linux-jlime-jornada7xx_2.6.37+git.bb     |   0
 .../linux-palm-omap1-2.6.22-omap1/palmtt/defconfig          |   0
 .../linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig         |   0
 .../linux-palm-omap1-2.6.22-omap1/palmz71/defconfig         |   0
 .../linux/{ => obsolete}/linux-palm-omap1_2.6.22-omap1.bb   |   0
 recipes-kernel/linux/{ => obsolete}/linux.inc               |   0
 recipes-kernel/linux/{ => obsolete}/linux_2.6.29.bb         |   0
 recipes-kernel/linux/{ => obsolete}/linux_3.0.1.bb          |   0
 recipes-kernel/linux/{ => obsolete}/linux_3.1.bb            |   0
 recipes-kernel/linux/{ => obsolete}/openezx-kernel_git.bb   |   0
 118 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0001--ARM-5407-1-SA1100-drop-broken-for-ages-iPAQ-h380.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0002--ARM-5408-1-SA1100-update-defconfigs-after-h3800.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0003--ARM-5423-1-SA1100-remove-unused-H3600_SLEEVE-Kco.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0004--ARM-5424-1-h3600-clean-up-mtd-partitions-table.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0005--ARM-5425-1-h3600-first-stage-of-ipaq_model_ops-c.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0006--ARM-5426-1-h3600-remove-clr_h3600_egpio-set_h360.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0007--ARM-5427-1-h3600-ipaq_model_ops-final-cleanup.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/01_pushed_upstream/0008-ALSA-drop-outdated-and-broken-sa11xx-uda1341-driver.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0009-mtd-remove-obsolete-ipaq-flash-driver.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0010-h3600-introduce-new-set-of-GPIO-defines.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0011-h3600-remove-unused-includes.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0012-h3600-add-include-linux-gpio.h.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0013-h3600-split-common-h3xxx_lcd_power.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0014-h3600-split-common-h3xxx_mach_init.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0015-h3600-remove-IRDA-tranceiver-stuff-from-serial-PM-c.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0016-h3600-switch-serial-hooks-to-use-gpiolib-functions.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0017-h3600-remove-unused-set_wake-callback-from-sa1100_p.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/02_cleanup_wip/0018-serial-remove-unused-set_wake-from-sa1100_serial.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0019-h3600-add-gpio-keys-for-Power-and-Action-buttons.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0020-input-fix-compilation-of-h3600-touchscreen-driver.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0021-input-fix-h3600_ts_input-kconfig-dependency.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0022-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3600.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0023-input-driver-for-keys-connected-to-microcontroller.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0024-input-driver-for-touchscreen-on-iPaq-h3600-h3100.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0025-power-add-driver-for-battery-reading-on-iPaq-h3600.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0026-h3600-add-micro-platform-device.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0027-USB-add-sa1100_udc-driver.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0028-h3600-fix-suspend-HACK.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/03_add_features/0029-pcmcia-fix-oops-on-suspend-in-sa1100_pcmcia-HACK.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-2.6.29/h3600/misc/patch_needed_for_old_touchscreen_driver/0005-SA1100-enable-second-serial-port-on-h3600.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0006-suspend.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.0.1/hx4700/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0002-s3cmci-minor-fixups.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0003-ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0009-rfkill-add-IR-type.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0011-ARM-h1940-add-IR-switch.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/0012-ARM-h1940-increase-oversampling-shift.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-3.1/h1940/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmld/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmt650/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtc/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtt3/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtt5/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtx/busybox-config (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtx/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtx/init (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmtx/initramfs_list (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6/palmz72/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-hackndev-2.6_git.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/asus620/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/asus730/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/aximx50/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/eteng500/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/gcc4x-limits.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h1910/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h2200/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h3600/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h3800/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h3900/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h4000/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/h5000/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcalpine/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcapache/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcbeetles/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcblueangel/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htchimalaya/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcsable/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcuniversal/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/htcwallaby/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/hx4700/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/looxc550/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/magician/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/makefile-implicit.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/rx1950/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6-2.6.21/rx3000/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6.inc (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-handhelds-2.6_2.6.21-hh20.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-ben-nanonote_2.6.36.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/defconfig_jlime (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/io.h-fix.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/keyboard-fix-deadkeys.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/keymap-fix.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada6xx_2.6.17.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-jlime-jornada7xx_2.6.37+git.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-palm-omap1-2.6.22-omap1/palmtt/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-palm-omap1-2.6.22-omap1/palmz71/defconfig (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux-palm-omap1_2.6.22-omap1.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux.inc (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux_2.6.29.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux_3.0.1.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/linux_3.1.bb (100%)
 rename recipes-kernel/linux/{ => obsolete}/openezx-kernel_git.bb (100%)

diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0001--ARM-5407-1-SA1100-drop-broken-for-ages-iPAQ-h380.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0001--ARM-5407-1-SA1100-drop-broken-for-ages-iPAQ-h380.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0001--ARM-5407-1-SA1100-drop-broken-for-ages-iPAQ-h380.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0001--ARM-5407-1-SA1100-drop-broken-for-ages-iPAQ-h380.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0002--ARM-5408-1-SA1100-update-defconfigs-after-h3800.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0002--ARM-5408-1-SA1100-update-defconfigs-after-h3800.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0002--ARM-5408-1-SA1100-update-defconfigs-after-h3800.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0002--ARM-5408-1-SA1100-update-defconfigs-after-h3800.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0003--ARM-5423-1-SA1100-remove-unused-H3600_SLEEVE-Kco.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0003--ARM-5423-1-SA1100-remove-unused-H3600_SLEEVE-Kco.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0003--ARM-5423-1-SA1100-remove-unused-H3600_SLEEVE-Kco.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0003--ARM-5423-1-SA1100-remove-unused-H3600_SLEEVE-Kco.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0004--ARM-5424-1-h3600-clean-up-mtd-partitions-table.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0004--ARM-5424-1-h3600-clean-up-mtd-partitions-table.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0004--ARM-5424-1-h3600-clean-up-mtd-partitions-table.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0004--ARM-5424-1-h3600-clean-up-mtd-partitions-table.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0005--ARM-5425-1-h3600-first-stage-of-ipaq_model_ops-c.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0005--ARM-5425-1-h3600-first-stage-of-ipaq_model_ops-c.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0005--ARM-5425-1-h3600-first-stage-of-ipaq_model_ops-c.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0005--ARM-5425-1-h3600-first-stage-of-ipaq_model_ops-c.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0006--ARM-5426-1-h3600-remove-clr_h3600_egpio-set_h360.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0006--ARM-5426-1-h3600-remove-clr_h3600_egpio-set_h360.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0006--ARM-5426-1-h3600-remove-clr_h3600_egpio-set_h360.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0006--ARM-5426-1-h3600-remove-clr_h3600_egpio-set_h360.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0007--ARM-5427-1-h3600-ipaq_model_ops-final-cleanup.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0007--ARM-5427-1-h3600-ipaq_model_ops-final-cleanup.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0007--ARM-5427-1-h3600-ipaq_model_ops-final-cleanup.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0007--ARM-5427-1-h3600-ipaq_model_ops-final-cleanup.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0008-ALSA-drop-outdated-and-broken-sa11xx-uda1341-driver.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0008-ALSA-drop-outdated-and-broken-sa11xx-uda1341-driver.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/01_pushed_upstream/0008-ALSA-drop-outdated-and-broken-sa11xx-uda1341-driver.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/01_pushed_upstream/0008-ALSA-drop-outdated-and-broken-sa11xx-uda1341-driver.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0009-mtd-remove-obsolete-ipaq-flash-driver.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0009-mtd-remove-obsolete-ipaq-flash-driver.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0009-mtd-remove-obsolete-ipaq-flash-driver.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0009-mtd-remove-obsolete-ipaq-flash-driver.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0010-h3600-introduce-new-set-of-GPIO-defines.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0010-h3600-introduce-new-set-of-GPIO-defines.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0010-h3600-introduce-new-set-of-GPIO-defines.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0010-h3600-introduce-new-set-of-GPIO-defines.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0011-h3600-remove-unused-includes.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0011-h3600-remove-unused-includes.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0011-h3600-remove-unused-includes.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0011-h3600-remove-unused-includes.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0012-h3600-add-include-linux-gpio.h.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0012-h3600-add-include-linux-gpio.h.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0012-h3600-add-include-linux-gpio.h.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0012-h3600-add-include-linux-gpio.h.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0013-h3600-split-common-h3xxx_lcd_power.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0013-h3600-split-common-h3xxx_lcd_power.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0013-h3600-split-common-h3xxx_lcd_power.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0013-h3600-split-common-h3xxx_lcd_power.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0014-h3600-split-common-h3xxx_mach_init.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0014-h3600-split-common-h3xxx_mach_init.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0014-h3600-split-common-h3xxx_mach_init.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0014-h3600-split-common-h3xxx_mach_init.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0015-h3600-remove-IRDA-tranceiver-stuff-from-serial-PM-c.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0015-h3600-remove-IRDA-tranceiver-stuff-from-serial-PM-c.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0015-h3600-remove-IRDA-tranceiver-stuff-from-serial-PM-c.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0015-h3600-remove-IRDA-tranceiver-stuff-from-serial-PM-c.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0016-h3600-switch-serial-hooks-to-use-gpiolib-functions.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0016-h3600-switch-serial-hooks-to-use-gpiolib-functions.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0016-h3600-switch-serial-hooks-to-use-gpiolib-functions.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0016-h3600-switch-serial-hooks-to-use-gpiolib-functions.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0017-h3600-remove-unused-set_wake-callback-from-sa1100_p.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0017-h3600-remove-unused-set_wake-callback-from-sa1100_p.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0017-h3600-remove-unused-set_wake-callback-from-sa1100_p.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0017-h3600-remove-unused-set_wake-callback-from-sa1100_p.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0018-serial-remove-unused-set_wake-from-sa1100_serial.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0018-serial-remove-unused-set_wake-from-sa1100_serial.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/02_cleanup_wip/0018-serial-remove-unused-set_wake-from-sa1100_serial.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/02_cleanup_wip/0018-serial-remove-unused-set_wake-from-sa1100_serial.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0019-h3600-add-gpio-keys-for-Power-and-Action-buttons.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0019-h3600-add-gpio-keys-for-Power-and-Action-buttons.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0019-h3600-add-gpio-keys-for-Power-and-Action-buttons.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0019-h3600-add-gpio-keys-for-Power-and-Action-buttons.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0020-input-fix-compilation-of-h3600-touchscreen-driver.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0020-input-fix-compilation-of-h3600-touchscreen-driver.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0020-input-fix-compilation-of-h3600-touchscreen-driver.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0020-input-fix-compilation-of-h3600-touchscreen-driver.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0021-input-fix-h3600_ts_input-kconfig-dependency.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0021-input-fix-h3600_ts_input-kconfig-dependency.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0021-input-fix-h3600_ts_input-kconfig-dependency.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0021-input-fix-h3600_ts_input-kconfig-dependency.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0022-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3600.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0022-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3600.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0022-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3600.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0022-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3600.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0023-input-driver-for-keys-connected-to-microcontroller.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0023-input-driver-for-keys-connected-to-microcontroller.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0023-input-driver-for-keys-connected-to-microcontroller.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0023-input-driver-for-keys-connected-to-microcontroller.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0024-input-driver-for-touchscreen-on-iPaq-h3600-h3100.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0024-input-driver-for-touchscreen-on-iPaq-h3600-h3100.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0024-input-driver-for-touchscreen-on-iPaq-h3600-h3100.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0024-input-driver-for-touchscreen-on-iPaq-h3600-h3100.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0025-power-add-driver-for-battery-reading-on-iPaq-h3600.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0025-power-add-driver-for-battery-reading-on-iPaq-h3600.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0025-power-add-driver-for-battery-reading-on-iPaq-h3600.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0025-power-add-driver-for-battery-reading-on-iPaq-h3600.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0026-h3600-add-micro-platform-device.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0026-h3600-add-micro-platform-device.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0026-h3600-add-micro-platform-device.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0026-h3600-add-micro-platform-device.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0027-USB-add-sa1100_udc-driver.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0027-USB-add-sa1100_udc-driver.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0027-USB-add-sa1100_udc-driver.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0027-USB-add-sa1100_udc-driver.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0028-h3600-fix-suspend-HACK.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0028-h3600-fix-suspend-HACK.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0028-h3600-fix-suspend-HACK.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0028-h3600-fix-suspend-HACK.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0029-pcmcia-fix-oops-on-suspend-in-sa1100_pcmcia-HACK.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0029-pcmcia-fix-oops-on-suspend-in-sa1100_pcmcia-HACK.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/03_add_features/0029-pcmcia-fix-oops-on-suspend-in-sa1100_pcmcia-HACK.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/03_add_features/0029-pcmcia-fix-oops-on-suspend-in-sa1100_pcmcia-HACK.patch
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/defconfig b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/defconfig
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/defconfig
diff --git a/recipes-kernel/linux/linux-2.6.29/h3600/misc/patch_needed_for_old_touchscreen_driver/0005-SA1100-enable-second-serial-port-on-h3600.patch b/recipes-kernel/linux/obsolete/linux-2.6.29/h3600/misc/patch_needed_for_old_touchscreen_driver/0005-SA1100-enable-second-serial-port-on-h3600.patch
similarity index 100%
rename from recipes-kernel/linux/linux-2.6.29/h3600/misc/patch_needed_for_old_touchscreen_driver/0005-SA1100-enable-second-serial-port-on-h3600.patch
rename to recipes-kernel/linux/obsolete/linux-2.6.29/h3600/misc/patch_needed_for_old_touchscreen_driver/0005-SA1100-enable-second-serial-port-on-h3600.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0006-suspend.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0006-suspend.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0006-suspend.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0006-suspend.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch
diff --git a/recipes-kernel/linux/linux-3.0.1/hx4700/defconfig b/recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-3.0.1/hx4700/defconfig
rename to recipes-kernel/linux/obsolete/linux-3.0.1/hx4700/defconfig
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0002-s3cmci-minor-fixups.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0002-s3cmci-minor-fixups.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0002-s3cmci-minor-fixups.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0002-s3cmci-minor-fixups.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0003-ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0003-ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0003-ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0003-ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0009-rfkill-add-IR-type.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0009-rfkill-add-IR-type.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0009-rfkill-add-IR-type.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0009-rfkill-add-IR-type.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0011-ARM-h1940-add-IR-switch.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0011-ARM-h1940-add-IR-switch.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0011-ARM-h1940-add-IR-switch.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0011-ARM-h1940-add-IR-switch.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/0012-ARM-h1940-increase-oversampling-shift.patch b/recipes-kernel/linux/obsolete/linux-3.1/h1940/0012-ARM-h1940-increase-oversampling-shift.patch
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/0012-ARM-h1940-increase-oversampling-shift.patch
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/0012-ARM-h1940-increase-oversampling-shift.patch
diff --git a/recipes-kernel/linux/linux-3.1/h1940/defconfig b/recipes-kernel/linux/obsolete/linux-3.1/h1940/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-3.1/h1940/defconfig
rename to recipes-kernel/linux/obsolete/linux-3.1/h1940/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmld/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmld/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmld/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmld/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmt650/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmt650/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmt650/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmt650/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtc/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtc/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtc/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtc/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtt3/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtt3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtt3/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtt3/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtt5/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtt5/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtt5/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtt5/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtx/busybox-config b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/busybox-config
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtx/busybox-config
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/busybox-config
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtx/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtx/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtx/init b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/init
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtx/init
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/init
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmtx/initramfs_list b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/initramfs_list
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmtx/initramfs_list
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmtx/initramfs_list
diff --git a/recipes-kernel/linux/linux-hackndev-2.6/palmz72/defconfig b/recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmz72/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6/palmz72/defconfig
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6/palmz72/defconfig
diff --git a/recipes-kernel/linux/linux-hackndev-2.6_git.bb b/recipes-kernel/linux/obsolete/linux-hackndev-2.6_git.bb
similarity index 100%
rename from recipes-kernel/linux/linux-hackndev-2.6_git.bb
rename to recipes-kernel/linux/obsolete/linux-hackndev-2.6_git.bb
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/asus620/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/asus620/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/asus620/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/asus620/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/asus730/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/asus730/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/asus730/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/asus730/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/aximx50/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/aximx50/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/aximx50/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/aximx50/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/eteng500/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/eteng500/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/eteng500/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/eteng500/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/gcc4x-limits.patch b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/gcc4x-limits.patch
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/gcc4x-limits.patch
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/gcc4x-limits.patch
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h1910/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h1910/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h1910/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h1910/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h2200/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h2200/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h2200/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h2200/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3600/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h3600/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3600/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h3600/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3800/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h3800/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3800/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h3800/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3900/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h3900/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3900/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h3900/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h4000/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h4000/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h4000/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h4000/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h5000/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h5000/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h5000/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/h5000/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcalpine/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcalpine/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcalpine/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcalpine/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcapache/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcapache/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcapache/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcapache/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcbeetles/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcbeetles/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcbeetles/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcbeetles/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcblueangel/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcblueangel/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcblueangel/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcblueangel/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htchimalaya/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htchimalaya/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htchimalaya/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htchimalaya/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcsable/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcsable/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcsable/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcsable/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcuniversal/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcuniversal/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcuniversal/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcuniversal/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcwallaby/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcwallaby/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcwallaby/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/htcwallaby/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/hx4700/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/hx4700/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/hx4700/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/hx4700/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/looxc550/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/looxc550/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/looxc550/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/looxc550/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/magician/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/magician/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/magician/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/magician/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/makefile-implicit.patch b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/makefile-implicit.patch
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/makefile-implicit.patch
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/makefile-implicit.patch
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/rx1950/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/rx1950/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/rx1950/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/rx1950/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6-2.6.21/rx3000/defconfig b/recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/rx3000/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6-2.6.21/rx3000/defconfig
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6-2.6.21/rx3000/defconfig
diff --git a/recipes-kernel/linux/linux-handhelds-2.6.inc b/recipes-kernel/linux/obsolete/linux-handhelds-2.6.inc
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6.inc
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6.inc
diff --git a/recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb b/recipes-kernel/linux/obsolete/linux-handhelds-2.6_2.6.21-hh20.bb
similarity index 100%
rename from recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb
rename to recipes-kernel/linux/obsolete/linux-handhelds-2.6_2.6.21-hh20.bb
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote b/recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote
rename to recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch b/recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch b/recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz b/recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz
rename to recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch b/recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb b/recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote_2.6.36.bb
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb
rename to recipes-kernel/linux/obsolete/linux-jlime-ben-nanonote_2.6.36.bb
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/defconfig_jlime b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/defconfig_jlime
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/defconfig_jlime
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/defconfig_jlime
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/io.h-fix.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/io.h-fix.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/io.h-fix.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/io.h-fix.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/keyboard-fix-deadkeys.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/keyboard-fix-deadkeys.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/keyboard-fix-deadkeys.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/keyboard-fix-deadkeys.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/keymap-fix.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/keymap-fix.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/keymap-fix.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/keymap-fix.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch
diff --git a/recipes-kernel/linux/linux-jlime-jornada6xx_2.6.17.bb b/recipes-kernel/linux/obsolete/linux-jlime-jornada6xx_2.6.17.bb
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada6xx_2.6.17.bb
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada6xx_2.6.17.bb
diff --git a/recipes-kernel/linux/linux-jlime-jornada7xx_2.6.37+git.bb b/recipes-kernel/linux/obsolete/linux-jlime-jornada7xx_2.6.37+git.bb
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-jornada7xx_2.6.37+git.bb
rename to recipes-kernel/linux/obsolete/linux-jlime-jornada7xx_2.6.37+git.bb
diff --git a/recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmtt/defconfig b/recipes-kernel/linux/obsolete/linux-palm-omap1-2.6.22-omap1/palmtt/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmtt/defconfig
rename to recipes-kernel/linux/obsolete/linux-palm-omap1-2.6.22-omap1/palmtt/defconfig
diff --git a/recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig b/recipes-kernel/linux/obsolete/linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig
rename to recipes-kernel/linux/obsolete/linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig
diff --git a/recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmz71/defconfig b/recipes-kernel/linux/obsolete/linux-palm-omap1-2.6.22-omap1/palmz71/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmz71/defconfig
rename to recipes-kernel/linux/obsolete/linux-palm-omap1-2.6.22-omap1/palmz71/defconfig
diff --git a/recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb b/recipes-kernel/linux/obsolete/linux-palm-omap1_2.6.22-omap1.bb
similarity index 100%
rename from recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb
rename to recipes-kernel/linux/obsolete/linux-palm-omap1_2.6.22-omap1.bb
diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/obsolete/linux.inc
similarity index 100%
rename from recipes-kernel/linux/linux.inc
rename to recipes-kernel/linux/obsolete/linux.inc
diff --git a/recipes-kernel/linux/linux_2.6.29.bb b/recipes-kernel/linux/obsolete/linux_2.6.29.bb
similarity index 100%
rename from recipes-kernel/linux/linux_2.6.29.bb
rename to recipes-kernel/linux/obsolete/linux_2.6.29.bb
diff --git a/recipes-kernel/linux/linux_3.0.1.bb b/recipes-kernel/linux/obsolete/linux_3.0.1.bb
similarity index 100%
rename from recipes-kernel/linux/linux_3.0.1.bb
rename to recipes-kernel/linux/obsolete/linux_3.0.1.bb
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/obsolete/linux_3.1.bb
similarity index 100%
rename from recipes-kernel/linux/linux_3.1.bb
rename to recipes-kernel/linux/obsolete/linux_3.1.bb
diff --git a/recipes-kernel/linux/openezx-kernel_git.bb b/recipes-kernel/linux/obsolete/openezx-kernel_git.bb
similarity index 100%
rename from recipes-kernel/linux/openezx-kernel_git.bb
rename to recipes-kernel/linux/obsolete/openezx-kernel_git.bb
-- 
1.8.1.5


