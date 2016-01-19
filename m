Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 635466FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 22:28:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r129so109090821wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4KDnsJlwl9XL+VhOe4fyJJ9+GBl74FTTyq6Trt7tUqY=;
	b=NcGdJeZKHNRJ3Ja+45gkc1ViEb0w1WS1dgZv4pZAkVa6dREokWWzJsilzAAi8/xUtd
	AKTqMt8JGb3puMYXVY/2LgR46w+clY0rPdRFb7kH3mRMSE2MFy9lHCzMS2oo0XDn2hFF
	dI4m6H/EQXrrJPOSU9adp/jDH59ZK21ft9hrZD2QO5x83jIsfafubiB2fTzZmK5qVJua
	tSkV1Opsq5imPtQDAQ5GM+Er9neglfu1IJQOpEWJJFZMbpooer2suVdjdiIBWnB7h4H5
	EyBqCy0F/ZKQJdcF5hGeHMTQYEqUr95EPVsrTiArPwZBRcqqB0/SzhtdFGO+uLCi1jh5
	Gu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4KDnsJlwl9XL+VhOe4fyJJ9+GBl74FTTyq6Trt7tUqY=;
	b=d/z30FAawaz1nOpDCk4RhrhKRubrfAU5LzHsC4NXs8qBwiSEVYhG/cRfUzwhIVxJqs
	Zxf4UAsU0j8TqwnaYEgXxihjvT0bQlow3N5Mfe+DbRPCOBcKK42qWJPzpq75ibAnorYA
	qVEJ2sbGOeDvf6h/FUmtKU5crzbRo7+kxNSDlmPjehVUShDnHQ+T1uZYdE18+0i0IAuj
	3qsE5rbjzWEGNG/fOyfE/CseLc95H/0OWtWQa2uk9kR0n8hAs6vt+SdCI1KluUo5jNbq
	zf3RJJFO17fZvHNa2GpSYWH9piTrto59gzGLjwiBuus0tVeNRkDUVPQeUQnZG31Xl/12
	ZC4A==
X-Gm-Message-State: AG10YOT2qex4wc+iKC5eabH15uwhhReSIm3cDMxPzfLOCx5EVFgo3qXqRX84zLiCqyxuNQ==
X-Received: by 10.28.4.145 with SMTP id 139mr389678wme.56.1453242484087;
	Tue, 19 Jan 2016 14:28:04 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host48-23-dynamic.14-87-r.retail.telecomitalia.it. [87.14.23.48])
	by smtp.gmail.com with ESMTPSA id
	x6sm30302634wje.38.2016.01.19.14.28.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 14:28:03 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2016 23:27:48 +0100
Message-Id: <cover.1453242080.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull request 2016-01-19
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2016 22:28:05 -0000

The following changes since commit 1dc06f845b2ac531f64d3154ea6280f9243fc865:

  layer.conf: add LAYERDEPENDS (2015-06-18 00:38:32 +0100)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-handheld master

for you to fetch changes up to 526de214f4f88b41c41adc74da30637757acbee7:

  linux-handheld: initial commit of v. 4.4 for PXA and SA1100 devices (2016-01-19 22:50:27 +0100)

