Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1LixFx-0006z3-ET
	for openembedded-devel@openembedded.org; Sun, 15 Mar 2009 21:48:28 +0100
Received: from localhost.localdomain ([62.205.175.245]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n2FKlp04030441
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2009 23:47:51 +0300
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Date: Sun, 15 Mar 2009 23:47:51 +0300
Message-Id: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.0.6
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sun, 15 Mar 2009 23:47:51 +0300 (MSK)
X-SA-Exim-Connect-IP: 83.222.19.8
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_50,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH/RFC] base-files: add noatime to rootfs mount options
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
X-List-Received-Date: Sun, 15 Mar 2009 20:48:28 -0000

In most machines' fstabs rootfs mounted with 'defaults' option.
This implies that atime logging is on - i.e. on every read from
filesystem kernel writes atime stamp to files' metadata.
Here in embedded world, where rootfs is usually stored on some
kind of flash (internal NAND/NOR, or external SD/MMC/CF card)
it is a real problem, because higher number of writes causes
flash wearing, higher system load and higher chance of filesystem
corruption.

Fix it by adding noatime to rootfs mount options in fstab.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 packages/base-files/base-files/akita/fstab         |    2 +-
 packages/base-files/base-files/c7x0/fstab          |    2 +-
 packages/base-files/base-files/efika/fstab         |    2 +-
 packages/base-files/base-files/ep93xx/fstab        |    2 +-
 packages/base-files/base-files/fstab               |    2 +-
 .../base-files/base-files/gumstix-connex/fstab     |    2 +-
 .../base-files/base-files/gumstix-verdex/fstab     |    2 +-
 packages/base-files/base-files/h2200/fstab         |    2 +-
 packages/base-files/base-files/h3600/fstab         |    2 +-
 packages/base-files/base-files/h3900/fstab         |    2 +-
 packages/base-files/base-files/h5000/fstab         |    2 +-
 packages/base-files/base-files/h6300/fstab         |    2 +-
 packages/base-files/base-files/htcuniversal/fstab  |    2 +-
 packages/base-files/base-files/hx4700/fstab        |    2 +-
 packages/base-files/base-files/mtx-1/fstab         |    2 +-
 packages/base-files/base-files/mtx-2/fstab         |    2 +-
 packages/base-files/base-files/mx31moboard/fstab   |    2 +-
 packages/base-files/base-files/netbook-pro/fstab   |    2 +-
 packages/base-files/base-files/om-3d7k/fstab       |    2 +-
 packages/base-files/base-files/omap5912osk/fstab   |    2 +-
 packages/base-files/base-files/openprotium/fstab   |    2 +-
 packages/base-files/base-files/poodle/fstab        |    2 +-
 packages/base-files/base-files/simpad/fstab        |    2 +-
 packages/base-files/base-files/slugos/fstab        |    2 +-
 packages/base-files/base-files/spitz/fstab         |    2 +-
 packages/base-files/base-files/tosa/fstab          |    2 +-
 packages/base-files/base-files/wrt54/fstab         |    2 +-
 packages/base-files/base-files/xxs1500/fstab       |    2 +-
 packages/base-files/base-files_3.0.14.bb           |    2 +-
 29 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/packages/base-files/base-files/akita/fstab b/packages/base-files/base-files/akita/fstab
index 3b488cf..9b8e209 100644
--- a/packages/base-files/base-files/akita/fstab
+++ b/packages/base-files/base-files/akita/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,noatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/packages/base-files/base-files/c7x0/fstab b/packages/base-files/base-files/c7x0/fstab
index ea38eab..8d6332f 100644
--- a/packages/base-files/base-files/c7x0/fstab
+++ b/packages/base-files/base-files/c7x0/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,noatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/packages/base-files/base-files/efika/fstab b/packages/base-files/base-files/efika/fstab
index c7bf023..17fdb20 100644
--- a/packages/base-files/base-files/efika/fstab
+++ b/packages/base-files/base-files/efika/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,noatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 usbfs                /proc/bus/usb        usbfs      auto                0 0
diff --git a/packages/base-files/base-files/ep93xx/fstab b/packages/base-files/base-files/ep93xx/fstab
index c7bf023..17fdb20 100644
--- a/packages/base-files/base-files/ep93xx/fstab
+++ b/packages/base-files/base-files/ep93xx/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,noatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 usbfs                /proc/bus/usb        usbfs      auto                0 0
diff --git a/packages/base-files/base-files/fstab b/packages/base-files/base-files/fstab
index 628a9e9..a4c8610 100644
--- a/packages/base-files/base-files/fstab
+++ b/packages/base-files/base-files/fstab
@@ -1,6 +1,6 @@
 # stock fstab - you probably want to override this with a machine specific one
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime      1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/packages/base-files/base-files/gumstix-connex/fstab b/packages/base-files/base-files/gumstix-connex/fstab
index 418f997..9067bae 100644
--- a/packages/base-files/base-files/gumstix-connex/fstab
+++ b/packages/base-files/base-files/gumstix-connex/fstab
@@ -1,6 +1,6 @@
 # fstab for gumstix-connex
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 sysfs                /sys                 sysfs      defaults              0  0
 tmpfs                /dev                 tmpfs      defaults              0  0
