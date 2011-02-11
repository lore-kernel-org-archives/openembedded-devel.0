Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PnxWx-00075e-JE
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 19:15:43 +0100
Received: by bwz10 with SMTP id 10so3284216bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 10:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=bLmv8O6c5l3F9n5yIHQQH1eRV0m39aT0yk2goMbaoaQ=;
	b=h7k+/Zgpzt09ngycMP/TY6dhcaUF0G2qvLzpGnZqGBnD/7ngZF/3SB2FBowmHhdTyw
	P1MO+Af19N+YXTqpLv4G2lXLVnzePtcispx3tGvCw9xdWf5xcO2z6r2fSEmWhGDAynlh
	zV9fF9VThOrn5b+W2GE1AczShQ6g//UKNgBmg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Z/uy/AfUBlRIrQ1zmgYfNcuBgFtkWcPiPxnHoUsyjkJuYLxkK8WgLmD3TwUIu9NkhL
	a2JA91kjlxZKXFVhJe8vf+HWvMdgT4DjvscewPT+BVw+4G4PS7qvpXFNpGh2su/1VFQy
	liZUeape7z1rBVHQCNIKRj95eFqSxdCyBSfdg=
Received: by 10.204.123.7 with SMTP id n7mr789872bkr.33.1297448077376;
	Fri, 11 Feb 2011 10:14:37 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id rc9sm653716bkb.14.2011.02.11.10.14.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 10:14:36 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kristoffer.ericson@gmail.com
Date: Fri, 11 Feb 2011 19:14:26 +0100
Message-Id: <1297448066-5345-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] initscripts: removed jornada7xx specific scripts.
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
X-List-Received-Date: Fri, 11 Feb 2011 18:15:43 -0000

Stock ones work better (remounting / rw, makedevs calling).

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 .../initscripts-1.0/jornada7xx/checkroot           |  211 --------------------
 .../initscripts/initscripts-1.0/jornada7xx/devices |   70 -------
 2 files changed, 0 insertions(+), 281 deletions(-)
 delete mode 100755 recipes/initscripts/initscripts-1.0/jornada7xx/checkroot
 delete mode 100755 recipes/initscripts/initscripts-1.0/jornada7xx/devices

