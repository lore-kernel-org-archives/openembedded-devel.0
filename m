Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1vU-0007QV-Vn
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:13 +0200
Received: by wgbdr1 with SMTP id dr1so4765359wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LPuXNGvTxfc6j1YmG3RthQs5z5L3Af87Z4BtMjT2Bfk=;
	b=sPFD8Qv2kXcs01pxlmo4Pvk/beMvW+MSn9w010Rwa6s8EJCcCt4lXRgEizD/JYnybX
	BWAWNawj+rWW1Pk0MidhjD7zdzn5UipTx9Clz1i0aP/O5j4yheri+582X/OtJYSDELhg
	N2MJ++MdOkfwBwV+e0uYU0dfpMNZ9s71cZ3ESOB68nuQReLpcCwQDflxtkPEWBWRFypb
	P3vfDZ21lDHh7dtKjGIuw+wz1CkdpjWHVwI6PIzoWU4gW9+6Gcf4bOXIkwpNQYe/B7Kz
	6zyFWot8hTQJpoieBegjZuEcBRhdndbDE8vFWNPGC/qyLBXQC+en1RH3StkrksZ7t5ah
	duuQ==
Received: by 10.216.133.130 with SMTP id q2mr6936013wei.131.1343699976628;
	Mon, 30 Jul 2012 18:59:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm28801567wib.2.2012.07.30.18.59.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:36 +0200
Message-Id: <5f56dbb05992e4d7d35b604829b171326b1029b7.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/24] udev-extra-rules: drop in favor of udev-extraconf from oe-core
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
X-List-Received-Date: Tue, 31 Jul 2012 02:11:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |   36 -----------
 .../udev/udev-extra-rules/automount.rules          |   19 ------
 .../udev/udev-extra-rules/autonet.rules            |   19 ------
 .../recipes-core/udev/udev-extra-rules/local.rules |   21 -------
 .../udev/udev-extra-rules/mount.blacklist          |    3 -
 .../recipes-core/udev/udev-extra-rules/mount.sh    |   64 --------------------
 .../recipes-core/udev/udev-extra-rules/network.sh  |   58 ------------------
 7 files changed, 0 insertions(+), 220 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules.bb
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/automount.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/autonet.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/local.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/mount.blacklist
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/network.sh

