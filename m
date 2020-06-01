Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.28445.1590977224582434417
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 19:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05126CML009117
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 19:06:53 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 31 May
 2020 19:06:39 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gpsd: add new init script
Date: Mon, 1 Jun 2020 10:06:25 +0800
Message-ID: <20200601020625.17417-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

The current init script can not start/stop gpsd daemon with the
following errors:
gpsd: line 48: /lib/init/vars.sh: No such file or directory
gpsd: line 52: /lib/lsb/init-functions: No such file or directory

Add a new init script to fix the issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-navigation/gpsd/gpsd/gpsd.init    | 158 ++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb  |   3 +-
 2 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.init

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.init b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.init
new file mode 100644
index 000000000..c9db0bb5c
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.init
@@ -0,0 +1,158 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          gpsd
+# Required-Start:    $remote_fs $syslog $network
+# Should-Start:      bluetooth dbus udev
+# Required-Stop:     $remote_fs $syslog $network
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# X-Start-Before:    ntp
+# Short-Description: GPS (Global Positioning System) daemon start/stop script
+# Description:       Start/Stop script for the gpsd service daemon,
+#                    which is able to monitor one or more GPS devices
+#                    connected to a host computer, making all data on
+#                    the location and movements of the sensors available
+#                    to be queried on TCP port 2947.
+### END INIT INFO
+
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="GPS (Global Positioning System) daemon"
+NAME="gpsd"
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+. /etc/init.d/functions || exit 1
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+if [ -z "$GPSD_SOCKET" ] && [ -z "$DEVICES" ]; then
+	GPSD_SOCKET=/var/run/gpsd.sock
+fi
+
+if [ -n "$GPSD_SOCKET" ]; then
+	GPSD_OPTIONS="$GPSD_OPTIONS -F $GPSD_SOCKET"
+fi
+
+DAEMON_ARGS="$GPSD_OPTIONS $DEVICES"
+
+#
+# Function that starts the daemon/service
+#
+do_start() {
+	local status pid
+
+	status=0
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "$DESC already running ($pid)."
+		exit 1
+		;;
+	*)
+		echo "Starting $DESC ..."
+		exec $DAEMON $DAEMON_ARGS >/dev/null 2>&1 || status=$?
+		echo "ERROR: Failed to start $DESC."
+		exit $status
+		;;
+	esac
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop() {
+	local pid status
+
+	status=0
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		# Exit when fail to stop, the kill would complain when fail
+		kill -s 15 $pid >/dev/null && rm -f $PIDFILE && \
+			echo "Stopped $DESC ($pid)." || exit $?
+		;;
+	*)
+		echo "$DESC is not running; none killed." >&2
+		;;
+	esac
+
+	return $status
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+	local pid status
+
+	status=0
+	# If the daemon can reload its configuration without
+	# restarting (for example, when it is sent a SIGHUP),
+	# then implement that here.
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "Reloading $DESC ..."
+		kill -s 1 $pid || exit $?
+		;;
+	*)
+		echo "$DESC is not running; none reloaded." >&2
+		;;
+	esac
+	exit $status
+}
+
+
+#
+# Function that shows the daemon/service status
+#
+status_of_proc () {
+	local pid status
+
+	status=0
+	# pidof output null when no program is running, so no "2>/dev/null".
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "$DESC is running ($pid)."
+		exit 0
+		;;
+	*)
+		echo "$DESC is not running." >&2
+		exit $status
+		;;
+	esac
+}
+
+case "$1" in
+start)
+	do_start
+	;;
+stop)
+	do_stop || exit $?
+	;;
+status)
+	status_of_proc
+	;;
+restart)
+	# Always start the service regardless the status of do_stop
+	do_stop
+	do_start
+	;;
+force-reload)
+	# Only start the service when do_stop succeeds
+	do_stop && do_start
+	;;
+*)
+	echo "Usage: $0 {start|stop|status|restart|force-reload}" >&2
+	exit 3
+	;;
+esac
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
index 390e6a8c3..3888ad8fa 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
@@ -8,6 +8,7 @@ PROVIDES = "virtual/gpsd"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0001-Revert-SConstruct-Add-test-for-sizeof-time_t-result-.patch \
+    file://gpsd.init \
 "
 SRC_URI[md5sum] = "cf7fdec7ce7221d20bee1a7246362b05"
 SRC_URI[sha256sum] = "172a7805068eacb815a3c5225436fcb0be46e7e49a5001a94034eac43df85e50"
@@ -66,7 +67,7 @@ do_install() {
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${S}/packaging/deb/etc_init.d_gpsd ${D}/${sysconfdir}/init.d/gpsd
+    install -m 0755 ${WORKDIR}/gpsd.init ${D}/${sysconfdir}/init.d/gpsd
     install -d ${D}/${sysconfdir}/default
     install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}/${sysconfdir}/default/gpsd.default
 
-- 
2.17.1

