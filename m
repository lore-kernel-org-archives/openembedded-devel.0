Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87f2-0001zk-Ga
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:35:11 +0200
Received: by fxm6 with SMTP id 6so1460933fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=AKHVNM2QGdd0f+sz8QbG1Lvxxm87ADdENeuRrfZHlPg=;
	b=KRV512uifM6qJqam3MqTD/Qe/2rOGzEr4DPRVIjOugyfJnA0VVGi8TcPD8XCLdqCya
	Snk9XtbOWabnI2mTi0EcHH7+cKr4X0zLvmrhjEcSkGV9Hi0VTGGwd5mfChmSmgv0lmyT
	iJvRhvdycj3rT5H3vta97UOKVyB8iY6tqUR2Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ctmwcFkL70MKj1S5J5xUo+qAtNOb9bXk2mLgbZxy/az0IzklnPpde8XuhXTIg3YaTr
	0ShVGQ+EjlXAEcPx4XjSmzr2buMIlMdhHWxG5Blg2tHYBIvhCA4ion2M3n//lVcO9p8u
	rF1/UZazjWnzChvZ4PiSvqvaObOrYwKSRN0qo=
Received: by 10.103.212.16 with SMTP id o16mr3848850muq.38.1287477272398;
	Tue, 19 Oct 2010 01:34:32 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u8sm4729403fah.12.2010.10.19.01.34.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:34:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:25 +0200
Message-Id: <1287477207-27752-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/13] openmoko: move initscripts, psplash, alsa-scenarios also to obsolete
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
X-List-Received-Date: Tue, 19 Oct 2010 08:35:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../initscripts/initscripts-openmoko/bootmisc.sh   |   47 ----
 recipes/initscripts/initscripts-openmoko/campgsm   |  128 ----------
 .../initscripts/initscripts-openmoko/checkroot.sh  |   43 ----
 .../initscripts-openmoko/led-trigger.sh            |    6 -
 .../initscripts/initscripts-openmoko/mountall.sh   |   52 ----
 .../initscripts-openmoko/mountdevsubfs.sh          |   14 --
 .../initscripts-openmoko/mountkernfs.sh            |   33 ---
 .../initscripts/initscripts-openmoko/mountnfs.sh   |   87 -------
 .../initscripts-openmoko/populate-volatile.sh      |  248 --------------------
 recipes/initscripts/initscripts-openmoko_1.0.bb    |  112 ---------
 .../initscripts/initscripts-openmoko/bootmisc.sh   |   47 ++++
 .../initscripts/initscripts-openmoko/campgsm       |  128 ++++++++++
 .../initscripts/initscripts-openmoko/checkroot.sh  |   43 ++++
 .../initscripts-openmoko/led-trigger.sh            |    6 +
 .../initscripts/initscripts-openmoko/mountall.sh   |   52 ++++
 .../initscripts-openmoko/mountdevsubfs.sh          |   14 ++
 .../initscripts-openmoko/mountkernfs.sh            |   33 +++
 .../initscripts/initscripts-openmoko/mountnfs.sh   |   87 +++++++
 .../initscripts-openmoko/populate-volatile.sh      |  248 ++++++++++++++++++++
 .../initscripts/initscripts-openmoko_1.0.bb        |  112 +++++++++
 .../openmoko2/openmoko-alsa-scenarios_svn.bb       |   25 ++
 recipes/obsolete/psplash/psplash-openmoko_svn.bb   |   20 ++
 recipes/openmoko2/openmoko-alsa-scenarios_svn.bb   |   25 --
 recipes/psplash/psplash-openmoko_svn.bb            |   20 --
 24 files changed, 815 insertions(+), 815 deletions(-)
 delete mode 100644 recipes/initscripts/initscripts-openmoko/bootmisc.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/campgsm
 delete mode 100644 recipes/initscripts/initscripts-openmoko/checkroot.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/led-trigger.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/mountall.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/mountdevsubfs.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/mountkernfs.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/mountnfs.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko/populate-volatile.sh
 delete mode 100644 recipes/initscripts/initscripts-openmoko_1.0.bb
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/bootmisc.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/campgsm
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/checkroot.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/led-trigger.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/mountall.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/mountdevsubfs.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/mountkernfs.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/mountnfs.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko/populate-volatile.sh
 create mode 100644 recipes/obsolete/initscripts/initscripts-openmoko_1.0.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-alsa-scenarios_svn.bb
 create mode 100644 recipes/obsolete/psplash/psplash-openmoko_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-alsa-scenarios_svn.bb
 delete mode 100644 recipes/psplash/psplash-openmoko_svn.bb