diff --git a/packages/base-files/base-files/gumstix-verdex/fstab b/packages/base-files/base-files/gumstix-verdex/fstab
index 9b5f00c..207b84e 100644
--- a/packages/base-files/base-files/gumstix-verdex/fstab
+++ b/packages/base-files/base-files/gumstix-verdex/fstab
@@ -1,6 +1,6 @@
 # fstab for gumstix-verdex
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 sysfs                /sys                 sysfs      defaults              0  0
 tmpfs                /dev                 tmpfs      defaults              0  0
diff --git a/packages/base-files/base-files/h2200/fstab b/packages/base-files/base-files/h2200/fstab
index 5063f84..9b70f9d 100644
--- a/packages/base-files/base-files/h2200/fstab
+++ b/packages/base-files/base-files/h2200/fstab
@@ -1,4 +1,4 @@
-rootfs		/		auto	defaults	1  1		
+rootfs		/		auto	defaults,noatime	1  1		
 proc            /proc		proc    defaults        0  0
 sys             /sys		sysfs	defaults        0  0
 tmpfs		/var/volatile	tmpfs	mode=0755	0  0
diff --git a/packages/base-files/base-files/h3600/fstab b/packages/base-files/base-files/h3600/fstab
index 9ec7df1..e0b5443 100644
--- a/packages/base-files/base-files/h3600/fstab
+++ b/packages/base-files/base-files/h3600/fstab
@@ -1,4 +1,4 @@
-rootfs		/ 		auto	defaults	1  1 
+rootfs		/ 		auto	defaults,noatime	1  1 
 proc            /proc   proc    defaults        0  0
 /dev/hda1	/media/cf	auto	defaults,noauto,noatime,user,exec,suid	0  0
 /dev/mmc/part1	/media/card	auto	defaults,noauto,noatime,user,exec,suid	0  0
diff --git a/packages/base-files/base-files/h3900/fstab b/packages/base-files/base-files/h3900/fstab
index 9ec7df1..e0b5443 100644
--- a/packages/base-files/base-files/h3900/fstab
+++ b/packages/base-files/base-files/h3900/fstab
@@ -1,4 +1,4 @@
-rootfs		/ 		auto	defaults	1  1 
+rootfs		/ 		auto	defaults,noatime	1  1 
 proc            /proc   proc    defaults        0  0
 /dev/hda1	/media/cf	auto	defaults,noauto,noatime,user,exec,suid	0  0
 /dev/mmc/part1	/media/card	auto	defaults,noauto,noatime,user,exec,suid	0  0
diff --git a/packages/base-files/base-files/h5000/fstab b/packages/base-files/base-files/h5000/fstab
index ad05f3b..846b1ba 100644
--- a/packages/base-files/base-files/h5000/fstab
+++ b/packages/base-files/base-files/h5000/fstab
@@ -1,4 +1,4 @@
-rootfs		/ 	auto	defaults	1  1 
+rootfs		/ 	auto	defaults,noatime	1  1 
 #breaks h51xx
 /dev/mtdblock2 /home   jffs2   defaults        1  1
 proc            /proc   proc    defaults        0  0
diff --git a/packages/base-files/base-files/h6300/fstab b/packages/base-files/base-files/h6300/fstab
index f9b94d1..176df03 100644
--- a/packages/base-files/base-files/h6300/fstab
+++ b/packages/base-files/base-files/h6300/fstab
@@ -1,4 +1,4 @@
-rootfs       	/		auto	defaults	1  1
+rootfs       	/		auto	defaults,noatime	1  1
 proc            /proc		proc    defaults        0  0
 sys             /sys		sysfs	defaults        0  0
 tmpfs		/var/volatile	tmpfs	mode=0755	0  0
