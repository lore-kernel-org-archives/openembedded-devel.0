Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SoNSv-00074W-3F
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2012 01:34:05 +0200
Received: from mizar.localdomain (87.0.20.4) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6317B3EAE1; Tue, 10 Jul 2012 01:22:55 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2012 01:22:34 +0200
Message-Id: <cover.1341875525.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH 0/5] Zaurus kernel cleanings and tuning
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
X-List-Received-Date: Mon, 09 Jul 2012 23:34:05 -0000

 * remove obsolete recipe
 * update linux-yocto kernels for UBI support

Andrea Adami (5):
  linux_3.1: remove obsoleted Zaurus defconfig
  linux_3.2: remove obsolete recipe and defconfigs (was Zaurus-only)
  linux_git: remove unused obsolete recipe (was for Zaurus spitz)
  linux-yocto: unset CONFIG_MTD_NAND_VERIFY_WRITE for Zaurus
  linux-yocto-tiny-kexecboot: unset CONFIG_MTD_NAND_VERIFY_WRITE for
    Zaurus

 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 --
 recipes-kernel/linux/linux-3.1/akita/defconfig     |  379 -------------------
 recipes-kernel/linux/linux-3.1/c7x0/defconfig      |  316 ----------------
 recipes-kernel/linux/linux-3.1/collie/defconfig    |  322 -----------------
 .../linux/linux-3.1/locomo_kbd_tweak-r2.patch      |   66 ----
 recipes-kernel/linux/linux-3.1/poodle/defconfig    |  317 ----------------
 recipes-kernel/linux/linux-3.1/spitz/defconfig     |  378 -------------------
 recipes-kernel/linux/linux-3.1/tosa/defconfig      |  379 -------------------
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 --
 recipes-kernel/linux/linux-3.2/akita/defconfig     |  375 -------------------
 recipes-kernel/linux/linux-3.2/c7x0/defconfig      |  312 ----------------
 recipes-kernel/linux/linux-3.2/collie/defconfig    |  319 ----------------
 .../linux-3.2/collie_remove_irq_to_gpio.patch      |   31 --
 .../linux/linux-3.2/locomo_kbd_tweak-r2.patch      |   66 ----
 recipes-kernel/linux/linux-3.2/poodle/defconfig    |  314 ----------------
 recipes-kernel/linux/linux-3.2/spitz/defconfig     |  374 -------------------
 recipes-kernel/linux/linux-3.2/tosa/defconfig      |  376 -------------------
 .../akita/akita-kexecboot.cfg                      |    2 +-
 .../c7x0/c7x0-kexecboot.cfg                        |    2 +-
 .../collie/collie-kexecboot.cfg                    |    2 +-
 .../poodle/poodle-kexecboot.cfg                    |    2 +-
 .../spitz/spitz-kexecboot.cfg                      |    2 +-
 .../tosa/tosa-kexecboot.cfg                        |    2 +-
 recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    2 +-
 recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    2 +-
 recipes-kernel/linux/linux-yocto/collie/collie.cfg |    2 +-
 recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    2 +-
 recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    2 +-
 recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    2 +-
 recipes-kernel/linux/linux/spitz/defconfig         |  380 --------------------
 recipes-kernel/linux/linux_3.1.bb                  |   13 +-
 recipes-kernel/linux/linux_3.2.bb                  |   25 --
 recipes-kernel/linux/linux_git.bb                  |   26 --
 33 files changed, 14 insertions(+), 4846 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 delete mode 100644 recipes-kernel/linux/linux-3.1/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.1/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.1/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.1/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-3.1/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.1/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.1/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.2/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 delete mode 100644 recipes-kernel/linux/linux-3.2/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.2/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.2/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.2/collie_remove_irq_to_gpio.patch
 delete mode 100644 recipes-kernel/linux/linux-3.2/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-3.2/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.2/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-3.2/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux_3.2.bb
 delete mode 100644 recipes-kernel/linux/linux_git.bb

-- 
1.7.8.6



