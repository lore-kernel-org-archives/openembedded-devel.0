Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRf-00053o-Qp
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:27 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:40 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:39 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:34 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:20 +0100
Message-Id: <cover.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
X-OriginalArrivalTime: 18 Jan 2009 02:24:34.0783 (UTC)
	FILETIME=[E73FD6F0:01C97913]
Subject: [PATCH 00/14] [RFC] kexecboot and implementation on Zaurus
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:28 -0000

- brand new kexecboot-0.4.bb (thx Yuri Bushmelev)
- this serie of patches deploys kernel in /boot
- but breaks the usual limits for kernel size

Andrea Adami (14):
  linux-kexecboot.inc: revert 71d21c5e379ab3f5d754a967a52240963552a71c
  linux-kexecboot_2.6.26: revert
    71dade0cdaef0220d31a309d8b6d28b99eb25b29
  linux-kexecboot-2.6.26: defconfig fixes
  kexecboot: add new recipe for kexecboot-0.4
  kexecboot: remove kexecboot-0.3
  kexecboot: delete initramfs-kexecboot
  kexecboot: use custom device table with mmc and event0
  zaurus-2.6.inc: switch to kexecboot and deploy kernel in /boot
  linux-rp: unlock 2.6.24 and 2.6.26 for Zaurus clamshells
  linux-rp: update defconfig for spitz
  linux-rp: update defconfigs for c7x0 and akita
  zaurus-2.6.inc: modules fixes
  base-files: fix fstab for multiboot on Zaurus clamshells
  zaurus-clamshell.inc: remove 16 bytes Sharp header

 conf/checksums.ini                                 |    3 +
 conf/machine/include/kexecboot.inc                 |    3 +
 conf/machine/include/zaurus-2.6.inc                |   10 +-
 conf/machine/include/zaurus-clamshell.inc          |    8 +-
 files/device_table-kexecboot.txt                   |    4 +
 files/device_table-minimal.txt                     |    7 -
 packages/base-files/base-files/akita/fstab         |    2 +-
 packages/base-files/base-files/c7x0/fstab          |    2 +-
 packages/base-files/base-files/spitz/fstab         |    4 +-
 packages/kexecboot/files/kexecboot-rewrite.patch   |  344 --------------------
 packages/kexecboot/initramfs-kexecboot-image.bb    |    2 +-
 packages/kexecboot/initramfs-kexecboot_1.0.bb      |   28 --
 packages/kexecboot/kexecboot_0.3.bb                |   21 --
 packages/kexecboot/kexecboot_0.4.bb                |   37 ++
 .../linux-kexecboot-2.6.26/akita/defconfig         |    8 +-
 .../linux-kexecboot-2.6.26/c7x0/defconfig          |    8 +-
 .../linux-kexecboot-2.6.26/spitz/defconfig         |   29 +-
 packages/kexecboot/linux-kexecboot.inc             |    1 -
 packages/kexecboot/linux-kexecboot_2.6.26.bb       |    4 +-
 packages/linux/linux-rp-2.6.24/defconfig-akita     |   12 +-
 packages/linux/linux-rp-2.6.24/defconfig-c7x0      |   12 +-
 packages/linux/linux-rp-2.6.24/defconfig-spitz     |   29 +-
 packages/linux/linux-rp-2.6.26/defconfig-akita     |   12 +-
 packages/linux/linux-rp-2.6.26/defconfig-c7x0      |   12 +-
 packages/linux/linux-rp-2.6.26/defconfig-spitz     |   29 +-
 packages/linux/linux-rp_2.6.24.bb                  |    5 +-
 packages/linux/linux-rp_2.6.26.bb                  |    4 +-
 27 files changed, 151 insertions(+), 489 deletions(-)
 delete mode 100644 packages/kexecboot/files/kexecboot-rewrite.patch
 delete mode 100644 packages/kexecboot/initramfs-kexecboot_1.0.bb
 delete mode 100644 packages/kexecboot/kexecboot_0.3.bb
 create mode 100644 packages/kexecboot/kexecboot_0.4.bb



