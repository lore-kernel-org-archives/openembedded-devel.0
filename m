Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1La7mo-0005TS-0T
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 13:13:50 +0100
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 0EE2218935A; Thu, 19 Feb 2009 13:12:03 +0100 (CET)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 13:12:03 +0100
Message-Id: <1235045523-6405-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] task-boot: rename DISTRO_ vars to IMAGE_ vars and move to image.bbclass
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
X-List-Received-Date: Thu, 19 Feb 2009 12:13:50 -0000

From: Koen Kooi <koen@openembedded.org>

---
 classes/image.bbclass         |   22 ++++++++++++++++++++++
 conf/distro/kaeilos.conf      |    2 +-
 conf/distro/openmoko.conf     |    2 +-
 conf/distro/openprotium.conf  |    6 +++---
 conf/machine/mx31moboard.conf |    2 +-
 packages/tasks/task-boot.bb   |   22 +---------------------
 6 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index c493c73..2ed0ee1 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -16,6 +16,28 @@ EXCLUDE_FROM_WORLD = "1"
 
 USE_DEVFS ?= "0"
 
+#
+# udev, devfsd, busybox-mdev (from busybox) or none
+#
+IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  "udev","",d)} "
+#
+# sysvinit, upstart
+#
+IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
+IMAGE_INITSCRIPTS ?= "initscripts"
+#
+# tinylogin, getty
+#
+IMAGE_LOGIN_MANAGER ?= "tinylogin" 
+
+IMAGE_VARS = "${IMAGE_INITSCRIPTS} \
+${IMAGE_DEV_MANAGER} \
+${IMAGE_INIT_MANAGER} \
+${IMAGE_LOGIN_MANAGER} "
+
+RDEPENDS += "${IMAGE_VARS}"
+PACKAGE_INSTALL += "${IMAGE_VARS}"
+
 PID = "${@os.getpid()}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index fac86c8..a65bbff 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -21,7 +21,7 @@ require conf/distro/include/preferred-opie-versions-1.2.4.inc
 PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
 PREFERRED_VERSION_busybox        = "1.13.2"
 
-DISTRO_DEV_MANAGER = "busybox-mdev"
+IMAGE_DEV_MANAGER = "busybox-mdev"
 
 #Images built can have to modes:
 # 'debug': empty rootpassword, strace included
diff --git a/conf/distro/openmoko.conf b/conf/distro/openmoko.conf
index c038096..cb1513d 100644
--- a/conf/distro/openmoko.conf
+++ b/conf/distro/openmoko.conf
@@ -30,7 +30,7 @@ DISTRO_FEED_URI ?= "http://downloads.openmoko.org/repository/testing"
 AB_DEPLOY_EXTRA ?= ""
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE_ARCH}/${AB_DEPLOY_EXTRA}"
 
-DISTRO_INITSCRIPTS = "initscripts-openmoko"
+IMAGE_INITSCRIPTS = "initscripts-openmoko"
 
 # We try to minimize the distro features in the default image.
 DISTRO_FEATURES = "wifi ppp alsa ext2 vfat usbhost"
diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
index b794d4a..633e3bc 100644
--- a/conf/distro/openprotium.conf
+++ b/conf/distro/openprotium.conf
@@ -8,10 +8,10 @@ TARGET_OS = "linux"
 #
 # Basic configuration
 #
-DISTRO_DEV_MANAGER = "udev"
+IMAGE_DEV_MANAGER = "udev"
 DISTRO_SSH_DAEMON = "dropbear"
-DISTRO_INIT_MANAGER = "sysvinit"
-DISTRO_LOGIN_MANAGER = "tinylogin"
+IMAGE_INIT_MANAGER = "sysvinit"
+IMAGE_LOGIN_MANAGER = "tinylogin"
 MACHINE_TASK_PROVIDER = "task-openprotium"
 
 #
diff --git a/conf/machine/mx31moboard.conf b/conf/machine/mx31moboard.conf
index a00a9b1..a1a5212 100644
--- a/conf/machine/mx31moboard.conf
+++ b/conf/machine/mx31moboard.conf
@@ -20,7 +20,7 @@ module_conf_g_ether = "alias usb0 g_ether"
 module_conf_rt2570-k2wrlz = "alias rausb0 rt2570"
 
 # tinylogin is broken for our speeds
-DISTRO_LOGIN_MANAGER = "busybox"
+IMAGE_LOGIN_MANAGER = "busybox"
 
 # used by sysvinit_2
 SERIAL_CONSOLE = "-Lh 921600 ttymxc0 vt100"
diff --git a/packages/tasks/task-boot.bb b/packages/tasks/task-boot.bb
index 1a74f15..1a1b9f2 100644
--- a/packages/tasks/task-boot.bb
+++ b/packages/tasks/task-boot.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Basic task to get a device booting"
-PR = "r48"
+PR = "r49"
 
 inherit task
 
@@ -8,22 +8,6 @@ inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 #
-# udev, devfsd, mdev (from busybox) or none
-#
-DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  "udev","",d)} "
-
-#
-# sysvinit, upstart
-#
-DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
-DISTRO_INITSCRIPTS ?= "initscripts"
-
-#
-# tinylogin, getty
-#
-DISTRO_LOGIN_MANAGER ?= "tinylogin"
-
-#
 # those ones can be set in machine config to supply packages needed to get machine booting
 #
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
@@ -40,14 +24,10 @@ RDEPENDS_task-boot = "\
     base-files \
     base-passwd \
     busybox \
-    ${DISTRO_INITSCRIPTS} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
     update-alternatives \
-    ${DISTRO_DEV_MANAGER} \
-    ${DISTRO_INIT_MANAGER} \
-    ${DISTRO_LOGIN_MANAGER} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
     "
 
-- 
1.6.1