diff --git a/recipes/initscripts/initscripts-openmoko/bootmisc.sh b/recipes/initscripts/initscripts-openmoko/bootmisc.sh
deleted file mode 100644
index 4511e12..0000000
--- a/recipes/initscripts/initscripts-openmoko/bootmisc.sh
+++ /dev/null
@@ -1,47 +0,0 @@
-#
-# bootmisc.sh	Miscellaneous things to be done during bootup.
-#
-
-. /etc/default/rcS
-#
-# Put a nologin file in /etc to prevent people from logging in before
-# system startup is complete.
-#
-if test "$DELAYLOGIN" = yes
-then
-  echo "System bootup in progress - please wait" > /etc/nologin
-  cp /etc/nologin /etc/nologin.boot
-fi
-
-#
-# Update /etc/motd.
-#
-if test "$EDITMOTD" != no
-then
-	uname -a > /etc/motd.tmp
-	sed 1d /etc/motd >> /etc/motd.tmp
-	mv /etc/motd.tmp /etc/motd
-fi
-
-#
-# Update dynamic library cache
-#
-#/sbin/ldconfig
-
-# Set the system clock from hardware clock
-# If the timestamp is 1 day or more recent than the current time,
-# use the timestamp instead.
-[ "$UTC" = yes ] || /etc/init.d/hwclock.sh start
-
-if ! test -f /etc/.configured && test -e /etc/timestamp
-then
-	SYSTEMDATE=`date "+%Y%m%d"`
-	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4);}'`
-        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`
-        if [ $NEEDUPDATE -eq 1 ]; then
-		date `cat /etc/timestamp`
-		/etc/init.d/hwclock.sh stop
-	fi
-fi
-
-: exit 0
diff --git a/recipes/initscripts/initscripts-openmoko/campgsm b/recipes/initscripts/initscripts-openmoko/campgsm
deleted file mode 100644
index 5be6708..0000000
--- a/recipes/initscripts/initscripts-openmoko/campgsm
+++ /dev/null
@@ -1,128 +0,0 @@
-#!/bin/sh
-
-VERBOSE=no
-
-PIDS=`pidof -x "$0"`
-
-# make sure pidof sees us
-if [ -z "$PIDS" ]; then
-	exec "$0"
-	exit 1
-fi
-
-GSM_DEVICE="/dev/ttySAC0"
-GSM_POWER="/sys/devices/platform/neo1973-pm-gsm.0/power_on"
-GSM_RESET="/sys/devices/platform/neo1973-pm-gsm.0/reset"
-
-GSM_COMMANDS="Z E0V1 +CFUN=1 +COPS=0"
-
-gsm_running () {
-	if [ "$PIDS" != "$$" ]; then
-		return 0
-	else
-		return 1
-	fi
-}
-
-gsm_send () {
-	cmd="$1"
-	echo -ne "AT${cmd}\r" > "$GSM_DEVICE"
-}
-
-# this function might block forever
-gsm_wait () {
-	ret="UNKNOWN"
-
-	while read status; do
-		case "$status" in
-			OK*)
-				ret="OK"
-				;;
-			ERROR*)
-				ret="ERROR"
-				;;
-			*)
-				ret="UNKNOWN"
-				;;
-		esac
-		if [ "x$ret" != "xUNKNOWN" ]; then
-			break
-		fi
-	done < "$GSM_DEVICE"
-
-	if [ "x$ret" != "xOK" ]; then
-		return 1
-	fi
-
-	return 0
-}
-
-gsm_setup () {
-	[ $VERBOSE == "yes" ] && echo -n "Powering up GSM modem..."
-	echo 0 > "$GSM_POWER"; sleep 1
-	echo 1 > "$GSM_POWER"; sleep 1
-	echo 1 > "$GSM_RESET"; sleep 1
-	echo 0 > "$GSM_RESET"; sleep 4
-	[ $VERBOSE == "yes" ] && echo "done"
-
-	stty -F "$GSM_DEVICE" cooked -opost -echo crtscts 115200
-}
-
-gsm_wakeup () {
-	[ $VERBOSE == "yes" ] && echo "Waking up GSM modem"
-
-	# there is at most one OK/ERROR even if we send multiple commands
-	gsm_send ""
-	gsm_send ""
-	gsm_send ""
-
-	if gsm_wait; then
-		[ $VERBOSE == "yes" ] && echo "GSM modem awake"
-		return 0
-	else
-		echo "failed to wake up GSM modem"
-		return 1
-	fi
-}
-
-start () {
-	gsm_setup
-
-	if gsm_wakeup; then
-		for cmd in $GSM_COMMANDS
-		do
-			[ $VERBOSE == "yes" ] && echo "Sending AT$cmd"
-			gsm_send "$cmd"
-
-			if ! gsm_wait; then
-				echo "AT$cmd failed"
-				break
-			fi
-		done
-	fi
-}
-
-set -e
-
-case "$1" in
-	start)
-		if gsm_running; then
-			echo "Another instance is already running"
-			exit 1
-		fi
-
-		start &
-		;;
-	stop)
-		if gsm_running; then
-			PIDS=`pidof -x -o "$$" "$0"`
-			echo -n "Stopping other instances..."
-			kill $PIDS
-			echo "done"
-		fi
-		;;
-	*)
-		echo "Usage: $0 {start|stop}"
-		exit 1
-		;;
-esac
diff --git a/recipes/initscripts/initscripts-openmoko/checkroot.sh b/recipes/initscripts/initscripts-openmoko/checkroot.sh
deleted file mode 100644
index 029ae9b..0000000
--- a/recipes/initscripts/initscripts-openmoko/checkroot.sh
+++ /dev/null
@@ -1,43 +0,0 @@
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
-#	If the root filesystem was not marked as read-only in /etc/fstab,
-#	remount the rootfs rw but do not try to change mtab because it
-#	is on a ro fs until the remount succeeded. Then clean up old mtabs
-#	and finally write the new mtab.
-#	This part is only needed if the rootfs was mounted ro.
-#
-ROOTFSDEV="/dev/root"
-if grep -q "^$ROOTFSDEV .* rw" /proc/mounts; then
-	echo "Root filesystem already read-write, not remounting"
-else
-	rootmode=rw
-
-	echo "Remounting root file system..."
-	mount -n -o remount,noatime,$rootmode /
-	if test "$rootmode" = rw
-	then
-		if test ! -L /etc/mtab
-		then
-			rm -f /etc/mtab~ /etc/nologin
-			: > /etc/mtab
-		fi
-		mount -f -o remount /
-		mount -f /proc
-		test "$devfs" && grep -q '^devfs /dev' /proc/mounts && mount -f "$devfs"
-	fi
-fi
-
-: exit 0
diff --git a/recipes/initscripts/initscripts-openmoko/led-trigger.sh b/recipes/initscripts/initscripts-openmoko/led-trigger.sh
deleted file mode 100644
index 9583ce9..0000000
--- a/recipes/initscripts/initscripts-openmoko/led-trigger.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#! /bin/sh
-sys_led_trigger="/sys/devices/platform/gta02-led.0/leds/gta02-aux:red/trigger"
-if test -e $sys_led_trigger ;then
-        echo bat-charging > $sys_led_trigger
-fi
-
diff --git a/recipes/initscripts/initscripts-openmoko/mountall.sh b/recipes/initscripts/initscripts-openmoko/mountall.sh
deleted file mode 100644
index 4bd7bbb..0000000
--- a/recipes/initscripts/initscripts-openmoko/mountall.sh
+++ /dev/null
@@ -1,52 +0,0 @@
-#
-# mountall.sh	Mount all filesystems.
-#
-# Version:	@(#)mountall.sh  2.83-2  01-Nov-2001  miquels@cistron.nl
-#
-. /etc/default/rcS
-if test -f /etc/default/mountall; then
-    . /etc/default/mountall
-fi
-
-#
-# Mount local filesystems in /etc/fstab. For some reason, people
-# might want to mount "proc" several times, and mount -v complains
-# about this. So we mount "proc" filesystems without -v.
-#
-test "$VERBOSE" != no && echo "Mounting local filesystems..."
-mount -a $MOUNTALL
-
-#
-# We might have mounted something over /dev, see if /dev/initctl is there.
-#
-if test ! -p /dev/initctl
-then
-	rm -f /dev/initctl
-	mknod -m 600 /dev/initctl p
-fi
-kill -USR1 1
-
-#
-# Execute swapon command again, in case we want to swap to
-# a file on a now mounted filesystem.
-#
-doswap=yes
-if test $doswap = yes
-then
-	swapon -a 2> /dev/null
-fi
-
-# A missing homedirectory for root can cause all sorts of problems.
-# This can happen after user formats his /home partition for example
-
-if test -e /etc/passwd
-then
-	ROOT_HOME="`grep root /etc/passwd | cut -d: -f6`"
-
-	if test -n "$ROOT_HOME"
-	then
-		! test -d "$ROOT_HOME" && mkdir -p "$ROOT_HOME"
-	fi
-fi
-: exit 0
-
diff --git a/recipes/initscripts/initscripts-openmoko/mountdevsubfs.sh b/recipes/initscripts/initscripts-openmoko/mountdevsubfs.sh
deleted file mode 100644
index c6cfb05..0000000
--- a/recipes/initscripts/initscripts-openmoko/mountdevsubfs.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-. /etc/default/devpts
-
-test -c /dev/ptmx || mknod -m 666 /dev/ptmx c 5 2
-
-if [ -d /dev/pts ]; then
-	mount -n -t devpts devpts /dev/pts -ogid=${TTYGRP},mode=${TTYMODE}
-fi
-
-
-if [ -d /dev/shm ]; then
-	mount -n -t tmpfs shmfs /dev/shm -omode=0777
-fi
diff --git a/recipes/initscripts/initscripts-openmoko/mountkernfs.sh b/recipes/initscripts/initscripts-openmoko/mountkernfs.sh
deleted file mode 100644
index 1ed09fc..0000000
--- a/recipes/initscripts/initscripts-openmoko/mountkernfs.sh
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/sh
-
-supported_kernel() {
-  case "$(uname -r)" in
-    2.[012345].*|2.6.[0-9]|2.6.[0-9][!0-9]*) return 1 ;;
-    2.6.1[0-7]|2.6.1[0-7][!0-9]*) return 1 ;;
-  esac
-  return 0
-}
-
-check_kernel() {
-	if ! supported_kernel; then
-		echo "WARNING: kernel < 2.6.18"
-	fi
-
-	if ! grep -qs devpts /proc/filesystems; then
-		echo "WARNING: kernel does not support devpts"
-	fi
-
-	if ! grep -qs tmpfs /proc/filesystems; then
-		echo "WARNING: kernel does not support tmpfs"
-	fi
-}
-
-if [ -d /proc ]; then
-	mount -n -t proc proc /proc
-fi
-
-check_kernel
-
-if [ -d /sys ]; then
-	mount -n -t sysfs sysfs /sys
-fi
diff --git a/recipes/initscripts/initscripts-openmoko/mountnfs.sh b/recipes/initscripts/initscripts-openmoko/mountnfs.sh
deleted file mode 100644
index 2631392..0000000
--- a/recipes/initscripts/initscripts-openmoko/mountnfs.sh
+++ /dev/null
@@ -1,87 +0,0 @@
-#
-# mountnfs.sh	Now that TCP/IP is configured, mount the NFS file
-#		systems in /etc/fstab if needed. If possible,
-#		start the portmapper before mounting (this is needed for
-#		Linux 2.1.x and up).
-#
-#		Also mounts SBM filesystems now, so the name of
-#		this script is getting increasingly inaccurate.
-#
-# Version:	@(#)mountnfs.sh  2.83  05-Oct-2001  miquels@cistron.nl
-#
-
-. /etc/default/rcS
-
-#
-#	Run in a subshell because of I/O redirection.
-#
-test -x /sbin/portmap && test -f /etc/fstab && (
-
-#
-#	Read through fstab line by line. If it is NFS, set the flag
-#	for mounting NFS filesystems. If any NFS partition is found and it
-#	not mounted with the nolock option, we start the portmapper.
-#
-portmap=no
-mount_nfs=no
-mount_smb=no
-mount_ncp=no
-while read device mountpt fstype options
-do
-	case "$device" in
-		""|\#*)
-			continue
-			;;
-	esac
-
-	case "$options" in
-		*noauto*)
-			continue
-			;;
-	esac
-
-	if test "$fstype" = nfs
-	then
-		mount_nfs=yes
-		case "$options" in
-			*nolock*)
-				;;
-			*)
-				portmap=yes
-				;;
-		esac
-	fi
-	if test "$fstype" = smbfs
-	then
-		mount_smb=yes
-	fi
-	if test "$fstype" = ncpfs
-	then
-		mount_ncp=yes
-	fi
-done
-
-exec 0>&1
-
-if test "$portmap" = yes
-then
-	if test -x /sbin/portmap
-	then
-		echo -n "Starting portmapper... "
-		start-stop-daemon --start --quiet --exec /sbin/portmap
-		sleep 2
-	fi
-fi
-
-if test "$mount_nfs" = yes || test "$mount_smb" = yes || test "$mount_ncp" = yes
-then
-	echo "Mounting remote filesystems..."
-	test "$mount_nfs" = yes && mount -a -t nfs
-	test "$mount_smb" = yes && mount -a -t smbfs
-	test "$mount_ncp" = yes && mount -a -t ncpfs
-fi
-
-) < /etc/fstab
-
-: exit 0
-
diff --git a/recipes/initscripts/initscripts-openmoko/populate-volatile.sh b/recipes/initscripts/initscripts-openmoko/populate-volatile.sh
deleted file mode 100644
index 6fb23d7..0000000
--- a/recipes/initscripts/initscripts-openmoko/populate-volatile.sh
+++ /dev/null
@@ -1,248 +0,0 @@
-#!/bin/sh
-
-. /etc/default/rcS
-
-CFGDIR="/etc/default/volatiles"
-TMPROOT="/var/tmp"
-COREDEF="00_core"
-
-[ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
-
-create_file() {
-	EXEC="
-	touch \"$1\";
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
-
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
-
-	[ -e "$1" ] && {
-	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
-	} || {
-	  eval $EXEC
-	}
-}
-
-mk_dir() {
-	EXEC="
-	mkdir -p \"$1\";
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
-
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
-
-	[ -e "$1" ] && {
-	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
-	} || {
-	  eval $EXEC
-	}
-}
-
-link_file() {
-	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1"
-
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache
-
-	[ -e "$2" ] && {
-	  echo "Cannot create link over existing -${TNAME}-." >&2
-	} || {
-	  eval $EXEC
-	}
-}
-
-check_requirements() {
-
-  cleanup() {
-    rm "${TMP_INTERMED}"
-    rm "${TMP_DEFINED}"
-    rm "${TMP_COMBINED}"
-    }
-
-  CFGFILE="$1"
-
-  [ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
-
-  TMP_INTERMED="${TMPROOT}/tmp.$$"
-  TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
-  TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
-
-
-  cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
-  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
-  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
-
-  NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
-  NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
-
-  [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
-    echo "Undefined users:"
-    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
-    cleanup
-    return 1
-    }
-
-
-  cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
-  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
-  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
-
-  NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
-  NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
-
-  [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
-    echo "Undefined groups:"
-    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
-    cleanup
-    return 1
-    }
-
-  # Add checks for required directories here
-
-  cleanup
-  return 0
-  }
-
-apply_cfgfile() {
-
-  CFGFILE="$1"
-
-  check_requirements "${CFGFILE}" || {
-    echo "Skipping ${CFGFILE}"
-    return 1
-    }
-
-  cat ${CFGFILE} | grep -v "^#" | \
-  while read LINE; do
-
-    eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
-
-    [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
-
-
-    [ "${TTYPE}" = "l" ] && {
-      TSOURCE="$TLTARGET"
-      [ -L "${TNAME}" ] || {
-	[ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
-	link_file "${TSOURCE}" "${TNAME}"
-	}
-      continue
-      }
-
-    [ -L "${TNAME}" ] && {
-      [ "${VERBOSE}" != "no" ] && echo "Found link."
-      NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/'`
-      echo ${NEWNAME} | grep -v "^/" >/dev/null && {
-	TNAME="`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
-	[ "${VERBOSE}" != "no" ] && echo "Converted relative linktarget to absolute path -${TNAME}-."
-	} || {
-	TNAME="${NEWNAME}"
-	[ "${VERBOSE}" != "no" ] && echo "Using absolute link target -${TNAME}-."
-	}
-      }
-
-    case "${TTYPE}" in
-      "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
-	    create_file "${TNAME}"
-	    ;;
-      "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
-	    mk_dir "${TNAME}"
-	    # Add check to see if there's an entry in fstab to mount.
-	    ;;
-      *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
-	    continue
-	    ;;
-    esac
-
-
-    done
-
-  return 0
-
-  }
-
-SKEL_DIR="/etc/volatile/skel"
-
-skel_mount() {
-	VOLATILE="$1"
-
-	[ -d "$VOLATILE" ] || mkdir -p "$VOLATILE"
-
-	mount -t tmpfs volatile "$VOLATILE" -omode=0755
-}
-
-skel_load() {
-	VOLATILE="$1"
-
-	if ! skel_mount "$VOLATILE"; then
-		echo "failed to mount $VOLATILE"
-		return 1
-	fi
-
-	cp -a "$SKEL_DIR"/* "$VOLATILE"/
-}
-
-skel_update() {
-	VOLATILE="$1"
-
-	if ! skel_mount "$VOLATILE"; then
-		echo "failed to update"
-		return 1
-	fi
-
-	echo -n "Populating volatile directory..."
-	for file in `ls -1 "${CFGDIR}" | sort`; do
-		apply_cfgfile "${CFGDIR}/${file}"
-	done
-	echo "done"
-
-	if [ -d "$SKEL_DIR" ]; then
-		rm -rf "$SKEL_DIR"
-	fi
-
-	mkdir -p "$SKEL_DIR"/tmp
-	cp -a "$VOLATILE"/* "$SKEL_DIR"/
-}
-
-populate() {
-	if [ -d "$SKEL_DIR"/tmp ]; then
-		skel_load /var/volatile
-	else
-		skel_update /var/volatile
-	fi
-
-	for d in /var/volatile/*
-	do
-		ln -sf "$d" /var
-	done
-
-	if ! test -L /tmp; then
-		rm -rf /tmp
-		ln -sf /var/tmp /tmp
-	fi
-}
-
-case "$1" in
-	start)
-	if grep -q "^volatile " /proc/mounts; then
-		echo "volatile directory is already mounted"
-	else
-		populate
-	fi
-	;;
-	stop)
-	: # no-op
-	;;
-	update)
-	if skel_update /var/volatile; then
-		umount /var/volatile
-		if grep -q "^volatile " /proc/mounts; then
-			cp -a "$SKEL_DIR"/* /var/volatile
-		fi
-	fi
-	;;
-	*)
-	echo "Usage: /etc/init.d/populate-volatile {start|stop|update}"
-	;;
-esac
-
-: exit 0
diff --git a/recipes/initscripts/initscripts-openmoko_1.0.bb b/recipes/initscripts/initscripts-openmoko_1.0.bb
deleted file mode 100644
index a1e1b7d..0000000
--- a/recipes/initscripts/initscripts-openmoko_1.0.bb
+++ /dev/null
@@ -1,112 +0,0 @@
-DESCRIPTION = "Openmoko init scripts"
-SECTION = "base"
-PRIORITY = "required"
-LICENSE = "GPL"
-DEPENDS = ""
-RDEPENDS_${PN} = ""
-PR = "r1"
-
-RCONFLICTS_${PN} = "initscripts"
-
-SRC_URI = "file://bootmisc.sh \
-	   file://campgsm \
-	   file://checkroot.sh \
-	   file://finish.sh \
-	   file://functions \
-	   file://hostname.sh \
-	   file://led-trigger.sh \
-	   file://mountall.sh \
-	   file://mountdevsubfs.sh \
-	   file://mountkernfs.sh \
-	   file://mountnfs.sh \
-	   file://populate-volatile.sh \
-	   file://devpts \
-	   file://volatiles \
-	   file://halt \
-	   file://reboot \
-	   file://rmnologin \
-	   file://save-rtc.sh \
-	   file://sendsigs \
-	   file://umountfs \
-	   file://umountnfs.sh \
-	   "
-
-SRC_URI_append_arm = " file://alignment.sh"
-
-inherit base
-
-do_install () {
-#
-# Create directories and install device independent scripts
-#
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/rcS.d
-	install -d ${D}${sysconfdir}/rc0.d
-	install -d ${D}${sysconfdir}/rc1.d
-	install -d ${D}${sysconfdir}/rc2.d
-	install -d ${D}${sysconfdir}/rc3.d
-	install -d ${D}${sysconfdir}/rc4.d
-	install -d ${D}${sysconfdir}/rc5.d
-	install -d ${D}${sysconfdir}/rc6.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/default/volatiles
-
-	if [ "${TARGET_ARCH}" = "arm" ]; then
-		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
-	fi
-	install -m 0755	${WORKDIR}/bootmisc.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/campgsm		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/checkroot.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/finish.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/functions		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/hostname.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/led-trigger.sh	${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/mountall.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/mountnfs.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/mountdevsubfs.sh	${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/mountkernfs.sh	${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/populate-volatile.sh	${D}${sysconfdir}/init.d
-
-	install -m 0644	${WORKDIR}/devpts		${D}${sysconfdir}/default/devpts
-	install -m 0644	${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-
-	install -m 0755	${WORKDIR}/halt			${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/reboot		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/rmnologin		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/save-rtc.sh		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/sendsigs		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/umountfs		${D}${sysconfdir}/init.d
-	install -m 0755	${WORKDIR}/umountnfs.sh		${D}${sysconfdir}/init.d
-
-#
-# Create runlevel links
-#
-	ln -sf		../init.d/hostname.sh		${D}${sysconfdir}/rcS.d/S02hostname.sh
-	ln -sf		../init.d/mountkernfs.sh	${D}${sysconfdir}/rcS.d/S02mountkernfs.sh
-	ln -sf		../init.d/mountdevsubfs.sh	${D}${sysconfdir}/rcS.d/S04mountdevsubfs.sh
-	if [ "${TARGET_ARCH}" = "arm" ]; then
-		ln -sf	../init.d/alignment.sh		${D}${sysconfdir}/rcS.d/S06alignment
-	fi
-	#ln -sf		../init.d/campgsm		${D}${sysconfdir}/rcS.d/S07campgsm
-	ln -sf		../init.d/checkroot.sh		${D}${sysconfdir}/rcS.d/S10checkroot.sh
-	ln -sf		../init.d/mountall.sh		${D}${sysconfdir}/rcS.d/S35mountall.sh
-	ln -sf		../init.d/populate-volatile.sh	${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
-	ln -sf		../init.d/mountnfs.sh		${D}${sysconfdir}/rcS.d/S45mountnfs.sh
-	ln -sf		../init.d/bootmisc.sh		${D}${sysconfdir}/rcS.d/S55bootmisc.sh
-	ln -sf		../init.d/led-trigger.sh	${D}${sysconfdir}/rcS.d/S97led-trigger.sh
-	ln -sf		../init.d/finish.sh		${D}${sysconfdir}/rcS.d/S99finish.sh
-
-	ln -sf		../init.d/rmnologin		${D}${sysconfdir}/rc5.d/S99rmnologin
-
-	ln -sf		../init.d/sendsigs		${D}${sysconfdir}/rc0.d/S20sendsigs
-	ln -sf		../init.d/save-rtc.sh		${D}${sysconfdir}/rc0.d/S25save-rtc.sh
-	ln -sf		../init.d/umountnfs.sh		${D}${sysconfdir}/rc6.d/S31umountnfs.sh
-	ln -sf		../init.d/umountfs		${D}${sysconfdir}/rc0.d/S40umountfs
-	ln -sf		../init.d/halt			${D}${sysconfdir}/rc0.d/S90halt
-
-	ln -sf		../init.d/sendsigs		${D}${sysconfdir}/rc6.d/S20sendsigs
-	ln -sf		../init.d/save-rtc.sh		${D}${sysconfdir}/rc6.d/S25save-rtc.sh
-	ln -sf		../init.d/umountnfs.sh		${D}${sysconfdir}/rc6.d/S31umountnfs.sh
-	ln -sf		../init.d/umountfs		${D}${sysconfdir}/rc6.d/S40umountfs
-	ln -sf		../init.d/reboot		${D}${sysconfdir}/rc6.d/S90reboot
-}
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/bootmisc.sh b/recipes/obsolete/initscripts/initscripts-openmoko/bootmisc.sh
new file mode 100644
index 0000000..4511e12
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/bootmisc.sh
@@ -0,0 +1,47 @@
+#
+# bootmisc.sh	Miscellaneous things to be done during bootup.
+#
+
+. /etc/default/rcS
+#
+# Put a nologin file in /etc to prevent people from logging in before
+# system startup is complete.
+#
+if test "$DELAYLOGIN" = yes
+then
+  echo "System bootup in progress - please wait" > /etc/nologin
+  cp /etc/nologin /etc/nologin.boot
+fi
+
+#
+# Update /etc/motd.
+#
+if test "$EDITMOTD" != no
+then
+	uname -a > /etc/motd.tmp
+	sed 1d /etc/motd >> /etc/motd.tmp
+	mv /etc/motd.tmp /etc/motd
+fi
+
+#
+# Update dynamic library cache
+#
+#/sbin/ldconfig
+
+# Set the system clock from hardware clock
+# If the timestamp is 1 day or more recent than the current time,
+# use the timestamp instead.
+[ "$UTC" = yes ] || /etc/init.d/hwclock.sh start
+
+if ! test -f /etc/.configured && test -e /etc/timestamp
+then
+	SYSTEMDATE=`date "+%Y%m%d"`
+	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4);}'`
+        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`
+        if [ $NEEDUPDATE -eq 1 ]; then
+		date `cat /etc/timestamp`
+		/etc/init.d/hwclock.sh stop
+	fi
+fi
+
+: exit 0
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/campgsm b/recipes/obsolete/initscripts/initscripts-openmoko/campgsm
new file mode 100644
index 0000000..5be6708
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/campgsm
@@ -0,0 +1,128 @@
+#!/bin/sh
+
+VERBOSE=no
+
+PIDS=`pidof -x "$0"`
+
+# make sure pidof sees us
+if [ -z "$PIDS" ]; then
+	exec "$0"
+	exit 1
+fi
+
+GSM_DEVICE="/dev/ttySAC0"
+GSM_POWER="/sys/devices/platform/neo1973-pm-gsm.0/power_on"
+GSM_RESET="/sys/devices/platform/neo1973-pm-gsm.0/reset"
+
+GSM_COMMANDS="Z E0V1 +CFUN=1 +COPS=0"
+
+gsm_running () {
+	if [ "$PIDS" != "$$" ]; then
+		return 0
+	else
+		return 1
+	fi
+}
+
+gsm_send () {
+	cmd="$1"
+	echo -ne "AT${cmd}\r" > "$GSM_DEVICE"
+}
+
+# this function might block forever
+gsm_wait () {
+	ret="UNKNOWN"
+
+	while read status; do
+		case "$status" in
+			OK*)
+				ret="OK"
+				;;
+			ERROR*)
+				ret="ERROR"
+				;;
+			*)
+				ret="UNKNOWN"
+				;;
+		esac
+		if [ "x$ret" != "xUNKNOWN" ]; then
+			break
+		fi
+	done < "$GSM_DEVICE"
+
+	if [ "x$ret" != "xOK" ]; then
+		return 1
+	fi
+
+	return 0
+}
+
+gsm_setup () {
+	[ $VERBOSE == "yes" ] && echo -n "Powering up GSM modem..."
+	echo 0 > "$GSM_POWER"; sleep 1
+	echo 1 > "$GSM_POWER"; sleep 1
+	echo 1 > "$GSM_RESET"; sleep 1
+	echo 0 > "$GSM_RESET"; sleep 4
+	[ $VERBOSE == "yes" ] && echo "done"
+
+	stty -F "$GSM_DEVICE" cooked -opost -echo crtscts 115200
+}
+
+gsm_wakeup () {
+	[ $VERBOSE == "yes" ] && echo "Waking up GSM modem"
+
+	# there is at most one OK/ERROR even if we send multiple commands
+	gsm_send ""
+	gsm_send ""
+	gsm_send ""
+
+	if gsm_wait; then
+		[ $VERBOSE == "yes" ] && echo "GSM modem awake"
+		return 0
+	else
+		echo "failed to wake up GSM modem"
+		return 1
+	fi
+}
+
+start () {
+	gsm_setup
+
+	if gsm_wakeup; then
+		for cmd in $GSM_COMMANDS
+		do
+			[ $VERBOSE == "yes" ] && echo "Sending AT$cmd"
+			gsm_send "$cmd"
+
+			if ! gsm_wait; then
+				echo "AT$cmd failed"
+				break
+			fi
+		done
+	fi
+}
+
+set -e
+
+case "$1" in
+	start)
+		if gsm_running; then
+			echo "Another instance is already running"
+			exit 1
+		fi
+
+		start &
+		;;
+	stop)
+		if gsm_running; then
+			PIDS=`pidof -x -o "$$" "$0"`
+			echo -n "Stopping other instances..."
+			kill $PIDS
+			echo "done"
+		fi
+		;;
+	*)
+		echo "Usage: $0 {start|stop}"
+		exit 1
+		;;
+esac
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/checkroot.sh b/recipes/obsolete/initscripts/initscripts-openmoko/checkroot.sh
new file mode 100644
index 0000000..029ae9b
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/checkroot.sh
@@ -0,0 +1,43 @@
+#
+# checkroot.sh	Check to root filesystem.
+#
+# Version:	@(#)checkroot.sh  2.84  25-Jan-2002  miquels@cistron.nl
+#
+
+. /etc/default/rcS
+
+#
+# Set SULOGIN in /etc/default/rcS to yes if you want a sulogin to be spawned
+# from this script *before anything else* with a timeout, like SCO does.
+#
+test "$SULOGIN" = yes && sulogin -t 30 $CONSOLE
+
+#
+#	If the root filesystem was not marked as read-only in /etc/fstab,
+#	remount the rootfs rw but do not try to change mtab because it
+#	is on a ro fs until the remount succeeded. Then clean up old mtabs
+#	and finally write the new mtab.
+#	This part is only needed if the rootfs was mounted ro.
+#
+ROOTFSDEV="/dev/root"
+if grep -q "^$ROOTFSDEV .* rw" /proc/mounts; then
+	echo "Root filesystem already read-write, not remounting"
+else
+	rootmode=rw
+
+	echo "Remounting root file system..."
+	mount -n -o remount,noatime,$rootmode /
+	if test "$rootmode" = rw
+	then
+		if test ! -L /etc/mtab
+		then
+			rm -f /etc/mtab~ /etc/nologin
+			: > /etc/mtab
+		fi
+		mount -f -o remount /
+		mount -f /proc
+		test "$devfs" && grep -q '^devfs /dev' /proc/mounts && mount -f "$devfs"
+	fi
+fi
+
+: exit 0
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/led-trigger.sh b/recipes/obsolete/initscripts/initscripts-openmoko/led-trigger.sh
new file mode 100644
index 0000000..9583ce9
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/led-trigger.sh
@@ -0,0 +1,6 @@
+#! /bin/sh
+sys_led_trigger="/sys/devices/platform/gta02-led.0/leds/gta02-aux:red/trigger"
+if test -e $sys_led_trigger ;then
+        echo bat-charging > $sys_led_trigger
+fi
+
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/mountall.sh b/recipes/obsolete/initscripts/initscripts-openmoko/mountall.sh
new file mode 100644
index 0000000..4bd7bbb
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/mountall.sh
@@ -0,0 +1,52 @@
+#
+# mountall.sh	Mount all filesystems.
+#
+# Version:	@(#)mountall.sh  2.83-2  01-Nov-2001  miquels@cistron.nl
+#
+. /etc/default/rcS
+if test -f /etc/default/mountall; then
+    . /etc/default/mountall
+fi
+
+#
+# Mount local filesystems in /etc/fstab. For some reason, people
+# might want to mount "proc" several times, and mount -v complains
+# about this. So we mount "proc" filesystems without -v.
+#
+test "$VERBOSE" != no && echo "Mounting local filesystems..."
+mount -a $MOUNTALL
+
+#
+# We might have mounted something over /dev, see if /dev/initctl is there.
+#
+if test ! -p /dev/initctl
+then
+	rm -f /dev/initctl
+	mknod -m 600 /dev/initctl p
+fi
+kill -USR1 1
+
+#
+# Execute swapon command again, in case we want to swap to
+# a file on a now mounted filesystem.
+#
+doswap=yes
+if test $doswap = yes
+then
+	swapon -a 2> /dev/null
+fi
+
+# A missing homedirectory for root can cause all sorts of problems.
+# This can happen after user formats his /home partition for example
+
+if test -e /etc/passwd
+then
+	ROOT_HOME="`grep root /etc/passwd | cut -d: -f6`"
+
+	if test -n "$ROOT_HOME"
+	then
+		! test -d "$ROOT_HOME" && mkdir -p "$ROOT_HOME"
+	fi
+fi
+: exit 0
+
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/mountdevsubfs.sh b/recipes/obsolete/initscripts/initscripts-openmoko/mountdevsubfs.sh
new file mode 100644
index 0000000..c6cfb05
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/mountdevsubfs.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+. /etc/default/devpts
+
+test -c /dev/ptmx || mknod -m 666 /dev/ptmx c 5 2
+
+if [ -d /dev/pts ]; then
+	mount -n -t devpts devpts /dev/pts -ogid=${TTYGRP},mode=${TTYMODE}
+fi
+
+
+if [ -d /dev/shm ]; then
+	mount -n -t tmpfs shmfs /dev/shm -omode=0777
+fi
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/mountkernfs.sh b/recipes/obsolete/initscripts/initscripts-openmoko/mountkernfs.sh
new file mode 100644
index 0000000..1ed09fc
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/mountkernfs.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+supported_kernel() {
+  case "$(uname -r)" in
+    2.[012345].*|2.6.[0-9]|2.6.[0-9][!0-9]*) return 1 ;;
+    2.6.1[0-7]|2.6.1[0-7][!0-9]*) return 1 ;;
+  esac
+  return 0
+}
+
+check_kernel() {
+	if ! supported_kernel; then
+		echo "WARNING: kernel < 2.6.18"
+	fi
+
+	if ! grep -qs devpts /proc/filesystems; then
+		echo "WARNING: kernel does not support devpts"
+	fi
+
+	if ! grep -qs tmpfs /proc/filesystems; then
+		echo "WARNING: kernel does not support tmpfs"
+	fi
+}
+
+if [ -d /proc ]; then
+	mount -n -t proc proc /proc
+fi
+
+check_kernel
+
+if [ -d /sys ]; then
+	mount -n -t sysfs sysfs /sys
+fi
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/mountnfs.sh b/recipes/obsolete/initscripts/initscripts-openmoko/mountnfs.sh
new file mode 100644
index 0000000..2631392
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/mountnfs.sh
@@ -0,0 +1,87 @@
+#
+# mountnfs.sh	Now that TCP/IP is configured, mount the NFS file
+#		systems in /etc/fstab if needed. If possible,
+#		start the portmapper before mounting (this is needed for
+#		Linux 2.1.x and up).
+#
+#		Also mounts SBM filesystems now, so the name of
+#		this script is getting increasingly inaccurate.
+#
+# Version:	@(#)mountnfs.sh  2.83  05-Oct-2001  miquels@cistron.nl
+#
+
+. /etc/default/rcS
+
+#
+#	Run in a subshell because of I/O redirection.
+#
+test -x /sbin/portmap && test -f /etc/fstab && (
+
+#
+#	Read through fstab line by line. If it is NFS, set the flag
+#	for mounting NFS filesystems. If any NFS partition is found and it
+#	not mounted with the nolock option, we start the portmapper.
+#
+portmap=no
+mount_nfs=no
+mount_smb=no
+mount_ncp=no
+while read device mountpt fstype options
+do
+	case "$device" in
+		""|\#*)
+			continue
+			;;
+	esac
+
+	case "$options" in
+		*noauto*)
+			continue
+			;;
+	esac
+
+	if test "$fstype" = nfs
+	then
+		mount_nfs=yes
+		case "$options" in
+			*nolock*)
+				;;
+			*)
+				portmap=yes
+				;;
+		esac
+	fi
+	if test "$fstype" = smbfs
+	then
+		mount_smb=yes
+	fi
+	if test "$fstype" = ncpfs
+	then
+		mount_ncp=yes
+	fi
+done
+
+exec 0>&1
+
+if test "$portmap" = yes
+then
+	if test -x /sbin/portmap
+	then
+		echo -n "Starting portmapper... "
+		start-stop-daemon --start --quiet --exec /sbin/portmap
+		sleep 2
+	fi
+fi
+
+if test "$mount_nfs" = yes || test "$mount_smb" = yes || test "$mount_ncp" = yes
+then
+	echo "Mounting remote filesystems..."
+	test "$mount_nfs" = yes && mount -a -t nfs
+	test "$mount_smb" = yes && mount -a -t smbfs
+	test "$mount_ncp" = yes && mount -a -t ncpfs
+fi
+
+) < /etc/fstab
+
+: exit 0
+
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko/populate-volatile.sh b/recipes/obsolete/initscripts/initscripts-openmoko/populate-volatile.sh
new file mode 100644
index 0000000..6fb23d7
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko/populate-volatile.sh
@@ -0,0 +1,248 @@
+#!/bin/sh
+
+. /etc/default/rcS
+
+CFGDIR="/etc/default/volatiles"
+TMPROOT="/var/tmp"
+COREDEF="00_core"
+
+[ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
+
+create_file() {
+	EXEC="
+	touch \"$1\";
+	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
+	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
+
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
+
+	[ -e "$1" ] && {
+	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
+	} || {
+	  eval $EXEC
+	}
+}
+
+mk_dir() {
+	EXEC="
+	mkdir -p \"$1\";
+	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
+	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
+
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
+
+	[ -e "$1" ] && {
+	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
+	} || {
+	  eval $EXEC
+	}
+}
+
+link_file() {
+	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1"
+
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache
+
+	[ -e "$2" ] && {
+	  echo "Cannot create link over existing -${TNAME}-." >&2
+	} || {
+	  eval $EXEC
+	}
+}
+
+check_requirements() {
+
+  cleanup() {
+    rm "${TMP_INTERMED}"
+    rm "${TMP_DEFINED}"
+    rm "${TMP_COMBINED}"
+    }
+
+  CFGFILE="$1"
+
+  [ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
+
+  TMP_INTERMED="${TMPROOT}/tmp.$$"
+  TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
+  TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
+
+
+  cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
+  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
+
+  NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
+  NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
+
+  [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
+    echo "Undefined users:"
+    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
+    cleanup
+    return 1
+    }
+
+
+  cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
+  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
+
+  NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
+  NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
+
+  [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
+    echo "Undefined groups:"
+    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
+    cleanup
+    return 1
+    }
+
+  # Add checks for required directories here
+
+  cleanup
+  return 0
+  }
+
+apply_cfgfile() {
+
+  CFGFILE="$1"
+
+  check_requirements "${CFGFILE}" || {
+    echo "Skipping ${CFGFILE}"
+    return 1
+    }
+
+  cat ${CFGFILE} | grep -v "^#" | \
+  while read LINE; do
+
+    eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
+
+    [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
+
+
+    [ "${TTYPE}" = "l" ] && {
+      TSOURCE="$TLTARGET"
+      [ -L "${TNAME}" ] || {
+	[ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
+	link_file "${TSOURCE}" "${TNAME}"
+	}
+      continue
+      }
+
+    [ -L "${TNAME}" ] && {
+      [ "${VERBOSE}" != "no" ] && echo "Found link."
+      NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/'`
+      echo ${NEWNAME} | grep -v "^/" >/dev/null && {
+	TNAME="`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
+	[ "${VERBOSE}" != "no" ] && echo "Converted relative linktarget to absolute path -${TNAME}-."
+	} || {
+	TNAME="${NEWNAME}"
+	[ "${VERBOSE}" != "no" ] && echo "Using absolute link target -${TNAME}-."
+	}
+      }
+
+    case "${TTYPE}" in
+      "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
+	    create_file "${TNAME}"
+	    ;;
+      "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
+	    mk_dir "${TNAME}"
+	    # Add check to see if there's an entry in fstab to mount.
+	    ;;
+      *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
+	    continue
+	    ;;
+    esac
+
+
+    done
+
+  return 0
+
+  }
+
+SKEL_DIR="/etc/volatile/skel"
+
+skel_mount() {
+	VOLATILE="$1"
+
+	[ -d "$VOLATILE" ] || mkdir -p "$VOLATILE"
+
+	mount -t tmpfs volatile "$VOLATILE" -omode=0755
+}
+
+skel_load() {
+	VOLATILE="$1"
+
+	if ! skel_mount "$VOLATILE"; then
+		echo "failed to mount $VOLATILE"
+		return 1
+	fi
+
+	cp -a "$SKEL_DIR"/* "$VOLATILE"/
+}
+
+skel_update() {
+	VOLATILE="$1"
+
+	if ! skel_mount "$VOLATILE"; then
+		echo "failed to update"
+		return 1
+	fi
+
+	echo -n "Populating volatile directory..."
+	for file in `ls -1 "${CFGDIR}" | sort`; do
+		apply_cfgfile "${CFGDIR}/${file}"
+	done
+	echo "done"
+
+	if [ -d "$SKEL_DIR" ]; then
+		rm -rf "$SKEL_DIR"
+	fi
+
+	mkdir -p "$SKEL_DIR"/tmp
+	cp -a "$VOLATILE"/* "$SKEL_DIR"/
+}
+
+populate() {
+	if [ -d "$SKEL_DIR"/tmp ]; then
+		skel_load /var/volatile
+	else
+		skel_update /var/volatile
+	fi
+
+	for d in /var/volatile/*
+	do
+		ln -sf "$d" /var
+	done
+
+	if ! test -L /tmp; then
+		rm -rf /tmp
+		ln -sf /var/tmp /tmp
+	fi
+}
+
+case "$1" in
+	start)
+	if grep -q "^volatile " /proc/mounts; then
+		echo "volatile directory is already mounted"
+	else
+		populate
+	fi
+	;;
+	stop)
+	: # no-op
+	;;
+	update)
+	if skel_update /var/volatile; then
+		umount /var/volatile
+		if grep -q "^volatile " /proc/mounts; then
+			cp -a "$SKEL_DIR"/* /var/volatile
+		fi
+	fi
+	;;
+	*)
+	echo "Usage: /etc/init.d/populate-volatile {start|stop|update}"
+	;;
+esac
+
+: exit 0
diff --git a/recipes/obsolete/initscripts/initscripts-openmoko_1.0.bb b/recipes/obsolete/initscripts/initscripts-openmoko_1.0.bb
new file mode 100644
index 0000000..a1e1b7d
--- /dev/null
+++ b/recipes/obsolete/initscripts/initscripts-openmoko_1.0.bb
@@ -0,0 +1,112 @@
+DESCRIPTION = "Openmoko init scripts"
+SECTION = "base"
+PRIORITY = "required"
+LICENSE = "GPL"
+DEPENDS = ""
+RDEPENDS_${PN} = ""
+PR = "r1"
+
+RCONFLICTS_${PN} = "initscripts"
+
+SRC_URI = "file://bootmisc.sh \
+	   file://campgsm \
+	   file://checkroot.sh \
+	   file://finish.sh \
+	   file://functions \
+	   file://hostname.sh \
+	   file://led-trigger.sh \
+	   file://mountall.sh \
+	   file://mountdevsubfs.sh \
+	   file://mountkernfs.sh \
+	   file://mountnfs.sh \
+	   file://populate-volatile.sh \
+	   file://devpts \
+	   file://volatiles \
+	   file://halt \
+	   file://reboot \
+	   file://rmnologin \
+	   file://save-rtc.sh \
+	   file://sendsigs \
+	   file://umountfs \
+	   file://umountnfs.sh \
+	   "
+
+SRC_URI_append_arm = " file://alignment.sh"
+
+inherit base
+
+do_install () {
+#
+# Create directories and install device independent scripts
+#
+	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/rcS.d
+	install -d ${D}${sysconfdir}/rc0.d
+	install -d ${D}${sysconfdir}/rc1.d
+	install -d ${D}${sysconfdir}/rc2.d
+	install -d ${D}${sysconfdir}/rc3.d
+	install -d ${D}${sysconfdir}/rc4.d
+	install -d ${D}${sysconfdir}/rc5.d
+	install -d ${D}${sysconfdir}/rc6.d
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/default/volatiles
+
+	if [ "${TARGET_ARCH}" = "arm" ]; then
+		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
+	fi
+	install -m 0755	${WORKDIR}/bootmisc.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/campgsm		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/checkroot.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/finish.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/functions		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/hostname.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/led-trigger.sh	${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/mountall.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/mountnfs.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/mountdevsubfs.sh	${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/mountkernfs.sh	${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/populate-volatile.sh	${D}${sysconfdir}/init.d
+
+	install -m 0644	${WORKDIR}/devpts		${D}${sysconfdir}/default/devpts
+	install -m 0644	${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
+
+	install -m 0755	${WORKDIR}/halt			${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/reboot		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/rmnologin		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/save-rtc.sh		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/sendsigs		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/umountfs		${D}${sysconfdir}/init.d
+	install -m 0755	${WORKDIR}/umountnfs.sh		${D}${sysconfdir}/init.d
+
+#
+# Create runlevel links
+#
+	ln -sf		../init.d/hostname.sh		${D}${sysconfdir}/rcS.d/S02hostname.sh
+	ln -sf		../init.d/mountkernfs.sh	${D}${sysconfdir}/rcS.d/S02mountkernfs.sh
+	ln -sf		../init.d/mountdevsubfs.sh	${D}${sysconfdir}/rcS.d/S04mountdevsubfs.sh
+	if [ "${TARGET_ARCH}" = "arm" ]; then
+		ln -sf	../init.d/alignment.sh		${D}${sysconfdir}/rcS.d/S06alignment
+	fi
+	#ln -sf		../init.d/campgsm		${D}${sysconfdir}/rcS.d/S07campgsm
+	ln -sf		../init.d/checkroot.sh		${D}${sysconfdir}/rcS.d/S10checkroot.sh
+	ln -sf		../init.d/mountall.sh		${D}${sysconfdir}/rcS.d/S35mountall.sh
+	ln -sf		../init.d/populate-volatile.sh	${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
+	ln -sf		../init.d/mountnfs.sh		${D}${sysconfdir}/rcS.d/S45mountnfs.sh
+	ln -sf		../init.d/bootmisc.sh		${D}${sysconfdir}/rcS.d/S55bootmisc.sh
+	ln -sf		../init.d/led-trigger.sh	${D}${sysconfdir}/rcS.d/S97led-trigger.sh
+	ln -sf		../init.d/finish.sh		${D}${sysconfdir}/rcS.d/S99finish.sh
+
+	ln -sf		../init.d/rmnologin		${D}${sysconfdir}/rc5.d/S99rmnologin
+
+	ln -sf		../init.d/sendsigs		${D}${sysconfdir}/rc0.d/S20sendsigs
+	ln -sf		../init.d/save-rtc.sh		${D}${sysconfdir}/rc0.d/S25save-rtc.sh
+	ln -sf		../init.d/umountnfs.sh		${D}${sysconfdir}/rc6.d/S31umountnfs.sh
+	ln -sf		../init.d/umountfs		${D}${sysconfdir}/rc0.d/S40umountfs
+	ln -sf		../init.d/halt			${D}${sysconfdir}/rc0.d/S90halt
+
+	ln -sf		../init.d/sendsigs		${D}${sysconfdir}/rc6.d/S20sendsigs
+	ln -sf		../init.d/save-rtc.sh		${D}${sysconfdir}/rc6.d/S25save-rtc.sh
+	ln -sf		../init.d/umountnfs.sh		${D}${sysconfdir}/rc6.d/S31umountnfs.sh
+	ln -sf		../init.d/umountfs		${D}${sysconfdir}/rc6.d/S40umountfs
+	ln -sf		../init.d/reboot		${D}${sysconfdir}/rc6.d/S90reboot
+}
diff --git a/recipes/obsolete/openmoko2/openmoko-alsa-scenarios_svn.bb b/recipes/obsolete/openmoko2/openmoko-alsa-scenarios_svn.bb
new file mode 100644
index 0000000..315ea4d
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-alsa-scenarios_svn.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Package for the different scenarios used by Openmoko"
+SECTION = "openmoko/base"
+SRCREV = "4732"
+PV = "1.0+svnr${SRCPV}"
+PR = "r2"
+
+PROVIDES = "virtual/alsa-scenarios"
+
+COMPATIBLE_MACHINE = "(om-gta01|om-gta02)"
+
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target/audio/;module=om-gta01;proto=http"
+SRC_URI_${MACHINE_ARCH} = "svn://svn.openmoko.org/trunk/src/target/audio/;module=${MACHINE_ARCH};proto=http"
+
+S = "${WORKDIR}/${MACHINE_ARCH}"
+
+do_install() {
+    install -d ${D}${datadir}/openmoko/scenarios/
+    install -m 644 ${S}/*.state ${D}${datadir}/openmoko/scenarios/
+    install -d ${D}${sysconfdir}/
+    install -m 644 ${S}/stereoout.state ${D}${sysconfdir}/asound.state
+}
+
+PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+
+FILES_${PN} += "${datadir}/openmoko"
diff --git a/recipes/obsolete/psplash/psplash-openmoko_svn.bb b/recipes/obsolete/psplash/psplash-openmoko_svn.bb
new file mode 100644
index 0000000..9c675b4
--- /dev/null
+++ b/recipes/obsolete/psplash/psplash-openmoko_svn.bb
@@ -0,0 +1,20 @@
+require psplash.inc
+require psplash-ua.inc
+
+ALTERNATIVE_PRIORITY = "30"
+
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
+# respectively psplash-bar-img.h (BAR) for the bar.
+# You might also want to patch the colors (see patch)
+
+SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+          file://logo-math.patch \
+          file://psplash-poky-img.h \
+          file://psplash-bar-img.h \
+          file://psplash-default \
+          file://psplash-init"
+S = "${WORKDIR}/psplash"
+
+SRC_URI_append_openmoko = " file://configurability.patch "
diff --git a/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb b/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb
deleted file mode 100644
index 315ea4d..0000000
--- a/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Package for the different scenarios used by Openmoko"
-SECTION = "openmoko/base"
-SRCREV = "4732"
-PV = "1.0+svnr${SRCPV}"
-PR = "r2"
-
-PROVIDES = "virtual/alsa-scenarios"
-
-COMPATIBLE_MACHINE = "(om-gta01|om-gta02)"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target/audio/;module=om-gta01;proto=http"
-SRC_URI_${MACHINE_ARCH} = "svn://svn.openmoko.org/trunk/src/target/audio/;module=${MACHINE_ARCH};proto=http"
-
-S = "${WORKDIR}/${MACHINE_ARCH}"
-
-do_install() {
-    install -d ${D}${datadir}/openmoko/scenarios/
-    install -m 644 ${S}/*.state ${D}${datadir}/openmoko/scenarios/
-    install -d ${D}${sysconfdir}/
-    install -m 644 ${S}/stereoout.state ${D}${sysconfdir}/asound.state
-}
-
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
-
-FILES_${PN} += "${datadir}/openmoko"
diff --git a/recipes/psplash/psplash-openmoko_svn.bb b/recipes/psplash/psplash-openmoko_svn.bb
deleted file mode 100644
index 9c675b4..0000000
--- a/recipes/psplash/psplash-openmoko_svn.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require psplash.inc
-require psplash-ua.inc
-
-ALTERNATIVE_PRIORITY = "30"
-
-# You can create your own pslash-poky-img.h by doing
-# ./make-image-header.sh <file>.png POKY
-# and rename the resulting .h to pslash-poky-img.h (for the logo)
-# respectively psplash-bar-img.h (BAR) for the bar.
-# You might also want to patch the colors (see patch)
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://logo-math.patch \
-          file://psplash-poky-img.h \
-          file://psplash-bar-img.h \
-          file://psplash-default \
-          file://psplash-init"
-S = "${WORKDIR}/psplash"
-
-SRC_URI_append_openmoko = " file://configurability.patch "
-- 
1.7.3.1



