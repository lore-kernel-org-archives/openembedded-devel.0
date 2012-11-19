Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TaV6n-00081d-2K
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 18:26:13 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Nov 2012 09:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,280,1352102400"; d="scan'208";a="249506878"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.190])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2012 09:11:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:11:25 +0000
Message-Id: <738d5da6dd36ec7c495cb2ed90d969095e99b8fb.1353345006.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/8] quagga: add from OE-Classic, update and tidy-up
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
X-List-Received-Date: Mon, 19 Nov 2012 17:26:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Update to 0.99.21
* Fix SRC_URI to point to a working download location
* Make LICENSE more accurate
* Add LIC_FILES_CHKSUM
* Add old gentoo patch to fix libcap linking errors
* Put binaries in sbindir
* Use useradd.bbclass to create user/groups
* Add LSB headers to init script (borrowed from debian)
* Tidy up packaging and directory references
* Add SUMMARY

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../quagga/files/fix-for-lib-inpath.patch          |   19 ++
 .../quagga/files/quagga-0.99.17-libcap.patch       |   64 +++++++
 .../recipes-protocols/quagga/files/quagga.default  |   13 ++
 .../recipes-protocols/quagga/files/quagga.init     |  200 ++++++++++++++++++++
 .../quagga/files/volatiles.03_quagga               |    3 +
 .../quagga/files/watchquagga.default               |    7 +
 .../quagga/files/watchquagga.init                  |   64 +++++++
 .../recipes-protocols/quagga/quagga.inc            |  146 ++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |    8 +
 9 files changed, 524 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.default
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.init
 create mode 100644 meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
 create mode 100644 meta-networking/recipes-protocols/quagga/files/watchquagga.default
 create mode 100644 meta-networking/recipes-protocols/quagga/files/watchquagga.init
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga.inc
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb

