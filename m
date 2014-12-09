Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3F2601A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 01:37:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44702942"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Dec 2014 09:34:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB91bP4C007701
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Dec 2014 09:37:25 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 9 Dec 2014 09:37:50 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Dec 2014 09:36:12 +0800
Message-ID: <1418088972-3518-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] openct: add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 01:37:52 -0000
Content-Type: text/plain

OpenCT implements drivers for several smart card readers.
It comes as driver in ifdhandler format for PC/SC-Lite,
as CT-API driver, or as a small and lean middleware,
so applications can use it with minimal overhead.
OpenCT also has a primitive mechanism to export smart card
readers to remote machines via TCP/IP.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../openct/etc-openct.udev.in-disablePROGRAM.patch | 31 ++++++++
 .../openct/etc-openct_usb.in-modify-UDEVINFO.patch | 35 +++++++++
 meta-oe/recipes-support/openct/openct/openct.init  | 89 ++++++++++++++++++++++
 .../recipes-support/openct/openct/openct.service   | 13 ++++
 .../recipes-support/openct/openct/openct.sysconfig |  5 ++
 meta-oe/recipes-support/openct/openct_0.6.20.bb    | 83 ++++++++++++++++++++
 6 files changed, 256 insertions(+)
 create mode 100644 meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
 create mode 100644 meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
 create mode 100644 meta-oe/recipes-support/openct/openct/openct.init
 create mode 100644 meta-oe/recipes-support/openct/openct/openct.service
 create mode 100644 meta-oe/recipes-support/openct/openct/openct.sysconfig
 create mode 100644 meta-oe/recipes-support/openct/openct_0.6.20.bb

