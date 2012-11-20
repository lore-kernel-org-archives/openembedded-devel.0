Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Taq0b-0003zS-7d
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 16:45:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2012 07:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,286,1352102400"; d="scan'208";a="222183655"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.208])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2012 07:31:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2012 15:30:48 +0000
Message-Id: <aac4bbc49dcb00de29c3c30bd6747a652665b6cf.1353425302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH v2 4/8] radvd: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Tue, 20 Nov 2012 15:45:10 -0000

* Update to 1.9.1
* Add libdaemon to DEPENDS as needed by 1.9+
* Remove empty config file (not really of much use and there's an
  example config in the -doc package anyway)
* Use useradd.bbclass to create user
* Handle hardcoded paths in initscript
* Add LSB headers to initscript (borrowed from openSUSE)
* Set custom LICENSE as it's BSD-Style but not actually one of the
  standard BSD variants
* Add LIC_FILES_CHKSUM
* Set SUMMARY (which sets DESCRIPTION)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-daemons/radvd/files/radvd.init         |  124 ++++++++++++++++++++
 .../recipes-daemons/radvd/files/volatiles.03_radvd |    2 +
 meta-networking/recipes-daemons/radvd/radvd.inc    |   42 +++++++
 .../recipes-daemons/radvd/radvd_1.9.1.bb           |    6 +
 4 files changed, 174 insertions(+)
 create mode 100755 meta-networking/recipes-daemons/radvd/files/radvd.init
 create mode 100644 meta-networking/recipes-daemons/radvd/files/volatiles.03_radvd
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd.inc
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb

diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.init b/meta-networking/recipes-daemons/radvd/files/radvd.init
new file mode 100755
index 0000000..a48dff8
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.init
@@ -0,0 +1,124 @@
+#! /bin/sh
+#
+### BEGIN INIT INFO
+# Provides:       radvd
+# Required-Start: $remote_fs $named $syslog
+# Required-Stop:  $remote_fs $named $syslog
+# Default-Start:  3 5
+# Default-Stop:   0 1 2 6
+# Description:    router advertisement daemon
+### END INIT INFO
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/radvd
+NAME=radvd
+DESC=radvd
+CONFIG=/etc/radvd.conf
+SAVED_SETTINGS=/var/run/radvd/saved-settings
+PIDFILE=/var/run/radvd/radvd.pid
+OPTIONS="-u radvd -p $PIDFILE"
+
+test -x $DAEMON || exit 0
+
+set -e
+
+# Check for IPv6 support in kernel
+if test \! -e /proc/sys/net/ipv6; then
+  echo "IPv6 support must be enabled in the kernel for $DESC to work."
+  exit
+fi
+
+save_settings()
+{
+    local file=$1
+    
+    rm -f $file
+    for if_conf in /proc/sys/net/ipv6/conf/*; do
+	echo -e "$if_conf/forwarding\t `cat $if_conf/forwarding`" >> $file
+    done
+    return 0
+}
+
+restore_settings()
+{
+    file=$1
+    
+    if [ ! -f $file ]; then
+	echo "$0: warning: cannot restore settings"
+	return
+    fi
+    
+    ( 
+	while read f value; do
+	    if [ -w $f ]; then
+		echo $value > $f
+	    fi
+	done
+    ) < $file
+}
+
+chkconfig() {
+    if [ ! -e $CONFIG -o ! -s $CONFIG ]; then
+        echo ""
+	echo "* $CONFIG does not exist or is empty." 
+	echo "* See /usr/share/doc/radvd/examples/simple-radvd.conf for a simple"
+	echo "* configuration suitable for most systems, and radvd.conf(5)"
+	echo "* for configuration file syntax. radvd will *not* be started."
+	exit 0
+    fi
+}
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	chkconfig
+	save_settings $SAVED_SETTINGS
+	
+        # We must enable IPv6 forwarding for radvd to work
+	echo 1 > /proc/sys/net/ipv6/conf/all/forwarding
+
+	# Check for stale pidfile; radvd won't start if one is lying around
+	if [ -f $PIDFILE ] && ! ps `cat  $PIDFILE` > /dev/null; then
+	  rm -f $PIDFILE
+	fi
+	if ! start-stop-daemon --oknodo --start --pidfile $PIDFILE \
+		--exec $DAEMON -- $OPTIONS; then
+	  echo "failed." && exit 1
+	fi
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --oknodo --stop --pidfile $PIDFILE \
+		--exec $DAEMON
+	restore_settings $SAVED_SETTINGS
+	rm -f $SAVED_SETTINGS
+	echo "$NAME."
+	;;
+  reload|force-reload)
+	echo "Reloading $DESC configuration files."
+	start-stop-daemon --stop --signal HUP --quiet --pidfile \
+	    $PIDFILE --exec $DAEMON
+	;;
+  restart)
+	chkconfig
+	echo -n "Restarting $DESC: "
+	if ! start-stop-daemon --stop --quiet --pidfile \
+		$PIDFILE --exec $DAEMON; then
+	  # stop failed, so we were not running
+	  save_settings $SAVED_SETTINGS
+	  echo 1 > /proc/sys/net/ipv6/conf/all/forwarding
+	fi
+	sleep 1
+	start-stop-daemon --start --quiet --pidfile \
+		$PIDFILE --exec $DAEMON -- $OPTIONS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|reload|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-daemons/radvd/files/volatiles.03_radvd b/meta-networking/recipes-daemons/radvd/files/volatiles.03_radvd
new file mode 100644
index 0000000..89256a4
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/volatiles.03_radvd
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d radvd root 0755 /var/run/radvd none
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
new file mode 100644
index 0000000..4061279
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -0,0 +1,42 @@
+SUMMARY = "IPv6 router advertisement daemon"
+HOMEPAGE = "http://www.litech.org/radvd/"
+SECTION = "console/network"
+DEPENDS = "flex-native libdaemon"
+
+# License is BSD-Style (with advertising clause) but also has an additional 0th clause
+LICENSE = "radvd"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
+
+SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
+           file://radvd.init \
+           file://volatiles.03_radvd"
+
+inherit autotools update-rc.d useradd
+
+do_install_append () {
+	install -m 0755 -d ${D}${sysconfdir}/init.d \
+	                   ${D}${sysconfdir}/default/volatiles \
+	                   ${D}${docdir}/radvd
+	# Install init script and volatiles
+	install -m 0755 ${WORKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd
+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
+	sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
+
+	install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
+	# Documentation
+	for i in radvd.conf.example README; do \
+		install -m 0644 $i ${D}${docdir}/radvd; \
+	done
+}
+
+INITSCRIPT_NAME = "radvd"
+INITSCRIPT_PARAMS = "defaults 20 80"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
+
+pkg_postinst_${PN} () {
+        ${sysconfdir}/init.d/populate-volatile.sh update
+}
diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb b/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb
new file mode 100644
index 0000000..26d21ce
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb
@@ -0,0 +1,6 @@
+PR = "r0"
+
+require radvd.inc
+
+SRC_URI[md5sum] = "e807ad7e9a76d46b6133df391385cd31"
+SRC_URI[sha256sum] = "54eb5704a2b710ba946fa30d2bca811fa23b1b3bfab322c38cb0c2a9619aa933"
-- 
1.7.9.5