diff --git a/meta-oe/recipes-core/udev/udev-extra-rules.bb b/meta-oe/recipes-core/udev/udev-extra-rules.bb
deleted file mode 100644
index 7f9ca85..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "Extra udev rules"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-inherit allarch
-
-PR = "r4"
-
-SRC_URI = " \
-       file://automount.rules \
-       file://mount.sh \
-       file://mount.blacklist \
-       file://autonet.rules \
-       file://network.sh \
-       file://local.rules \
-"
-
-
-do_install() {
-    install -d ${D}${sysconfdir}/udev/rules.d
-
-    install -m 0644 ${WORKDIR}/automount.rules     ${D}${sysconfdir}/udev/rules.d/automount.rules
-    install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
-    install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
-
-    install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
-
-    install -d ${D}${sysconfdir}/udev/scripts/
-
-    install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
-    install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
-}
-
-FILES_${PN} = "${sysconfdir}/udev"
-RDEPENDS_${PN} = "udev"
-CONFFILES_${PN} = "${sysconfdir}/udev/mount.blacklist"
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/automount.rules b/meta-oe/recipes-core/udev/udev-extra-rules/automount.rules
deleted file mode 100644
index 7e844c3..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules/automount.rules
+++ /dev/null
@@ -1,19 +0,0 @@
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
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/autonet.rules b/meta-oe/recipes-core/udev/udev-extra-rules/autonet.rules
deleted file mode 100644
index 19676aa..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules/autonet.rules
+++ /dev/null
@@ -1,19 +0,0 @@
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
-# Handle network interface setup
-SUBSYSTEM=="net", ACTION=="add" RUN+="/etc/udev/scripts/network.sh"
-SUBSYSTEM=="net", ACTION=="remove" RUN+="/etc/udev/scripts/network.sh"
-
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/local.rules b/meta-oe/recipes-core/udev/udev-extra-rules/local.rules
deleted file mode 100644
index 4eaa8ca..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules/local.rules
+++ /dev/null
@@ -1,21 +0,0 @@
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
-# The first rtc device is symlinked to /dev/rtc
-KERNEL=="rtc0", SYMLINK+="rtc"
-
-#The first framebuffer is symlinked to /dev/fb
-KERNEL=="fb0",  SYMLINK+="fb"
-
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/mount.blacklist b/meta-oe/recipes-core/udev/udev-extra-rules/mount.blacklist
deleted file mode 100644
index d3ebb17..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules/mount.blacklist
+++ /dev/null
@@ -1,3 +0,0 @@
-/dev/loop
-/dev/ram
-/dev/mtdblock
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh b/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
deleted file mode 100644
index 67c2b4b..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/bin/sh
-#
-# Called from udev
-# Attemp to mount any added block devices
-# and remove any removed devices
-#
-
-MOUNT="/bin/mount"
-PMOUNT="/usr/bin/pmount"
-UMOUNT="/bin/umount"
-name="`basename "$DEVNAME"`"
-
-for line in `grep -v ^# /etc/udev/mount.blacklist`
-do
-	if ( echo "$DEVNAME" | grep -q "$line" )
-	then
-		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
-		exit 0
-	fi
-done
-
-automount() {
-	! test -d "/media/$name" && mkdir -p "/media/$name"
-
-	if ! $MOUNT -t auto -o async,relatime $DEVNAME "/media/$name"
-	then
-		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
-		rm_dir "/media/$name"
-	else
-		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
-		touch "/tmp/.automount-$name"
-	fi
-}
-
-rm_dir() {
-	# We do not want to rm -r populated directories
-	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
-	then
-		! test -z "$1" && rm -r "$1"
-	else
-		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
-	fi
-}
-
-if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
-	if [ -x "$PMOUNT" ]; then
-		$PMOUNT $DEVNAME 2> /dev/null
-	elif [ -x $MOUNT ]; then
-			$MOUNT $DEVNAME 2> /dev/null
-	fi
-
-	# Avoid remounting devices (e.g: rootfs)
-	awk '{print $1}' /proc/mounts | grep -q "^$DEVNAME$" || automount
-fi
-
-if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
-	for mnt in `grep "$DEVNAME" /proc/mounts | cut -f 2 -d " " `
-	do
-		$UMOUNT -l $mnt
-	done
-
-	# Remove empty directories from auto-mounter
-	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
-fi
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/network.sh b/meta-oe/recipes-core/udev/udev-extra-rules/network.sh
deleted file mode 100644
index 182c26d..0000000
--- a/meta-oe/recipes-core/udev/udev-extra-rules/network.sh
+++ /dev/null
@@ -1,58 +0,0 @@
-#!/bin/sh
-
-# udevd does clearenv(). Export shell PATH to children.
-export PATH
-
-# Do not run when pcmcia-cs is installed
-test -x /sbin/cardctl && exit 0
-
-# We get two "add" events for hostap cards due to wifi0
-echo "$INTERFACE" | grep -q wifi && exit 0
-
-
-# Check if /etc/init.d/network has been run yet to see if we are 
-# called by starting /etc/rcS.d/S03udev and not by hotplugging a device
-#
-# At this stage, network interfaces should not be brought up
-# automatically because:
-# a)	/etc/init.d/network has not been run yet (security issue)
-# b) 	/var has not been populated yet so /etc/resolv,conf points to 
-#	oblivion, making the network unusable
-#
-
-spoofp="`grep ^spoofprotect /etc/network/options`"
-if test -z "$spoofp"
-then
-	# This is the default from /etc/init.d/network
-	spoofp_val=yes
-else
-	spoofp_val=${spoofp#spoofprotect=}
-fi
-
-test "$spoofp_val" = yes && spoofp_val=1 || spoofp_val=0
-
-# I think it is safe to assume that "lo" will always be there ;)
-if test "`cat /proc/sys/net/ipv4/conf/lo/rp_filter`" != "$spoofp_val" -a -n "$spoofp_val"
-then
-	echo "$INTERFACE" >> /dev/udev_network_queue	
-	exit 0
-fi
-
-#
-# Code taken from pcmcia-cs:/etc/pcmcia/network
-#
-
-# if this interface has an entry in /etc/network/interfaces, let ifupdown
-# handle it
-if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
-  case $ACTION in
-    add)
-    	ifconfig | grep -q "^$INTERFACE" || ifup $INTERFACE
-    	;;
-    remove)
-    	ifdown $INTERFACE
-    	;;
-  esac
-  
-  exit 0
-fi
-- 
1.7.8.6



