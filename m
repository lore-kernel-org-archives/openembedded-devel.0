Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 634E16AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 22:13:42 +0000 (UTC)
Received: by wiun10 with SMTP id n10so54316148wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 15:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S0uNsM5dBggMRPjO7H3rHWNz4+pgk61CfgULg8M6kD0=;
	b=pKdwJQMyX7D7rx8CwFiDLnqS1Vtsc8++ElVwBs6yfG96dMYKYcSQjobL8LHN3b3EH/
	Ot01qOYCRz0CZQwuTvW4Y4+Mr4vxmK7vEyE60EODLj+7DT6bbqKJvqgkbcZNlLFWz/lg
	cn4eK0jsS5/2260/6rPn5YtzslcuKGaE+EwGl2GtFVK4uC42la6VHJBQxyshYA29DfEJ
	sesPaaxZ4pFVeVCpLYd3dIZhB82BXkVO9raaP+ExBGGmiDHD7DlMkwbD1e+1/2vXAx4q
	byTZPKe2xnUTKxyw1xglh0RlPd5xb1YWgga4ektzZ9kzl+IKyRzhsfoJNPPQ1JszNv7n
	sztg==
X-Received: by 10.195.11.202 with SMTP id ek10mr17602875wjd.12.1429395223467; 
	Sat, 18 Apr 2015 15:13:43 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host231-254-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.254.231]) by mx.google.com with ESMTPSA id
	hj10sm20579431wjc.48.2015.04.18.15.13.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Apr 2015 15:13:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Apr 2015 00:13:36 +0200
Message-Id: <1429395216-20462-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull Request 20150419 - Cleanings for Yocto Project 1.8
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
X-List-Received-Date: Sat, 18 Apr 2015 22:13:45 -0000

After 4 years of meta-handheld we remove the unmaintained MACHINES,
bsp tools and kernels.

The following changes since commit 824b971f8abc45a8ac8bca784a43d371f05325e5:

  keymaps: make sure sysconfdir exists (2015-04-17 09:57:57 +0100)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-handheld master

for you to fetch changes up to 0f7aeeb45f2beba64887b209c54f522dffe12bfc:

  keymaps: restrict compatibility to maintained machines (2015-04-18 23:59:03 +0200)

