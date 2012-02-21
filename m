Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzdcc-0004Pd-95
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:30:22 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581A7FB; Tue, 21 Feb 2012 01:22:03 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:21:51 +0100
Message-Id: <cover.1329780628.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 0/6] create meta-initramfs layer
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
X-List-Received-Date: Tue, 21 Feb 2012 00:30:22 -0000

* Layer will host klibc recipe and .bbclass for compiling
* statically linked binaries.
* Add kexecboot, linux-kexecboot  and relative images
* (http://kexecboot.org)

Andrea Adami (6):
  meta-initramfs: initial commit
  meta-initramfs: import klibc recipe and bbclass from meta-oe
  meta-initramfs: add kexec-tools-klibc from meta-oe
  meta-initramfs: add initramfs-kexecboot images from meta-handheld
  meta-initramfs: add kexecboot recipes from meta-handheld
  meta-initramfs: add linux-kexecboot_3.1 from meta-handheld

 meta-initramfs/README                              |   11 +
 meta-initramfs/classes/klibc.bbclass               |    9 +
 .../images/initramfs-kexecboot-image.bb            |   28 +
 .../images/initramfs-kexecboot-klibc-image.bb      |    5 +
 .../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb     |   61 +
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |   12 +
 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc |   54 +
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    9 +
 .../linux/files/qvga/logo_linux_clut224.ppm.bz2    |  Bin 0 -> 5547 bytes
 .../linux/files/vga/logo_linux_clut224.ppm.bz2     |  Bin 0 -> 6436 bytes
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
 .../linux/linux-kexecboot-3.1/akita/defconfig      |  132 ++
 .../linux/linux-kexecboot-3.1/c7x0/defconfig       |  134 ++
 .../linux/linux-kexecboot-3.1/collie/defconfig     |  144 ++
 .../linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch  |   66 +
 .../linux/linux-kexecboot-3.1/poodle/defconfig     |  136 ++
 .../linux/linux-kexecboot-3.1/spitz/defconfig      |  132 ++
 .../linux/linux-kexecboot-3.1/tosa/defconfig       |  134 ++
 .../recipes-kernel/linux/linux-kexecboot.inc       |  136 ++
 .../recipes-kernel/linux/linux-kexecboot_3.1.bb    |   15 +
 .../recipes-devtools/klibc/klcc-cross_1.5.25.bb    |   33 +
 .../klibc/klibc-1.5.25/dash_readopt.patch          |  111 ++
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 +
 .../klibc/klibc-1.5.25/klcc_prefix.patch           |   24 +
 .../klibc/klibc-1.5.25/klibc-config-eabi.patch     |   14 +
 .../klibc/klibc-1.5.25/modprobe.patch              | 1984 ++++++++++++++++++++
 .../klibc/klibc-1.5.25/staging.patch               |  153 ++
 .../klibc/klibc-1.5.25/use-env-for-perl.patch      |   25 +
 .../recipes-devtools/klibc/klibc-1.5.25/wc.patch   |  245 +++
 .../klibc/klibc-checksums_1.5.25.inc               |    2 +
 .../klibc/klibc-static-utils_1.5.25.bb             |   17 +
 .../recipes-devtools/klibc/klibc-utils.inc         |   70 +
 .../recipes-devtools/klibc/klibc-utils_1.5.25.bb   |   17 +
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |   48 +
 .../recipes-devtools/klibc/klibc_1.5.25.bb         |   35 +
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 +
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 +
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 +
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 +
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 +
 .../kexec/kexec-tools-klibc_2.0.2.bb               |   26 +
 meta-initramfs/recipes-kernel/kmod/kmod_git.bb     |   16 +
 meta-oe/classes/klibc.bbclass                      |    9 -
 .../recipes-devtools/klibc/klcc-cross_1.5.25.bb    |   33 -
 .../klibc/klibc-1.5.25/dash_readopt.patch          |  111 --
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 -
 .../klibc/klibc-1.5.25/klcc_prefix.patch           |   24 -
 .../klibc/klibc-1.5.25/klibc-config-eabi.patch     |   14 -
 .../klibc/klibc-1.5.25/modprobe.patch              | 1984 --------------------
 .../klibc/klibc-1.5.25/staging.patch               |  153 --
 .../klibc/klibc-1.5.25/use-env-for-perl.patch      |   25 -
 .../recipes-devtools/klibc/klibc-1.5.25/wc.patch   |  245 ---
 .../klibc/klibc-checksums_1.5.25.inc               |    2 -
 .../klibc/klibc-static-utils_1.5.25.bb             |   17 -
 meta-oe/recipes-devtools/klibc/klibc-utils.inc     |   70 -
 .../recipes-devtools/klibc/klibc-utils_1.5.25.bb   |   17 -
 meta-oe/recipes-devtools/klibc/klibc.inc           |   48 -
 meta-oe/recipes-devtools/klibc/klibc_1.5.25.bb     |   35 -
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 -
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 -
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 -
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 -
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 -
 .../kexec/kexec-tools-klibc_2.0.2.bb               |   26 -
 64 files changed, 4407 insertions(+), 3148 deletions(-)
 create mode 100644 meta-initramfs/README
 create mode 100644 meta-initramfs/classes/klibc.bbclass
 create mode 100644 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
 create mode 100644 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/files/qvga/logo_linux_clut224.ppm.bz2
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/files/vga/logo_linux_clut224.ppm.bz2
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot.inc
 create mode 100644 meta-initramfs/recipes-bsp/recipes-kernel/linux/linux-kexecboot_3.1.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.25.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/dash_readopt.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/fstype-sane-vfat-and-jffs2-for-1.5.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/klcc_prefix.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/klibc-config-eabi.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/modprobe.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/staging.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/use-env-for-perl.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/wc.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-checksums_1.5.25.inc
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.25.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc.inc
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
 create mode 100644 meta-initramfs/recipes-kernel/kmod/kmod_git.bb
 delete mode 100644 meta-oe/classes/klibc.bbclass
 delete mode 100644 meta-oe/recipes-devtools/klibc/klcc-cross_1.5.25.bb
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/dash_readopt.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/fstype-sane-vfat-and-jffs2-for-1.5.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/klcc_prefix.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/klibc-config-eabi.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/modprobe.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/staging.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/use-env-for-perl.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/wc.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-checksums_1.5.25.inc
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-utils.inc
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-utils_1.5.25.bb
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc.inc
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc_1.5.25.bb
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb

-- 
1.7.3.4