diff --git a/packages/base-files/base-files/htcuniversal/fstab b/packages/base-files/base-files/htcuniversal/fstab
index b4aa259..c551a19 100644
--- a/packages/base-files/base-files/htcuniversal/fstab
+++ b/packages/base-files/base-files/htcuniversal/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs               /proc/bus/usb         usbfs      defaults              0  0
diff --git a/packages/base-files/base-files/hx4700/fstab b/packages/base-files/base-files/hx4700/fstab
index 49b5c96..c3364a1 100644
--- a/packages/base-files/base-files/hx4700/fstab
+++ b/packages/base-files/base-files/hx4700/fstab
@@ -1,4 +1,4 @@
-rootfs	 	/		auto	defaults		1  1		
+rootfs	 	/		auto	defaults,noatime		1  1		
 /dev/mtdblock3 	/home   jffs2   defaults        1  1
 
 proc            /proc		proc    defaults        0  0
diff --git a/packages/base-files/base-files/mtx-1/fstab b/packages/base-files/base-files/mtx-1/fstab
index 5c0e2b3..d2ccb5c 100644
--- a/packages/base-files/base-files/mtx-1/fstab
+++ b/packages/base-files/base-files/mtx-1/fstab
@@ -1,7 +1,7 @@
 # /etc/fstab: static file system information. mtx-1
 #
 # <file system> <mount pt>     <type>     <options>         <dump> <pass>
-rootfs          /              auto       defaults          1      1
+rootfs          /              auto       defaults,noatime          1      1
 tmpfs           /var/volatile  tmpfs      mode=0755,size=10m 0      0
 proc            /proc          proc       defaults          0      0
 devpts          /dev/pts       devpts     mode=0620,gid=5   0      0
diff --git a/packages/base-files/base-files/mtx-2/fstab b/packages/base-files/base-files/mtx-2/fstab
index 8b9ad0f..9fac143 100644
--- a/packages/base-files/base-files/mtx-2/fstab
+++ b/packages/base-files/base-files/mtx-2/fstab
@@ -1,7 +1,7 @@
 # /etc/fstab: static file system information. mtx-2
 #
 # <file system> <mount pt>     <type>     <options>         <dump> <pass>
-rootfs          /              auto       defaults          1      1
+rootfs          /              auto       defaults,noatime          1      1
 tmpfs           /var/volatile  tmpfs      mode=0755,size=10m 0      0
 proc            /proc          proc       defaults          0      0
 devpts          /dev/pts       devpts     mode=0620,gid=5   0      0
diff --git a/packages/base-files/base-files/mx31moboard/fstab b/packages/base-files/base-files/mx31moboard/fstab
index 1ec0fd5..0e0d7c2 100644
--- a/packages/base-files/base-files/mx31moboard/fstab
+++ b/packages/base-files/base-files/mx31moboard/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/packages/base-files/base-files/netbook-pro/fstab b/packages/base-files/base-files/netbook-pro/fstab
index c7bf023..17fdb20 100644
--- a/packages/base-files/base-files/netbook-pro/fstab
+++ b/packages/base-files/base-files/netbook-pro/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,noatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 usbfs                /proc/bus/usb        usbfs      auto                0 0
diff --git a/packages/base-files/base-files/om-3d7k/fstab b/packages/base-files/base-files/om-3d7k/fstab
index 48aefde..c6ab4d5 100644
--- a/packages/base-files/base-files/om-3d7k/fstab
+++ b/packages/base-files/base-files/om-3d7k/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/packages/base-files/base-files/omap5912osk/fstab b/packages/base-files/base-files/omap5912osk/fstab
index 5e881f7..5a51e61 100644
--- a/packages/base-files/base-files/omap5912osk/fstab
+++ b/packages/base-files/base-files/omap5912osk/fstab
@@ -1,6 +1,6 @@
 # fstab for omap5912osk
 
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 sysfs                /sys                 sysfs      defaults              0  0
 tmpfs                /dev                 tmpfs      defaults              0  0
