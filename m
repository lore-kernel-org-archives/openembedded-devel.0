Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 279786B1A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:10:45 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so152243eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 10:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EcFq+zt0FTIbAkSPV9DaIagvcJv4mO30Rkbh8ue98tc=;
	b=WqNi9HpYzJEJk4ZxURUo4NabgK4NjjNMmo/iyIZNh+X0PMGtlcn2m2kbvF6DVdNln4
	Zn6fJqXF0fWVo8umkXcjiHNstI+Uc2EOaYfgMm94hXTncYzgDCdolkw6kVT0kAXNK5IN
	J7zPxAxrhaunMJ7u6nMItDPGxfGACavLQhJMhXzUeyxTbO+XcP6p16iINoS3GdEfb2GK
	mv0Orfwwx8nyReWH8xJ8gqyT9E947iz0x6wM309pDSiBl7PREojMxDV9Rsf6B5Pirp+2
	VxeWJ7YluQoln6blWzxsatAiudera8j0q/gXyb7No0jsNNTZVbEEl10XSP6Loe2t8BdG
	6ZxQ==
X-Received: by 10.14.115.133 with SMTP id e5mr515656eeh.91.1384366247315;
	Wed, 13 Nov 2013 10:10:47 -0800 (PST)
Received: from mizar.localdomain
	(host34-23-dynamic.14-87-r.retail.telecomitalia.it. [87.14.23.34])
	by mx.google.com with ESMTPSA id 1sm29531071eeg.4.2013.11.13.10.10.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Nov 2013 10:10:46 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2013 19:10:30 +0100
Message-Id: <1384366230-2547-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] Pull request 20131113
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
X-List-Received-Date: Wed, 13 Nov 2013 18:10:46 -0000

The following changes since commit e07ae17cfda815e9395ce2f6b28e1797dfaef1df:

  h3600: build .tar.gz images too (2013-11-11 13:06:14 +0000)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to c3f65502a3c52345ca5dbaf9d5c2c9779ef618df:

  linux-yocto-tiny-kexecboot: collie: resync patches with linux-yocto_3.10 (2013-11-13 18:10:43 +0100)

----------------------------------------------------------------
Andrea Adami (10):
      linux-yocto-dev: add ipaq h1940 3.12-rc5 patchset
      machine: h1940: switch temporarly to linux-yocto-dev (3.12-rc5)
      linux_3.1: remove, no more machines using it (h1940 is up to 3.12)
      linux-yocto-dev: remove upstreamed sharpsl_param patch
      linux-yocto: collie: add sa1100 framebuffer clock fixup
      linux-yocto: collie: MTD: disable erase suspend on write
      linux-yocto: collie: add pcmcia clock fixes for sa1100
      linux-yocto: collie: add fix for locomo driver
      linux-yocto: collie: properly readd cfi_probe
      linux-yocto-tiny-kexecboot: collie: resync patches with linux-yocto_3.10

 conf/machine/h1940.conf                            |    2 +-
 recipes-kernel/linux/linux-3.1/h1940/defconfig     | 1762 --------------------
 .../linux/linux-yocto-3.10/collie/collie.scc       |    9 +-
 .../patches-locomo/locomo-fix-SCL-SDA.patch        |   28 +
 .../patches-mtd/collie-cfi-probe-again.patch       |   29 +
 .../patches-mtd/collie-fixup-strataflash.patch     |   27 +
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |   95 ++
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  |  115 ++
 .../pcmcia-sa1100-device-clock.patch               |  100 ++
 recipes-kernel/linux/linux-yocto-dev.bbappend      |    3 +-
 .../linux/linux-yocto-dev/akita/akita.scc          |    2 -
 recipes-kernel/linux/linux-yocto-dev/c7x0/c7x0.scc |    2 -
 ...-s3c24xx-DMA-don-t-use-autoreload-feature.patch |  133 +-
 .../h1940/0002-s3cmci-minor-fixups.patch           |   14 +-
 ...10-drop-RFKILL-driver-for-H1940-bluetooth.patch |  117 +-
 ...mtd-nand-s3c2410-add-iPAQ-specific-layout.patch |   12 +-
 ...005-ARM-s3c2410-Add-nand-device-for-h1940.patch |   40 +-
 ...006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch |   28 +-
 ...-ARM-s3c2410-unlock-reset-button-on-H1940.patch |   20 +-
 ...08-ARM-h1940-add-bluetooth-RF-kill-switch.patch |   24 +-
 .../h1940/0009-rfkill-add-IR-type.patch            |   36 +-
 ...fkill_gpio-add-support-for-inverted-GPIOs.patch |   18 +-
 .../h1940/0011-ARM-h1940-add-IR-switch.patch       |   22 +-
 ...012-ARM-h1940-increase-oversampling-shift.patch |   18 +-
 .../linux/linux-yocto-dev/h1940/defconfig          |  185 ++
 .../patches/patches-pxa/sharpsl_param.patch        |   61 -
 .../linux/linux-yocto-dev/poodle/poodle.scc        |    1 -
 .../linux/linux-yocto-dev/spitz/spitz.scc          |    2 -
 recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc |    2 -
 recipes-kernel/linux/linux-yocto-handhelds.inc     |   18 +
 .../collie/collie-tiny.scc                         |   13 +
 .../patches-locomo/locomo-fix-SCL-SDA.patch        |   28 +
 .../patches-mtd/collie-cfi-probe-again.patch       |   29 +
 .../patches-mtd/collie-fixup-strataflash.patch     |   27 +
 .../patches/patches-mtd/collie-force-cfi.patch     |   30 +
 .../patches/patches-mtd/collie-force-unlock.patch  |   22 +
 .../patches/patches-mtd/collie-mtd-resize.patch    |   41 +
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |   95 ++
 .../patches-sa1100/collie-add-bootblock.patch      |   29 +
 .../patches/patches-sa1100/collie-irda.patch       |   88 +
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  |  115 ++
 .../pcmcia-sa1100-device-clock.patch               |  100 ++
 recipes-kernel/linux/linux_3.1.bb                  |   30 -
 43 files changed, 1449 insertions(+), 2123 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-3.1/h1940/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch (89%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0002-s3cmci-minor-fixups.patch (74%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0003-ARM-s3c2410-drop-RFKILL-driver-for-H1940-bluetooth.patch (57%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0004-mtd-nand-s3c2410-add-iPAQ-specific-layout.patch (70%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0005-ARM-s3c2410-Add-nand-device-for-h1940.patch (70%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0006-ARM-s3c2410-h1940-don-t-touch-UPLLCON.patch (52%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0007-ARM-s3c2410-unlock-reset-button-on-H1940.patch (69%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0008-ARM-h1940-add-bluetooth-RF-kill-switch.patch (75%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0009-rfkill-add-IR-type.patch (50%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0010-rfkill_gpio-add-support-for-inverted-GPIOs.patch (85%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0011-ARM-h1940-add-IR-switch.patch (69%)
 rename recipes-kernel/linux/{linux-3.1 => linux-yocto-dev}/h1940/0012-ARM-h1940-increase-oversampling-shift.patch (54%)
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h1940/defconfig
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-pxa/sharpsl_param.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-unlock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux_3.1.bb

