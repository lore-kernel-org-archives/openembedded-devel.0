Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaIB-00028f-EQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528110"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:14 +0000
Message-Id: <9fd1d943927d1df0262685168afdcd4757ab0c40.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 08/11] conntrack-tools: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:56 -0000

* Update to version 1.4.0 and add additional dependencies
* Handle hardcoded paths in initscripts
* Add LSB header to initscript
* Make LICENSE more specific
* Add LIC_FILES_CHKSUM
* Set SUMMARY (which sets DESCRIPTION)

Based on a patch by Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../conntrack-tools/conntrack-tools_1.4.0.bb       |   33 ++++++++
 .../conntrack-tools/files/conntrack-failover       |   77 +++++++++++++++++
 .../recipes-filter/conntrack-tools/files/init      |   87 ++++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/conntrack-failover
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/init

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
new file mode 100644
index 0000000..9938e24
--- /dev/null
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Connection tracking userspace tools for Linux"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
+           libnetfilter-cthelper libnetfilter-queue"
+
+PR = "r0"
+
+SRC_URI = " \
+	http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
+	file://conntrack-failover \
+	file://init \
+	"
+SRC_URI[tar.md5sum] = "ee737c774e01349f75e935228a2d851b"
+SRC_URI[tar.sha256sum] = "036b032a5c4d180aad686df21399d74506b9b3d3000794eb13ac313482e24896"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "conntrackd"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/conntrackd
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 0644 doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
+	install -m 0755 ${WORKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
+	install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
+
+	# Fix hardcoded paths in scripts
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
+	sed -i 's!/var/!${localstatedir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
+	sed -i 's!^export PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}/${sysconfdir}/init.d/conntrackd
+}
diff --git a/meta-networking/recipes-filter/conntrack-tools/files/conntrack-failover b/meta-networking/recipes-filter/conntrack-tools/files/conntrack-failover
new file mode 100644
index 0000000..6d92e63
--- /dev/null
+++ b/meta-networking/recipes-filter/conntrack-tools/files/conntrack-failover
@@ -0,0 +1,77 @@
+#!/bin/sh
+# 
+# (C) 2008 by Pablo Neira Ayuso <pablo@netfilter.org>
+# (C) 2009 Roman I Khimov <khimov@altell.ru>
+#
+# This software may be used and distributed according to the terms
+# of the GNU General Public License, incorporated herein by reference.
+#
+# Description:
+#
+# This is the script for primary-backup setups for keepalived
+# (http://www.keepalived.org). You may adapt it to make it work with other
+# high-availability managers.
+#
+# Do not forget to include the required modifications to your keepalived.conf
+# file to invoke this script during keepalived's state transitions.
+#
+# Contributions to improve this script are welcome :).
+#
+## Modified to work as init.d script under pacemaker control
+
+CONNTRACKD_BIN=/usr/sbin/conntrackd
+CONNTRACKD_LOCK=/var/lock/conntrack.lock
+CONNTRACKD_CONFIG=/etc/conntrackd/conntrackd.conf
+
+case "$1" in
+  start)
+    #
+    # commit the external cache into the kernel table
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -c
+    if [ $? -eq 1 ]
+    then
+        logger "ERROR: failed to invoke conntrackd -c"
+    fi
+
+    #
+    # flush the internal and the external caches
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -f
+    if [ $? -eq 1 ]
+    then
+    	logger "ERROR: failed to invoke conntrackd -f"
+    fi
+
+    #
+    # resynchronize my internal cache to the kernel table
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -R
+    if [ $? -eq 1 ]
+    then
+    	logger "ERROR: failed to invoke conntrackd -R"
+    fi
+
+    #
+    # send a bulk update to backups 
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -B
+    if [ $? -eq 1 ]
+    then
+        logger "ERROR: failed to invoke conntrackd -B"
+    fi
+    ;;
+  stop)
+	$CONNTRACKD_BIN -t
+	$CONNTRACKD_BIN -n
+	;;
+  status)
+	;;
+  *)
+    logger "ERROR: unknown command"
+    echo "Usage: conntrack-failover {start|stop|status}"
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-filter/conntrack-tools/files/init b/meta-networking/recipes-filter/conntrack-tools/files/init
new file mode 100644
index 0000000..bce2075
--- /dev/null
+++ b/meta-networking/recipes-filter/conntrack-tools/files/init
@@ -0,0 +1,87 @@
+#!/bin/sh
+#
+# /etc/init.d/conntrackd
+#
+# Maximilian Wilhelm <max@rfc2324.org>
+#  -- Mon, 06 Nov 2006 18:39:07 +0100
+#
+# Roman I Khimov <khimov@altell.ru>
+#  -- Tue, 27 Oct 2009 14:34:00 +0300
+
+### BEGIN INIT INFO
+# Provides:          conntrackd
+# Required-Start:    $remote_fs $syslog
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Description: Starts conntrackd
+# short-description: Starts conntrackd
+### END INIT INFO
+
+export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+
+NAME="conntrackd"
+DAEMON="/usr/sbin/conntrackd"
+CONFIG="/etc/conntrackd/conntrackd.conf"
+PIDFILE="/var/run/${NAME}.pid"
+
+
+# Gracefully exit if there is no daemon (debian way of life)
+if [ ! -x "${DAEMON}" ]; then
+	exit 0
+fi
+
+# Check for config file
+if [ ! -f /etc/conntrackd/conntrackd.conf ]; then
+	echo "Error: There is no config file for $NAME" >&2
+	exit 1;
+fi
+
+case "$1" in
+  start)
+        echo -n "Starting $NAME: "
+	for i in nf_conntrack_netlink nf_conntrack_netbios_ns nf_conntrack_proto_dccp nf_conntrack_tftp \
+		nf_conntrack_sane nf_conntrack_pptp nf_conntrack_irc nf_conntrack_amanda nf_conntrack_h323 \
+		nf_conntrack_proto_udplite nf_conntrack_proto_gre nf_conntrack_proto_sctp nf_conntrack_ftp \
+		nf_conntrack_sip; do
+		modprobe $i >/dev/null 2>/dev/null &
+	done
+	start-stop-daemon --start --quiet --make-pidfile --pidfile "/var/run/${NAME}.pid" --background --exec "${DAEMON}"
+	RET=$?
+	if [ "$?" = "0" ]; then
+		sleep 2
+		# Sync with other server
+		conntrackd -n
+		echo "done."
+	else
+		echo "FAILED!"
+	fi
+	exit $RET
+	;;
+  stop)
+        echo -n "Stopping $NAME:"
+	start-stop-daemon --stop --quiet --oknodo --pidfile "/var/run/${NAME}.pid" && echo "done." || echo "FAILED!"
+	;;
+  status)
+	echo -n "conntrackd "
+	start-stop-daemon -q -K -t -x $DAEMON
+	RET=$?
+	if [ "$RET" = "0" ]; then
+                PID=`cat $PIDFILE`
+		echo "($PID) is running"
+	else
+		echo "is not running"
+		exit $RET
+	fi
+	;;
+  restart)
+	$0 stop
+	$0 start
+	;;
+
+  *)
+	echo "Usage: /etc/init.d/conntrackd {start|stop|restart}"
+	exit 1
+esac
+
+exit 0
-- 
1.7.10.4



