Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBBC72646
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 08:30:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45602861"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Dec 2014 16:27:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBM8UC4N031403
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 16:30:12 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 22 Dec 2014 16:30:42 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Dec 2014 16:30:23 +0800
Message-ID: <1419237023-27713-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] fedora-initscripts: Add new recipe
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
X-List-Received-Date: Mon, 22 Dec 2014 08:30:47 -0000
Content-Type: text/plain

The initscripts package contains the basic system scripts used to boot your
Red Hat or Fedora system, change runlevels, and shut the system down cleanly.
Initscripts also contains the scripts that activate and deactivate most
network interfaces.

Port from Fedora 20.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../fedora-initscripts/0001-Disable-NLS.patch      |  37 +++++
 .../fedora-initscripts/0002-Do-not-chown.patch     |  28 ++++
 .../fedora-initscripts/netconsole.init             | 140 +++++++++++++++++
 .../fedora-initscripts/netconsole.service          |  11 ++
 .../fedora-initscripts/netfs.init                  | 171 +++++++++++++++++++++
 .../fedora-initscripts/netfs.service               |  11 ++
 .../fedora-initscripts/network.sysconfig           |   1 +
 .../fedora-initscripts/os-release                  |   1 +
 .../fedora-initscripts/fedora-initscripts_9.60.bb  |  73 +++++++++
 9 files changed, 473 insertions(+)
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0001-Disable-NLS.patch
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0002-Do-not-chown.patch
 create mode 100755 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.init
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.service
 create mode 100755 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.init
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.service
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/network.sysconfig
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/os-release
 create mode 100644 meta-oe/recipes-support/fedora-initscripts/fedora-initscripts_9.60.bb

diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0001-Disable-NLS.patch b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0001-Disable-NLS.patch
new file mode 100644
index 0000000..a473e70
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0001-Disable-NLS.patch
@@ -0,0 +1,37 @@
+From eb113e2083d7a01ff6357e20e506eb86168cec74 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Mon, 22 Dec 2014 14:45:04 +0800
+Subject: [PATCH 1/2] Disable NLT
+
+Upstream-Status: pending
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 667eac5..69a4bb8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -10,7 +10,7 @@ mandir=/usr/share/man
+ 
+ all:
+ 	make -C src
+-	make -C po
++#	make -C po
+ 
+ install:
+ 	mkdir -p $(ROOT)/etc/profile.d $(ROOT)/usr/sbin
+@@ -64,7 +64,7 @@ install:
+ 	  ln -sf ../../../usr/sbin/ifup . ; \
+ 	  ln -sf ../../../usr/sbin/ifdown . )
+ 	make install ROOT=$(ROOT) mandir=$(mandir) -C src
+-	make install PREFIX=$(ROOT) -C po
++#	make install PREFIX=$(ROOT) -C po
+ 
+ 	mkdir -p $(ROOT)/var/run/netreport $(ROOT)/var/log
+ 	chown $(SUPERUSER):$(SUPERGROUP) $(ROOT)/var/run/netreport
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0002-Do-not-chown.patch b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0002-Do-not-chown.patch
new file mode 100644
index 0000000..303e9c9
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/0002-Do-not-chown.patch
@@ -0,0 +1,28 @@
+From 5d784f1be46f1e55a6932f19c25fad0faf400b3e Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Mon, 22 Dec 2014 14:47:41 +0800
+Subject: [PATCH 2/2] Do not chown
+
+Upstream-Status: pending
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 69a4bb8..d386b65 100644
+--- a/Makefile
++++ b/Makefile
+@@ -67,7 +67,7 @@ install:
+ #	make install PREFIX=$(ROOT) -C po
+ 
+ 	mkdir -p $(ROOT)/var/run/netreport $(ROOT)/var/log
+-	chown $(SUPERUSER):$(SUPERGROUP) $(ROOT)/var/run/netreport
++#	chown $(SUPERUSER):$(SUPERGROUP) $(ROOT)/var/run/netreport
+ 	chmod u=rwx,g=rwx,o=rx $(ROOT)/var/run/netreport
+ 
+ 	for i in 0 1 2 3 4 5 6 ; do \
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.init b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.init
new file mode 100755
index 0000000..b76fb56
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.init
@@ -0,0 +1,140 @@
+#!/bin/bash
+# 
+# netconsole 	This loads the netconsole module with the configured parameters.
+#
+# chkconfig: - 50 50
+# description: Initializes network console logging
+# config: /etc/sysconfig/netconsole
+#
+# Copyright 2002 Red Hat, Inc.
+#
+# Based in part on a shell script by
+# Andreas Dilger <adilger@turbolinux.com>  Sep 26, 2001
+
+PATH=/sbin:/usr/sbin:$PATH
+RETVAL=0
+SERVER_ADDRESS_RESOLUTION=
+
+# Check that networking is up.
+. /etc/sysconfig/network
+
+# Source function library.
+. /etc/init.d/functions
+
+# Default values
+LOCALPORT=6666
+DEV=
+
+SYSLOGADDR=
+SYSLOGPORT=514
+SYSLOGMACADDR=
+
+kernel=$(uname -r | cut -d. -f1-2)
+
+usage ()
+{
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}" 1>&2
+	RETVAL=2
+}
+
+print_address_info ()
+{
+	local host=$1
+	local route via target
+
+	route=$(LANG=C ip -o route get to $host/32)
+	
+	[ -z "$DEV" ] && DEV=$(echo $route | sed "s|.* dev \([^ ]*\).*|\1|")
+	echo "DEV=$DEV"
+	echo "LOCALADDR=$(echo $route | sed "s|.* src \([^ ]*\).*|\1|")"
+	if [[ $route == *" via "* ]] ; then
+		via=$(echo $route | sed "s|.* via \([^ ]*\).*|\1|")
+		target=$via
+	else
+		target=$host
+	fi
+	if [ -z "$SYSLOGMACADDR" ]; then
+		arp=$(LANG=C /sbin/arping -c 1 -I $DEV $target 2>/dev/null | awk '/ reply from .*[.*]/ { print gensub(".* reply from .* \\[(.*)\\].*","\\1","G") }')
+		[ -n "$arp" ] && echo "SYSLOGMACADDR=$arp"
+	fi	
+}	
+	
+start ()
+{
+	[ -f /etc/sysconfig/netconsole ] || exit 6
+	. /etc/sysconfig/netconsole
+
+	SYSLOGOPTS=
+	# syslogd server, if any
+	if [ -n "$SYSLOGADDR" ]; then
+		MATCH="^([0-9]{1,3}\.){3}[0-9]{1,3}$"
+		if ! [[ "$SYSLOGADDR" =~ $MATCH ]]; then
+			SYSLOGADDR=$(LANG=C host $SYSLOGADDR 2>/dev/null | awk '/has address / { print $NF }')
+		fi
+	fi
+	if [ -z "$SYSLOGADDR" ] ; then
+		echo $"Server address not specified in /etc/sysconfig/netconsole" 1>&2
+		exit 6
+	fi
+	eval $(print_address_info $SYSLOGADDR)
+	
+	if [ -z "$SYSLOGMACADDR" ]; then
+		echo $"netconsole: can't resolve MAC address of $SYSLOGADDR" 1>&2
+		exit 1
+	fi
+
+	SYSLOGOPTS="netconsole=$LOCALPORT@$LOCALADDR/$DEV,$SYSLOGPORT@$SYSLOGADDR/$SYSLOGMACADDR "
+
+	/usr/bin/logger -p daemon.info -t netconsole: inserting netconsole module with arguments \
+	$SYSLOGOPTS
+	if [ -n "$SYSLOGOPTS" ]; then
+		action $"Initializing netconsole" modprobe netconsole \
+			$SYSLOGOPTS
+		[ "$?" != "0" ] && RETVAL=1
+	fi
+	touch /var/lock/subsys/netconsole
+}
+
+stop ()
+{
+	if /sbin/lsmod | grep netconsole >/dev/null 2>&1 ; then
+	    action $"Disabling netconsole" rmmod netconsole;
+	    [ "$?" != "0" ] && RETVAL=1
+	fi
+
+	rm -f /var/lock/subsys/netconsole
+}
+
+status ()
+{
+	if /sbin/lsmod | grep netconsole >/dev/null 2>&1 ; then
+		echo $"netconsole module loaded"
+		RETVAL=0
+	else
+		echo $"netconsole module not loaded"
+		RETVAL=3
+	fi
+}
+
+
+restart ()
+{
+	stop
+	start
+}
+
+condrestart ()
+{
+	[ -e /var/lock/subsys/netconsole ] && restart
+}
+
+
+case "$1" in
+    stop) stop ;;
+    status) status ;;
+    start|restart|reload|force-reload) restart ;;
+    condrestart) condrestart ;;
+    *) usage ;;
+esac
+
+exit $RETVAL
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.service b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.service
new file mode 100644
index 0000000..c80c8cb
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netconsole.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Initializes network console logging
+
+[Service]
+Type=oneshot
+ExecStart=/usr/lib/fedora-initscripts/netconsole start
+ExecStop=/usr/lib/fedora-initscripts/netconsole stop
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.init b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.init
new file mode 100755
index 0000000..5430765
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.init
@@ -0,0 +1,171 @@
+#!/bin/bash
+#
+# netfs         Mount network filesystems.
+#
+# Authors:	Bill Nottingham <notting@redhat.com>
+#		AJ Lewis <alewis@redhat.com>
+# 		Miquel van Smoorenburg, <miquels@drinkel.nl.mugnet.org>
+#
+# chkconfig: 345 25 75
+# description: Mounts and unmounts all Network File System (NFS), \
+#	       CIFS (Lan Manager/Windows), and NCP (NetWare) mount points.
+### BEGIN INIT INFO
+# Provides: $remote_fs
+# Short-Description: Mount and unmount network filesystems.
+# Description: Mount and unmount network filesystems.
+### END INIT INFO
+
+[ -f /etc/sysconfig/network ] || exit 0
+. /etc/init.d/functions
+. /etc/sysconfig/network
+
+NFSFSTAB=$(LC_ALL=C awk '!/^#/ && $3 ~ /^nfs/ && $3 != "nfsd" && $4 !~ /noauto/ { print $2 }' /etc/fstab)
+CIFSFSTAB=$(LC_ALL=C awk '!/^#/ && $3 == "cifs" && $4 !~ /noauto/ { print $2 }' /etc/fstab)
+NCPFSTAB=$(LC_ALL=C awk '!/^#/ && $3 == "ncpfs" && $4 !~ /noauto/ { print $2 }' /etc/fstab)
+NETDEVFSTAB=$(LC_ALL=C awk '!/^#/ && $4 ~/_netdev/ && $4 !~ /noauto/ { print $1 }' /etc/fstab)
+
+NFSMTAB=$(LC_ALL=C awk '$3 ~ /^nfs/ && $3 != "nfsd" && $2 != "/" { print $2 }' /proc/mounts)
+CIFSMTAB=$(LC_ALL=C awk '$3 == "cifs" { print $2 }' /proc/mounts)
+NCPMTAB=$(LC_ALL=C awk '$3 == "ncpfs" { print $2 }' /proc/mounts)
+NETDEVMTAB=$(LC_ALL=C awk '$4 ~ /_netdev/ && $2 != "/" { print $2 }' /etc/mtab)
+
+# See how we were called.
+case "$1" in
+  start)
+        [ "$EUID" != "0" ] && exit 4
+        [ -n "$NFSFSTAB" ] && 
+	  {
+	    [ ! -f /var/lock/subsys/rpcbind ] && service rpcbind start
+	    action $"Mounting NFS filesystems: " mount -a -t nfs,nfs4
+	  }
+        [ -n "$CIFSFSTAB" ] && action $"Mounting CIFS filesystems: " mount -a -t cifs
+        [ -n "$NCPFSTAB" ] && action $"Mounting NCP filesystems: " mount -a -t ncpfs
+        [ -n "$NETDEVFSTAB" ] &&
+	  {
+	    if [ -f /etc/mdadm.conf ]; then
+		mdadm -A -s
+	    fi
+	    if [ -f /etc/multipath.conf ] && [ -x /sbin/multipath ]; then
+	    	modprobe dm-multipath >/dev/null 2>&1
+		/sbin/multipath -v 0
+		if [ -x /sbin/kpartx ]; then
+		       /sbin/dmsetup ls --target multipath --exec "/sbin/kpartx -a -p p"
+		fi
+	    fi
+	    if [ -x /sbin/lvm ]; then
+		if /sbin/lvm vgscan > /dev/null 2>&1 ; then
+		       action $"Setting up Logical Volume Management:" /sbin/lvm vgchange -a y
+		fi
+	    fi
+	    STRING=$"Checking network-attached filesystems"
+	    
+	    echo $STRING
+	    fsck -A -T -R -a -t opts=_netdev
+	    rc=$?
+	    
+	    if [ "$rc" -eq "0" ]; then
+	    	success "$STRING"
+		echo
+	    elif [ "$rc" -eq "1" ]; then
+	        passed "$STRING"
+	        echo
+	    fi
+	    
+	    if [ "$rc" -gt 1 ]; then
+		if [ -x /usr/bin/plymouth ] && /usr/bin/plymouth --ping ; then
+			/usr/bin/plymouth --hide-splash
+		fi
+		failure "$STRING"
+		tty >/dev/null 2>&1 || exit 1
+		echo
+		echo
+		echo $"*** An error occurred during the file system check."
+		echo $"*** Dropping you to a shell; the system will reboot"
+		echo $"*** when you leave the shell."
+		
+		str=$"(Repair filesystem)"
+		PS1="$str \# # "; export PS1
+		[ "$SELINUX" = "1" ] && disable_selinux
+		sulogin
+		
+		shutdown -r now
+	   fi
+	  }
+	touch /var/lock/subsys/netfs
+	action $"Mounting other filesystems: " mount -a -t nfs4,cifs,ncpfs,gfs,nonfs
+	;;
+  stop)
+        # Unmount loopback stuff first
+        [ "$EUID" != "0" ] && exit 4
+	__umount_loopback_loop
+  	if [ -n "$NETDEVMTAB" ]; then
+		__umount_loop '$4 ~ /_netdev/ && $2 != "/" {print $2}' \
+			/etc/mtab \
+			$"Unmounting network block filesystems: " \
+			$"Unmounting network block filesystems (retry): "
+	fi
+  	if [ -n "$NFSMTAB" ]; then
+		__umount_loop '$3 ~ /^nfs/ && $3 != "nfsd" && $2 != "/" {print $2}' \
+			/proc/mounts \
+			$"Unmounting NFS filesystems: " \
+			$"Unmounting NFS filesystems (retry): " \
+			"-f -l"
+	fi
+	[ -n "$CIFSMTAB" ] && action $"Unmounting CIFS filesystems: " umount -a -t cifs
+	[ -n "$NCPMTAB" ] && action $"Unmounting NCP filesystems: " umount -a -t ncp,ncpfs
+	rm -f /var/lock/subsys/netfs
+	;;
+  status)
+	if [ -f /proc/mounts ] ; then
+	        [ -n "$NFSFSTAB" ] && {
+		     echo $"Configured NFS mountpoints: "
+		     for fs in $NFSFSTAB; do echo $fs ; done
+		}
+	        [ -n "$CIFSFSTAB" ] && {
+		     echo $"Configured CIFS mountpoints: "
+		     for fs in $CIFSFSTAB; do echo $fs ; done
+		}
+	        [ -n "$NCPFSTAB" ] && {
+		     echo $"Configured NCP mountpoints: "
+		     for fs in $NCPFSTAB; do echo $fs ; done
+		}
+		[ -n "$NETDEVFSTAB" ] && {
+		      echo $"Configured network block devices: "
+		      for fs in $NETDEVFSTAB; do echo $fs ; done
+		}
+		[ -n "$NFSMTAB" ] && {
+                      echo $"Active NFS mountpoints: "
+		      for fs in $NFSMTAB; do echo $fs ; done
+		}
+		[ -n "$CIFSMTAB" ] && {
+                      echo $"Active CIFS mountpoints: "
+		      for fs in $CIFSMTAB; do echo $fs ; done
+		}
+		[ -n "$NCPMTAB" ] && {
+                      echo $"Active NCP mountpoints: "
+		      for fs in $NCPMTAB; do echo $fs ; done
+		}
+		[ -n "$NETDEVMTAB" ] && {
+		      echo $"Active network block devices: "
+		      for fs in $NETDEVMTAB; do echo $fs ; done
+		}
+	else
+		echo $"/proc filesystem unavailable"
+	fi
+	[ -r /var/lock/subsys/netfs ] || exit 3
+	;;
+  restart)
+	$0 stop
+	$0 start
+	exit $?
+	;;
+  reload)
+        $0 start
+	exit $?
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart|reload|status}"
+	exit 2
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.service b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.service
new file mode 100644
index 0000000..59d2d93
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/netfs.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Mount network filesystems(one-shot mode)
+
+[Service]
+Type=oneshot
+ExecStart=/usr/lib/fedora-initscripts/netfs start
+ExecStop=/usr/lib/fedora-initscripts/netfs stop
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/network.sysconfig b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/network.sysconfig
new file mode 100644
index 0000000..61c4a5a
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/network.sysconfig
@@ -0,0 +1 @@
+NETWORKING=yes
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/os-release b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/os-release
new file mode 100644
index 0000000..1e6a513
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts/os-release
@@ -0,0 +1 @@
+ubinux release 14 (Horse)
diff --git a/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts_9.60.bb b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts_9.60.bb
new file mode 100644
index 0000000..aa9e809
--- /dev/null
+++ b/meta-oe/recipes-support/fedora-initscripts/fedora-initscripts_9.60.bb
@@ -0,0 +1,73 @@
+SUMMARY = "The inittab file and the /etc/init.d scripts"
+DESCRIPTION = "\
+The initscripts package contains the basic system scripts used to boot your \
+Red Hat or Fedora system, change runlevels, and shut the system down cleanly. \
+Initscripts also contains the scripts that activate and deactivate most \
+network interfaces."
+HOMEPAGE = "http://fedorahosted.org/releases/i/n/initscripts/"
+SECTION = "System Environment/Base"
+LICENSE = "GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/5c9cd83e4e04257fef3ffd8e549b7f81/initscripts-${PV}.tar.bz2    \
+           file://0001-Disable-NLS.patch                            \
+           file://0002-Do-not-chown.patch                           \
+           file://os-release                                        \
+           file://network.sysconfig                                 \
+           file://netconsole.init                                   \
+           file://netfs.init                                        \
+           file://netconsole.service                                \
+           file://netfs.service                                     \
+           "
+SRC_URI[md5sum] = "5c9cd83e4e04257fef3ffd8e549b7f81"
+SRC_URI[sha256sum] = "254508884ceeef22e24f4e8b051bb51958ae8252bd7b02cd2b7bcce3fb453dc2"
+
+S = "${WORKDIR}/initscripts-${PV}"
+
+inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
+
+EXTRA_OEMAKE = 'ROOT=${D}           \
+                SUPERUSER=root      \
+                SUPERGROUP=root     \
+                mandir=${mandir}    \
+                PROGS="consoletype" \
+                '
+
+do_compile() {
+    sed -i 's/^PROGS/DUMMY_PROGS/g' ${S}/src/Makefile
+    oe_runmake -C ${S}/src
+}
+
+do_install() {
+    install -d -m 0755 ${D}${bindir}
+    install -d -m 0755 ${D}${sysconfdir}/init.d/
+    install -d -m 0755 ${D}${base_sbindir}
+
+    install -m 0644 ${WORKDIR}/os-release ${D}${sysconfdir}/os-release
+    install -m 0644 ${S}/adjtime ${D}${sysconfdir}/
+    install -d ${D}${sysconfdir}/sysconfig/
+    install -m 0644 ${WORKDIR}/os-release ${D}${sysconfdir}/os-release
+    install -m 755 ${WORKDIR}/netfs.init ${D}${sysconfdir}/init.d/netfs
+    install -m 755 ${WORKDIR}/netconsole.init ${D}${sysconfdir}/init.d/netconsole
+    install -m 755 ${WORKDIR}/network.sysconfig ${D}${sysconfdir}/sysconfig/network
+    install -m 755 ${S}/sysconfig/netconsole ${D}${sysconfdir}/sysconfig/
+    install -m 755 ${S}/src/consoletype ${D}${bindir}/
+    install -m 755 ${S}/service ${D}${base_sbindir}/
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${libexecdir}
+        install -m 0755 ${WORKDIR}/netfs.init ${D}${libexecdir}/netfs
+        install -m 0755 ${WORKDIR}/netconsole.init ${D}${libexecdir}/netconsole
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/netfs.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/netconsole.service ${D}${systemd_unitdir}/system/
+    fi
+}
+
+RDEPENDS_${PN} = "bash"
+
+FILES_${PN} += "${systemd_unitdir}/system/netconsole.service"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "netfs.service"
+SYSTEMD_AUTO_ENABLE = "enable"
-- 
1.8.3.1


