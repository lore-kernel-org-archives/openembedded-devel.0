Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TPEVL-0007JI-3A
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 17:28:55 +0200
Received: by mail-vb0-f47.google.com with SMTP id ez10so556543vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ASrTZwwaZEsZ6Tu5CD9J6PPyyZRfzmz8bU/jvCIIs6s=;
	b=flc2LTr8sxOFxUbZ/LoWwc63o5AR3wfmoIRNclzapyi51N8Nq1lux/9NMRn2KhGiKe
	TkAR6VOBGGN+r4CxiTbeWz9eU8lFxXa2nyuc/QE70hcJtyYuLM6BIii465EvrUuTAT2+
	Tl599BD3mA8b14JeBmz9+cZQLdJwoTbfOnI/pxszIFvmFicB1CE3HADyRme2XDLJgP1M
	D9sTn2mVD3kFcliEZsAvdylPX/4RK828C8x2vRR7zbK2ZAxtvxWbBCMGdnRcNWB1fDuo
	UhvQjI0NeFFIZrqotKVnq2gv3n+ln9+Y/qv1ZcxmWGA2sjLcfXJOToi4N+wtaFwAQaFe
	rYvQ==
Received: by 10.58.32.233 with SMTP id m9mr2131368vei.23.1350659733516;
	Fri, 19 Oct 2012 08:15:33 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id v9sm1652299ves.8.2012.10.19.08.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 08:15:32 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Fri, 19 Oct 2012 11:15:38 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Oct 2012 11:15:34 -0400
Message-Id: <1350659734-10362-2-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
References: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
Subject: [meta-oe][PATCH] lmsensors: Initial commit
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
X-List-Received-Date: Fri, 19 Oct 2012 15:28:55 -0000

The lmsensors project provides hardware health monitoring tools in the
form of kernel drivers, a user-space library and some helper
programs. This recipe provides all the different user-space tools
offered by lmsensors in separete packages. Startup scripts and default
configuration files are also made available through this commit.

The packages consist of (description text from lmsensors documentation):
* lmsensors-libsensors: The user-space sensors support library code.
* lmsensors-sensors: A console tool to report sensor readings and set
  new sensor limits.
* lmsensors-sensord: A daemon to watch sensor values and log
  problems. It includes RRD support.
* lmsensors-fancontrol: Controls fanspeeds responding to changes on
  temperature sensors. Configuration through pwmconfig.
* lmsensors-sensorsdetect: This program tries to detect the available
  SMBus adapters and the chips connected to them, as well as Super-I/O
  and misc chips.
* lmsensors-sensorsconfconvert: Convert configuration files from
  lmsensorsv2 to lmsensorsv3.
* lmsensors-pwmconfig: tests the pwm (pulse width modulation) outputs
  of sensors for their effect on the fans and helps to setup the
  configfile for fancontrol.
* lmsensors-isatools: This program sets/gets the registers of ISA or
  Super-I/O chips.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 .../recipes-support/lm_sensors/files/fancontrol    |    2 +
 .../recipes-support/lm_sensors/files/fancontrol.sh |   48 +++++++
 .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++
 .../recipes-support/lm_sensors/files/sensord.conf  |   16 +++
 .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++
 .../recipes-support/lm_sensors/files/sensors.conf  |    2 +
 .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  140 ++++++++++++++++++++
 7 files changed, 267 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb

diff --git a/meta-oe/recipes-support/lm_sensors/files/fancontrol b/meta-oe/recipes-support/lm_sensors/files/fancontrol
new file mode 100644
index 0000000..1f03a2b
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/files/fancontrol
@@ -0,0 +1,2 @@
+# fancontrol configuration file.
+# Place your device specific configuration in this file.
diff --git a/meta-oe/recipes-support/lm_sensors/files/fancontrol.sh b/meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
new file mode 100644
index 0000000..f179310
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
@@ -0,0 +1,48 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          fancontrol
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: fancontrol initscript
+# Description:       Starts and controls the fancontrol daemon
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="fan control daemon"
+NAME="fancontrol"
+FANCONTROL=`which $NAME`
+
+. /etc/init.d/functions || exit 1
+
+# Exit if the package is not installed
+[ -x "$FANCONTROL" ] || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: $NAME... "
+        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
+        echo "done."
+        ;;
+    stop)
+        echo -n "Stopping $DESC: $NAME... "
+        /sbin/start-stop-daemon -K -x $FANCONTROL
+        echo "done."
+        ;;
+    restart)
+        echo "Restarting $DESC: $NAME... "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensord.cgi b/meta-oe/recipes-support/lm_sensors/files/sensord.cgi
new file mode 100644
index 0000000..b1aad05
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/files/sensord.cgi
@@ -0,0 +1,10 @@
+#!/usr/bin/rrdcgi
+
+<html>
+<head>
+<title>sensord</title>
+</head>
+<body>
+Generate a valid sensord.cgi script and install it in your BSP.
+</body>
+</html>
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensord.conf b/meta-oe/recipes-support/lm_sensors/files/sensord.conf
new file mode 100644
index 0000000..6b48cf6
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/files/sensord.conf
@@ -0,0 +1,16 @@
+# Default sensord configuration file
+# Syntax: sensord {options} {chips}
+# -i, --interval <time>     -- interval between scanning alarms (default 60s)
+# -l, --log-interval <time> -- interval between logging sensors (default 30m)
+# -t, --rrd-interval <time> -- interval between updating RRD file (default 5m)
+# -T, --rrd-no-average      -- switch RRD in non-average mode
+# -r, --rrd-file <file>     -- RRD file (default <none>)
+# -c, --config-file <file>  -- configuration file
+# -p, --pid-file <file>     -- PID file (default /var/run/sensord.pid)
+# -f, --syslog-facility <f> -- syslog facility to use (default local4)
+# -g, --rrd-cgi <img-dir>   -- output an RRD CGI script and exit
+# -a, --load-average        -- include load average in RRD file
+# -d, --debug               -- display some debug information
+# -v, --version             -- display version and exit
+# -h, --help                -- display help and exit
+SENSORD_ARGS="-i60s -l30m -t1m -r/var/lib/sensord.rrd -a"
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensord.sh b/meta-oe/recipes-support/lm_sensors/files/sensord.sh
new file mode 100644
index 0000000..5a09cd3
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/files/sensord.sh
@@ -0,0 +1,49 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          sensord
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: sensord initscript
+# Description:       Starts the sensord logging daemon
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="sensors logging daemon"
+NAME="sensord"
+SENSORD=`which $NAME`
+
+. /etc/init.d/functions || exit 1
+. /etc/sensord.conf || exit 1
+
+# Exit if the package is not installed
+[ -x "$SENSORD" ] || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: $NAME... "
+        start-stop-daemon -S -x $SENSORD -- $SENSORD_ARGS
+        echo "done."
+        ;;
+    stop)
+        echo -n "Stopping $DESC: $NAME... "
+        start-stop-daemon -K -x $SENSORD
+        echo "done."
+        ;;
+    restart)
+        echo "Restarting $DESC: $NAME... "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensors.conf b/meta-oe/recipes-support/lm_sensors/files/sensors.conf
new file mode 100644
index 0000000..bb8c93d
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/files/sensors.conf
@@ -0,0 +1,2 @@
+# sensors configuration file.
+# Place your device specific configuration in this file.
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
new file mode 100644
index 0000000..5c6c91d
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
@@ -0,0 +1,140 @@
+SUMMARY = "lm_sensors"
+DESCRIPTION = "Hardware health monitoring applications"
+HOMEPAGE = "http://www.lm-sensors.org/"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
+
+SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
+           file://fancontrol \
+           file://fancontrol.sh \
+           file://sensors.conf \
+           file://sensord.conf \
+           file://sensord.sh \
+           file://sensord.cgi \
+"
+
+SRC_URI[md5sum] = "f357ba00b080ab102a170f7bf8bb2578"
+SRC_URI[sha256sum] = "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258da5444c149a9e3ae1"
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "${PN}-fancontrol ${PN}-sensord"
+INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol.sh"
+INITSCRIPT_NAME_${PN}-sensord = "sensord.sh"
+INITSCRIPT_PARAMS_${PN}-fancontrol = "defaults 66"
+INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67"
+
+S = "${WORKDIR}/lm_sensors-${PV}"
+
+EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
+		MACHINE=${TARGET_ARCH} PREFIX=${prefix} CC="${CC}" AR="${AR}"'
+
+do_compile() {
+    oe_runmake user PROG_EXTRA="sensors sensord"
+}
+
+do_install() {
+    oe_runmake user_install DESTDIR=${D}
+    install -m 0755 ${S}/prog/sensord/sensord ${D}${bindir}
+    install -m 0644 ${S}/prog/sensord/sensord.8 ${D}/usr/man/man8
+
+    # move manuals into proper place
+    install -d ${D}${mandir}
+    rm -rf ${D}${mandir}/*
+    mv ${D}/usr/man/* ${D}${mandir}
+    rmdir ${D}/usr/man
+
+    # Install directories
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/sensors.d
+
+    # Install sensors.conf
+    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
+
+    # Install fancontrol config file
+    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
+
+    # Install fancontrol init script
+    install -m 0755 ${WORKDIR}/fancontrol.sh ${D}${sysconfdir}/init.d
+
+    # Install sensord init script
+    install -m 0755 ${WORKDIR}/sensord.sh ${D}${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
+
+    # Install sensord.cgi script and create world-writable
+    # web-accessible sensord directory.
+    install -d ${D}/www/pages/cgi-bin
+    install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
+    install -d -m a=rwxs ${D}/www/pages/sensord
+}
+
+# libsensors packages
+PACKAGES =+ "${PN}-libsensors ${PN}-libsensors-dbg ${PN}-libsensors-dev ${PN}-libsensors-staticdev ${PN}-libsensors-doc"
+
+# sensors command packages
+PACKAGES =+ "${PN}-sensors ${PN}-sensors-dbg ${PN}-sensors-doc"
+
+# sensord logging daemon
+PACKAGES =+ "${PN}-sensord ${PN}-sensord-dbg ${PN}-sensord-doc"
+
+# fancontrol script
+PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc"
+
+# sensors-detect script
+PACKAGES =+ "${PN}-sensorsdetect ${PN}-sensorsdetect-doc"
+
+# sensors-conf-convert script
+PACKAGES =+ "${PN}-sensorsconfconvert"
+
+# pwmconfig script
+PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
+
+# isadump and isaset helper program
+PACKAGES =+ "${PN}-isatools ${PN}-isatools-dbg ${PN}-isatools-doc"
+
+# libsensors files
+FILES_${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d/sensors.conf"
+FILES_${PN}-libsensors-dbg = "${libdir}/.debug ${prefix}/src/debug"
+FILES_${PN}-libsensors-dev = "${libdir}/libsensors.so ${includedir}"
+FILES_${PN}-libsensors-staticdev = "${libdir}/libsensors.a"
+FILES_${PN}-libsensors-doc = "${mandir}/man3"
+
+# sensors command files
+FILES_${PN}-sensors = "${bindir}/sensors"
+FILES_${PN}-sensors-dbg = "${bindir}/.debug/sensors"
+FILES_${PN}-sensors-doc = "${mandir}/man1 ${mandir}/man5"
+RDEPENDS_${PN}-sensors = "${PN}-libsensors"
+
+# sensord logging daemon
+FILES_${PN}-sensord = "${bindir}/sensord ${sysconfdir}/sensord.conf ${sysconfdir}/init.d/sensord.sh /www/*"
+FILES_${PN}-sensord-dbg = "${bindir}/.debug/sensord"
+FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
+RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool lighttpd lighttpd-module-cgi"
+
+# fancontrol script files
+FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${sysconfdir}/fancontrol ${sysconfdir}/init.d/fancontrol.sh"
+FILES_${PN}-fancontrol-doc = "${mandir}/man8/fancontrol.8"
+RDEPENDS_${PN}-fancontrol = "bash"
+
+# sensors-detect script files
+FILES_${PN}-sensorsdetect = "${sbindir}/sensors-detect"
+FILES_${PN}-sensorsdetect-doc = "${mandir}/man8/sensors-detect.8"
+RDEPENDS_${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
+
+# sensors-conf-convert script files
+FILES_${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
+RDEPENDS_${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
+
+# pwmconfig script files
+FILES_${PN}-pwmconfig = "${sbindir}/pwmconfig"
+FILES_${PN}-pwmconfig-doc = "${mandir}/man8/pwmconfig.8"
+RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol"
+
+# isadump and isaset helper program files
+FILES_${PN}-isatools = "${sbindir}/isa*"
+FILES_${PN}-isatools-dbg = "${sbindir}/.debug/isa*"
+FILES_${PN}-isatools-doc = "${mandir}/man8/isa*"
-- 
1.7.5.4



