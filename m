Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2E60673DA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:40:41 +0000 (UTC)
Received: by wizk4 with SMTP id k4so91434952wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fQe8puNMQXvw6XODIdBXLwOmynX1MwWTnSZjUA6OtW0=;
	b=YVAMJUpXYOcBAcJKbV8uyq3204UJf6GcFZC1kTv1picy5KgXJC3VtjtvSac50LJtKp
	Ts0Iu0aY0VlkhzIC32z6wnY1kiENqdeRF/VPlPvFE99I84p8WlwSyqGGZLIi4kDo6Gwp
	JeOvw4bSZDGsuQ4DMKekIYdIDoRRsi/1DyN8kFe8Pf/f+EY9gVFOu/zVfMibLQWVeQUK
	no1agTmg67Ysjg+N4oda0R/hgk1D62baOaMpwtaXryaMmiV6B3Ipm/tsBjfOoFS9ffIg
	GBJKCw2zgsgGClvWLshM6OxAfOpI0wWNo+B2t6ELqd/9U5Aw0xB8lYdD5ldwcfgZRAox
	FoVg==
X-Received: by 10.180.19.134 with SMTP id f6mr25811529wie.35.1428964842433;
	Mon, 13 Apr 2015 15:40:42 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host185-253-dynamic.48-82-r.retail.telecomitalia.it.
	[82.48.253.185]) by mx.google.com with ESMTPSA id
	cf12sm13325427wjb.10.2015.04.13.15.40.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 15:40:41 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2015 00:40:23 +0200
Message-Id: <cover.1428964372.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull Request 20150414 - Kernel updates
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
X-List-Received-Date: Mon, 13 Apr 2015 22:40:43 -0000

The following changes since commit 318318c74f0e37f4cf54a4c8f3aab9e59555111d:

  linux-yocto(-tiny-kexecboot)_3.17: remove upstreamed patch for collie (2015-01-12 09:58:06 +0000)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-handheld master

for you to fetch changes up to 9002869eb1085e96824acf86c7f24602a3c9d4fe:

  mininit: remove now unused recipe (2015-04-13 23:39:02 +0200)

