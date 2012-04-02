Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SEoxg-0003TJ-Lq
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 23:38:52 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650A4789FC; Mon, 2 Apr 2012 23:29:44 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2012 23:29:40 +0200
Message-Id: <1333402180-26673-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] udev: better mangling of oe-core local.rules
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
X-List-Received-Date: Mon, 02 Apr 2012 21:38:52 -0000

* do not keep a copy of local.rules
* bump PR
* (this patch will be superfluous if/when accepted by oe-core)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-core/udev/udev/local.rules  |   34 ----------------------------------
 recipes-core/udev/udev_164.bbappend |    6 +++++-
 2 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 recipes-core/udev/udev/local.rules

diff --git a/recipes-core/udev/udev/local.rules b/recipes-core/udev/udev/local.rules
deleted file mode 100644
index 49e8d28..0000000
--- a/recipes-core/udev/udev/local.rules
+++ /dev/null
@@ -1,34 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Media automounting
-SUBSYSTEM=="block", ACTION=="add"    RUN+="/etc/udev/scripts/mount.sh"
-SUBSYSTEM=="block", ACTION=="remove" RUN+="/etc/udev/scripts/mount.sh"
-
-# Handle network interface setup
-SUBSYSTEM=="net", ACTION=="add" RUN+="/etc/udev/scripts/network.sh"
-SUBSYSTEM=="net", ACTION=="remove" RUN+="/etc/udev/scripts/network.sh"
-
-# The first framebuffer is symlinked to /dev/fb                       
-KERNEL=="fb0", SYMLINK+="fb"
-
-# The first rtc device is symlinked to /dev/rtc
-KERNEL=="rtc0", SYMLINK+="rtc"
-
-# Try and modprobe for drivers for new hardware
-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
-
-# Create a symlink to any touchscreen input device
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
diff --git a/recipes-core/udev/udev_164.bbappend b/recipes-core/udev/udev_164.bbappend
index 446ea84..4d263b0 100644
--- a/recipes-core/udev/udev_164.bbappend
+++ b/recipes-core/udev/udev_164.bbappend
@@ -1,5 +1,9 @@
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
+# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
+do_configure_append () {
+        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/' ${WORKDIR}/local.rules
+}
-- 
1.7.3.4



