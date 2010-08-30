Received: from mail.infocentr.ru ([78.108.66.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1Oq7XH-0004Ec-EY
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:48:48 +0200
Received: from localhost.localdomain (unknown [192.168.62.150])
	by mail.infocentr.ru (Postfix) with ESMTP id 33920B0016E0;
	Mon, 30 Aug 2010 22:48:07 +0600 (YEKST)
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 22:47:57 +0600
Message-Id: <1283186879-971-2-git-send-email-norguhtar@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1283186879-971-1-git-send-email-norguhtar@gmail.com>
References: <1283186879-971-1-git-send-email-norguhtar@gmail.com>
X-SA-Exim-Connect-IP: 78.108.66.4
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL, BAYES_00, FB_CIALIS_LEO3,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3 2/4] Add rc init files for upstart sysvcompat
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
X-List-Received-Date: Mon, 30 Aug 2010 16:48:49 -0000

* Add rc, rcS and rcS-default from sysvinit recipe directory, for upstart-sysvcompat

Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
---
 recipes/upstart/files/init/rc          |  102 ++++++++++++++++++++++++++++
 recipes/upstart/files/init/rcS         |  113 ++++++++++++++++++++++++++++++++
 recipes/upstart/files/init/rcS-default |   25 +++++++
 3 files changed, 240 insertions(+), 0 deletions(-)
 create mode 100755 recipes/upstart/files/init/rc
 create mode 100755 recipes/upstart/files/init/rcS
 create mode 100644 recipes/upstart/files/init/rcS-default

diff --git a/recipes/upstart/files/init/rc b/recipes/upstart/files/init/rc
new file mode 100755
index 0000000..fdb0fce
--- /dev/null
+++ b/recipes/upstart/files/init/rc
@@ -0,0 +1,102 @@
+#!/bin/sh
+#
+# rc		This file is responsible for starting/stopping
+#		services when the runlevel changes.
+#
+#		Optimization feature:
+#		A startup script is _not_ run when the service was
+#		running in the previous runlevel and it wasn't stopped
+#		in the runlevel transition (most Debian services don't
+#		have K?? links in rc{1,2,3,4,5} )
+#
+# Author:	Miquel van Smoorenburg <miquels@cistron.nl>
+#		Bruce Perens <Bruce@Pixar.com>
+#
+# Version:	@(#)rc  2.78  07-Nov-1999  miquels@cistron.nl
+#
+
+. /etc/default/rcS
+export VERBOSE
+
+#
+# Start script or program.
+#
+startup() {
+  case "$1" in
+	*.sh)
+		sh "$@"
+		;;
+	*)
+		"$@"
+		;;
+  esac
+}
+
+  # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
+  trap ":" INT QUIT TSTP
+
+  # Set onlcr to avoid staircase effect.
+  stty onlcr 0>&1
+
+  # Now find out what the current and what the previous runlevel are.
+
+  runlevel=$RUNLEVEL
+  # Get first argument. Set new runlevel to this argument.
+  [ "$1" != "" ] && runlevel=$1
+  if [ "$runlevel" = "" ]
+  then
+	echo "Usage: $0 <runlevel>" >&2
+	exit 1
+  fi
+  previous=$PREVLEVEL
+  [ "$previous" = "" ] && previous=N
+
+  export runlevel previous
+
+  # Is there an rc directory for this new runlevel?
+  if [ -d /etc/rc$runlevel.d ]
+  then
+	# First, run the KILL scripts.
+	if [ $previous != N ]
+	then
+		for i in /etc/rc$runlevel.d/K[0-9][0-9]*
+		do
+			# Check if the script is there.
+			[ ! -f $i ] && continue
+
+			# Stop the service.
+			startup $i stop
+		done
+	fi
+	# Now run the START scripts for this runlevel.
+	for i in /etc/rc$runlevel.d/S*
+	do
+		[ ! -f $i ] && continue
+
+		if [ $previous != N ] && [ $previous != S ]
+		then
+			#
+			# Find start script in previous runlevel and
+			# stop script in this runlevel.
+			#
+			suffix=${i#/etc/rc$runlevel.d/S[0-9][0-9]}
+			stop=/etc/rc$runlevel.d/K[0-9][0-9]$suffix
+			previous_start=/etc/rc$previous.d/S[0-9][0-9]$suffix
+			#
+			# If there is a start script in the previous level
+			# and _no_ stop script in this level, we don't
+			# have to re-start the service.
+			#
+			[ -f $previous_start ] && [ ! -f $stop ] && continue
+		fi
+		case "$runlevel" in
+			0|6)
+				startup $i stop
+				;;
+			*)
+				startup $i start
+				;;
+		esac
+	done
+  fi
+# eof /etc/init.d/rc
diff --git a/recipes/upstart/files/init/rcS b/recipes/upstart/files/init/rcS
new file mode 100755
index 0000000..15b90f7
--- /dev/null
+++ b/recipes/upstart/files/init/rcS
@@ -0,0 +1,113 @@
+#!/bin/sh
+#
+# rcS		Call all S??* scripts in /etc/rcS.d in
+#		numerical/alphabetical order.
+#
+# Version:	@(#)/etc/init.d/rcS  2.76  19-Apr-1999  miquels@cistron.nl
+#
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+runlevel=S
+prevlevel=N
+umask 022
+export PATH runlevel prevlevel
+
+#	Make sure proc is mounted
+#
+[ -d "/proc/1" ] || mount proc /proc -t proc
+
+#	Make sure sys is mounted
+[ -d "/sys/kernel" ] || mount sysfs /sys -t sysfs
+
+#
+#	See if system needs to be setup. This is ONLY meant to
+#	be used for the initial setup after a fresh installation!
+#
+if [ -x /sbin/unconfigured.sh ]
+then
+  /sbin/unconfigured.sh
+fi
+
+#
+#	Source defaults.
+#
+. /etc/default/rcS
+
+#
+#	Trap CTRL-C &c only in this shell so we can interrupt subprocesses.
+#
+trap ":" INT QUIT TSTP
+
+#
+#       Do we have /proc/progress and set VERBOSE to "no" ?
+#       If so, calculate the number of scripts and the incremental step
+#
+if [ "$VERBOSE" = no ]; then
+    if [ -e /proc/progress ]; then
+        set `ls -1 /etc/rc$runlevel.d/S* | wc`
+        numscripts=$1
+        PROGRESS_incstep=`expr 90 / $1`
+        PROGRESS_value=10
+        PROGRESS=yes
+        export PROGRESS_value PROGRESS_incstep
+    fi
+fi
+export VERBOSE PROGRESS
+
+#
+#	Call all parts in order.
+#
+for i in /etc/rcS.d/S??*
+do
+	# Ignore dangling symlinks for now.
+	[ ! -f "$i" ] && continue
+
+	# Handle verbosity
+	[ "$VERBOSE" = very ] && echo "INIT: Running $i..."
+	if [ "$PROGRESS" = yes ]; then
+		export PROGRESS_value=`expr $PROGRESS_value + $PROGRESS_incstep`
+		echo "$PROGRESS_value Starting $i..." >/proc/progress
+	fi
+
+	case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set start
+				. $i
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			$i start
+			;;
+	esac
+
+        #
+        # Report status based on result code
+        #
+        result=$?
+        if [ "$PROGRESS" = yes ]; then
+                if [ "$result" = 0 ]; then
+                    echo "=s" >/proc/progress
+                else
+                    echo "=f" >/proc/progress
+                fi
+        fi
+done
+
+#
+#	For compatibility, run the files in /etc/rc.boot too.
+#
+[ -d /etc/rc.boot ] && run-parts /etc/rc.boot
+
+#
+#	Finish setup if needed. The comment above about
+#	/sbin/unconfigured.sh applies here as well!
+#
+if [ -x /sbin/setup.sh ]
+then
+  /sbin/setup.sh
+fi
+
diff --git a/recipes/upstart/files/init/rcS-default b/recipes/upstart/files/init/rcS-default
new file mode 100644
index 0000000..7ad3c7b
--- /dev/null
+++ b/recipes/upstart/files/init/rcS-default
@@ -0,0 +1,25 @@
+#
+#	Defaults for the boot scripts in /etc/rcS.d
+#
+
+# Time files in /tmp are kept in days.
+TMPTIME=0
+# Set to yes if you want sulogin to be spawned on bootup
+SULOGIN=no
+# Set to no if you want to be able to login over telnet/rlogin
+# before system startup is complete (as soon as inetd is started)
+DELAYLOGIN=no
+# Set UTC=yes if your system clock is set to UTC (GMT), and UTC=no if not.
+# UTC=yes
+# Set VERBOSE to "no" if you would like a more quiet bootup.
+VERBOSE=no
+# Set EDITMOTD to "no" if you don't want /etc/motd to be editted automatically
+EDITMOTD=no
+# Whether to fsck root on boot
+ENABLE_ROOTFS_FSCK=no
+# Set FSCKFIX to "yes" if you want to add "-y" to the fsck at startup.
+FSCKFIX=yes
+# Set TICKADJ to the correct tick value for this specific machine
+#TICKADJ=10000
+# Enable caching in populate-volatile.sh
+VOLATILE_ENABLE_CACHE=yes
-- 
1.6.0.6