----------------------------------------------------------------
Andrea Adami (12):
      jornada: remove unmaintained machines and kernels
      ezx: remove unmaintained machines, bsp tools and kernels
      palm: remove unmaintained machines, bsp tools and kernels
      ipaq: remove unmaintained machines and bsp tools
      simpad: remove unmaintained machine
      linux-handhelds_2.6: remove unmaintained kernel
      linux.inc: remove unused kernel .inc
      OE logo: remove unused ppm.bz2 vga and qvga logo
      device_table: remove unused device tables
      ipaq-boot-params: restrict compatibility to h3600 only
      formfactor: remove machconfig of unmaintained machines
      keymaps: restrict compatibility to maintained machines

 conf/machine/a1200.conf                            |     5 -
 conf/machine/a780.conf                             |     5 -
 conf/machine/a910.conf                             |     5 -
 conf/machine/e680.conf                             |     5 -
 conf/machine/h1910.conf                            |    25 -
 conf/machine/h2200.conf                            |    42 -
 conf/machine/h3800.conf                            |     6 -
 conf/machine/h3900.conf                            |    33 -
 conf/machine/h4000.conf                            |    43 -
 conf/machine/h5000.conf                            |    43 -
 conf/machine/include/motorola-ezx-base.inc         |    61 -
 conf/machine/include/palm.inc                      |    81 -
 conf/machine/jornada56x.conf                       |    17 -
 conf/machine/jornada6xx.conf                       |    13 -
 conf/machine/jornada7xx.conf                       |    20 -
 conf/machine/palmld.conf                           |    35 -
 conf/machine/palmt650.conf                         |    18 -
 conf/machine/palmt680.conf                         |    12 -
 conf/machine/palmtc.conf                           |    12 -
 conf/machine/palmtt.conf                           |    15 -
 conf/machine/palmtt3.conf                          |     7 -
 conf/machine/palmtt5.conf                          |    13 -
 conf/machine/palmtx.conf                           |    27 -
 conf/machine/palmz31.conf                          |    19 -
 conf/machine/palmz71.conf                          |    12 -
 conf/machine/palmz72.conf                          |    20 -
 conf/machine/rokre2.conf                           |    10 -
 conf/machine/rokre6.conf                           |     6 -
 conf/machine/rx1950.conf                           |    27 -
 conf/machine/rx3000.conf                           |    36 -
 conf/machine/simpad.conf                           |    19 -
 files/device_table-ezx.txt                         |    26 -
 files/device_table-minimal.txt                     |    44 -
 files/device_table_add-loop.txt                    |     1 -
 files/device_table_add-scsi.txt                    |     6 -
 recipes-bsp/ezx/ezx-gen-blob_git.bb                |    41 -
 recipes-bsp/ezx/ezx-gpiotool_svn.bb                |    24 -
 recipes-bsp/ezx/ezxd/ezxd.init                     |    83 -
 recipes-bsp/ezx/ezxd_svn.bb                        |    48 -
 recipes-bsp/ezx/files/remove-bogus-sed.patch       |    15 -
 recipes-bsp/ezx/moto-boot-usb-native_git.bb        |    27 -
 recipes-bsp/formfactor/files/a1200/machconfig      |    16 -
 recipes-bsp/formfactor/files/a780/machconfig       |    15 -
 recipes-bsp/formfactor/files/a910/machconfig       |    16 -
 recipes-bsp/formfactor/files/e680/machconfig       |    15 -
 recipes-bsp/formfactor/files/h1910/machconfig      |    15 -
 recipes-bsp/formfactor/files/h2200/machconfig      |    15 -
 recipes-bsp/formfactor/files/h3800/machconfig      |    15 -
 recipes-bsp/formfactor/files/h3900/machconfig      |    15 -
 recipes-bsp/formfactor/files/h4000/machconfig      |    15 -
 recipes-bsp/formfactor/files/h5000/machconfig      |    15 -
 recipes-bsp/formfactor/files/jornada56x/machconfig |    15 -
 recipes-bsp/formfactor/files/jornada6xx/machconfig |    15 -
 recipes-bsp/formfactor/files/jornada7xx/machconfig |    15 -
 recipes-bsp/formfactor/files/palmld/machconfig     |    15 -
 recipes-bsp/formfactor/files/palmt650/machconfig   |    15 -
 recipes-bsp/formfactor/files/palmt680/machconfig   |    15 -
 recipes-bsp/formfactor/files/palmtc/machconfig     |    15 -
 recipes-bsp/formfactor/files/palmtt/machconfig     |    15 -
 recipes-bsp/formfactor/files/palmtt3/machconfig    |    15 -
 recipes-bsp/formfactor/files/palmtt5/machconfig    |    15 -
 recipes-bsp/formfactor/files/palmtx/machconfig     |    15 -
 recipes-bsp/formfactor/files/palmz31/machconfig    |    16 -
 recipes-bsp/formfactor/files/palmz71/machconfig    |    15 -
 recipes-bsp/formfactor/files/palmz72/machconfig    |    15 -
 recipes-bsp/formfactor/files/rokre2/machconfig     |    16 -
 recipes-bsp/formfactor/files/rokre6/machconfig     |    16 -
 recipes-bsp/formfactor/files/rx1950/machconfig     |    15 -
 recipes-bsp/formfactor/files/rx3000/machconfig     |    15 -
 recipes-bsp/formfactor/files/simpad/machconfig     |    15 -
 recipes-bsp/h2200-bootloader/h2200-bootloader.bb   |    15 -
 recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb   |     3 +-
 recipes-bsp/keymaps/keymaps_1.0.bbappend           |    12 +-
 recipes-bsp/palmt650/palmt650-keyboard-modmap.bb   |    23 -
 .../palmt650/palmt650-keyboard-modmap/60xXmodmap   |     8 -
 .../palmt650/palmt650-keyboard-modmap/Xmodmap      |   118 -
 .../linux/files/qvga/logo_linux_clut224.ppm.bz2    |   Bin 5547 -> 0 bytes
 .../linux/files/vga/logo_linux_clut224.ppm.bz2     |   Bin 6436 -> 0 bytes
 .../linux/linux-hackndev-2.6/palmld/defconfig      |  1346 -
 .../linux/linux-hackndev-2.6/palmt650/defconfig    |  1295 -
 .../linux/linux-hackndev-2.6/palmtc/defconfig      |  1208 -
 .../linux/linux-hackndev-2.6/palmtt3/defconfig     |  1383 -
 .../linux/linux-hackndev-2.6/palmtt5/defconfig     |  1314 -
 .../linux/linux-hackndev-2.6/palmtx/busybox-config |   571 -
 .../linux/linux-hackndev-2.6/palmtx/defconfig      |  1347 -
 .../linux/linux-hackndev-2.6/palmtx/init           |   195 -
 .../linux/linux-hackndev-2.6/palmtx/initramfs_list |   243 -
 .../linux/linux-hackndev-2.6/palmz72/defconfig     |  1422 -
 recipes-kernel/linux/linux-hackndev-2.6_git.bb     |    72 -
 ...vent-the-loop-in-timespec_add_ns-from-bei.patch |    34 -
 .../linux-handhelds-2.6-2.6.21/asus620/defconfig   |  1354 -
 .../linux-handhelds-2.6-2.6.21/asus730/defconfig   |  1475 -
 .../linux-handhelds-2.6-2.6.21/aximx50/defconfig   |  1337 -
 .../linux-handhelds-2.6-2.6.21/eteng500/defconfig  |  1326 -
 .../linux-handhelds-2.6-2.6.21/gcc4x-limits.patch  |    10 -
 .../linux-handhelds-2.6-2.6.21/h1910/defconfig     |  1407 -
 .../linux-handhelds-2.6-2.6.21/h2200/defconfig     |  1803 -
 .../linux-handhelds-2.6-2.6.21/h3600/defconfig     |  1324 -
 .../linux-handhelds-2.6-2.6.21/h3800/defconfig     |  1322 -
 .../linux-handhelds-2.6-2.6.21/h3900/defconfig     |  1443 -
 .../linux-handhelds-2.6-2.6.21/h4000/defconfig     |  1569 -
 .../linux-handhelds-2.6-2.6.21/h5000/defconfig     |  1701 -
 .../linux-handhelds-2.6-2.6.21/htcalpine/defconfig |  1347 -
 .../linux-handhelds-2.6-2.6.21/htcapache/defconfig |  1437 -
 .../htcbeetles/defconfig                           |  1354 -
 .../htcblueangel/defconfig                         |  1590 -
 .../htchimalaya/defconfig                          |  1350 -
 .../linux-handhelds-2.6-2.6.21/htcsable/defconfig  |  1465 -
 .../htcuniversal/defconfig                         |  1471 -
 .../htcwallaby/defconfig                           |  1322 -
 .../linux-handhelds-2.6-2.6.21/hx4700/defconfig    |  1823 -
 ...-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch |   144 -
 .../linux-handhelds-2.6-2.6.21/looxc550/defconfig  |  1351 -
 .../linux-handhelds-2.6-2.6.21/magician/defconfig  |  1679 -
 .../makefile-implicit.patch                        |    34 -
 .../linux-handhelds-2.6-2.6.21/rx1950/defconfig    |  1383 -
 .../linux-handhelds-2.6-2.6.21/rx3000/defconfig    |  1507 -
 recipes-kernel/linux/linux-handhelds-2.6.inc       |   126 -
 .../linux/linux-handhelds-2.6_2.6.21-hh20.bb       |    27 -
 .../LinuxSH-2.6.17.patch                           | 56290 -------------------
 .../alsa_hp6xx_2.6.17.patch                        |   636 -
 .../linux-jlime-jornada6xx-2.6.17/defconfig_jlime  |  1187 -
 .../linux-jlime-jornada6xx-2.6.17/io.h-fix.patch   |    31 -
 .../keyboard-fix-deadkeys.patch                    |   204 -
 .../linux-jlime-jornada6xx-2.6.17/keymap-fix.patch |   408 -
 .../linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch |   987 -
 .../unexpected-int-fix.patch                       |    17 -
 .../linux/linux-jlime-jornada6xx_2.6.17.bb         |    31 -
 .../linux/linux-jlime-jornada7xx_2.6.37+git.bb     |    24 -
 .../linux-palm-omap1-2.6.22-omap1/palmtt/defconfig |   882 -
 .../palmtt2/defconfig                              |   882 -
 .../palmz71/defconfig                              |   875 -
 .../linux/linux-palm-omap1_2.6.22-omap1.bb         |    42 -
 recipes-kernel/linux/linux.inc                     |   123 -
 recipes-kernel/linux/openezx-kernel_git.bb         |    47 -
 135 files changed, 2 insertions(+), 110201 deletions(-)
 delete mode 100644 conf/machine/a1200.conf
 delete mode 100644 conf/machine/a780.conf
 delete mode 100644 conf/machine/a910.conf
 delete mode 100644 conf/machine/e680.conf
 delete mode 100644 conf/machine/h1910.conf
 delete mode 100644 conf/machine/h2200.conf
 delete mode 100644 conf/machine/h3800.conf
 delete mode 100644 conf/machine/h3900.conf
 delete mode 100644 conf/machine/h4000.conf
 delete mode 100644 conf/machine/h5000.conf
 delete mode 100644 conf/machine/include/motorola-ezx-base.inc
 delete mode 100644 conf/machine/include/palm.inc
 delete mode 100644 conf/machine/jornada56x.conf
 delete mode 100644 conf/machine/jornada6xx.conf
 delete mode 100644 conf/machine/jornada7xx.conf
 delete mode 100644 conf/machine/palmld.conf
 delete mode 100644 conf/machine/palmt650.conf
 delete mode 100644 conf/machine/palmt680.conf
 delete mode 100644 conf/machine/palmtc.conf
 delete mode 100644 conf/machine/palmtt.conf
 delete mode 100644 conf/machine/palmtt3.conf
 delete mode 100644 conf/machine/palmtt5.conf
 delete mode 100644 conf/machine/palmtx.conf
 delete mode 100644 conf/machine/palmz31.conf
 delete mode 100644 conf/machine/palmz71.conf
 delete mode 100644 conf/machine/palmz72.conf
 delete mode 100644 conf/machine/rokre2.conf
 delete mode 100644 conf/machine/rokre6.conf
 delete mode 100644 conf/machine/rx1950.conf
 delete mode 100644 conf/machine/rx3000.conf
 delete mode 100644 conf/machine/simpad.conf
 delete mode 100644 files/device_table-ezx.txt
 delete mode 100644 files/device_table-minimal.txt
 delete mode 100644 files/device_table_add-loop.txt
 delete mode 100644 files/device_table_add-scsi.txt
 delete mode 100644 recipes-bsp/ezx/ezx-gen-blob_git.bb
 delete mode 100644 recipes-bsp/ezx/ezx-gpiotool_svn.bb
 delete mode 100644 recipes-bsp/ezx/ezxd/ezxd.init
 delete mode 100644 recipes-bsp/ezx/ezxd_svn.bb
 delete mode 100644 recipes-bsp/ezx/files/remove-bogus-sed.patch
 delete mode 100644 recipes-bsp/ezx/moto-boot-usb-native_git.bb
 delete mode 100755 recipes-bsp/formfactor/files/a1200/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/a780/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/a910/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/e680/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/h1910/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/h2200/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/h3800/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/h3900/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/h4000/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/h5000/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/jornada56x/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/jornada6xx/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/jornada7xx/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmld/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmt650/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmt680/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmtc/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmtt/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmtt3/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmtt5/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmtx/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmz31/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmz71/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/palmz72/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/rokre2/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/rokre6/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/rx1950/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/rx3000/machconfig
 delete mode 100755 recipes-bsp/formfactor/files/simpad/machconfig
 delete mode 100644 recipes-bsp/h2200-bootloader/h2200-bootloader.bb
 delete mode 100644 recipes-bsp/palmt650/palmt650-keyboard-modmap.bb
 delete mode 100644 recipes-bsp/palmt650/palmt650-keyboard-modmap/60xXmodmap
 delete mode 100644 recipes-bsp/palmt650/palmt650-keyboard-modmap/Xmodmap
 delete mode 100644 recipes-kernel/linux/files/qvga/logo_linux_clut224.ppm.bz2
 delete mode 100644 recipes-kernel/linux/files/vga/logo_linux_clut224.ppm.bz2
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmld/defconfig
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmt650/defconfig
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmtc/defconfig
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmtt3/defconfig
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmtt5/defconfig
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmtx/busybox-config
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmtx/defconfig
 delete mode 100755 recipes-kernel/linux/linux-hackndev-2.6/palmtx/init
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmtx/initramfs_list
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6/palmz72/defconfig
 delete mode 100644 recipes-kernel/linux/linux-hackndev-2.6_git.bb
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/asus620/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/asus730/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/aximx50/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/eteng500/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/gcc4x-limits.patch
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h1910/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h2200/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3600/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3800/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h3900/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h4000/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/h5000/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcalpine/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcapache/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcbeetles/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcblueangel/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htchimalaya/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcsable/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcuniversal/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/htcwallaby/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/hx4700/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/looxc550/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/magician/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/makefile-implicit.patch
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/rx1950/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6-2.6.21/rx3000/defconfig
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6.inc
 delete mode 100644 recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/LinuxSH-2.6.17.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/alsa_hp6xx_2.6.17.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/defconfig_jlime
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/io.h-fix.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/keyboard-fix-deadkeys.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/keymap-fix.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/rtc-2.6.17.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx-2.6.17/unexpected-int-fix.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada6xx_2.6.17.bb
 delete mode 100644 recipes-kernel/linux/linux-jlime-jornada7xx_2.6.37+git.bb
 delete mode 100644 recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmtt/defconfig
 delete mode 100644 recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmtt2/defconfig
 delete mode 100644 recipes-kernel/linux/linux-palm-omap1-2.6.22-omap1/palmz71/defconfig
 delete mode 100644 recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb
 delete mode 100644 recipes-kernel/linux/linux.inc
 delete mode 100644 recipes-kernel/linux/openezx-kernel_git.bb

-- 
1.9.1


