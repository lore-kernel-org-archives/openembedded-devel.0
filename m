Return-Path: <B40290@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0185.outbound.messaging.microsoft.com [213.199.154.185])
	by mail.openembedded.org (Postfix) with ESMTP id F174E6C856
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:11:23 +0000 (UTC)
Received: from mail212-db8-R.bigfish.com (10.174.8.254) by
	DB8EHSOBE017.bigfish.com (10.174.4.80) with Microsoft SMTP Server id
	14.1.225.22; Wed, 16 Oct 2013 07:11:24 +0000
Received: from mail212-db8 (localhost [127.0.0.1])	by
	mail212-db8-R.bigfish.com (Postfix) with ESMTP id 8F231360117	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:11:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eI13e6Kc8kzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275dh6d523h1de097h186068h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail212-db8 (localhost.localdomain [127.0.0.1]) by mail212-db8
	(MessageSwitch) id 1381907483138840_1138;
	Wed, 16 Oct 2013 07:11:23 +0000 (UTC)
Received: from DB8EHSMHS030.bigfish.com (unknown [10.174.8.249])	by
	mail212-db8.bigfish.com (Postfix) with ESMTP id 1C54A4C0031	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:11:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS030.bigfish.com
	(10.174.4.40) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 16 Oct 2013 07:11:22 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 16 Oct 2013 07:11:20 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9G7BHpv017199;	Wed, 16 Oct 2013 00:11:18 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Oct 2013 15:11:13 +0800
Message-ID: <1381907473-16769-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH 1/3] snort : add recipe
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
X-List-Received-Date: Wed, 16 Oct 2013 07:11:25 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *snort - a free lightweight network intrusion detection
                system for UNIX and Windows

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-connectivity/snort/files/default       |   42 ++
 .../snort/files/disable-dap-address-space-id.patch |   52 +++
 .../snort/files/disable-inaddr-none.patch          |   75 ++++
 .../recipes-connectivity/snort/files/logrotate     |   12 +
 .../recipes-connectivity/snort/files/snort.init    |  425 ++++++++++++++++++++
 .../recipes-connectivity/snort/files/volatiles     |    2 +
 .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   83 ++++
 7 files changed, 691 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/files/default
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/files/logrotate
 create mode 100755 meta-networking/recipes-connectivity/snort/files/snort.init
 create mode 100644 meta-networking/recipes-connectivity/snort/files/volatiles
 create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb

diff --git a/meta-networking/recipes-connectivity/snort/files/default b/meta-networking/recipes-connectivity/snort/files/default
new file mode 100644
index 0000000..afd3840
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/default
@@ -0,0 +1,42 @@
+# Parameters for the daemon
+# Add any additional parameteres here.
+PARAMS="-m 027 -D -d "
+#
+# Snort user
+# This user will be used to launch snort. Notice that the 
+# preinst script of the package might do changes to the user 
+# (home directory, User Name) when the package is upgraded or
+# reinstalled.  So, do *not* change this to 'root' or to any other user 
+# unless you are sure there is no problem with those changes being introduced.
+# 
+SNORTUSER="snort"
+#
+# Logging directory
+# Snort logs will be dropped here and this will be the home
+# directory for the SNORTUSER. If you change this value you should
+# change the /etc/logrotate.d/snort definition too, otherwise logs
+# will not be rotated properly.
+#
+LOGDIR="/var/log/snort"
+#
+# Snort group
+# This is the group that the snort user will be added to.
+#
+SNORTGROUP="snort"
+# 
+# Allow Snort's init.d script to work if the configured interfaces
+# are not available. Set this to yes if you configure Snort with
+# multiple interfaces but some might not be available on boot
+# (e.g. wireless interfaces)
+# 
+# Note: In order for this to work the 'iproute' package needs to 
+# be installed.
+ALLOW_UNAVAILABLE="no"
+
+# Local configs
+#
+LOCAL_SNORT_STARTUP=boot
+LOCAL_SNORT_HOME_NET="192.168.0.0/16"
+LOCAL_SNORT_INTERFACE=""
+LOCAL_SNORT_STATS_RCPT="root"
+LOCAL_SNORT_STATS_THRESHOLD="1"
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch b/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
new file mode 100644
index 0000000..39e5c9c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
@@ -0,0 +1,52 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for dap address space id... configure: 
+configure: error: cannot run test program while cross compiling
+
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
+@@ -679,23 +679,23 @@
+ 
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
+ 
+-AC_MSG_CHECKING([for daq address space ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.address_space_id = 0;
+-]])],
+-[have_daq_address_space_id="yes"],
+-[have_daq_address_space_id="no"])
+-AC_MSG_RESULT($have_daq_address_space_id)
+-if test "x$have_daq_address_space_id" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+-        [DAQ version supports address space ID in header.])
+-fi
++#AC_MSG_CHECKING([for daq address space ID])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_PktHdr_t hdr;
++#   hdr.address_space_id = 0;
++#]])],
++have_daq_address_space_id="yes"
++#[have_daq_address_space_id="no"])
++#AC_MSG_RESULT($have_daq_address_space_id)
++#if test "x$have_daq_address_space_id" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
++#        [DAQ version supports address space ID in header.])
++#fi
+ 
+ # any sparc platform has to have this one defined.
+ AC_MSG_CHECKING(for sparc)
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
new file mode 100644
index 0000000..9dafe63
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
@@ -0,0 +1,75 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+fix the below error:
+checking for INADDR_NONE... configure:
+configure: error: cannot run test program while cross compiling
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+
+--- a/configure.in	2013-08-21 03:56:17.197414789 -0500
++++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
+@@ -281,25 +281,7 @@
+ AC_CHECK_TYPES([boolean])
+ 
+ # In case INADDR_NONE is not defined (like on Solaris)
+-have_inaddr_none="no"
+-AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-]],
+-[[
+-	if (inet_addr("10,5,2") == INADDR_NONE);
+-    return 0;
+-]])],
+-[have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
+-AC_MSG_RESULT($have_inaddr_none)
+-if test "x$have_inaddr_none" = "xno"; then
+-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+-fi
++have_inaddr_none="yes"
+ 
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include <stdio.h>
+@@ -397,21 +379,21 @@
+   fi
+ fi
+ 
+-AC_MSG_CHECKING([for pcap_lex_destroy])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <pcap.h>
+-]],
+-[[
+-   pcap_lex_destroy();
+-]])],
+-[have_pcap_lex_destroy="yes"],
+-[have_pcap_lex_destroy="no"])
+-AC_MSG_RESULT($have_pcap_lex_destroy)
+-if test "x$have_pcap_lex_destroy" = "xyes"; then
+-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
+-fi
++#AC_MSG_CHECKING([for pcap_lex_destroy])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <pcap.h>
++#]],
++#[[
++#   pcap_lex_destroy();
++#]])],
++have_pcap_lex_destroy="yes"
++#[have_pcap_lex_destroy="no"])
++#AC_MSG_RESULT($have_pcap_lex_destroy)
++#if test "x$have_pcap_lex_destroy" = "xyes"; then
++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
++#fi
+ 
+ AC_MSG_CHECKING([for pcap_lib_version])
+ AC_LINK_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/files/logrotate b/meta-networking/recipes-connectivity/snort/files/logrotate
new file mode 100644
index 0000000..e394e2e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/logrotate
@@ -0,0 +1,12 @@
+/var/log/snort/*.log /var/log/snort/alert {
+    size 1M
+    missingok
+    compress
+    delaycompress
+    rotate 10
+    sharedscripts
+    postrotate
+    /etc/init.d/snort restart
+    endscript
+}
+
diff --git a/meta-networking/recipes-connectivity/snort/files/snort.init b/meta-networking/recipes-connectivity/snort/files/snort.init
new file mode 100755
index 0000000..af66619
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/snort.init
@@ -0,0 +1,425 @@
+#!/bin/sh -e
+#
+# Init.d script for Snort in OpenEmbedded, based on Debian's script
+#
+# Copyright (c) 2009 Roman I Khimov <khimov@altell.ru>
+#
+# Copyright (c) 2001 Christian Hammers 
+# Copyright (c) 2001-2002 Robert van der Meulen
+# Copyright (c) 2002-2004 Sander Smeenk <ssmeenk@debian.org>
+# Copyright (c) 2004-2007 Javier Fernandez-Sanguino <jfs@debian.org>
+#
+# This is free software; you may redistribute it and/or modify
+# it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; either version 2,
+# or (at your option) any later version.
+#
+# This is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License with
+# the Debian operating system, in /usr/share/common-licenses/GPL;  if
+# not, write to the Free Software Foundation, Inc., 59 Temple Place,
+# Suite 330, Boston, MA 02111-1307 USA
+#
+### BEGIN INIT INFO
+# Provides:          snort
+# Required-Start:    $time $network $local_fs
+# Required-Stop:     
+# Should-Start:      $syslog
+# Should-Stop:       
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Lightweight network intrusion detection system
+# Description:       Intrusion detection system that will
+#                    capture traffic from the network cards and will
+#                    match against a set of known attacks.
+### END INIT INFO
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+
+test $DEBIAN_SCRIPT_DEBUG && set -v -x
+
+DAEMON=/usr/bin/snort
+NAME=snort
+DESC="Network Intrusion Detection System"
+
+. /etc/default/snort
+COMMON="$PARAMS -l $LOGDIR -u $SNORTUSER -g $SNORTGROUP"
+
+test -x $DAEMON || exit 0
+test -z "$LOCAL_SNORT_HOME_NET" && LOCAL_SNORT_HOME_NET="192.168.0.0/16"
+
+# to find the lib files
+cd /etc/snort
+
+running()
+{
+        PIDFILE=$1
+# No pidfile, probably no daemon present
+        [ ! -f "$PIDFILE" ] && return 1
+        pid=`cat $PIDFILE`
+# No pid, probably no daemon present
+        [ -z "$pid" ] && return 1
+        [ ! -d /proc/$pid ] &&  return 1
+        cmd=`cat /proc/$pid/cmdline | tr "\000" "\n"|head -n 1 |cut -d : -f 1`
+# No daemon
+        [ "$cmd" != "$DAEMON" ] &&  return 1
+        return 0
+}
+
+
+check_log_dir() {
+# Does the logging directory belong to Snort?
+	# If we cannot determine the logdir return without error
+	# (we will not check it)
+	# This will only be used by people using /etc/default/snort
+	[ -n "$LOGDIR" ] || return 0
+	[ -n "$SNORTUSER" ] || return 0
+	if [ ! -e "$LOGDIR" ] ; then
+		echo "ERR: logging directory $LOGDIR does not exist"
+		return 1
+	elif [ ! -d "$LOGDIR" ] ; then
+		echo "ERR: logging directory $LOGDIR does not exist"
+		return 1
+	else
+		# Don't worry, be happy
+		true
+	fi
+	return 0
+}
+
+check_root()  {
+    if [ "$(id -u)" != "0" ]; then
+        echo "You must be root to start, stop or restart $NAME."
+        exit 4
+    fi
+}
+
+case "$1" in
+  start)
+        check_root
+	echo "Starting $DESC " "$NAME"
+
+        if [ -e /etc/snort/db-pending-config ] ; then
+		echo "/etc/snort/db-pending-config file found"
+		echo "Snort will not start as its database is not yet configured."
+		echo "Please configure the database as described in"
+		echo "/usr/share/doc/snort-{pgsql,mysql}/README-database.Debian"
+		echo "and remove /etc/snort/db-pending-config"
+		exit 6
+	fi
+
+        if ! check_log_dir; then
+		echo " will not start $DESC!"
+		exit 5
+	fi
+	if [ "$LOCAL_SNORT_STARTUP" = "dialup" ]; then
+		shift
+		set +e
+		/etc/ppp/ip-up.d/snort "$@"
+		ret=$?
+                if  [ $ret -eq 0 ] ; then
+                  echo 0
+                else
+                  echo 1
+                fi
+		exit $ret
+	fi
+
+	# Usually, we start all interfaces
+	interfaces="$LOCAL_SNORT_INTERFACE"
+
+	# If we are requested to start a specific interface...
+	test "$2" && interfaces="$2"
+
+        # If the interfaces list is empty stop (no error)
+        if [ -z "$interfaces" ] ; then
+            echo "no interfaces configured, will not start"
+            echo 0
+            exit 0
+        fi
+
+	myret=0
+	got_instance=0
+	for interface in $interfaces; do
+		got_instance=1
+		echo "($interface"
+
+                # Check if the interface is available:
+                # - only if iproute is available
+                # - the interface exists 
+                # - the interface is up
+                if ! [ -x /sbin/ip ] || ( ip link show dev "$interface" >/dev/null 2>&1 && [ -n "`ip link show up "$interface" 2>/dev/null`" ] ) ; then
+
+		PIDFILE=/var/run/snort_$interface.pid
+                CONFIGFILE=/etc/snort/snort.$interface.conf
+
+                # Defaults:
+		fail="failed (check /var/log/syslog and /var/log/snort)"
+                run="yes"
+
+                if [ -e "$PIDFILE" ] && running $PIDFILE; then
+                        run="no" 
+                        # Do not start this instance, it is already runing
+                fi
+
+                if [ "$run" = "yes" ] ; then
+                    if [ ! -e "$CONFIGFILE" ]; then
+                        echo "no /etc/snort/snort.$interface.conf found, defaulting to snort.conf"
+                        CONFIGFILE=/etc/snort/snort.conf
+                    fi
+
+                    set +e
+                    /sbin/start-stop-daemon --start --quiet  \
+                        --pidfile "$PIDFILE" \
+                        --exec $DAEMON -- $COMMON $LOCAL_SNORT_OPTIONS \
+                        -c $CONFIGFILE \
+                        -S "HOME_NET=[$LOCAL_SNORT_HOME_NET]" \
+                        -i $interface >/dev/null
+                    ret=$?
+                    case "$ret" in
+			0)
+                                echo  "...done)"
+				;;
+			*)
+				echo "...ERROR: $fail)"
+				myret=$(expr "$myret" + 1)
+				;;
+                     esac
+                     set -e
+                else
+                        echo "...already running)"
+                fi
+
+                else
+                # What to do if the interface is not available
+                # or is not up
+                        if [ "$ALLOW_UNAVAILABLE" != "no" ] ; then 
+                            echo "...interface not available)"
+                        else 
+                            echo "...ERROR: interface not available)"
+                            myret=$(expr "$myret" + 1)
+                        fi
+                fi
+	done
+
+	if [ "$got_instance" = 0 ] && [ "$ALLOW_UNAVAILABLE" = "no" ]; then
+		echo "No snort instance found to be started!" >&2
+		exit 6
+	fi
+
+        if  [ $myret -eq 0 ] ; then
+            echo 0
+        else
+            echo 1
+        fi
+	exit $myret
+	;;
+  stop)
+        check_root
+        echo "Stopping $DESC " "$NAME"
+    
+	if [ "$LOCAL_SNORT_STARTUP" = "dialup" ]; then
+		shift
+		set +e
+		/etc/ppp/ip-down.d/snort "$@"
+		ret=$?
+                if  [ $ret -eq 0 ] ; then
+                    echo 0
+                else
+                  echo 1
+                fi
+		exit $ret
+	fi
+
+	# Usually, we stop all current running interfaces
+	pidpattern=/var/run/snort_*.pid
+
+	# If we are requested to stop a specific interface...
+	test "$2" && pidpattern=/var/run/snort_"$2".pid
+
+	got_instance=0
+        myret=0
+	for PIDFILE in $pidpattern; do
+		# This check is also needed, if the above pattern doesn't match
+		test -f "$PIDFILE" || continue
+
+		got_instance=1
+		interface=$(basename "$PIDFILE" .pid | sed -e 's/^snort_//')
+
+		echo "($interface"
+
+		set +e
+                if [ ! -e "$PIDFILE" -o -r "$PIDFILE" ] ; then
+# Change ownership of the pidfile
+		    /sbin/start-stop-daemon --stop --retry 5 --quiet --oknodo \
+			--pidfile "$PIDFILE" --exec $DAEMON >/dev/null
+                    ret=$?
+                    rm -f "$PIDFILE"
+                    rm -f "$PIDFILE.lck"
+                else
+                     echo "cannot read $PIDFILE"
+                     ret=4
+                fi
+		case "$ret" in
+			0)
+                                echo  "...done)"
+				;;
+			*)
+				echo "...ERROR)"
+				myret=$(expr "$myret" + 1)
+				;;
+		esac
+                set -e
+
+	done
+
+	if [ "$got_instance" = 0 ]; then
+		log_warning_msg "No running snort instance found"
+                exit 0 # LSB demands we don't exit with error here
+	fi
+        if  [ $myret -eq 0 ] ; then
+            echo 0
+        else
+            echo 1
+        fi
+	exit $myret
+	;;
+  restart|force-restart|reload|force-reload)
+        check_root
+	# Usually, we restart all current running interfaces
+	pidpattern=/var/run/snort_*.pid
+
+	# If we are requested to restart a specific interface...
+	test "$2" && pidpattern=/var/run/snort_"$2".pid
+
+	got_instance=0
+	for PIDFILE in $pidpattern; do
+		# This check is also needed, if the above pattern doesn't match
+		test -f "$PIDFILE" || continue
+
+		got_instance=1
+		interface=$(basename "$PIDFILE" .pid | sed -e 's/^snort_//')
+		$0 stop $interface || true
+		$0 start $interface || true
+	done
+
+	if [ "$got_instance" = 0 ]; then
+		echo "No snort instance found to be stopped!" >&2
+                exit 6
+	fi
+	;;
+  status)
+# Non-root users can use this (if allowed to)
+        echo "Status of snort daemon(s)"
+	interfaces="$LOCAL_SNORT_INTERFACE"
+	# If we are requested to check for a specific interface...
+	test "$2" && interfaces="$2"
+        err=0
+        pid=0
+	for interface in $interfaces; do
+                echo " $interface "
+                pidfile=/var/run/snort_$interface.pid
+                if [ -f  "$pidfile" ] ; then
+                        if [ -r "$pidfile" ] ; then
+                            pidval=`cat $pidfile`
+                            pid=$(expr "$pid" + 1)
+                            if ps -p $pidval | grep -q snort; then
+                                echo "OK"
+                            else
+				echo "ERROR"
+				err=$(expr "$err" + 1)
+			    fi
+                         else
+	       		     echo "ERROR: cannot read status file"
+                             err=$(expr "$err" + 1)
+                         fi
+                 else
+                       echo "ERROR"
+                       err=$(expr "$err" + 1)
+                 fi
+        done
+        if [ $err -ne 0 ] ; then
+            if [ $pid -ne 0 ] ; then
+# More than one case where pidfile exists but no snort daemon
+# LSB demands a '1' exit value here
+                echo  1
+                exit 1
+            else
+# No pidfiles at all
+# LSB demands a '3' exit value here
+                echo  3
+                exit 3
+            fi
+        fi
+        echo  0
+        ;;
+  config-check)
+        echo "Checking $DESC configuration" 
+	if [ "$LOCAL_SNORT_STARTUP" = "dialup" ]; then
+		echo "Config-check is currently not supported for snort in Dialup configuration"
+                echo  3
+                exit 3
+	fi
+
+	# usually, we test all interfaces
+	interfaces="$LOCAL_SNORT_INTERFACE"
+	# if we are requested to test a specific interface...
+	test "$2" && interfaces="$2"
+
+	myret=0
+	got_instance=0
+	for interface in $interfaces; do
+		got_instance=1
+		echo "interface $interface"
+
+		CONFIGFILE=/etc/snort/snort.$interface.conf
+		if [ ! -e "$CONFIGFILE" ]; then
+			CONFIGFILE=/etc/snort/snort.conf
+		fi
+		COMMON=`echo $COMMON | sed -e 's/-D//'`
+		set +e
+                fail="INVALID"
+		if [ -r "$CONFIGFILE" ]; then
+                    $DAEMON -T $COMMON $LOCAL_SNORT_OPTIONS \
+			-c $CONFIGFILE \
+			-S "HOME_NET=[$LOCAL_SNORT_HOME_NET]" \
+			-i $interface >/dev/null 2>&1
+                    ret=$?
+                else
+                    fail="cannot read $CONFIGFILE"
+                    ret=4
+                fi
+		set -e
+
+		case "$ret" in
+			0)
+                                echo "OK"
+				;;
+			*)
+                                echo "$fail"
+				myret=$(expr "$myret" + 1)
+				;;
+		esac
+	done
+	if [ "$got_instance" = 0 ]; then
+		echo "no snort instance found to be started!" >&2
+		exit 6
+	fi
+
+        if  [ $myret -eq 0 ] ; then
+            echo 0
+        else
+            echo 1
+        fi
+	exit $myret
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-restart|reload|force-reload|status|config-check}"
+	exit 1
+	;;
+esac
+exit 0
diff --git a/meta-networking/recipes-connectivity/snort/files/volatiles b/meta-networking/recipes-connectivity/snort/files/volatiles
new file mode 100644
index 0000000..0f22f9b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/volatiles
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d snort snort 0755 /var/log/snort none
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
new file mode 100644
index 0000000..c72b49b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
@@ -0,0 +1,83 @@
+DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
+HOMEPAGE = "http://www.snort.org/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
+
+DEPENDS = "libpcap libpcre daq libdnet"
+
+
+SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+            file://disable-inaddr-none.patch \
+            file://disable-dap-address-space-id.patch \ 
+            file://snort.init \
+            file://default \
+            file://logrotate \
+            file://volatiles"
+
+SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd"
+SRC_URI[tarball.sha256sum] = "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc"
+
+inherit autotools  gettext 
+
+EXTRA_OECONF = " \
+	--enable-gre \    
+	--enable-linux-smp-stats \
+	--enable-reload \
+	--enable-reload-error-restart \
+	--enable-targetbased \
+	--disable-static-daq \
+	"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/snort/rules
+	install -d ${D}/${sysconfdir}/snort/preproc_rules
+	install -d ${D}/${sysconfdir}/default/volatiles
+	mkdir -p ${D}/${sysconfdir}/init.d
+	for i in map config conf dtd; do
+		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
+	done
+	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
+	install -m 0644 ${WORKDIR}/default ${D}/${sysconfdir}/default/snort
+	install -m 0644 ${WORKDIR}/volatiles ${D}/${sysconfdir}/default/volatiles/snort
+	install -m 0755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
+	mkdir -p ${D}/${localstatedir}/log/snort
+	install -d ${D}${sysconfdir}/logrotate.d
+	install -m 0644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/snort
+}
+
+pkg_postinst_${PN}() {
+	${sysconfdir}/init.d/populate-volatile.sh update
+}
+
+PACKAGES =+ "${PN}-logrotate"
+FILES_${PN}-logrotate = "${sysconfdir}/logrotate.d/snort"
+FILES_${PN} += " \
+	${libdir}/snort_dynamicengine/*.so.* \
+	${libdir}/snort_dynamicpreprocessor/*.so.* \
+	${libdir}/snort_dynamicrules/*.so.* \
+	"
+FILES_${PN}-dbg += " \
+	${libdir}/snort_dynamicengine/.debug \
+	${libdir}/snort_dynamicpreprocessor/.debug \
+	${libdir}/snort_dynamicrules/.debug \
+	"
+FILES_${PN}-staticdev += " \
+	${libdir}/snort_dynamicengine/*.a \
+	${libdir}/snort_dynamicpreprocessor/*.a \
+	${libdir}/snort_dynamicrules/*.a \
+	${libdir}/snort/dynamic_preproc/*.a \
+	${libdir}/snort/dynamic_output/*.a \
+	"
+FILES_${PN}-dev += " \
+	${libdir}/snort_dynamicengine/*.la \
+	${libdir}/snort_dynamicpreprocessor/*.la \
+	${libdir}/snort_dynamicrules/*.la \
+	${libdir}/snort_dynamicengine/*.so \
+	${libdir}/snort_dynamicpreprocessor/*.so \
+	${libdir}/snort_dynamicrules/*.so \
+	${prefix}/src/snort_dynamicsrc \
+	"
+
+RRECOMMENDS_${PN} += "${PN}-logrotate"
+RRECOMMENDS_${PN} += "barnyard"
+RSUGGESTS_${PN}-logrotate += "logrotate"
-- 
1.7.5.4



