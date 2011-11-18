Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RRCXZ-0004yv-Nd
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 01:42:49 +0100
Received: from mizar.localdomain (87.5.50.68) by smtp209.alice.it (8.5.124.08)
	id 4E850A8605666140; Fri, 18 Nov 2011 01:36:24 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2011 01:36:02 +0100
Message-Id: <cover.1321575642.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 0/5] Kernel 3.1 and cleanings
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
X-List-Received-Date: Fri, 18 Nov 2011 00:42:49 -0000

* Initial commit of kernel 3.1 patchset 1
*  tested on Zaurus devices
*  defconfig refinements needed for hx4700 and h1940 (untested)
*
* Removed 2.6.39 and 3.0.1 kernel versions
* Removed git versions (unused by our couple of kernel devs)

Andrea Adami (5):
  linux(kexecboot): initial commit of kernel 3.1 updated to patchset 1
  linux: remove linux-3.0.1. hx4700 is up to 3.1 now.
  linux(kexecboot): remove kernels 2.6.39
  linux-kexecboot: remove now unused git version
  linux: remove unused git version

 recipes-kernel/linux/linux-2.6.39.inc              |   20 -
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 -
 recipes-kernel/linux/linux-2.6.39/akita/defconfig  |  381 ----
 recipes-kernel/linux/linux-2.6.39/c7x0/defconfig   |  378 ----
 recipes-kernel/linux/linux-2.6.39/collie/defconfig |  324 ----
 recipes-kernel/linux/linux-2.6.39/h1940/defconfig  | 1704 ------------------
 .../linux/linux-2.6.39/locomo_kbd_tweak-r2.patch   |   66 -
 recipes-kernel/linux/linux-2.6.39/poodle/defconfig |  379 ----
 recipes-kernel/linux/linux-2.6.39/spitz/defconfig  |  381 ----
 recipes-kernel/linux/linux-2.6.39/tosa/defconfig   |  381 ----
 ...port-for-the-HTC-ASIC3.-Underlying-suppor.patch |   50 -
 .../hx4700/0002-tmio_mmc_irq-race.patch            |  114 --
 ...e-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch |   29 -
 ...CF-support-for-the-HTC-ASIC3.-Underlying-.patch |  254 ---
 .../hx4700/0005-Suspend-unbalanced-irqs.patch      |   34 -
 .../linux/linux-3.0.1/hx4700/0006-suspend.patch    |   55 -
 ...007-hx4700-change-led-trigger-assignments.patch |   31 -
 recipes-kernel/linux/linux-3.0.1/hx4700/defconfig  | 1822 --------------------
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
 recipes-kernel/linux/linux-3.1/akita/defconfig     |  378 ++++
 recipes-kernel/linux/linux-3.1/c7x0/defconfig      |  316 ++++
 recipes-kernel/linux/linux-3.1/collie/defconfig    |  322 ++++
 recipes-kernel/linux/linux-3.1/h1940/defconfig     | 1704 ++++++++++++++++++
 ...port-for-the-HTC-ASIC3.-Underlying-suppor.patch |   50 +
 .../linux-3.1/hx4700/0002-tmio_mmc_irq-race.patch  |  114 ++
 ...e-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch |   29 +
 ...CF-support-for-the-HTC-ASIC3.-Underlying-.patch |  254 +++
 .../hx4700/0005-Suspend-unbalanced-irqs.patch      |   34 +
 .../linux/linux-3.1/hx4700/0006-suspend.patch      |   55 +
 ...007-hx4700-change-led-trigger-assignments.patch |   31 +
 recipes-kernel/linux/linux-3.1/hx4700/defconfig    | 1822 ++++++++++++++++++++
 .../linux/linux-3.1/locomo_kbd_tweak-r2.patch      |   66 +
 recipes-kernel/linux/linux-3.1/poodle/defconfig    |  317 ++++
 recipes-kernel/linux/linux-3.1/spitz/defconfig     |  378 ++++
 recipes-kernel/linux/linux-3.1/tosa/defconfig      |  379 ++++
 .../linux/linux-kexecboot-2.6.39/akita/defconfig   |  133 --
 .../linux/linux-kexecboot-2.6.39/c7x0/defconfig    |  135 --
 .../linux/linux-kexecboot-2.6.39/collie/defconfig  |  145 --
 .../linux/linux-kexecboot-2.6.39/poodle/defconfig  |  137 --
 .../linux/linux-kexecboot-2.6.39/spitz/defconfig   |  133 --
 .../linux/linux-kexecboot-2.6.39/tosa/defconfig    |  135 --
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
 .../linux/linux-kexecboot-3.1/akita/defconfig      |  132 ++
 .../linux/linux-kexecboot-3.1/c7x0/defconfig       |  134 ++
 .../linux/linux-kexecboot-3.1/collie/defconfig     |  144 ++
 .../linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch  |   66 +
 .../linux/linux-kexecboot-3.1/poodle/defconfig     |  136 ++
 .../linux/linux-kexecboot-3.1/spitz/defconfig      |  132 ++
 .../linux/linux-kexecboot-3.1/tosa/defconfig       |  134 ++
 recipes-kernel/linux/linux-kexecboot.inc           |   17 +-
 .../linux/linux-kexecboot/spitz/defconfig          |  129 --
 recipes-kernel/linux/linux-kexecboot_2.6.39.bb     |    5 -
 recipes-kernel/linux/linux-kexecboot_3.1.bb        |   25 +
 recipes-kernel/linux/linux-kexecboot_git.bb        |    2 -
 recipes-kernel/linux/linux.inc                     |    4 +-
 recipes-kernel/linux/linux/spitz/defconfig         |  379 ----
 recipes-kernel/linux/linux_2.6.39.bb               |    9 -
 recipes-kernel/linux/linux_3.0.1.bb                |   22 -
 recipes-kernel/linux/linux_3.1.bb                  |   35 +
 recipes-kernel/linux/linux_git.bb                  |   10 -
 60 files changed, 7266 insertions(+), 7821 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-2.6.39.inc
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/h1940/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0002-tmio_mmc_irq-race.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0005-Suspend-unbalanced-irqs.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0006-suspend.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0.1/hx4700/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/h1940/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0001-Add-LED-support-for-the-HTC-ASIC3.-Underlying-suppor.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0002-tmio_mmc_irq-race.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0003-Only-compile-tmio_mmc_dma.o-when-CONFIG_MMC_SDHI-is-.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0004-Add-PCMCIA-CF-support-for-the-HTC-ASIC3.-Underlying-.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0005-Suspend-unbalanced-irqs.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0006-suspend.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/0007-hx4700-change-led-trigger-assignments.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/hx4700/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_2.6.39.bb
 create mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bb
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_git.bb
 delete mode 100644 recipes-kernel/linux/linux/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux_2.6.39.bb
 delete mode 100644 recipes-kernel/linux/linux_3.0.1.bb
 create mode 100644 recipes-kernel/linux/linux_3.1.bb
 delete mode 100644 recipes-kernel/linux/linux_git.bb

-- 
1.7.3.4



