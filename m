Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9Qv-0004ym-Rb
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:44:01 +0200
Received: by fxg11 with SMTP id 11so869515fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l8rKN6lDd5wWD2A97/6LGLt9R8SQz9R/Cv7U4oqzbfY=;
	b=I+ORvGn4KFvzae6BIvw3ya3C/QZ2ii/DtMQTv55QHxg5MygfRURGsxNgomuD9ZGBqq
	yYLudsjBRz3IBraghm2EdIwsfH6wB8H7D1md4w/k6He9M8Bf7oK/Ck3pUjeFE6McabB6
	18JnBmrZE+hsigarIFBEjK2gnZvvTCbIC3nB8=
Received: by 10.223.26.71 with SMTP id d7mr537849fac.23.1314891546052;
	Thu, 01 Sep 2011 08:39:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 11sm127872fav.10.2011.09.01.08.39.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:39:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:38:56 +0200
Message-Id: <cover.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-handheld][PATCH 00/10] Pull request #1
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
X-List-Received-Date: Thu, 01 Sep 2011 15:44:01 -0000

Hi,

please merge following changes, they are mostly from meta-zaurus and are needed 
even to parse recipes when MACHINE=spitz.

Tested on core-image-core, where only failing recipe is now zaurusd, because of o-hand repo:
| ERROR: Function 'Fetcher failure for URL: 'svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http'. Please set SRCREV to a valid value' failed

and we should switch that from svn.o-hand.com to 
http://git.yoctoproject.org/cgit/cgit.cgi/zaurusd/ as rest of o-hand recipes in oe-core.

The following changes since commit 3e013ce4211bca15dedbbdc1e714e17d85013746:

  linux-3.0: update to 3.0.1 (2011-08-24 00:09:51 +0100)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/sync-with-meta-zaurus

Martin Jansa (10):
  linux-2.6.39: drop files which don't belong here
  linux-2.6.39: upgrade to 2.6.39.4 and import 2 patches from
    meta-zaurus
  linux-kexecboot: import from meta-zaurus
  linux: add some logo files from meta-zaurus
  linux(-kexecboot): move shared definitions to linux-${PV}.inc
  initramfs-kexecboot.inc: import missing file from meta-zaurus
  conf/machine: unify MACHINE_GUI_CLASS/GUI_MACHINE_CLASS to
    MACHINE_GUI_CLASS in all configs
  kexecboot: import from meta-zaurus
  spitz,akita: add iwmmxt to PACKAGE_EXTRA_ARCHS_tune-xscale not
    PACKAGE_EXTRA_ARCHS
  initramfs-kexecboot*image: import from meta-zaurus

 conf/machine/akita.conf                            |    2 +-
 conf/machine/include/initramfs-kexecboot.inc       |   18 +
 conf/machine/include/zaurus.inc                    |    2 +-
 conf/machine/palmt650.conf                         |    2 +-
 conf/machine/palmt680.conf                         |    2 +-
 conf/machine/palmtc.conf                           |    2 +-
 conf/machine/palmtt5.conf                          |    2 +-
 conf/machine/simpad.conf                           |    2 +-
 conf/machine/spitz.conf                            |    2 +-
 recipes-bsp/images/initramfs-kexecboot-image.bb    |   23 +
 .../images/initramfs-kexecboot-klibc-image.bb      |    3 +
 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm       |   43 +
 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb         |   56 +
 recipes-bsp/kexecboot/kexecboot-klibc_git.bb       |   12 +
 recipes-bsp/kexecboot/kexecboot.inc                |   61 +
 recipes-bsp/kexecboot/kexecboot_git.bb             |    9 +
 .../linux/files/qvga/logo_linux_clut224.ppm.bz2    |  Bin 0 -> 5547 bytes
 .../linux/files/vga/logo_linux_clut224.ppm.bz2     |  Bin 0 -> 6436 bytes
 recipes-kernel/linux/linux-2.6.39.inc              |   20 +
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
 .../linux/linux-2.6.39/locomo_kbd_tweak-r2.patch   |   66 +
 .../linux/linux-2.6.39/om-gta01/defconfig          |  481 -
 .../linux/linux-2.6.39/om-gta02/defconfig          |  490 -
 recipes-kernel/linux/linux-2.6.39/openmoko.patch   |46285 --------------------
 recipes-kernel/linux/linux-2.6.39/shr.patch        | 2021 -
 recipes-kernel/linux/linux-kexecboot.inc           |  145 +
 .../linux/linux-kexecboot/akita/defconfig          |  133 +
 .../linux/linux-kexecboot/c7x0/defconfig           |  135 +
 .../linux/linux-kexecboot/collie/defconfig         |  145 +
 .../linux/linux-kexecboot/poodle/defconfig         |  137 +
 .../linux/linux-kexecboot/spitz/defconfig          |  133 +
 .../linux/linux-kexecboot/tosa/defconfig           |  135 +
 recipes-kernel/linux/linux-kexecboot_2.6.39.bb     |    5 +
 recipes-kernel/linux/linux_2.6.39.bb               |   28 +-
 34 files changed, 1322 insertions(+), 49312 deletions(-)
 create mode 100644 conf/machine/include/initramfs-kexecboot.inc
 create mode 100644 recipes-bsp/images/initramfs-kexecboot-image.bb
 create mode 100644 recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
 create mode 100644 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot.inc
 create mode 100644 recipes-bsp/kexecboot/kexecboot_git.bb
 create mode 100644 recipes-kernel/linux/files/qvga/logo_linux_clut224.ppm.bz2
 create mode 100644 recipes-kernel/linux/files/vga/logo_linux_clut224.ppm.bz2
 create mode 100644 recipes-kernel/linux/linux-2.6.39.inc
 create mode 100644 recipes-kernel/linux/linux-2.6.39/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-2.6.39/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/om-gta01/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/om-gta02/defconfig
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/openmoko.patch
 delete mode 100644 recipes-kernel/linux/linux-2.6.39/shr.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot.inc
 create mode 100644 recipes-kernel/linux/linux-kexecboot/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot_2.6.39.bb

-- 
1.7.6.1