Andrea Adami (2):
  linux-yocto_3.14: remove stale recipe
  linux-handheld: initial commit of v. 4.4 for PXA and SA1100 devices

 .../linux/linux-handheld-4.4/OE-qvga-logo.patch    | 232025 +++++
 .../linux/linux-handheld-4.4/OE-vga-logo.patch     | 923225 ++++++++++++++++++
 .../linux/linux-handheld-4.4/akita/defconfig       |    435 +
 .../linux/linux-handheld-4.4/c7x0/defconfig        |    366 +
 .../linux/linux-handheld-4.4/collie/defconfig      |    378 +
 .../linux/linux-handheld-4.4/h3600/defconfig       |     95 +
 .../linux/linux-handheld-4.4/hx4700/defconfig      |    178 +
 .../hx4700-change-led-trigger-assignments.patch    |     33 +
 .../0001-mfd-add-new-driver-for-Sharp-LoCoMo.patch |    574 +
 ...ort-locomo-leds-driver-to-new-locomo-core.patch |    173 +
 ...rt-LoCoMo-keyboard-driver-to-use-new-loco.patch |    452 +
 ...okbd-differentiate-between-two-Enter-keys.patch |     30 +
 ...backlight-add-new-locomo-backlight-driver.patch |    213 +
 .../0006-video-lcd-add-LoCoMo-LCD-driver.patch     |    349 +
 ...-port-LoCoMo-gpio-support-from-old-driver.patch |    225 +
 ...pio-locomo-implement-per-pin-irq-handling.patch |    223 +
 .../locomo/0009-i2c-add-locomo-i2c-driver.patch    |    196 +
 ...sa1100-make-collie-use-new-locomo-drivers.patch |    390 +
 ...00-don-t-preallocate-IRQ-space-for-locomo.patch |     45 +
 ...odle-make-use-of-new-locomo-GPIO-interfac.patch |    121 +
 ...0013-ARM-pxa-poodle-use-new-LoCoMo-driver.patch |    170 +
 ...dle-don-t-preallocate-IRQ-space-for-locom.patch |     31 +
 ...o-backlight-drop-old-locomo-bl-lcd-driver.patch |    279 +
 .../locomo/0016-ARM-drop-old-LoCoMo-driver.patch   |   1197 +
 ...LoCoMo-keyboard-driver-support-both-poodl.patch |     55 +
 .../locomo/0018-spi-add-locomo-SPI-driver.patch    |    390 +
 ...-add-gpio-charger-configuration-on-poodle.patch |     59 +
 ...RM-pxa-poodle-add-gpio-keys-configuration.patch |     76 +
 ...-ARM-pxa-declare-battery-device-on-poodle.patch |     65 +
 .../0022-power-add-poodle-battery-driver.patch     |    333 +
 .../locomo/0023-poodle-gpio-uart-hack.patch        |     25 +
 ...100-add-dummy-clk_set_rate-implementation.patch |     41 +
 ...-ts-use-gpiolib-to-access-TBL_CHK-pin-on-.patch |     93 +
 .../0034-mfd-ucb1x00-drop-old-io-accessors.patch   |    128 +
 ...cb1x00-add-irq-field-to-the-platform-data.patch |     28 +
 ...100-populate-codec-platform-data-with-irq.patch |     54 +
 ...0037-mfd-ucb1x00-make-use-of-provided-irq.patch |     36 +
 ...ucb11x0-don-t-exit-if-UCB-is-not-detected.patch |     26 +
 ...-emit-added-moved-or-deleted-file-warning.patch |     26 +
 ...ocomokbd-provide-an-Alt-SysRQ-combination.patch |     76 +
 .../linux/linux-handheld-4.4/poodle/defconfig      |    375 +
 .../linux/linux-handheld-4.4/spitz/defconfig       |    434 +
 ...deo-move-backlight-to-the-end-of-Makefile.patch |     34 +
 ...02-tosa-bl-correct-backlight-calculations.patch |     39 +
 ...-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch |     43 +
 .../linux/linux-handheld-4.4/tosa/defconfig        |    438 +
 recipes-kernel/linux/linux-handheld_4.4.bb         |     87 +
 .../linux/linux-yocto-3.14/OE-qvga-logo.patch      | 232025 -----
 .../linux/linux-yocto-3.14/OE-vga-logo.patch       | 923225 ------------------
 .../linux/linux-yocto-3.14/akita/defconfig         |    445 -
 .../linux-yocto-3.14/c7x0/corgi-gpio_keys.patch    |     80 -
 .../linux/linux-yocto-3.14/c7x0/defconfig          |    375 -
 .../collie/arm-sa1100-add-cpu-clock.patch          |     95 -
 .../collie/arm-sa1100-dummy-clk_set_rate.patch     |     33 -
 .../collie/collie-LH28F640BF.patch                 |     97 -
 .../collie/collie-add-bootblock.patch              |     29 -
 .../collie/collie-cfi-probe-again.patch            |     29 -
 .../linux-yocto-3.14/collie/collie-irda.patch      |     88 -
 .../collie/collie-mtd-resize.patch                 |     41 -
 .../collie/collie-use-gpio-charger.patch           |    113 -
 .../linux/linux-yocto-3.14/collie/defconfig        |    379 -
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  |    112 -
 .../collie/locomo-fix-SCL-SDA.patch                |     28 -
 .../collie/locomo_kbd_tweak-r2.patch               |     84 -
 .../collie/locomolcd-suspend-resume.patch          |     92 -
 .../collie/pcmcia-sa1100-device-clock.patch        |     91 -
 .../revert-arm-sa1100-dummy-clk_get_rate.patch     |     32 -
 .../h1940/0001-rfkill-add-IR-type.patch            |     59 -
 ...-Remove-S3C24XX_DMA-dependency-from-S3C24.patch |     30 -
 ...4xx-add-dma_coherent_mask-for-DMA-devices.patch |     35 -
 ...s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch |     34 -
 ...xx-drop-RFKILL-driver-for-H1940-bluetooth.patch |    202 -
 .../0006-ARM-s3c24xx-h1940-Add-nand-device.patch   |    126 -
 ...007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch |     41 -
 ...008-ARM-s3c24xx-h1940-unlock-reset-button.patch |     52 -
 ...3c24xx-h1940-add-bluetooth-RF-kill-switch.patch |    100 -
 .../0010-ARM-s3c24xx-h1940-add-IR-switch.patch     |     73 -
 ...s3c24xx-h1940-increase-oversampling-shift.patch |     29 -
 .../0012-ARM-s3c24xx-h1940-Add-DMA-device.patch    |     27 -
 ...engine-s3c24xx-dma-Process-whole-SG-chain.patch |     27 -
 ...e-s3c24xx-dma-Add-cyclic-transfer-support.patch |    183 -
 ...015-s3cmci-port-DMA-code-to-dmaengine-API.patch |    370 -
 ...g-s3c24-xx-12-i2s-port-to-use-generic-dma.patch |    385 -
 ...g-drop-support-for-legacy-S3C24XX-DMA-API.patch |    515 -
 .../linux/linux-yocto-3.14/h1940/defconfig         |    200 -
 ...r-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch |    712 -
 ...ARM-sa1100-add-Micro-ASIC-platform-device.patch |     73 -
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch |    208 -
 ...light-add-driver-for-iPAQ-micro-backlight.patch |    147 -
 ...nput-driver-for-touchscreen-on-iPaq-h3xxx.patch |    198 -
 .../0006-leds-add-driver-for-the-iPAQ-micro.patch  |    193 -
 ...-driver-for-battery-reading-on-iPaq-h3xxx.patch |    350 -
 .../linux/linux-yocto-3.14/h3600/defconfig         |     95 -
 .../linux/linux-yocto-3.14/hx4700/defconfig        |    180 -
 .../hx4700-change-led-trigger-assignments.patch    |     33 -
 .../linux/linux-yocto-3.14/poodle/defconfig        |    377 -
 .../poodle/locomo-fix-SCL-SDA.patch                |     28 -
 .../poodle/locomo_kbd_tweak-r2.patch               |     84 -
 .../poodle/locomolcd-suspend-resume.patch          |     92 -
 .../revert-check-on-console-device.patch           |     41 -
 .../linux/linux-yocto-3.14/spitz/defconfig         |    444 -
 ...deo-move-backlight-to-the-end-of-Makefile.patch |     34 -
 ...02-tosa-bl-correct-backlight-calculations.patch |     39 -
 ...-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch |     41 -
 .../0004-ARM-pxa-tosa-switch-to-gpio-charger.patch |     90 -
 ...5-ARM-pxa-tosa-fix-several-build-failures.patch |     32 -
 ...b-fail-ohci-suspend-if-full-state-restore.patch |     54 -
 ...97xx-adapt-parameters-to-tosa-touchscreen.patch |     31 -
 .../linux/linux-yocto-3.14/tosa/defconfig          |    448 -
 recipes-kernel/linux/linux-yocto_3.14.bbappend     |    137 -
 110 files changed, 1164364 insertions(+), 1164142 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/OE-qvga-logo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/OE-vga-logo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/h3600/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/hx4700/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/hx4700/hx4700-change-led-trigger-assignments.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0001-mfd-add-new-driver-for-Sharp-LoCoMo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0002-leds-port-locomo-leds-driver-to-new-locomo-core.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0003-input-convert-LoCoMo-keyboard-driver-to-use-new-loco.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0004-input-locomokbd-differentiate-between-two-Enter-keys.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0005-video-backlight-add-new-locomo-backlight-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0006-video-lcd-add-LoCoMo-LCD-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0007-gpio-port-LoCoMo-gpio-support-from-old-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0008-gpio-locomo-implement-per-pin-irq-handling.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0009-i2c-add-locomo-i2c-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0010-ARM-sa1100-make-collie-use-new-locomo-drivers.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0011-ARM-sa1100-don-t-preallocate-IRQ-space-for-locomo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0012-ASoC-pxa-poodle-make-use-of-new-locomo-GPIO-interfac.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0013-ARM-pxa-poodle-use-new-LoCoMo-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0014-ARM-pxa-poodle-don-t-preallocate-IRQ-space-for-locom.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0015-video-backlight-drop-old-locomo-bl-lcd-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0016-ARM-drop-old-LoCoMo-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0017-input-make-LoCoMo-keyboard-driver-support-both-poodl.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0018-spi-add-locomo-SPI-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0019-ARM-pxa-add-gpio-charger-configuration-on-poodle.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0020-ARM-pxa-poodle-add-gpio-keys-configuration.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0021-ARM-pxa-declare-battery-device-on-poodle.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0022-power-add-poodle-battery-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0023-poodle-gpio-uart-hack.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0032-ARM-sa1100-add-dummy-clk_set_rate-implementation.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0033-mfd-ucb1x00-ts-use-gpiolib-to-access-TBL_CHK-pin-on-.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0034-mfd-ucb1x00-drop-old-io-accessors.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0035-mfd-ucb1x00-add-irq-field-to-the-platform-data.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0036-ARM-sa1100-populate-codec-platform-data-with-irq.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0037-mfd-ucb1x00-make-use-of-provided-irq.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0038-XXX-ucb11x0-don-t-exit-if-UCB-is-not-detected.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0039-XXX-don-t-emit-added-moved-or-deleted-file-warning.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0040-input-locomokbd-provide-an-Alt-SysRQ-combination.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/tosa/0001-HACK-video-move-backlight-to-the-end-of-Makefile.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/tosa/0002-tosa-bl-correct-backlight-calculations.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/tosa/0003-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld_4.4.bb
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/OE-qvga-logo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/OE-vga-logo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/c7x0/corgi-gpio_keys.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/arm-sa1100-add-cpu-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/arm-sa1100-dummy-clk_set_rate.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-add-bootblock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-cfi-probe-again.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-irda.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-mtd-resize.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-use-gpio-charger.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/fbdev-sa1100fb-make-use-of-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/locomo-fix-SCL-SDA.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/locomolcd-suspend-resume.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/pcmcia-sa1100-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/revert-arm-sa1100-dummy-clk_get_rate.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0001-rfkill-add-IR-type.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0002-ARM-s3c24xx-Remove-S3C24XX_DMA-dependency-from-S3C24.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0003-ARM-s3c24xx-add-dma_coherent_mask-for-DMA-devices.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0004-ARM-s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0005-ARM-s3c24xx-drop-RFKILL-driver-for-H1940-bluetooth.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0006-ARM-s3c24xx-h1940-Add-nand-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0008-ARM-s3c24xx-h1940-unlock-reset-button.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0009-ARM-s3c24xx-h1940-add-bluetooth-RF-kill-switch.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0010-ARM-s3c24xx-h1940-add-IR-switch.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0011-ARM-s3c24xx-h1940-increase-oversampling-shift.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0012-ARM-s3c24xx-h1940-Add-DMA-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0013-dmaengine-s3c24xx-dma-Process-whole-SG-chain.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0014-dmaengine-s3c24xx-dma-Add-cyclic-transfer-support.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0015-s3cmci-port-DMA-code-to-dmaengine-API.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0016-ASoC-samsung-s3c24-xx-12-i2s-port-to-use-generic-dma.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0017-ASoC-samsung-drop-support-for-legacy-S3C24XX-DMA-API.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0004-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0005-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/0007-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/h3600/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/hx4700/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/hx4700/hx4700-change-led-trigger-assignments.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/poodle/locomo-fix-SCL-SDA.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/poodle/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/poodle/locomolcd-suspend-resume.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/revert-check-on-console-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0001-HACK-video-move-backlight-to-the-end-of-Makefile.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0002-tosa-bl-correct-backlight-calculations.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0003-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0004-ARM-pxa-tosa-switch-to-gpio-charger.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0005-ARM-pxa-tosa-fix-several-build-failures.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0006-mfd-tc6393xb-fail-ohci-suspend-if-full-state-restore.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/0007-wm97xx-adapt-parameters-to-tosa-touchscreen.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.14.bbappend

-- 
1.9.1