diff --git a/packages/base-files/base-files/openprotium/fstab b/packages/base-files/base-files/openprotium/fstab
index 96b0e2a..9003736 100644
--- a/packages/base-files/base-files/openprotium/fstab
+++ b/packages/base-files/base-files/openprotium/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1  1
+rootfs               /                    auto       defaults,noatime              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbfs                /proc/bus/usb        usbfs      defaults              0  0
diff --git a/packages/base-files/base-files/poodle/fstab b/packages/base-files/base-files/poodle/fstab
index 733b13f..f5b6c26 100644
--- a/packages/base-files/base-files/poodle/fstab
+++ b/packages/base-files/base-files/poodle/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,noatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/packages/base-files/base-files/simpad/fstab b/packages/base-files/base-files/simpad/fstab
index 3e57ae3..38fd892 100644
--- a/packages/base-files/base-files/simpad/fstab
+++ b/packages/base-files/base-files/simpad/fstab
@@ -1,4 +1,4 @@
-rootfs               /                    auto       defaults              1 1
+rootfs               /                    auto       defaults,noatime              1 1
 proc                 /proc                proc       defaults              0 0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0 0
 tmpfs                /dev/shm             tmpfs      mode=0777             0  0
diff --git a/packages/base-files/base-files/slugos/fstab b/packages/base-files/base-files/slugos/fstab
index e00f057..af99764 100644
--- a/packages/base-files/base-files/slugos/fstab
+++ b/packages/base-files/base-files/slugos/fstab
@@ -1,4 +1,4 @@
-rootfs		/		jffs2	defaults	1  1
+rootfs		/		jffs2	defaults,noatime	1  1
 sysfs		/sys		sysfs	defaults	0  0
 proc		/proc		proc	defaults	0  0
 tmpfs		/var/volatile	tmpfs	mode=0755	0  0
diff --git a/packages/base-files/base-files/spitz/fstab b/packages/base-files/base-files/spitz/fstab
index 324fb78..e71d5fe 100644
--- a/packages/base-files/base-files/spitz/fstab
+++ b/packages/base-files/base-files/spitz/fstab
@@ -1,7 +1,7 @@
 # don't mount /dev/mtdblock2 since Spitz uses pivot_root
 # or 2.6 directly boots from the hdd
 # /dev/mtdblock2     /            jffs2   rw,noatime              1  1
-rootfs             /            auto    defaults                1  1
+rootfs             /            auto    defaults,noatime                1  1
 proc               /proc        proc    defaults                0  0
 # we can use a normal var filesystem with a microdrive
 # tmpfs              /var/volatiles         tmpfs   defaults                0  0
diff --git a/packages/base-files/base-files/tosa/fstab b/packages/base-files/base-files/tosa/fstab
index f256c74..8063edd 100644
--- a/packages/base-files/base-files/tosa/fstab
+++ b/packages/base-files/base-files/tosa/fstab
@@ -1,4 +1,4 @@
-rootfs      /       auto    defaults        1  1
+rootfs      /       auto    defaults,noatime        1  1
 #/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
diff --git a/packages/base-files/base-files/wrt54/fstab b/packages/base-files/base-files/wrt54/fstab
index 0e64d30..d848d00 100644
--- a/packages/base-files/base-files/wrt54/fstab
+++ b/packages/base-files/base-files/wrt54/fstab
@@ -1,7 +1,7 @@
 # /etc/fstab: static file system information. wrt
 #
 # <file system> <mount pt>     <type>     <options>         <dump> <pass>
-rootfs          /              auto       defaults          1      1
+rootfs          /              auto       defaults,noatime          1      1
 tmpfs           /var/volatile  tmpfs      mode=0755,size=50% 0      0
 tmpfs                /dev/shm             tmpfs      mode=0777             0  0
 proc            /proc          proc       defaults          0      0
diff --git a/packages/base-files/base-files/xxs1500/fstab b/packages/base-files/base-files/xxs1500/fstab
index 655ea97..2bc6d47 100644
--- a/packages/base-files/base-files/xxs1500/fstab
+++ b/packages/base-files/base-files/xxs1500/fstab
@@ -1,7 +1,7 @@
 # /etc/fstab: static file system information.
 #
 # <file system> <mount pt>     <type>     <options>         <dump> <pass>
-rootfs          /              auto       defaults          1      1
+rootfs          /              auto       defaults,noatime          1      1
 tmpfs           /var/volatile  tmpfs      mode=0755,size=10m 0      0
 proc            /proc          proc       defaults          0      0
 devpts          /dev/pts       devpts     mode=0620,gid=5   0      0
diff --git a/packages/base-files/base-files_3.0.14.bb b/packages/base-files/base-files_3.0.14.bb
index 460fd63..0d012c7 100644
--- a/packages/base-files/base-files_3.0.14.bb
+++ b/packages/base-files/base-files_3.0.14.bb
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



