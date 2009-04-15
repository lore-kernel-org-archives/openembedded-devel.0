Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1Lu2P3-0003d2-Ix
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 12:31:40 +0200
Received: from localhost.localdomain ([62.205.175.245]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n3FARoLl024566
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 14:27:51 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 14:27:50 +0400
Message-Id: <1239791270-14459-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <20090415102105.GA17954@rainbow>
References: <20090415102105.GA17954@rainbow>
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Wed, 15 Apr 2009 14:27:51 +0400 (MSD)
X-SA-Exim-Connect-IP: 83.222.19.8
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_50,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base-files: add relatime to rootfs mount options
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
X-List-Received-Date: Wed, 15 Apr 2009 10:31:41 -0000

In most machines' fstabs rootfs mounted with 'defaults' option.
This implies that atime logging is on - i.e. on every read from
filesystem kernel writes atime stamp to files' metadata.
Here in embedded world, where rootfs is usually stored on some
kind of flash (internal NAND/NOR, or external SD/MMC/CF card)
it is a real problem, because higher number of writes causes
flash wearing, higher system load and higher chance of filesystem
corruption.

Fix it by adding relatime to rootfs mount options.

NOTE: since relatime option only available on 2.6.20+ kernels,
following fstabs weren't touched, as these machines seem to use
older kernels (kernel versions checked against Angstrom distro, other
distros may vary):
 amsdelta	linux-amsdelta-2.6_2.6.16-omap2.bb
 epia		linux-epia_2.6.19.2.bb
 h6300		linux-h6300-omap1_2.6.16.16.bb
 jornada7xx	linux-jlime-jornada7xx_2.6.19rc6.bb
 mtx-1		linux-mtx-1_2.4.27.bb
 mtx-2		linux-mtx-2_2.4.27.bb
 netbook-pro	netbook-pro-kernel_2.6.17.bb
 nokia770	linux-nokia800_2.6.18-osso40.bb
 wrt54		linux-wrt_2.4.30.bb
 xxs1500	linux-xxs1500_2.4.21.bb
Users of these machines may want to use noatime flag instead.
Also expect breakage if your machine uses old kernel and default fstab.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 recipes/base-files/base-files/akita/fstab          |    2 +-
 recipes/base-files/base-files/c7x0/fstab           |    2 +-
 recipes/base-files/base-files/efika/fstab          |    2 +-
 recipes/base-files/base-files/ep93xx/fstab         |    2 +-
 recipes/base-files/base-files/fstab                |    2 +-
 recipes/base-files/base-files/gumstix-connex/fstab |    2 +-
 recipes/base-files/base-files/gumstix-verdex/fstab |    2 +-
 recipes/base-files/base-files/h2200/fstab          |    2 +-
 recipes/base-files/base-files/h3600/fstab          |    2 +-
 recipes/base-files/base-files/h3900/fstab          |    2 +-
 recipes/base-files/base-files/h5000/fstab          |    2 +-
 recipes/base-files/base-files/htcuniversal/fstab   |    2 +-
 recipes/base-files/base-files/hx4700/fstab         |    2 +-
 recipes/base-files/base-files/mx31moboard/fstab    |    2 +-
 recipes/base-files/base-files/om-3d7k/fstab        |    2 +-
 recipes/base-files/base-files/omap5912osk/fstab    |    2 +-
 recipes/base-files/base-files/openprotium/fstab    |    2 +-
 recipes/base-files/base-files/poodle/fstab         |    2 +-
 recipes/base-files/base-files/simpad/fstab         |    2 +-
 recipes/base-files/base-files/slugos/fstab         |    2 +-
 recipes/base-files/base-files/spitz/fstab          |    2 +-
 recipes/base-files/base-files/tosa/fstab           |    2 +-
 recipes/base-files/base-files_3.0.14.bb            |    2 +-
 23 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/recipes/base-files/base-files/akita/fstab b/recipes/base-files/base-files/akita/fstab
index 3b488cf..bf8075e 100644
--- a/recipes/base-files/base-files/akita/fstab
+++ b/recipes/base-files/base-files/akita/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,relatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/recipes/base-files/base-files/c7x0/fstab b/recipes/base-files/base-files/c7x0/fstab
index ea38eab..a4b2873 100644
--- a/recipes/base-files/base-files/c7x0/fstab
+++ b/recipes/base-files/base-files/c7x0/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,relatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/recipes/base-files/base-files/efika/fstab b/recipes/base-files/base-files/efika/fstab
index c7bf023..45bbd09 100644
--- a/recipes/base-files/base-files/efika/fstab
+++ b/recipes/base-files/base-files/efika/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,relatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 usbfs                /proc/bus/usb        usbfs      auto                0 0
diff --git a/recipes/base-files/base-files/ep93xx/fstab b/recipes/base-files/base-files/ep93xx/fstab
index c7bf023..45bbd09 100644
--- a/recipes/base-files/base-files/ep93xx/fstab
+++ b/recipes/base-files/base-files/ep93xx/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,relatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 usbfs                /proc/bus/usb        usbfs      auto                0 0
diff --git a/recipes/base-files/base-files/fstab b/recipes/base-files/base-files/fstab
index 628a9e9..f941f6d 100644
--- a/recipes/base-files/base-files/fstab
+++ b/recipes/base-files/base-files/fstab
@@ -1,6 +1,6 @@
 # stock fstab - you probably want to override this with a machine specific one
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime      1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/recipes/base-files/base-files/gumstix-connex/fstab b/recipes/base-files/base-files/gumstix-connex/fstab
index 418f997..689cd28 100644
--- a/recipes/base-files/base-files/gumstix-connex/fstab
+++ b/recipes/base-files/base-files/gumstix-connex/fstab
@@ -1,6 +1,6 @@
 # fstab for gumstix-connex
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 sysfs                /sys                 sysfs      defaults              0  0
 tmpfs                /dev                 tmpfs      defaults              0  0
diff --git a/recipes/base-files/base-files/gumstix-verdex/fstab b/recipes/base-files/base-files/gumstix-verdex/fstab
index 9b5f00c..9c0aed7 100644
--- a/recipes/base-files/base-files/gumstix-verdex/fstab
+++ b/recipes/base-files/base-files/gumstix-verdex/fstab
@@ -1,6 +1,6 @@
 # fstab for gumstix-verdex
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 sysfs                /sys                 sysfs      defaults              0  0
 tmpfs                /dev                 tmpfs      defaults              0  0
diff --git a/recipes/base-files/base-files/h2200/fstab b/recipes/base-files/base-files/h2200/fstab
index 5063f84..2b97e45 100644
--- a/recipes/base-files/base-files/h2200/fstab
+++ b/recipes/base-files/base-files/h2200/fstab
@@ -1,4 +1,4 @@
-rootfs		/		auto	defaults	1  1		
+rootfs		/		auto	defaults,relatime	1  1		
 proc            /proc		proc    defaults        0  0
 sys             /sys		sysfs	defaults        0  0
 tmpfs		/var/volatile	tmpfs	mode=0755	0  0
diff --git a/recipes/base-files/base-files/h3600/fstab b/recipes/base-files/base-files/h3600/fstab
index 9ec7df1..181faad 100644
--- a/recipes/base-files/base-files/h3600/fstab
+++ b/recipes/base-files/base-files/h3600/fstab
@@ -1,4 +1,4 @@
-rootfs		/ 		auto	defaults	1  1 
+rootfs		/ 		auto	defaults,relatime	1  1 
 proc            /proc   proc    defaults        0  0
 /dev/hda1	/media/cf	auto	defaults,noauto,noatime,user,exec,suid	0  0
 /dev/mmc/part1	/media/card	auto	defaults,noauto,noatime,user,exec,suid	0  0
diff --git a/recipes/base-files/base-files/h3900/fstab b/recipes/base-files/base-files/h3900/fstab
index 9ec7df1..181faad 100644
--- a/recipes/base-files/base-files/h3900/fstab
+++ b/recipes/base-files/base-files/h3900/fstab
@@ -1,4 +1,4 @@
-rootfs		/ 		auto	defaults	1  1 
+rootfs		/ 		auto	defaults,relatime	1  1 
 proc            /proc   proc    defaults        0  0
 /dev/hda1	/media/cf	auto	defaults,noauto,noatime,user,exec,suid	0  0
 /dev/mmc/part1	/media/card	auto	defaults,noauto,noatime,user,exec,suid	0  0
diff --git a/recipes/base-files/base-files/h5000/fstab b/recipes/base-files/base-files/h5000/fstab
index ad05f3b..2b28120 100644
--- a/recipes/base-files/base-files/h5000/fstab
+++ b/recipes/base-files/base-files/h5000/fstab
@@ -1,4 +1,4 @@
-rootfs		/ 	auto	defaults	1  1 
+rootfs		/ 	auto	defaults,relatime	1  1 
 #breaks h51xx
 /dev/mtdblock2 /home   jffs2   defaults        1  1
 proc            /proc   proc    defaults        0  0
diff --git a/recipes/base-files/base-files/htcuniversal/fstab b/recipes/base-files/base-files/htcuniversal/fstab
index b4aa259..c2a5a86 100644
--- a/recipes/base-files/base-files/htcuniversal/fstab
+++ b/recipes/base-files/base-files/htcuniversal/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs               /proc/bus/usb         usbfs      defaults              0  0
diff --git a/recipes/base-files/base-files/hx4700/fstab b/recipes/base-files/base-files/hx4700/fstab
index 49b5c96..c37827d 100644
--- a/recipes/base-files/base-files/hx4700/fstab
+++ b/recipes/base-files/base-files/hx4700/fstab
@@ -1,4 +1,4 @@
-rootfs	 	/		auto	defaults		1  1		
+rootfs	 	/		auto	defaults,relatime		1  1		
 /dev/mtdblock3 	/home   jffs2   defaults        1  1
 
 proc            /proc		proc    defaults        0  0
diff --git a/recipes/base-files/base-files/mx31moboard/fstab b/recipes/base-files/base-files/mx31moboard/fstab
index 1ec0fd5..5271a0e 100644
--- a/recipes/base-files/base-files/mx31moboard/fstab
+++ b/recipes/base-files/base-files/mx31moboard/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/recipes/base-files/base-files/om-3d7k/fstab b/recipes/base-files/base-files/om-3d7k/fstab
index 48aefde..825cac4 100644
--- a/recipes/base-files/base-files/om-3d7k/fstab
+++ b/recipes/base-files/base-files/om-3d7k/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/recipes/base-files/base-files/omap5912osk/fstab b/recipes/base-files/base-files/omap5912osk/fstab
index 5e881f7..cb1e388 100644
--- a/recipes/base-files/base-files/omap5912osk/fstab
+++ b/recipes/base-files/base-files/omap5912osk/fstab
@@ -1,6 +1,6 @@
 # fstab for omap5912osk
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 sysfs                /sys                 sysfs      defaults              0  0
 tmpfs                /dev                 tmpfs      defaults              0  0
diff --git a/recipes/base-files/base-files/openprotium/fstab b/recipes/base-files/base-files/openprotium/fstab
index 96b0e2a..a695354 100644
--- a/recipes/base-files/base-files/openprotium/fstab
+++ b/recipes/base-files/base-files/openprotium/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,relatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/recipes/base-files/base-files/poodle/fstab b/recipes/base-files/base-files/poodle/fstab
index 733b13f..aa88081 100644
--- a/recipes/base-files/base-files/poodle/fstab
+++ b/recipes/base-files/base-files/poodle/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,relatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/recipes/base-files/base-files/simpad/fstab b/recipes/base-files/base-files/simpad/fstab
index 3e57ae3..8df3054 100644
--- a/recipes/base-files/base-files/simpad/fstab
+++ b/recipes/base-files/base-files/simpad/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,relatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 tmpfs                /dev/shm             tmpfs      mode=0777             0  0
diff --git a/recipes/base-files/base-files/slugos/fstab b/recipes/base-files/base-files/slugos/fstab
index e00f057..986c172 100644
--- a/recipes/base-files/base-files/slugos/fstab
+++ b/recipes/base-files/base-files/slugos/fstab
@@ -1,4 +1,4 @@
-rootfs		/		jffs2	defaults	1  1
+rootfs		/		jffs2	defaults,relatime	1  1
 sysfs		/sys		sysfs	defaults	0  0
 proc		/proc		proc	defaults	0  0
 tmpfs		/var/volatile	tmpfs	mode=0755	0  0
diff --git a/recipes/base-files/base-files/spitz/fstab b/recipes/base-files/base-files/spitz/fstab
index 324fb78..e5190e3 100644
--- a/recipes/base-files/base-files/spitz/fstab
+++ b/recipes/base-files/base-files/spitz/fstab
@@ -1,7 +1,7 @@
 # don't mount /dev/mtdblock2 since Spitz uses pivot_root
 # or 2.6 directly boots from the hdd
 # /dev/mtdblock2     /            jffs2   rw,noatime              1  1
-rootfs             /            auto    defaults                1  1
+rootfs             /            auto    defaults,relatime                1  1
 proc               /proc        proc    defaults                0  0
 # we can use a normal var filesystem with a microdrive
 # tmpfs              /var/volatiles         tmpfs   defaults                0  0
diff --git a/recipes/base-files/base-files/tosa/fstab b/recipes/base-files/base-files/tosa/fstab
index f256c74..2f1db3a 100644
--- a/recipes/base-files/base-files/tosa/fstab
+++ b/recipes/base-files/base-files/tosa/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,relatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 460fd63..0d012c7 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Miscellaneous files for the base system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r85"
+PR = "r86"
 LICENSE = "GPL"
 
 SRC_URI = " \
-- 
1.6.0.6



