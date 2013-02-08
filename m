Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3bwM-0007Po-1K for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 01:35:58 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3bhE-0000k7-Ju for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 01:20:04 +0100
Received: from tfitzsim-lnx.cisco.com ([161.44.225.6])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 01:20:04 +0100
Received: from fitzsim by tfitzsim-lnx.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 01:20:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Thomas Fitzsimmons <fitzsim@cisco.com>
Date: Thu, 07 Feb 2013 19:14:56 -0500
Message-ID: <37c8c82a510f475cf4ea5526e33f0bfbe9496967.1360262057.git.fitzsim@cisco.com>
References: <cover.1360262057.git.fitzsim@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: tfitzsim-lnx.cisco.com
In-Reply-To: <cover.1360262057.git.fitzsim@cisco.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1.50 (gnu/linux)
Cancel-Lock: sha1:wQd3oWiZ3likDk+9sRbjJilk9fY=
Subject: [meta-oe][PATCH 2/2] lmsensors: Add lmsensors-config RRECOMMENDS
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
X-List-Received-Date: Fri, 08 Feb 2013 00:36:02 -0000
Content-Type: text/plain


Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
---
 .../recipes-support/lm_sensors/files/fancontrol.sh |   48 -----------------
 .../recipes-support/lm_sensors/files/sensord.sh    |   49 -----------------
 .../lm_sensors/lmsensors/fancontrol.init           |   48 +++++++++++++++++
 .../lm_sensors/lmsensors/sensord.init              |   49 +++++++++++++++++
 .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |   56 +++++++-------------
 5 files changed, 116 insertions(+), 134 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init

diff --git a/meta-oe/recipes-support/lm_sensors/files/fancontrol.sh b/meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
deleted file mode 100644
index f179310..0000000
--- a/meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
+++ /dev/null
@@ -1,48 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          fancontrol
-# Required-Start:    $local_fs
-# Should-Start:
-# Required-Stop:     $local_fs
-# Should-Stop:
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: fancontrol initscript
-# Description:       Starts and controls the fancontrol daemon
-### END INIT INFO
-
-PATH=/sbin:/usr/sbin:/bin:/usr/bin
-
-DESC="fan control daemon"
-NAME="fancontrol"
-FANCONTROL=`which $NAME`
-
-. /etc/init.d/functions || exit 1
-
-# Exit if the package is not installed
-[ -x "$FANCONTROL" ] || exit 0
-
-case "$1" in
-    start)
-        echo -n "Starting $DESC: $NAME... "
-        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
-        echo "done."
-        ;;
-    stop)
-        echo -n "Stopping $DESC: $NAME... "
-        /sbin/start-stop-daemon -K -x $FANCONTROL
-        echo "done."
-        ;;
-    restart)
-        echo "Restarting $DESC: $NAME... "
-        $0 stop
-        $0 start
-        echo "done."
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart}"
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensord.sh b/meta-oe/recipes-support/lm_sensors/files/sensord.sh
deleted file mode 100644
index 5a09cd3..0000000
--- a/meta-oe/recipes-support/lm_sensors/files/sensord.sh
+++ /dev/null
@@ -1,49 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          sensord
-# Required-Start:    $local_fs
-# Should-Start:
-# Required-Stop:     $local_fs
-# Should-Stop:
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: sensord initscript
-# Description:       Starts the sensord logging daemon
-### END INIT INFO
-
-PATH=/sbin:/usr/sbin:/bin:/usr/bin
-
-DESC="sensors logging daemon"
-NAME="sensord"
-SENSORD=`which $NAME`
-
-. /etc/init.d/functions || exit 1
-. /etc/sensord.conf || exit 1
-
-# Exit if the package is not installed
-[ -x "$SENSORD" ] || exit 0
-
-case "$1" in
-    start)
-        echo -n "Starting $DESC: $NAME... "
-        start-stop-daemon -S -x $SENSORD -- $SENSORD_ARGS
-        echo "done."
-        ;;
-    stop)
-        echo -n "Stopping $DESC: $NAME... "
-        start-stop-daemon -K -x $SENSORD
-        echo "done."
-        ;;
-    restart)
-        echo "Restarting $DESC: $NAME... "
-        $0 stop
-        $0 start
-        echo "done."
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart}"
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
new file mode 100644
index 0000000..f179310
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
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
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init b/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init
new file mode 100644
index 0000000..5a09cd3
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init
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
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
index 5c6c91d..1a1ef2d 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
@@ -8,29 +8,28 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
 
 SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
-           file://fancontrol \
-           file://fancontrol.sh \
-           file://sensors.conf \
-           file://sensord.conf \
-           file://sensord.sh \
-           file://sensord.cgi \
+           file://fancontrol.init \
+           file://sensord.init \
 "
 
 SRC_URI[md5sum] = "f357ba00b080ab102a170f7bf8bb2578"
 SRC_URI[sha256sum] = "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258da5444c149a9e3ae1"
 