----------------------------------------------------------------
Andrea Adami (10):
  linux-yocto(-tiny-kexecboot)_3.10: remove orphans
  linux-yocto(-tiny-kexecboot)_3.17: remove orphans
  zaurus.inc: use linux-handheld kernel
  h3600.conf: prefer linux-handheld kernel v. 4.0
  hx4700.conf: prefer linux-handheld kernel v. 4.0
  linux-handheld: initial commit of kernel v. 4.0
  linux-gcw0(-kexecboot): remove kernel version 3.12
  linux-gcw0(-kexecboot): commit of development version 3.19
  initramfs-mininit-klibc-image: remove, we use external mininit now
  mininit: remove now unused recipe

 conf/machine/h3600.conf                            |      2 +-
 conf/machine/hx4700.conf                           |      2 +-
 conf/machine/include/zaurus.inc                    |      2 +-
 .../images/initramfs-mininit-klibc-image.bb        |     22 -
 recipes-bsp/mininit/mininit_2.0.2.bb               |     36 -
 .../linux/linux-gcw0-3.12/gcw0/defconfig           |    203 -
 .../linux/linux-gcw0-3.19/gcw0/defconfig           |    211 +
 .../linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig |    212 -
 .../linux/linux-gcw0-kexecboot-3.19/gcw0/defconfig |    223 +
 recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb  |     29 -
 recipes-kernel/linux/linux-gcw0-kexecboot_3.19.bb  |     29 +
 recipes-kernel/linux/linux-gcw0_3.12.bb            |     15 -
 recipes-kernel/linux/linux-gcw0_3.19.bb            |     15 +
 .../linux/linux-handheld-4.0/OE-qvga-logo.patch    | 232025 +++++
 .../linux/linux-handheld-4.0/OE-vga-logo.patch     | 923225 ++++++++++++++++++
 .../linux/linux-handheld-4.0/akita/defconfig       |    436 +
 .../arm-sa1100-dummy-clk_set_rate.patch            |     33 +
 .../linux/linux-handheld-4.0/c7x0/defconfig        |    367 +
 .../linux/linux-handheld-4.0/collie/defconfig      |    378 +
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch |    208 +
 .../linux/linux-handheld-4.0/h3600/defconfig       |     95 +
 .../linux/linux-handheld-4.0/hx4700/defconfig      |    179 +
 .../hx4700-change-led-trigger-assignments.patch    |     33 +
 .../locomo/0001-iio-add-m62332-DAC-driver.patch    |    295 +
 .../0002-mfd-add-new-driver-for-Sharp-LoCoMo.patch |    603 +
 ...ort-locomo-leds-driver-to-new-locomo-core.patch |    187 +
 ...rt-LoCoMo-keyboard-driver-to-use-new-loco.patch |    480 +
 ...ocomokbd-provide-an-Alt-SysRQ-combination.patch |     75 +
 ...backlight-add-new-locomo-backlight-driver.patch |    212 +
 .../0007-video-lcd-add-LoCoMo-LCD-driver.patch     |    343 +
 ...-port-LoCoMo-gpio-support-from-old-driver.patch |    226 +
 ...pio-locomo-implement-per-pin-irq-handling.patch |    204 +
 .../locomo/0010-spi-add-locomo-SPI-driver.patch    |    421 +
 .../locomo/0011-i2c-add-locomo-i2c-driver.patch    |    196 +
 .../locomo/0012-ARM-drop-old-LoCoMo-driver.patch   |   1194 +
 ...o-backlight-drop-old-locomo-bl-lcd-driver.patch |    278 +
 ...sa1100-make-collie-use-new-locomo-drivers.patch |    408 +
 ...00-don-t-preallocate-IRQ-space-for-locomo.patch |     45 +
 ...0016-ARM-pxa-poodle-use-new-LoCoMo-driver.patch |    174 +
 ...dle-don-t-preallocate-IRQ-space-for-locom.patch |     30 +
 ...odle-make-use-of-new-locomo-GPIO-interfac.patch |    120 +
 .../locomo/0019-poodle-gpio-uart-hack.patch        |     26 +
 ...K-around-for-handling-irq0-when-we-should.patch |     29 +
 ...-add-gpio-charger-configuration-on-poodle.patch |     59 +
 ...RM-pxa-poodle-add-gpio-keys-configuration.patch |     76 +
 ...-ARM-pxa-declare-battery-device-on-poodle.patch |     39 +
 .../0004-power-add-poodle-battery-driver.patch     |    307 +
 .../linux/linux-handheld-4.0/poodle/defconfig      |    375 +
 .../linux/linux-handheld-4.0/spitz/defconfig       |    435 +
 ...deo-move-backlight-to-the-end-of-Makefile.patch |     34 +
 ...02-tosa-bl-correct-backlight-calculations.patch |     39 +
 ...-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch |     43 +
 .../linux/linux-handheld-4.0/tosa/defconfig        |    439 +
 recipes-kernel/linux/linux-handheld_4.0.bb         |     80 +
 .../linux-yocto-3.10/akita/akita-standard.scc      |      7 -
 .../linux/linux-yocto-3.10/akita/akita.cfg         |      4 -
 .../linux/linux-yocto-3.10/akita/akita.scc         |      8 -
 .../linux/linux-yocto-3.10/c7x0/c7x0-standard.scc  |      7 -
 .../linux/linux-yocto-3.10/c7x0/c7x0.cfg           |     52 -
 .../linux/linux-yocto-3.10/c7x0/c7x0.scc           |      6 -
 .../linux-yocto-3.10/collie/collie-standard.scc    |      7 -
 .../linux/linux-yocto-3.10/collie/collie.cfg       |    130 -
 .../linux/linux-yocto-3.10/collie/collie.scc       |     21 -
 .../linux/linux-yocto-3.10/feature-top.scc         |      1 -
 ...r-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch |    527 -
 ...ARM-sa1100-add-Micro-ASIC-platform-device.patch |     71 -
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch |    189 -
 ...nput-driver-for-touchscreen-on-iPaq-h3xxx.patch |    199 -
 ...-driver-for-battery-reading-on-iPaq-h3xxx.patch |    295 -
 .../0006-leds-add-driver-for-the-iPAQ-micro.patch  |    189 -
 ...light-add-driver-for-iPAQ-micro-backlight.patch |    142 -
 .../linux/linux-yocto-3.10/h3600/defconfig         |     91 -
 .../linux/linux-yocto-3.10/hx4700/defconfig        |    182 -
 .../hx4700-change-led-trigger-assignments.patch    |     33 -
 .../patches-locomo/locomo-fix-SCL-SDA.patch        |     28 -
 .../patches-locomo/locomolcd-suspend-resume.patch  |     92 -
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |     84 -
 .../patches/patches-mfd/mcp-device.patch           |     30 -
 .../patches/patches-mfd/ucb1x00-device.patch       |     28 -
 .../patches/patches-mtd/collie-LH28F640BF.patch    |     97 -
 .../patches-mtd/collie-cfi-probe-again.patch       |     29 -
 .../patches/patches-mtd/collie-eraseinfo.patch     |     55 -
 .../patches/patches-mtd/collie-jedec-probe.patch   |     35 -
 .../patches/patches-mtd/collie-mtd-resize.patch    |     41 -
 .../patches-power/collie_battery-dev-pm.patch      |     39 -
 .../patches-power/tosa_battery_irq_to_gpio.patch   |     39 -
 .../patches/patches-pxa/sharpsl_param.patch        |     47 -
 .../patches/patches-pxa/tosa-keys-mapping.patch    |    136 -
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |     95 -
 .../patches-sa1100/collie-add-bootblock.patch      |     29 -
 .../patches/patches-sa1100/collie-irda.patch       |     88 -
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  |    115 -
 .../pcmcia-sa1100-device-clock.patch               |    100 -
 .../patches/revert-check-on-console-device.patch   |     41 -
 .../linux-yocto-3.10/poodle/poodle-standard.scc    |      7 -
 .../linux/linux-yocto-3.10/poodle/poodle.cfg       |     57 -
 .../linux/linux-yocto-3.10/poodle/poodle.scc       |      7 -
 .../linux/linux-yocto-3.10/shrink_kernel.cfg       |     28 -
 .../linux-yocto-3.10/spitz/spitz-standard.scc      |      7 -
 .../linux/linux-yocto-3.10/spitz/spitz.cfg         |     61 -
 .../linux/linux-yocto-3.10/spitz/spitz.scc         |      7 -
 .../linux/linux-yocto-3.10/tosa/tosa-standard.scc  |      7 -
 .../linux/linux-yocto-3.10/tosa/tosa.cfg           |     65 -
 .../linux/linux-yocto-3.10/tosa/tosa.scc           |      9 -
 .../linux/linux-yocto-3.10/zaurus-common.scc       |     14 -
 .../linux/linux-yocto-3.10/zaurus-hardware.cfg     |    276 -
 .../linux/linux-yocto-3.10/zaurus-non-hardware.cfg |    396 -
 .../linux-yocto-3.10/zaurus-pxa-common-non-hw.cfg  |      9 -
 .../linux/linux-yocto-3.10/zaurus-pxa-common.cfg   |    103 -
 .../linux/linux-yocto-3.10/zaurus-pxa-only.scc     |      2 -
 .../linux/linux-yocto-3.10/zaurus-usb-host.scc     |      6 -
 .../linux-yocto-3.10/zaurus-usb-ohci-non-hw.cfg    |      4 -
 .../linux/linux-yocto-3.10/zaurus-usb-ohci.cfg     |    105 -
 .../linux/linux-yocto-3.17/OE-qvga-logo.patch      | 232025 -----
 .../linux/linux-yocto-3.17/OE-vga-logo.patch       | 923225 ------------------
 .../linux/linux-yocto-3.17/akita/defconfig         |    443 -
 .../linux/linux-yocto-3.17/c7x0/defconfig          |    374 -
 .../collie/arm-sa1100-add-cpu-clock.patch          |     95 -
 .../collie/arm-sa1100-dummy-clk_set_rate.patch     |     33 -
 .../collie/collie-use-gpio-charger.patch           |    113 -
 .../linux/linux-yocto-3.17/collie/defconfig        |    378 -
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  |    112 -
 .../collie/locomo-fix-SCL-SDA.patch                |     28 -
 .../collie/locomo_kbd_tweak-r2.patch               |     84 -
 .../collie/locomolcd-suspend-resume.patch          |     92 -
 .../collie/pcmcia-sa1100-device-clock.patch        |     91 -
 .../revert-arm-sa1100-dummy-clk_get_rate.patch     |     32 -
 ...ARM-sa1100-add-Micro-ASIC-platform-device.patch |     73 -
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch |    208 -
 .../linux/linux-yocto-3.17/h3600/defconfig         |     95 -
 .../linux/linux-yocto-3.17/poodle/defconfig        |    376 -
 .../poodle/locomo-fix-SCL-SDA.patch                |     28 -
 .../poodle/locomo_kbd_tweak-r2.patch               |     84 -
 .../poodle/locomolcd-suspend-resume.patch          |     92 -
 .../revert-check-on-console-device.patch           |     41 -
 .../linux/linux-yocto-3.17/spitz/defconfig         |    442 -
 ...deo-move-backlight-to-the-end-of-Makefile.patch |     34 -
 ...02-tosa-bl-correct-backlight-calculations.patch |     39 -
 ...-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch |     43 -
 .../0004-ARM-pxa-tosa-switch-to-gpio-charger.patch |     90 -
 ...5-ARM-pxa-tosa-fix-several-build-failures.patch |     32 -
 ...b-fail-ohci-suspend-if-full-state-restore.patch |     54 -
 ...97xx-adapt-parameters-to-tosa-touchscreen.patch |     31 -
 .../linux/linux-yocto-3.17/tosa/defconfig          |    446 -
 .../akita/defconfig                                |    138 -
 .../linux-yocto-tiny-kexecboot-3.10/c7x0/defconfig |    139 -
 .../collie/defconfig                               |    145 -
 .../poodle/defconfig                               |    143 -
 .../spitz/3200-mtd.patch                           |     13 -
 .../spitz/defconfig                                |    137 -
 .../linux-yocto-tiny-kexecboot-3.10/tosa/defconfig |    141 -
 .../akita/defconfig                                |    135 -
 .../linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig |    136 -
 .../collie/defconfig                               |    144 -
 .../poodle/defconfig                               |    140 -
 .../spitz/3200-mtd.patch                           |     13 -
 .../spitz/defconfig                                |    134 -
 .../linux-yocto-tiny-kexecboot-3.17/tosa/defconfig |    138 -
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |     94 -
 .../linux/linux-yocto-tiny-kexecboot_3.17.bbappend |     86 -
 recipes-kernel/linux/linux-yocto_3.10.bbappend     |     90 -
 recipes-kernel/linux/linux-yocto_3.17.bbappend     |     88 -
 162 files changed, 1164932 insertions(+), 1166486 deletions(-)
 delete mode 100644 recipes-bsp/images/initramfs-mininit-klibc-image.bb
 delete mode 100644 recipes-bsp/mininit/mininit_2.0.2.bb
 delete mode 100644 recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
 create mode 100644 recipes-kernel/linux/linux-gcw0-3.19/gcw0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
 create mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot-3.19/gcw0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
 create mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_3.19.bb
 delete mode 100644 recipes-kernel/linux/linux-gcw0_3.12.bb
 create mode 100644 recipes-kernel/linux/linux-gcw0_3.19.bb
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/OE-qvga-logo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/OE-vga-logo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/arm-sa1100-dummy-clk_set_rate.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/h3600/0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/h3600/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/hx4700/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/hx4700/hx4700-change-led-trigger-assignments.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0001-iio-add-m62332-DAC-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0002-mfd-add-new-driver-for-Sharp-LoCoMo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0003-leds-port-locomo-leds-driver-to-new-locomo-core.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0004-input-convert-LoCoMo-keyboard-driver-to-use-new-loco.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0005-input-locomokbd-provide-an-Alt-SysRQ-combination.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0006-video-backlight-add-new-locomo-backlight-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0007-video-lcd-add-LoCoMo-LCD-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0008-GPIO-port-LoCoMo-gpio-support-from-old-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0009-gpio-locomo-implement-per-pin-irq-handling.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0010-spi-add-locomo-SPI-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0011-i2c-add-locomo-i2c-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0012-ARM-drop-old-LoCoMo-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0013-video-backlight-drop-old-locomo-bl-lcd-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0014-ARM-sa1100-make-collie-use-new-locomo-drivers.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0015-ARM-sa1100-don-t-preallocate-IRQ-space-for-locomo.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0016-ARM-pxa-poodle-use-new-LoCoMo-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0017-ARM-pxa-poodle-don-t-preallocate-IRQ-space-for-locom.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0018-ASoC-pxa-poodle-make-use-of-new-locomo-GPIO-interfac.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0019-poodle-gpio-uart-hack.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/locomo/0020-irq-HACK-around-for-handling-irq0-when-we-should.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/poodle/0001-ARM-pxa-add-gpio-charger-configuration-on-poodle.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/poodle/0002-ARM-pxa-poodle-add-gpio-keys-configuration.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/poodle/0003-ARM-pxa-declare-battery-device-on-poodle.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/poodle/0004-power-add-poodle-battery-driver.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/tosa/0001-HACK-video-move-backlight-to-the-end-of-Makefile.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/tosa/0002-tosa-bl-correct-backlight-calculations.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/tosa/0003-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.0/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-handheld_4.0.bb
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/akita/akita-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/akita/akita.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/akita/akita.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/c7x0/c7x0-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/c7x0/c7x0.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/c7x0/c7x0.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/collie/collie-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/feature-top.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0004-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0005-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0007-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/hx4700/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/hx4700/hx4700-change-led-trigger-assignments.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mfd/mcp-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mfd/ucb1x00-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-eraseinfo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-jedec-probe.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-mtd-resize.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-power/collie_battery-dev-pm.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-pxa/sharpsl_param.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-pxa/tosa-keys-mapping.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-add-bootblock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-irda.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/revert-check-on-console-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/poodle/poodle-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/poodle/poodle.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/poodle/poodle.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/shrink_kernel.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/spitz/spitz-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/spitz/spitz.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/spitz/spitz.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/tosa/tosa-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/tosa/tosa.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/tosa/tosa.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-non-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-pxa-common-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-pxa-common.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-pxa-only.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-usb-host.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-usb-ohci-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/zaurus-usb-ohci.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/OE-qvga-logo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/OE-vga-logo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/arm-sa1100-add-cpu-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/arm-sa1100-dummy-clk_set_rate.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/collie-use-gpio-charger.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/fbdev-sa1100fb-make-use-of-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/locomo-fix-SCL-SDA.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/locomolcd-suspend-resume.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/pcmcia-sa1100-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/revert-arm-sa1100-dummy-clk_get_rate.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/h3600/0001-ARM-sa1100-add-Micro-ASIC-platform-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/h3600/0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/h3600/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/locomo-fix-SCL-SDA.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/locomolcd-suspend-resume.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/revert-check-on-console-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0001-HACK-video-move-backlight-to-the-end-of-Makefile.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0002-tosa-bl-correct-backlight-calculations.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0003-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0004-ARM-pxa-tosa-switch-to-gpio-charger.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0005-ARM-pxa-tosa-fix-several-build-failures.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0006-mfd-tc6393xb-fail-ohci-suspend-if-full-state-restore.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0007-wm97xx-adapt-parameters-to-tosa-touchscreen.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/3200-mtd.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/3200-mtd.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.10.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.17.bbappend

-- 
1.9.1