diff --git a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
new file mode 100644
index 0000000..745f923
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
@@ -0,0 +1,31 @@
+From e0d3e0bb1e38ff851696a7d8826e651d364ad8ce Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 5 Dec 2014 02:00:57 +0900
+Subject: [PATCH 1/2] etc/openct.udev.in: disablePROGRAM
+
+Bug fix: https://bugzilla.redhat.com/show_bug.cgi?id=287871
+
+Upstream-status: Pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ etc/openct.udev.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/etc/openct.udev.in b/etc/openct.udev.in
+index d11d0e1..48083c9 100644
+--- a/etc/openct.udev.in
++++ b/etc/openct.udev.in
+@@ -22,7 +22,8 @@ ACTION!="add", GOTO="openct_usb_rules_end"
+ # 2010-01-06 removed, as latest udev doesn't know WAIT_FOR_ATTR any more.
+ 
+ # sleep for 100ms - the wait_for_sysfs might not be enough
+-PROGRAM="/bin/sleep 0.1"
++# Disabled in this package - see https://bugzilla.redhat.com/287871
++# PROGRAM="/bin/sleep 0.1"
+ 
+ # ccid
+ ATTR{bInterfaceClass}=="0b", ATTR{bInterfaceSubClass}=="00", ATTR{bInterfaceProtocol}=="00", ATTRS{idVendor}=="?*"  RUN+="@udevdir@/openct_usb /dev/$parent"
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
new file mode 100644
index 0000000..d5e3fe5
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
@@ -0,0 +1,35 @@
+From d93985a137b553b2723235d03bda341dab14064f Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 5 Dec 2014 02:04:03 +0900
+Subject: [PATCH 2/2] etc/openct_usb.in: modify UDEVINFO
+
+this patch is from Fedora
+
+Upstream-status: Pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ etc/openct_usb.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/etc/openct_usb.in b/etc/openct_usb.in
+index 32f91aa..917467d 100644
+--- a/etc/openct_usb.in
++++ b/etc/openct_usb.in
+@@ -15,10 +15,10 @@ if [ -z "$DEVNAME" ]; then
+ 	# Guess udev info interface.
+ 	# Newer udev uses udevadm
+ 	#
+-	if which udevinfo > /dev/null 2>&1; then
+-		UDEVINFO="udevinfo"
+-	else
++	if which udevadm > /dev/null 2>&1; then
+ 		UDEVINFO="udevadm info"
++	else
++		UDEVINFO="udevinfo"
+ 	fi
+ 	DEVNAME=/dev/$($UDEVINFO --query=name --path=$(dirname $DEVPATH))
+ fi
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/openct/openct/openct.init b/meta-oe/recipes-support/openct/openct/openct.init
new file mode 100644
index 0000000..c689609
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/openct.init
@@ -0,0 +1,89 @@
+#!/bin/sh
+#
+# openct       This shell script takes care of starting and stopping OpenCT.
+#
+# chkconfig:   2345 24 89
+# description: OpenCT is a middleware framework for smart card terminals.
+#
+# processname: ifdhandler
+# config:      /etc/openct.conf
+
+### BEGIN INIT INFO
+# Provides: openct
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Should-Start: $syslog $network
+# Should-Stop: $syslog $network
+# Short-Description: Middleware framework for smart card terminals
+# Description: This starts/stops the OpenCT middleware framework support
+#              for smart card terminals.
+### END INIT INFO
+
+. /etc/init.d/functions
+
+exec="/usr/sbin/openct-control"
+prog=openct
+proc=ifdhandler
+
+OPENCT_OPTIONS=
+[ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
+
+lockfile=/var/lock/subsys/$prog
+
+start() {
+    retval=0
+    if ! status $proc >/dev/null 2>&1 ; then
+        action $"Initializing OpenCT smart card terminals: " \
+            $exec $OPENCT_OPTIONS init
+        retval=$?
+        [ $retval -eq 0 ] && touch $lockfile
+    fi
+    return $retval
+}
+
+stop() {
+    if status $proc >/dev/null 2>&1 ; then
+        action $"Stopping OpenCT smart card terminals: " \
+            $exec $OPENCT_OPTIONS shutdown
+    fi
+    retval=$?
+    if [ $retval -eq 0 ] ; then
+        rm -f /var/run/openct/status
+        rm -f $lockfile
+    fi
+    return $retval
+}
+
+restart() {
+    stop
+    start
+}
+
+oct_status() {
+    status $proc
+    retval=$?
+    if [ -e /var/run/openct/status ] ; then
+        $exec $OPENCT_OPTIONS status
+        [ -e /var/run/openct/status ] && \
+            echo $"Waiting for reader attach/detach events..."
+    fi
+    return $retval
+}
+
+case "$1" in
+    start|stop|restart)
+        $1
+        ;;
+    reload|force-reload)
+        restart
+        ;;
+    status)
+        oct_status
+        ;;
+    try-restart|condrestart)
+  	[ ! -f $lockfile ] || restart
+	;;
+    *)
+        echo $"Usage: $0 {start|stop|status|restart|try-restart|reload|force-reload}"
+        exit 2
+esac
diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-oe/recipes-support/openct/openct/openct.service
new file mode 100644
index 0000000..c9ec497
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/openct.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Openct Middleware framework for smart card terminals
+After=syslog.target network.target
+
+[Service]
+EnvironmentFile=-/etc/sysconfig/openct
+ExecStart=/usr/sbin/openct-control $OPENCT_OPTIONS init 
+ExecStop=/usr/sbin/openct-control $OPENCT_OPTIONS shutdown
+RemainAfterExit=yes
+KillMode=none
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openct/openct/openct.sysconfig b/meta-oe/recipes-support/openct/openct/openct.sysconfig
new file mode 100644
index 0000000..ffc2707
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/openct.sysconfig
@@ -0,0 +1,5 @@
+#                                                                    -*- sh -*-
+# Extra options to pass to openct-control.
+# Consult "/usr/sbin/openct-control -h" for available options.
+#
+OPENCT_OPTIONS=""
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
new file mode 100644
index 0000000..29c2419
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -0,0 +1,83 @@
+Summanry = "Middleware framework for smart card terminals"
+DESCRIPTION = "OpenCT implements drivers for several smart card readers. \
+It comes as driver in ifdhandler format for PC/SC-Lite, \
+as CT-API driver, or as a small and lean middleware, \
+so applications can use it with minimal overhead. \
+OpenCT also has a primitive mechanism to export smart card \
+readers to remote machines via TCP/IP."
+
+DEPENDS += "libtool pcsc-lite libusb-compat"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/o/${PN}/${PN}_${PV}.orig.tar.gz \
+    file://etc-openct.udev.in-disablePROGRAM.patch \
+    file://etc-openct_usb.in-modify-UDEVINFO.patch \
+    file://openct.init \
+    file://openct.sysconfig \
+    file://openct.service"
+
+SRC_URI[md5sum] = "a1da3358ab798f1cb9232f1dbababc21"
+SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d181a68"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+SYSTEMD_SERVICE_${PN} += "openct.service "
+SYSTEMD_AUTO_ENABLE = "enable"
+
+EXTRA_OECONF=" \
+    --disable-static \
+    --enable-usb \
+    --enable-pcsc \
+    --enable-doc \
+    --enable-api-doc \
+    --with-udev=/lib/udev \
+    --with-bundle=${libdir}/pcsc/drivers \
+"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += " \
+    ${libdir}/ctapi \
+    /lib/udev \
+    ${libdir}/openct-ifd.so \
+    ${libdir}/pcsc \
+    /run/openct/status \
+"
+
+FILES_${PN}-dbg += " \
+    ${libdir}/ctapi/.debug \
+    ${libdir}/pcsc/drivers/openct-ifd.bundle/Contents/Linux/.debug \
+"
+
+INSANE_SKIP_${PN} += "dev-deps"
+
+do_install () {
+    rm -rf ${D}
+    install -d ${D}/etc
+    install -dm 755 ${D}/lib/udev
+    # fix up hardcoded paths
+    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
+        ${WORKDIR}/openct.service ${WORKDIR}/openct.init
+    oe_runmake install DESTDIR=${D}
+    install -dm 755 ${D}${libdir}/ctapi
+    mv ${D}${libdir}/{libopenctapi.so,ctapi}
+    install -Dpm 644 etc/openct.udev ${D}/etc/udev/rules.d/60-openct.rules
+    install -pm 644 etc/openct.conf ${D}/etc/openct.conf
+    install -Dpm 755 ${WORKDIR}/openct.init ${D}/etc/init.d/openct
+    install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}/etc/sysconfig/openct
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/openct.service ${D}/${systemd_unitdir}/system
+    fi
+    so=$(find ${D} -name \*.so | sed "s|^${D}||")
+    sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
+    install -Dpm 644 etc/reader.conf ${D}/etc/reader.conf.d/openct.conf
+    install -dm 755 ${D}${localstatedir}/run/openct
+    touch ${D}${localstatedir}/run/openct/status
+    chmod 644 ${D}${localstatedir}/run/openct/status
+}
+
+pkg_postinst_${PN} () {
+    ln -sf ctapi/libopenctapi.so ${libdir}/libopenctapi.so
+}
-- 
1.8.4.2