+PR = "r1"
+
 inherit update-rc.d
 
 INITSCRIPT_PACKAGES = "${PN}-fancontrol ${PN}-sensord"
-INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol.sh"
-INITSCRIPT_NAME_${PN}-sensord = "sensord.sh"
+INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol"
+INITSCRIPT_NAME_${PN}-sensord = "sensord"
 INITSCRIPT_PARAMS_${PN}-fancontrol = "defaults 66"
 INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67"
 
 S = "${WORKDIR}/lm_sensors-${PV}"
 
 EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
-		MACHINE=${TARGET_ARCH} PREFIX=${prefix} CC="${CC}" AR="${AR}"'
+		MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
+		CC="${CC}" AR="${AR}"'
 
 do_compile() {
     oe_runmake user PROG_EXTRA="sensors sensord"
@@ -39,37 +38,17 @@ do_compile() {
 do_install() {
     oe_runmake user_install DESTDIR=${D}
     install -m 0755 ${S}/prog/sensord/sensord ${D}${bindir}
-    install -m 0644 ${S}/prog/sensord/sensord.8 ${D}/usr/man/man8
-
-    # move manuals into proper place
-    install -d ${D}${mandir}
-    rm -rf ${D}${mandir}/*
-    mv ${D}/usr/man/* ${D}${mandir}
-    rmdir ${D}/usr/man
+    install -m 0644 ${S}/prog/sensord/sensord.8 ${D}${mandir}/man8
 
-    # Install directories
-    install -d ${D}${sysconfdir}
+    # Install directory
     install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${sysconfdir}/sensors.d
-
-    # Install sensors.conf
-    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
-
-    # Install fancontrol config file
-    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
 
     # Install fancontrol init script
-    install -m 0755 ${WORKDIR}/fancontrol.sh ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/fancontrol.init \
+        ${D}${sysconfdir}/init.d/fancontrol
 
     # Install sensord init script
-    install -m 0755 ${WORKDIR}/sensord.sh ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
-
-    # Install sensord.cgi script and create world-writable
-    # web-accessible sensord directory.
-    install -d ${D}/www/pages/cgi-bin
-    install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
-    install -d -m a=rwxs ${D}/www/pages/sensord
+    install -m 0755 ${WORKDIR}/sensord.init ${D}${sysconfdir}/init.d/sensord
 }
 
 # libsensors packages
@@ -97,11 +76,12 @@ PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
 PACKAGES =+ "${PN}-isatools ${PN}-isatools-dbg ${PN}-isatools-doc"
 
 # libsensors files
-FILES_${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d/sensors.conf"
+FILES_${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d"
 FILES_${PN}-libsensors-dbg = "${libdir}/.debug ${prefix}/src/debug"
 FILES_${PN}-libsensors-dev = "${libdir}/libsensors.so ${includedir}"
 FILES_${PN}-libsensors-staticdev = "${libdir}/libsensors.a"
 FILES_${PN}-libsensors-doc = "${mandir}/man3"
+RRECOMMENDS_${PN}-libsensors = "lmsensors-config-libsensors"
 
 # sensors command files
 FILES_${PN}-sensors = "${bindir}/sensors"
@@ -110,15 +90,17 @@ FILES_${PN}-sensors-doc = "${mandir}/man1 ${mandir}/man5"
 RDEPENDS_${PN}-sensors = "${PN}-libsensors"
 
 # sensord logging daemon
-FILES_${PN}-sensord = "${bindir}/sensord ${sysconfdir}/sensord.conf ${sysconfdir}/init.d/sensord.sh /www/*"
+FILES_${PN}-sensord = "${bindir}/sensord ${sysconfdir}/init.d/sensord"
 FILES_${PN}-sensord-dbg = "${bindir}/.debug/sensord"
 FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
 RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool lighttpd lighttpd-module-cgi"
+RRECOMMENDS_${PN}-sensord = "lmsensors-config-sensord"
 
 # fancontrol script files
-FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${sysconfdir}/fancontrol ${sysconfdir}/init.d/fancontrol.sh"
+FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${sysconfdir}/init.d/fancontrol"
 FILES_${PN}-fancontrol-doc = "${mandir}/man8/fancontrol.8"
 RDEPENDS_${PN}-fancontrol = "bash"
+RRECOMMENDS_${PN}-fancontrol = "lmsensors-config-fancontrol"
 
 # sensors-detect script files
 FILES_${PN}-sensorsdetect = "${sbindir}/sensors-detect"
-- 
1.6.0.6