diff --git a/recipes/initscripts/initscripts-1.0/jornada7xx/checkroot b/recipes/initscripts/initscripts-1.0/jornada7xx/checkroot
deleted file mode 100755
index 9e2d3cf..0000000
--- a/recipes/initscripts/initscripts-1.0/jornada7xx/checkroot
+++ /dev/null
@@ -1,211 +0,0 @@
-#
-# checkroot.sh	Check to root filesystem.
-#
-# Version:	@(#)checkroot.sh  2.84  25-Jan-2002  miquels@cistron.nl
-#
-
-. /etc/default/rcS
-
-#
-# Set SULOGIN in /etc/default/rcS to yes if you want a sulogin to be spawned
-# from this script *before anything else* with a timeout, like SCO does.
-#
-test "$SULOGIN" = yes && sulogin -t 30 $CONSOLE
-
-#
-# Ensure that bdflush (update) is running before any major I/O is
-# performed (the following fsck is a good example of such activity :).
-#
-test -x /sbin/update && update
-
-#
-# Read /etc/fstab.
-#
-exec 9>&0 </etc/fstab
-rootmode=rw
-rootopts=rw
-test "$ENABLE_ROOTFS_FSCK" = yes && rootcheck="yes" || rootcheck="no"
-swap_on_md=no
-devfs=
-while read fs mnt type opts dump pass junk
-do
-	case "$fs" in
-		""|\#*)
-			continue;
-			;;
-		/dev/md*)
-			# Swap on md device.
-			test "$type" = swap && swap_on_md=yes
-			;;
-		/dev/*)
-			;;
-		*)
-			# Might be a swapfile.
-			test "$type" = swap && swap_on_md=yes
-			;;
-	esac
-	
-	test "$type" = devfs && devfs="$fs"
-
-	# Currently we do not care about the other entries
-	if test "$mnt" = "/"
-	then
-		#echo "[$fs] [$mnt] [$type] [$opts] [$dump] [$pass] [$junk]"
-
-		rootopts="$opts"		
-		roottype="$type"
-
-		#The "spinner" is broken on busybox sh	
-		TERM=dumb
-			
-		test "$pass" = 0 -o "$pass" = "" && rootcheck=no
-		
-		# Enable fsck for ext2 and ext3 rootfs, disable for everything else				
-		case "$type" in
-		ext3)	rootcheck=yes;;
-		*)		rootcheck=no;;
-		esac
-		
-		if test "$rootcheck" = yes
-		then
-			if ! test -x "/sbin/fsck.${roottype}"
-			then
-				echo -e "\n * * * WARNING: /sbin/fsck.${roottype} is missing! * * *\n"
-				rootcheck=no
-			fi
-		fi
-		
-		case "$opts" in
-			ro|ro,*|*,ro|*,ro,*)
-				rootmode=ro
-				;;
-		esac
-	fi
-done
-exec 0>&9 9>&-
-
-#
-# Activate the swap device(s) in /etc/fstab. This needs to be done
-# before fsck, since fsck can be quite memory-hungry.
-#
-doswap=no
-test -d /proc/1 || mount -n /proc
-case "`uname -r`" in
-	2.[0123].*)
-		if test $swap_on_md = yes && grep -qs resync /proc/mdstat
-		then
-			test "$VERBOSE" != no && echo "Not activating swap - RAID array resyncing"
-		else
-			doswap=yes
-		fi
-		;;
-	*)
-		doswap=yes
-		;;
-esac
-if test $doswap = yes
-then
-	test "$VERBOSE" != no && echo "Activating swap"
-	swapon -a 2> /dev/null
-fi
-
-#
-# Check the root filesystem.
-#
-if test -f /fastboot || test $rootcheck = no
-then
-  test $rootcheck = yes && echo "Fast boot, no filesystem check"
-else
-  #
-  # Ensure that root is quiescent and read-only before fsck'ing.
-  #
-  mount -n -o remount,ro /
-  if test $? = 0
-  then
-    if test -f /forcefsck
-    then
-	force="-f"
-    else
-	force=""
-    fi
-    if test "$FSCKFIX" = yes
-    then
-	fix="-y"
-    else
-	fix="-a"
-    fi
-    spinner="-C"
-    case "$TERM" in
-        dumb|network|unknown|"") spinner="" ;;
-    esac
-    test `uname -m` = s390 && spinner="" # This should go away
-    test "$VERBOSE" != no && echo "Checking root filesystem..."
-    fsck $spinner $force $fix /
-    #
-    # If there was a failure, drop into single-user mode.
-    #
-    # NOTE: "failure" is defined as exiting with a return code of
-    # 2 or larger.  A return code of 1 indicates that filesystem
-    # errors were corrected but that the boot may proceed.
-    #
-    if test "$?" -gt 1
-    then
-    
-      # Since this script is run very early in the boot-process, it should be safe to assume that the
-      # output is printed to VT1. However, some distributions use a bootsplash to hide the "ugly" boot
-      # messages and having the bootsplash "hang" due to a waiting fsck prompt is less than ideal
-      chvt 1
-    
-      # Surprise! Re-directing from a HERE document (as in
-      # "cat << EOF") won't work, because the root is read-only.
-      echo
-      echo "fsck failed.  Please repair manually and reboot.  Please note"
-      echo "that the root filesystem is currently mounted read-only.  To"
-      echo "remount it read-write:"
-      echo
-      echo "   # mount -n -o remount,rw /"
-      echo
-      echo "CONTROL-D will exit from this shell and REBOOT the system."
-      echo
-      # Start a single user shell on the console
-      /sbin/sulogin $CONSOLE
-      reboot -f
-    fi
-  else
-    echo "*** ERROR!  Cannot fsck root fs because it is not mounted read-only!"
-    echo
-  fi
-fi
-
-#
-#	If the root filesystem was not marked as read-only in /etc/fstab,
-#	remount the rootfs rw but do not try to change mtab because it
-#	is on a ro fs until the remount succeeded. Then clean up old mtabs
-#	and finally write the new mtab.
-#	This part is only needed if the rootfs was mounted ro.
-#
-if [ $(grep rootfs /proc/mounts | awk '{print $4}') = rw ]; then
-	exit 0
-fi
-
-#       Add a second check, which seems to be needed for some kernel versions
-if [ $(grep "/dev/root" /proc/mounts | awk '{print $4}') = rw ]; then
-        exit 0
-fi
-
-
-echo "Remounting root file system..."
-mount -n -o remount,$rootmode /
-if test "$rootmode" = rw
-then
-	if test ! -L /etc/mtab
-	then
-		rm -f /etc/mtab~ /etc/nologin
-		: > /etc/mtab
-	fi
-	mount -f -o remount /
-	mount -f /proc
-	test "$devfs" && grep -q '^devfs /dev' /proc/mounts && mount -f "$devfs"
-fi
-
-: exit 0
diff --git a/recipes/initscripts/initscripts-1.0/jornada7xx/devices b/recipes/initscripts/initscripts-1.0/jornada7xx/devices
deleted file mode 100755
index 422336a..0000000
--- a/recipes/initscripts/initscripts-1.0/jornada7xx/devices
+++ /dev/null
@@ -1,70 +0,0 @@
-#!/bin/sh
-#
-# Devfs handling script.  Since we arent running devfsd due to various reasons
-# which I will not lay out here, we need to create some links for compatibility.
-
-. /etc/default/rcS
-
-# exit without doing anything if udev is active
-if test -e /dev/.udevdb; then
-	exit 0
-fi
-
-if test -e /dev/.devfsd
-then
-	if test "$VERBOSE" != "no"; then echo -n "Setting up device links for devfs: "; fi
-	ln -s /dev/touchscreen/0 /dev/ts
-	ln -s /dev/touchscreen/0raw /dev/tsraw
-	ln -s /dev/vc/0 /dev/tty0
-	ln -s /dev/vc/1 /dev/tty1
-	ln -s /dev/vc/2 /dev/tty2
-	ln -s /dev/vc/3 /dev/tty3
-	ln -s /dev/vc/4 /dev/tty4
-	ln -s /dev/vc/5 /dev/tty5
-	ln -s /dev/fb/0 /dev/fb0
-#	ln -s /dev/tts/0 /dev/ttySA0
-#	ln -s /dev/tts/1 /dev/ttySA1
-#	ln -s /dev/tts/2 /dev/ttySA2
-
-	ln -s /dev/sound/dsp /dev/dsp
-	ln -s /dev/sound/mixer /dev/mixer
-
-	ln -s /dev/v4l/video0 /dev/video0
-	ln -s /dev/v4l/video0 /dev/video
-	ln -s /dev/misc/rtc /dev/rtc
-
-	## need this so that ppp will autoload the ppp modules
-	mknod /dev/ppp c 108 0
-        
-	if test "$VERBOSE" != "no"; then echo "done"; fi
-else
-	if test "$VERBOSE" != "no"; then echo -n "Mounting /dev ramdisk: "; fi
-	mount -t ramfs ramfs /dev || mount -t tmpfs ramfs /dev
-	if test $? -ne 0; then
-		if test "$VERBOSE" != "no"; then echo "failed"; fi
-	else
-		if test "$VERBOSE" != "no"; then echo "done"; fi
-	fi
-	if test "$VERBOSE" != "no"; then echo -n "Populating /dev: "; fi
-	cd /
-	mkdir -p dev/input
-        mknod /dev/input/ts0 c 13 65
-	mknod /dev/ttySC1 c 9 204
-	mknod /dev/irda0  c 10 204
-	mkdir -p dev/msys
-	mkdir -p dev/pts
-	mkdir -p dev/vc
-	for i in 0 1 2 3 4 5 6 7 8 9; do
-		ln -s /dev/tty$i /dev/vc/$i
-	done
-	ln -sf /proc/self/fd /dev/fd
-	ln -sf /proc/kcore /dev/core
-	/sbin/makedevs -r / -D /etc/device_table
-	if test $? -ne 0; then
-		if test "$VERBOSE" != "no"; then echo "failed"; fi
-	else
-		if test "$VERBOSE" != "no"; then echo "done"; fi
-	fi
-fi
-
-exit 0
-- 
1.7.1



