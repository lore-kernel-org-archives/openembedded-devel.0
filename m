Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXo-0007YZ-H0
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:00 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=NX2J+fKbbfdw//riEGJMOWDpL7YhoihhszEL8e0OBNo=;
	b=HAwt1fH/nYnOtCg88yxSKQdzq1cHLUYNJzAnJq30pbT/ozhsDpfqgw8DFtrZNjdjxj
	SZn0frTJ1ypH0OgxC5jaJ/zZGQMCBXDSQOy1A2cMRtZgp8a5EMGCq4FrqARxACDiy0xi
	Zdz0Q2utCmLO8aJb+m/IcYwJ/FziAeM9NNyUk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=W66urEy2Xl8NyGxLgzcoaEMZ7dxwYKxa9jk+PLwvqO+TUsUEDS1WFKZLW3HPnWPC3N
	3vUvXsU74BRM3N2pBgjubFbIGjQe5kPamEYMJbNu6t10XNn46xOipMcxDyRaHrrINwHG
	sllhdi0su1CBCurEYz+yIScz2eiPqu00lTREM=
Received: by 10.223.6.198 with SMTP id a6mr4644175faa.128.1306696674922;
	Sun, 29 May 2011 12:17:54 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a18sm498495fak.5.2011.05.29.12.17.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:16 +0200
Message-Id: <5bf64c258ec31fbd605c2179f5e9a9bb94b0d539.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/16] gpsd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/gpsd/gpsd-2.95/60-gpsd.rules   |   47 +++++++
 meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd        |  136 ++++++++++++++++++++
 .../recipes-support/gpsd/gpsd-2.95/gpsd-default    |    5 +
 .../recipes-support/gpsd/gpsd-2.95/libtool.patch   |   16 +++
 meta-oe/recipes-support/gpsd/gpsd_2.95.bb          |  102 +++++++++++++++
 5 files changed, 306 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules
 create mode 100755 meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd_2.95.bb

diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules b/meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules
new file mode 100644
index 0000000..c01db06
--- /dev/null
+++ b/meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules
@@ -0,0 +1,47 @@
+# udev rules for gpsd
+# $Id$
+#
+# GPSes don't have their own USB device class.  They're serial-over-USB
+# devices, so what you see is actually the ID of the serial-over-USB chip.
+# Fortunately, just two of these account for over 80% of consumer-grade
+# GPS sensors.  The gpsd.hotplug.wrapper script will tell a running gpsd
+# that it should look at the device that just went active, because it
+# might be a GPS.
+#
+# The following setup works on Debian - something similar will apply on 
+# other distributions:
+# 
+#   /etc/udev/gpsd.rules
+#   /etc/udev/rules.d/025_gpsd.rules -> ../gpsd.rules
+#   /lib/udev/gpsd.hotplug.wrapper
+#   /lib/udev/gpsd.hotplug
+# 
+# Setting the link in /etc/udev/rules.d activates the rule and determines
+# when to run it on boot (similar to init.d processing).
+
+SUBSYSTEM!="tty", GOTO="gpsd_rules_end"
+
+# Prolific Technology, Inc. PL2303 Serial Port
+ATTR{idVendor}=="067b", ATTR{idProduct}=="2303", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# ATEN International Co., Ltd UC-232A Serial Port [pl2303]
+ATTR{idVendor}=="0557", ATTR{idProduct}=="2008", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# FTDI 8U232AM
+ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# Cypress M8/CY7C64013 (DeLorme uses these)
+ATTR{idVendor}=="1163", ATTR{idProduct}=="0100", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# PS-360 OEM (Microsoft GPS sold with Street and Trips 2005)
+ATTR{idVendor}=="067b", ATTR{idProduct}=="aaa0", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# Garmin International GPSmap, various models (tested with Garmin GPS 18 USB)
+ATTR{idVendor}=="091e", ATTR{idProduct}=="0003", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# Cygnal Integrated Products, Inc. CP210x Composite Device (Used by Holux m241)
+ATTR{idVendor}=="10c4", ATTR{idProduct}=="ea60", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# u-blox AG, u-blox 5 (tested with Navilock NL-402U)
+ATTR{idVendor}=="1546", ATTR{idProduct}=="01a5", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# FTDI FT232
+ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+# u-blox 4
+SYSFS{idVendor}=="1546", SYSFS{idProduct}=="01a4", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+
+ACTION=="remove", RUN+="/lib/udev/gpsd.hotplug.wrapper"
+
+LABEL="gpsd_rules_end"
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd b/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd
new file mode 100755
index 0000000..3687d24
--- /dev/null
+++ b/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd
@@ -0,0 +1,136 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          gpsd
+# Required-Start:    $remote_fs $network
+# Should-Start:      bluetooth dbus udev
+# Required-Stop:     $remote_fs $network
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: GPS (Global Positioning System) daemon start/stop script
+# Description:       Start/Stop script for the gpsd service daemon,
+#                    which is able to monitor one or more GPS devices
+#                    connected to a host computer, making all data on
+#                    the location and movements of the sensors available
+#                    to be queried on TCP port 2947.
+### END INIT INFO
+
+# Author: Bernd Zeimetz <bzed@debian.org>
+#
+# Please remove the "Author" lines above and replace them
+# with your own name if you copy and modify this script.
+
+# Do NOT "set -e"
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+DESC="GPS (Global Positioning System) daemon"
+NAME=gpsd
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+SCRIPTNAME=/etc/init.d/$NAME
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration, if present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+if [ -z "$GPSD_SOCKET" ] && [ -z "$DEVICES" ]; then
+	GPSD_SOCKET=/var/run/gpsd.sock
+fi
+
+if [ -n "$GPSD_SOCKET" ]; then
+        GPSD_OPTIONS="$GPSD_OPTIONS -F $GPSD_SOCKET"
+fi
+
+#
+# Function that starts the daemon/service
+#
+do_start()
+{
+	# Return
+	#   0 if daemon has been started
+	#   1 if daemon was already running
+	#   2 if daemon could not be started
+	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --test \
+        -- $GPSD_OPTIONS -P $PIDFILE $GPS_DEVICES > /dev/null \
+		|| return 1
+	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
+		$GPSD_OPTIONS -P $PIDFILE $GPS_DEVICES \
+		|| return 2
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+	# Return
+	#   0 if daemon has been stopped
+	#   1 if daemon was already stopped
+	#   2 if daemon could not be stopped
+	#   other if a failure occurred
+	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
+	RETVAL="$?"
+	[ "$RETVAL" = 2 ] && return 2
+	# Many daemons don't delete their pidfiles when they exit.
+	rm -f $PIDFILE
+	return "$RETVAL"
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+	#
+	# If the daemon can reload its configuration without
+	# restarting (for example, when it is sent a SIGHUP),
+	# then implement that here.
+	#
+	start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --name $NAME
+	return 0
+}
+
+case "$1" in
+  start)
+		echo "Starting $DESC" "$NAME"
+		do_start
+		return $?
+	;;
+  stop)
+	echo "Stopping $DESC" "$NAME"
+	do_stop
+	return $?
+	;;
+  status)
+       ;;
+  reload|force-reload)
+	echo "Reloading $DESC" "$NAME"
+	do_reload
+	return $?
+	;;
+  restart)
+	#
+	# If the "reload" option is implemented then remove the
+	# 'force-reload' alias
+	#
+	echo "Restarting $DESC" "$NAME"
+	do_stop
+	case "$?" in
+	  0|1)
+		do_start
+		return $?
+		;;
+	  *)
+	 	# Failed to stop
+		return 1
+		;;
+	esac
+	;;
+  *)
+	echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
+	exit 3
+	;;
+esac
+
+:
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default b/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default
new file mode 100644
index 0000000..0ceff03
--- /dev/null
+++ b/meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default
@@ -0,0 +1,5 @@
+# If you must specify a non-NMEA driver, uncomment and modify the next line
+GPSD_SOCKET="/var/run/gpsd.sock"
+GPSD_OPTIONS="" 
+GPS_DEVICES=""
+
diff --git a/meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch b/meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch
new file mode 100644
index 0000000..7b78a72
--- /dev/null
+++ b/meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch
@@ -0,0 +1,16 @@
+Index: gpsd-2.95/Makefile.am
+===================================================================
+--- gpsd-2.95.orig/Makefile.am	2010-08-26 15:31:38.804330723 +0200
++++ gpsd-2.95/Makefile.am	2010-08-26 15:31:57.170020341 +0200
+@@ -253,9 +253,9 @@
+ # Warning: This overrides autoconf's normal link-line generation process
+ if LIBGPSMM_ENABLE
+ libgps_la_SOURCES += libgpsmm.cpp
+-libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
++libgps_la_LINK = $(LIBTOOL) --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
+ else
+-libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
++libgps_la_LINK = $(LIBTOOL) --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
+ endif
+ 
+ nodist_libgpsd_la_SOURCES = packet_names.h ais_json.i
diff --git a/meta-oe/recipes-support/gpsd/gpsd_2.95.bb b/meta-oe/recipes-support/gpsd/gpsd_2.95.bb
new file mode 100644
index 0000000..a674119
--- /dev/null
+++ b/meta-oe/recipes-support/gpsd/gpsd_2.95.bb
@@ -0,0 +1,102 @@
+DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
+DEPENDS = "dbus-glib ncurses python libusb1"
+PROVIDES = "virtual/gpsd"
+
+EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
+                --x-libraries=${STAGING_LIBDIR} \
+                --enable-dbus \
+                --disable-libQgpsmm \
+"
+
+SRC_URI = "http://download.berlios.de/${PN}/${P}.tar.gz;name=gpsd \
+           file://libtool.patch \
+           file://gpsd-default \
+           file://gpsd \
+           file://60-gpsd.rules"
+SRC_URI[gpsd.md5sum] = "12535a9ed9fecf9ea2c5bdc9840da5ae"
+SRC_URI[gpsd.sha256sum] = "832343a53921a8371efa540ba57c91dadedda445e571c1beb97c06539ef450ae"
+
+inherit autotools update-rc.d python-dir
+
+INITSCRIPT_NAME = "gpsd"
+INITSCRIPT_PARAMS = "defaults 35"
+
+LDFLAGS += "-L${STAGING_LIBDIR} -lm"
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure_prepend() {
+    # skip first
+    sed -i "s#for pylibpath in '/usr/lib'#for pylibpath in #g" ${S}/configure.ac
+}
+
+do_compile_prepend() {
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+	find ${S} -name "*.so" -exec rm -f {} \;
+}
+
+do_install_prepend() {
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+}
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
+    install -d ${D}/${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
+
+    #support for udev
+    install -d ${D}/${sysconfdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
+    install -d ${D}${base_libdir}/udev/
+    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
+    install -d ${D}${base_libdir}/udev/
+    install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
+
+pkg_postinst_${PN}-conf() {
+	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
+}
+
+pkg_postrm_${PN}-conf() {
+	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
+}
+
+PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+
+FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
+
+RDEPENDS_${PN} = "gpsd-gpsctl"
+RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
+
+DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
+FILES_gpsd-udev = "${base_libdir}/* ${sysconfdir}/udev/*"
+RDEPENDS_gpsd-udev += "udev gpsd-conf"
+
+DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
+FILES_libgpsd = "${libdir}/libgpsd.so.*"
+
+DESCRIPTION_libgps = "C service library used for communicating with gpsd"
+FILES_libgps = "${libdir}/libgps.so.*"
+
+DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts" 
+FILES_gpsd-conf = "${sysconfdir}"
+
+DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
+FILES_gpsd-gpsctl = "${bindir}/gpsctl"
+
+DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
+FILES_gps-utils = "${bindir}/*"
+RDEPENDS_gps-utils = "python-pygps"
+
+DESCRIPTION_python-pygps = "Python bindings to gpsd"
+FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
-- 
1.7.5.rc3



