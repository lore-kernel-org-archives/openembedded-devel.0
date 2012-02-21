Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzde3-00054f-3q
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:31:51 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581AD24; Tue, 21 Feb 2012 01:23:32 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:23:22 +0100
Message-Id: <cover.1329780587.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 0/3] migrate recipes to meta-initramfs
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
X-List-Received-Date: Tue, 21 Feb 2012 00:31:51 -0000

* Once the meta-initramfs layer will be in place,
* remove recipes which have been regrouped in the new
* layer and add appropriate .bbappends.

Andrea Adami (3):
  meta-handheld: recipe moved to meta-initramfs, add bbappends    
    Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  meta-handheld: remove initramfs-images, now in meta-initramfs
  meta-handheld: remove linux-kexecboot_3.1 now in meta-initramfs

 recipes-bsp/images/initramfs-kexecboot-image.bb    |   28 ----
 .../images/initramfs-kexecboot-klibc-image.bb      |    5 -
 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm       |   43 ------
 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb         |   61 --------
 recipes-bsp/kexecboot/kexecboot-handhelds.inc      |    6 +
 recipes-bsp/kexecboot/kexecboot-klibc_git.bb       |   12 --
 recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend |    3 +
 recipes-bsp/kexecboot/kexecboot.inc                |   62 ---------
 recipes-bsp/kexecboot/kexecboot_git.bb             |    9 --
 recipes-bsp/kexecboot/kexecboot_git.bbappend       |    3 +
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 -----
 .../linux/linux-kexecboot-3.1/akita/defconfig      |  132 ------------------
 .../linux/linux-kexecboot-3.1/c7x0/defconfig       |  134 ------------------
 .../linux/linux-kexecboot-3.1/collie/defconfig     |  144 --------------------
 .../linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch  |   66 ---------
 .../linux/linux-kexecboot-3.1/poodle/defconfig     |  136 ------------------
 .../linux/linux-kexecboot-3.1/spitz/defconfig      |  132 ------------------
 .../linux/linux-kexecboot-3.1/tosa/defconfig       |  134 ------------------
 recipes-kernel/linux/linux-kexecboot_3.1.bb        |    7 -
 recipes-kernel/linux/linux-kexecboot_3.1.bbappend  |   19 +++
 20 files changed, 31 insertions(+), 1139 deletions(-)
 delete mode 100644 recipes-bsp/images/initramfs-kexecboot-image.bb
 delete mode 100644 recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-handhelds.inc
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
 delete mode 100644 recipes-bsp/kexecboot/kexecboot.inc
 delete mode 100644 recipes-bsp/kexecboot/kexecboot_git.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot_git.bbappend
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bb
 create mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bbappend

-- 
1.7.3.4