diff --git a/meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch b/meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
new file mode 100644
index 0000000..50f0ad5
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
@@ -0,0 +1,19 @@
+At first this worked, then I tried a clean build in a directory that
+contained lib in it (oe/build/titan-glibc) and vtysh no longer
+worked. It's test for the lib directory was excepting anything
+containing lib.
+
+With this patch you still cannot have lib in the path anywhere, but
+at least things containing lib will now work.
+
+--- quagga-0.99.2/vtysh/extract.pl.in	2005/11/16 04:12:04	1.1
++++ quagga-0.99.2/vtysh/extract.pl.in	2005/11/16 04:12:16
+@@ -89,7 +89,7 @@
+ 	$cmd =~ s/\s+$//g;
+ 
+         # $protocol is VTYSH_PROTO format for redirection of user input
+-    	if ($file =~ /lib/) {
++    	if ($file =~ /\/lib\//) {
+            if ($file =~ /keychain.c/) {
+               $protocol = "VTYSH_RIPD";
+            }
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch b/meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
new file mode 100644
index 0000000..9563ea2
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
@@ -0,0 +1,64 @@
+From 63e97633d01908da6d3776ac61e4033e6fa91e5c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@gmail.com>
+Date: Sun, 5 Sep 2010 18:19:09 +0200
+Subject: [PATCH] build: fix linking position for libcap
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ * lib/Makefile.am: link libzebra to libcap, since it uses symbols
+   from there.
+ * zebra/Makefile.am: no need to link libcap here now, since it's not
+   used directly (libtool with apply transitive dependencies for
+   static linking).
+
+Signed-off-by: Diego Elio Pettenò <flameeyes@gmail.com>
+
+Imported from Gentoo by Paul Eggleton <paul.eggleton@linux.intel.com>
+Upstream-Status: Pending
+
+---
+ lib/Makefile.am   |    2 +-
+ zebra/Makefile.am |    5 ++---
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 315e919..6e69993 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -18,7 +18,7 @@ BUILT_SOURCES = memtypes.h route_types.h
+ 
+ libzebra_la_DEPENDENCIES = @LIB_REGEX@
+ 
+-libzebra_la_LIBADD = @LIB_REGEX@
++libzebra_la_LIBADD = @LIB_REGEX@ $(LIBCAP)
+ 
+ pkginclude_HEADERS = \
+ 	buffer.h checksum.h command.h filter.h getopt.h hash.h \
+diff --git a/zebra/Makefile.am b/zebra/Makefile.am
+index 542f36f..d09a209 100644
+--- a/zebra/Makefile.am
++++ b/zebra/Makefile.am
+@@ -5,7 +5,6 @@ DEFS = @DEFS@ -DSYSCONFDIR=\"$(sysconfdir)/\" -DMULTIPATH_NUM=@MULTIPATH_NUM@
+ INSTALL_SDATA=@INSTALL@ -m 600
+ 
+ LIB_IPV6 = @LIB_IPV6@
+-LIBCAP = @LIBCAP@
+ 
+ ipforward = @IPFORWARD@
+ if_method = @IF_METHOD@
+@@ -39,9 +38,9 @@ noinst_HEADERS = \
+ 	connected.h ioctl.h rib.h rt.h zserv.h redistribute.h debug.h rtadv.h \
+ 	interface.h ipforward.h irdp.h router-id.h kernel_socket.h
+ 
+-zebra_LDADD = $(otherobj) $(LIBCAP) $(LIB_IPV6) ../lib/libzebra.la
++zebra_LDADD = $(otherobj) ../lib/libzebra.la $(LIB_IPV6)
+ 
+-testzebra_LDADD = $(LIBCAP) $(LIB_IPV6) ../lib/libzebra.la
++testzebra_LDADD = ../lib/libzebra.la $(LIB_IPV6)
+ 
+ zebra_DEPENDENCIES = $(otherobj)
+ 
+-- 
+1.7.2.2
+
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.default b/meta-networking/recipes-protocols/quagga/files/quagga.default
new file mode 100644
index 0000000..438c3b6
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/quagga.default
@@ -0,0 +1,13 @@
+# If this option is set the /etc/init.d/quagga script automatically loads
+# the config via "vtysh -b" when the servers are started.
+vtysh_enable=yes
+
+# Bind all daemons to loopback only by default
+zebra_options=" --daemon -A 127.0.0.1"
+babeld_options="-D 127.0.0.1"
+bgpd_options="  --daemon -A 127.0.0.1"
+ospfd_options=" --daemon -A 127.0.0.1"
+ospf6d_options="--daemon -A ::1"
+ripd_options="  --daemon -A 127.0.0.1"
+ripngd_options="--daemon -A ::1"
+isisd_options=" --daemon -A 127.0.0.1"
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.init b/meta-networking/recipes-protocols/quagga/files/quagga.init
new file mode 100644
index 0000000..d786a5a
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/quagga.init
@@ -0,0 +1,200 @@
+#!/bin/sh
+#
+# /etc/init.d/quagga -- start/stop the Quagga routing daemons
+#
+# Based on debian version by Endre Hirling <endre@mail.elte.hu> and 
+# Christian Hammers <ch@debian.org>.
+#
+
+### BEGIN INIT INFO
+# Provides: quagga
+# Required-Start: $local_fs $network $remote_fs $syslog
+# Required-Stop: $local_fs $network $remote_fs $syslog
+# Default-Start:  2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: start and stop the Quagga routing suite
+# Description: Quagga is a routing suite for IP routing protocols like 
+#              BGP, OSPF, RIP and others. This script contols the main 
+#              daemon "quagga" as well as the individual protocol daemons.
+### END INIT INFO
+
+# NOTE: sbin must be before bin so we get the iproute2 ip and not the
+# busybox ip command. The busybox one flushes all routes instead of just
+# the dynamic routes
+PATH=/sbin:/usr/sbin:/bin:/usr/bin:/sbin
+D_PATH=/usr/sbin/quagga
+C_PATH=/etc/quagga
+
+# Keep zebra first and do not list watchquagga!
+DAEMONS="zebra bgpd ripd ripngd ospfd ospf6d isisd babeld"
+
+# Print the name of the pidfile.
+pidfile()
+{
+	echo "/var/run/quagga/$1.pid"
+}
+
+# Check if daemon is started by using the pidfile.
+started()
+{
+	[ -e `pidfile $1` ] && kill -0 `cat \`pidfile $1\`` 2> /dev/null && return 0
+	return 1
+}
+
+# Loads the config via vtysh -b if configured to do so.
+vtysh_b ()
+{
+	# Rember, that all variables have been incremented by 1 in convert_daemon_prios()
+	if [ "$vtysh_enable" = 2 -a -f $C_PATH/Quagga.conf ]; then
+		/usr/bin/vtysh -b
+	fi
+}
+
+# Check if the daemon is activated and if its executable and config files 
+# are in place.
+# params: 	daemon name
+# returns:	0=ok, 1=error
+check_daemon()
+{
+	# If the integrated config file is used the others are not checked.
+	if [ -r "$C_PATH/Quagga.conf" ]; then
+	  return 0
+	fi 
+
+	# check for config file		  
+	if [ ! -r "$C_PATH/$1.conf" ]; then
+	  return 1
+	fi
+	return 0
+}
+
+# Starts the server if it's not alrady running according to the pid file.
+# The Quagga daemons creates the pidfile when starting.
+start()
+{
+	if ! check_daemon $1; then echo -n " (!$1)"; return; fi
+	echo -n " $1"
+	start-stop-daemon \
+		--start \
+		--pidfile=`pidfile $1` \
+		--exec "$D_PATH/$1" \
+		-- \
+		`eval echo "$""$1""_options"`
+		
+}
+
+# Stop the daemon given in the parameter, printing its name to the terminal.
+stop()
+{
+    if ! started "$1" ; then
+	echo -n " (!$1)"
+	return 0
+    else
+	PIDFILE=`pidfile $1`
+	PID=`cat $PIDFILE 2>/dev/null`
+	start-stop-daemon --stop --quiet --exec "$D_PATH/$1"
+	#
+	#       Now we have to wait until $DAEMON has _really_ stopped.
+	#
+	if test -n "$PID" && kill -0 $PID 2>/dev/null; then
+	    echo -n " (waiting) ."
+	    cnt=0
+	    while kill -0 $PID 2>/dev/null; do
+		cnt=`expr $cnt + 1`
+		if [ $cnt -gt 60 ]; then
+		    # Waited 120 secs now, fail.
+		    echo -n "Failed.. "
+		    break
+		fi
+		sleep 2
+		echo -n "."
+		done
+	    fi
+	echo -n " $1"
+	rm -f `pidfile $1`
+    fi
+}
+
+stop_all() 
+{
+	local daemon_list
+	daemon_list=${1:-$DAEMONS}
+
+	echo -n "Stopping Quagga daemons:"
+	for daemon_name in $daemon_list; do
+		stop "$daemon_name"
+	done
+	echo "."
+}
+
+start_all()
+{
+	local daemon_list
+	daemon_list=${1:-$DAEMONS}
+
+	echo -n "Starting Quagga daemons:"
+	for daemon_name in $daemon_list; do
+		start "$daemon_name"
+	done
+	echo "."
+}
+
+status_all() 
+{
+	local daemon_list
+	daemon_list=${1:-$DAEMONS}
+	res=1
+
+	echo -n "quagga: "
+	for daemon_name in $daemon_list; do
+	    if started "$daemon_name" ; then
+		id=`cat \`pidfile $daemon_name\``
+		echo -n "$daemon_name (pid $id) "
+		res=0
+	    fi
+	done
+	if [ $res -eq 0 ]; then
+	    echo "is running..."
+	else
+	    echo "is stopped..."
+	fi
+	exit $res
+}
+
+#########################################################
+# 		Main program 				#
+#########################################################
+
+# Load configuration
+test -f /etc/default/quagga && . /etc/default/quagga
+
+case "$1" in
+    start)
+	cd $C_PATH/
+	start_all $2
+	vtysh_b
+    	;;
+	
+    stop)
+  	stop_all $2
+	echo "Removing all routes made by zebra."
+	ip route flush proto zebra
+   	;;
+
+    status)
+  	status_all $2
+   	;;
+
+    restart|force-reload)
+	$0 stop $2
+	sleep 1
+	$0 start $2
+	;;
+
+    *)
+    	echo "Usage: /etc/init.d/quagga {start|stop|restart|status|force-reload} [daemon]"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga b/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
new file mode 100644
index 0000000..cfb896a
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d quagga quagga 0755 /var/run/quagga none
+d quagga quagga 0755 /var/log/quagga none
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/quagga/files/watchquagga.default b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
new file mode 100644
index 0000000..f152032
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
@@ -0,0 +1,7 @@
+# Watchquagga configuration
+#watch_daemons="zebra bgpd ospfd ospf6d ripd ripngd"
+watch_daemons="zebra"
+
+# To enable restarts, uncomment this line (but first be sure to edit
+# the WATCH_DAEMONS line to reflect the daemons you are actually using):
+watch_options="-Az -b_ -r/etc/init.d/quagga_restart_%s -s/etc/init.d/quagga_start_%s -k/etc/init.d/quagga_stop_%s"
diff --git a/meta-networking/recipes-protocols/quagga/files/watchquagga.init b/meta-networking/recipes-protocols/quagga/files/watchquagga.init
new file mode 100644
index 0000000..5ddd94a
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/watchquagga.init
@@ -0,0 +1,64 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: watchquagga
+# Required-Start: $local_fs $network $remote_fs $syslog
+# Required-Stop: $local_fs $network $remote_fs $syslog
+# Default-Start:  2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: start and stop the Quagga watchdog
+### END INIT INFO
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+
+# Load configuration
+test -f /etc/default/watchquagga && . /etc/default/watchquagga
+
+# Check that there are daemons to be monitored.
+[ -z "$watch_daemons" ] && exit 0
+
+pidfile="/var/run/quagga/watchquagga.pid"
+
+case "$1" in
+    start)
+	echo -n "Starting quagga watchdog daemon: watchquagga"
+	start-stop-daemon --start \
+		--pidfile $pidfile \
+		--exec /usr/sbin/watchquagga \
+		-- -d $watch_options $watch_daemons
+	echo "."
+    	;;
+	
+    stop)
+	echo -n "Stopping quagga watchdog daemon: watchquagga"
+	start-stop-daemon --stop --quiet \
+		--pidfile $pidfile
+	echo "."
+	;;
+
+    status)
+	echo -n "watchquagga "
+	res=1
+	[ -e $pidfile ] && kill -0 `cat $pidfile` 2> /dev/null
+	if [ $? -eq 0 ]; then
+	    echo "(pid `cat $pidfile`) is running..."
+	    res=0
+	else
+	    echo "is stopped..."
+	fi
+	exit $res
+	;;
+
+    restart|force-reload)
+	$0 stop $2
+	sleep 1
+	$0 start $2
+	;;
+
+    *)
+	echo "Usage: /etc/init.d/watchquagga {start|stop|restart|force-reload}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
new file mode 100644
index 0000000..9fc9d98
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -0,0 +1,146 @@
+SUMMARY = "BGP/OSPF/RIP routing daemon"
+DESCRIPTION = "Quagga is a routing software suite, providing \
+implementations of OSPFv2, OSPFv3, RIP v1 and v2, RIPv3 and BGPv4 for \
+Unix platforms, particularly FreeBSD, Linux, Solaris and NetBSD. \
+Quagga is a fork of GNU Zebra which was developed by Kunihiro \
+Ishiguro. The Quagga tree aims to build a more involved community \
+around Quagga than the current centralised model of GNU Zebra."
+HOMEPAGE = "http://www.quagga.net/"
+SECTION = "network"
+LICENSE = "GPL-2.0 & LGPL-2.0"
+DEPENDS = "readline ncurses perl-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+INC_PR = "r0"
+
+QUAGGASUBDIR = ""
+# ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
+# versions and leave it empty for recent versions.
+SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name=quagga-${PV} \
+           file://fix-for-lib-inpath.patch \
+           file://quagga-0.99.17-libcap.patch \
+           file://quagga.init \
+           file://quagga.default \
+           file://watchquagga.init \
+           file://watchquagga.default \
+           file://volatiles.03_quagga"
+
+inherit autotools update-rc.d useradd
+
+EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
+                --localstatedir=${localstatedir}/run/quagga \
+                --enable-exampledir=${docdir}/quagga/examples/ \
+                --enable-vtysh \
+                --enable-isisd \
+                --enable-watchquagga \
+                --enable-ospf-te \
+                --enable-opaque-lsa \
+                --enable-ipv6 \
+                --enable-ospfclient=yes \
+                --enable-multipath=64 \
+                --enable-user=quagga \
+                --enable-group=quagga \
+                --enable-vty-group=quaggavty \
+                --enable-configfile-mask=0640 \
+                --enable-logfile-mask=0640 \
+                --enable-rtadv \
+                --enable-tcp-md5"
+
+do_install () {
+        # Install init script and default settings
+        install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d \
+                           ${D}${sysconfdir}/quagga ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/quagga.default ${D}${sysconfdir}/default/quagga
+        install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
+        install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
+        install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
+        install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
+        # Install quagga
+        oe_runmake install DESTDIR=${D} prefix=${prefix} \
+                sbindir=${sbindir} \
+                sysconfdir=${sysconfdir}/quagga \
+                localstatedir=${localstatedir}/run/quagga
+}
+
+# Split into a main package and separate per-protocol packages
+PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd \
+                     ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
+                     ${PN}-ospfclient ${PN}-watchquagga"
+
+FILES_${PN}-ospfd       = "${sbindir}/ospfd ${libdir}/libospf.so.*"
+FILES_${PN}-ospf6d      = "${sbindir}/ospf6d"
+FILES_${PN}-babeld      = "${sbindir}/babeld"
+FILES_${PN}-bgpd        = "${sbindir}/bgpd"
+FILES_${PN}-ripd        = "${sbindir}/ripd"
+FILES_${PN}-ripngd      = "${sbindir}/ripngd"
+FILES_${PN}-isisd       = "${sbindir}/isisd"
+FILES_${PN}-ospfclient  = "${sbindir}/ospfclient ${libdir}/libospfapiclient.so.*"
+FILES_${PN}-watchquagga = "${sbindir}/watchquagga ${sysconfdir}/default/watchquagga \
+                           ${sysconfdir}/init.d/watchquagga"
+
+# Indicate that the default files are configuration files
+CONFFILES_${PN} = "${sysconfdir}/default/quagga"
+CONFFILES_${PN}-watchquagga = "${sysconfdir}/default/watchquagga"
+
+# Stop the names being rewritten due to the internal shared libraries
+DEBIAN_NOAUTONAME_${PN}-ospfd = "1"
+DEBIAN_NOAUTONAME_${PN}-ospfclient = "1"
+
+# the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
+RDEPENDS_${PN}          += "iproute2"
+
+# Main init script starts all deamons
+# Seperate init script for watchquagga
+INITSCRIPT_PACKAGES                     = "${PN} ${PN}-watchquagga"
+INITSCRIPT_NAME_${PN}                   = "quagga"
+INITSCRIPT_PARAMS_${PN}                 = "defaults 15 85"
+INITSCRIPT_NAME_${PN}-watchquagga       = "watchquagga"
+INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system quagga ; --system quaggavty"
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga quagga"
+
+pkg_postinst_${PN} () {
+	for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
+	chown quagga:quaggavty ${sysconfdir}/quagga
+	chown quagga:quagga ${sysconfdir}/quagga/*.conf
+	chmod 750 ${sysconfdir}/quagga
+	chown 640 ${sysconfdir}/quagga/*.conf
+	${sysconfdir}/init.d/populate-volatile.sh update
+}
+
+# Stop apps before uninstall
+pkg_prerm_${PN} () {
+        ${sysconfdir}/init.d/quagga stop
+}
+
+pkg_prerm_${PN}-ospfd () {
+        ${sysconfdir}/init.d/quagga stop ospfd
+}
+
+pkg_prerm_${PN}-ospf6d () {
+        ${sysconfdir}/init.d/quagga stop ospf6d
+}
+
+pkg_prerm_${PN}-babeld () {
+        ${sysconfdir}/init.d/quagga stop babeld
+}
+
+pkg_prerm_${PN}-bgpd () {
+        ${sysconfdir}/init.d/quagga stop bgpd
+}
+
+pkg_prerm_${PN}-ripd () {
+        ${sysconfdir}/init.d/quagga stop ripd
+}
+
+pkg_prerm_${PN}-ripngd () {
+        ${sysconfdir}/init.d/quagga stop ripngd
+}
+
+pkg_prerm_${PN}-isisd () {
+        ${sysconfdir}/init.d/quagga stop isisd
+}
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
new file mode 100644
index 0000000..5c403a9
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -0,0 +1,8 @@
+require quagga.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
+SRC_URI[quagga-0.99.21.sha256sum] = "9b8aea9026b4771a28e254a66cbd854723bcd0d71eebd0201d11838d4eb392ee"
+
+QUAGGASUBDIR = ""
-- 
1.7.9.5



