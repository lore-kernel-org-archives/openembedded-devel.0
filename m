Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D11C6CC86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 00:22:07 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so1273603eae.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 16:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ujoGfKCTbeQ2YcC01XOZluOfji1ebPbrDJBiDKJnmpM=;
	b=yiV/ChU35PboISVtbzYfoog2SGpK5YOz0k1OM9EZj1Hd2541kf3HHe4Suk3a6KuOkr
	EQraNwCUHUHeKoeASZoH5T2tZNKkVAXd3kU9oMWouIlF8PhFYUWbNd0Gi3GOHu5/BLDl
	g6kc1AX3N+GYaeevrECLRTvdlpdcCAkTvaNaEbLvnb8j6Lbs/JNkrCI+M/0bpUTBtKVl
	NeEmNdQrPiPtBEVsngyYHrsUb/MLj5GXqV+5sE+AgIteRAv7ZLSGTEoGlLir1SwR0tSs
	QZlxYuM4C4izG8cwEJWF2iLK8L+EZw2ASiXRhCQ+etNTpaCX5cn6ivprCKAq+Ui59kf9
	awHw==
X-Received: by 10.14.88.132 with SMTP id a4mr258970eef.60.1384906928888;
	Tue, 19 Nov 2013 16:22:08 -0800 (PST)
Received: from mizar.localdomain
	(host39-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.39])
	by mx.google.com with ESMTPSA id z2sm53861002eee.7.2013.11.19.16.22.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 16:22:08 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Nov 2013 01:21:59 +0100
Message-Id: <1384906919-30362-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] Pull request 20131120
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
X-List-Received-Date: Wed, 20 Nov 2013 00:22:08 -0000

The following changes since commit c3f65502a3c52345ca5dbaf9d5c2c9779ef618df:

  linux-yocto-tiny-kexecboot: collie: resync patches with linux-yocto_3.10 (2013-11-13 18:10:43 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to f97636bc6ba17c34e500531e480b093e2aff8fe5:

  linux-yocto-dev: collie: sync patches for 3.12 with linux-yocto (2013-11-20 01:11:11 +0100)

----------------------------------------------------------------
Andrea Adami (6):
      linux-yocto(-tiny-kexecboot): collie: add locomolcd suspend-resume patch
      linux-yocto-dev: h1940: update defconfig
      linux-yocto-tiny-kexecboot: initial defconfig updates for 3.10
      linux-yocto: tosa: add keymap patch to all kernels up to 3.12
      linux-yocto-tiny-kexecboot: add iso8859_1 and codepage 437 for (V)FAT
      linux-yocto-dev: collie: sync patches for 3.12 with linux-yocto

 .../linux/linux-yocto-3.10/collie/collie.scc       |   1 +
 .../patches-locomo/locomolcd-suspend-resume.patch  |  92 +++++++++
 .../patches/patches-pxa/tosa-keys-mapping.patch    | 136 ++++++++++++++
 .../linux/linux-yocto-3.10/tosa/tosa.scc           |   1 +
 .../linux/linux-yocto-dev/collie/collie.scc        |  12 ++
 .../linux/linux-yocto-dev/h1940/defconfig          |  15 ++
 .../patches-locomo/locomo-fix-SCL-SDA.patch        |  28 +++
 .../patches-locomo/locomolcd-suspend-resume.patch  |  92 +++++++++
 .../patches-mtd/collie-cfi-probe-again.patch       |  29 +++
 .../patches-mtd/collie-fixup-strataflash.patch     |  27 +++
 .../patches/patches-mtd/collie-force-cfi.patch     |  30 +++
 .../patches/patches-mtd/collie-force-unlock.patch  |  22 +++
 .../patches/patches-mtd/collie-mtd-resize.patch    |  41 ++++
 .../patches/patches-pxa/tosa-keys-mapping.patch    | 136 ++++++++++++++
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |  95 ++++++++++
 .../patches-sa1100/collie-add-bootblock.patch      |  29 +++
 .../patches/patches-sa1100/collie-irda.patch       |  88 +++++++++
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  | 115 ++++++++++++
 .../pcmcia-sa1100-device-clock.patch               | 100 ++++++++++
 recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc |   2 +
 .../akita/defconfig                                | 138 ++++++++++++++
 .../c7x0/c7x0-kexecboot.cfg                        | 193 +++++++++++--------
 .../linux-yocto-tiny-kexecboot-3.10/c7x0/defconfig | 139 ++++++++++++++
 .../collie/collie-kexecboot.cfg                    | 207 ++++++++++++---------
 .../collie/collie-tiny.scc                         |   1 +
 .../collie/defconfig                               | 145 +++++++++++++++
 .../patches-locomo/locomolcd-suspend-resume.patch  |  92 +++++++++
 .../patches/patches-pxa/tosa-keys-mapping.patch    | 136 ++++++++++++++
 .../poodle/defconfig                               | 143 ++++++++++++++
 .../poodle/poodle-kexecboot.cfg                    | 188 +++++++++++--------
 .../spitz/defconfig                                | 137 ++++++++++++++
 .../spitz/spitz-kexecboot.cfg                      | 193 +++++++++++--------
 .../linux-yocto-tiny-kexecboot-3.10/tosa/defconfig | 141 ++++++++++++++
 .../tosa/tosa-kexecboot.cfg                        | 188 +++++++++++--------
 .../tosa/tosa-tiny.scc                             |   1 +
 35 files changed, 2737 insertions(+), 396 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-pxa/tosa-keys-mapping.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-locomo/locomo-fix-SCL-SDA.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-locomo/locomolcd-suspend-resume.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-cfi-probe-again.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-fixup-strataflash.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-force-unlock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-mtd-resize.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-pxa/tosa-keys-mapping.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-sa1100/collie-add-bootblock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-sa1100/collie-irda.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/tosa-keys-mapping.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/defconfig

