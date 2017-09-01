Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC2078479
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 04:03:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 21:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,456,1498546800"; d="scan'208";a="124583320"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by orsmga004.jf.intel.com with ESMTP; 31 Aug 2017 21:03:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 16:02:32 +1200
Message-Id: <83099ac9a7c5ea6b57afea40e164f78b98f8fe96.1504238509.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504238509.git.paul.eggleton@linux.intel.com>
References: <cover.1504238509.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/2] mosquitto: add from meta-intel-iot-middleware and update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 04:03:17 -0000

The following improvements have been made over the recipe that was in
meta-intel-iot-middleware (a layer which is no longer actively
maintained):

* Upgrade to 1.4.14
* Use correct LICENSE value (license changed back in version 1.4)
* Add files containing the actual license terms to LIC_FILES_CHKSUM
* Make optional dependencies optional through PACKAGECONFIG (c-ares
  dependency now defaults to disabled)
* Use ${prefix} instead of /usr
* Drop python package since the python client was removed in 1.4
* SUMMARY and DESCRIPTION now reflect that it also supports MQTT 3.1.1
* Add brief description and Upstream-Status to build.patch
* Drop PR = "r0"
* Drop unnecessary setting of FILES_${PN}-staticdev since the default
  already includes this file
* Move SRC_URI checksums next to SRC_URI
* Move inherit of systemd further up

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../mosquitto/files/build.patch                    | 94 ++++++++++++++++++++++
 .../mosquitto/files/mosquitto.init                 | 89 ++++++++++++++++++++
 .../mosquitto/files/mosquitto.service              | 15 ++++
 .../mosquitto/mosquitto_1.4.14.bb                  | 80 ++++++++++++++++++
 4 files changed, 278 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/build.patch
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb

diff --git a/meta-oe/recipes-connectivity/mosquitto/files/build.patch b/meta-oe/recipes-connectivity/mosquitto/files/build.patch
new file mode 100644
index 0000000..0d0912b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosquitto/files/build.patch
@@ -0,0 +1,94 @@
+From ebd7c8e548e9b8e096ee4c390173db9a701f2604 Mon Sep 17 00:00:00 2001
+From: Bruno Bottazzini <bruno.bottazzini@intel.com>
+Date: Wed, 23 Mar 2016 11:18:26 -0300
+Subject: [PATCH] build
+
+Disable stripping and allow easily overriding prefix
+
+Upstream-Status: Pending
+
+Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
+---
+ client/Makefile  | 4 ++--
+ config.mk        | 2 +-
+ lib/Makefile     | 2 +-
+ lib/cpp/Makefile | 2 +-
+ src/Makefile     | 4 ++--
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/client/Makefile b/client/Makefile
+index bd65355..4e5a640 100644
+--- a/client/Makefile
++++ b/client/Makefile
+@@ -24,8 +24,8 @@ client_shared.o : client_shared.c client
+ 
+ install : all
+ 	$(INSTALL) -d ${DESTDIR}$(prefix)/bin
+-	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto_pub ${DESTDIR}${prefix}/bin/mosquitto_pub
+-	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto_sub ${DESTDIR}${prefix}/bin/mosquitto_sub
++	$(INSTALL) mosquitto_pub ${DESTDIR}${prefix}/bin/mosquitto_pub
++	$(INSTALL) mosquitto_sub ${DESTDIR}${prefix}/bin/mosquitto_sub
+ 
+ uninstall :
+ 	-rm -f ${DESTDIR}${prefix}/bin/mosquitto_pub
+diff --git a/config.mk b/config.mk
+index c0f175f..3427b83 100644
+--- a/config.mk
++++ b/config.mk
+@@ -241,7 +241,7 @@ ifeq ($(WITH_DOCS),yes)
+ endif
+ 
+ INSTALL?=install
+-prefix=/usr/local
++prefix?=/usr
+ mandir=${prefix}/share/man
+ localedir=${prefix}/share/locale
+ STRIP?=strip
+diff --git a/lib/Makefile b/lib/Makefile
+index 825fcea..9b7c05c 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -25,7 +25,7 @@ all : libmosquitto.so.${SOVERSION} libmo
+ 
+ install : all
+ 	$(INSTALL) -d ${DESTDIR}$(prefix)/lib${LIB_SUFFIX}/
+-	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} libmosquitto.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquitto.so.${SOVERSION}
++	$(INSTALL) libmosquitto.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquitto.so.${SOVERSION}
+ 	ln -sf libmosquitto.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquitto.so
+ 	$(INSTALL) -d ${DESTDIR}${prefix}/include/
+ 	$(INSTALL) mosquitto.h ${DESTDIR}${prefix}/include/mosquitto.h
+diff --git a/lib/cpp/Makefile b/lib/cpp/Makefile
+index 8b627d3..cdb2923 100644
+--- a/lib/cpp/Makefile
++++ b/lib/cpp/Makefile
+@@ -10,7 +10,7 @@ all : libmosquittopp.so.${SOVERSION}
+ 
+ install : all
+ 	$(INSTALL) -d ${DESTDIR}$(prefix)/lib${LIB_SUFFIX}/
+-	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} libmosquittopp.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquittopp.so.${SOVERSION}
++	$(INSTALL) libmosquittopp.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquittopp.so.${SOVERSION}
+ 	ln -sf libmosquittopp.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquittopp.so
+ 	$(INSTALL) -d ${DESTDIR}${prefix}/include/
+ 	$(INSTALL) mosquittopp.h ${DESTDIR}${prefix}/include/mosquittopp.h
+diff --git a/src/Makefile b/src/Makefile
+index 2cfb7d4..9a97644 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -103,12 +103,12 @@ mosquitto_passwd.o : mosquitto_passwd.c
+ 
+ install : all
+ 	$(INSTALL) -d ${DESTDIR}$(prefix)/sbin
+-	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto ${DESTDIR}${prefix}/sbin/mosquitto
++	$(INSTALL) mosquitto ${DESTDIR}${prefix}/sbin/mosquitto
+	$(INSTALL) -d ${DESTDIR}$(prefix)/include
+ 	$(INSTALL) mosquitto_plugin.h ${DESTDIR}${prefix}/include/mosquitto_plugin.h
+ ifeq ($(WITH_TLS),yes)
+	$(INSTALL) -d ${DESTDIR}$(prefix)/bin
+-	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto_passwd ${DESTDIR}${prefix}/bin/mosquitto_passwd
++	$(INSTALL) mosquitto_passwd ${DESTDIR}${prefix}/bin/mosquitto_passwd
+ endif
+ 
+ uninstall :
+-- 
+2.7.1
+
diff --git a/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init
new file mode 100644
index 0000000..d2a27b2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init
@@ -0,0 +1,89 @@
+#! /bin/sh
+
+# Based on the Debian initscript for mosquitto
+
+### BEGIN INIT INFO
+# Provides:         mosquitto
+# Required-Start:   $remote_fs $syslog
+# Required-Stop:    $remote_fs $syslog
+# Default-Start:    2 3 4 5
+# Default-Stop:     0 1 6
+# Short-Description:    mosquitto MQTT v3.1 message broker
+# Description: 
+#  This is a message broker that supports version 3.1 of the MQ Telemetry
+#  Transport (MQTT) protocol.
+#  
+#  MQTT provides a method of carrying out messaging using a publish/subscribe
+#  model. It is lightweight, both in terms of bandwidth usage and ease of
+#  implementation. This makes it particularly useful at the edge of the network
+#  where a sensor or other simple device may be implemented using an arduino for
+#  example.
+### END INIT INFO
+
+set -e
+
+PIDFILE=@LOCALSTATEDIR@/run/mosquitto.pid
+DAEMON=@SBINDIR@/mosquitto
+
+# start and stop the mosquitto MQTT message broker
+
+test -x ${DAEMON} || exit 0
+
+umask 022
+
+. @SYSCONFDIR@/init.d/functions
+
+export PATH="${PATH:+$PATH:}@SBINDIR@:@BASE_SBINDIR@"
+
+case "$1" in
+    start)
+        echo "Starting Mosquitto message broker" "mosquitto"
+        if start-stop-daemon --start --quiet --oknodo --background  --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ; then
+            exit 0
+        else
+            exit 1
+        fi
+        ;;
+    stop)
+        echo "Stopping Mosquitto message broker" "mosquitto"
+        if start-stop-daemon --stop --quiet --oknodo --pidfile ${PIDFILE}; then
+            rm -f ${PIDFILE}
+            exit 0
+        else
+            exit 1
+        fi
+        ;;
+
+
+    reload|force-reload)
+        if [ -f ${PIDFILE} ] ; then
+            echo "Reloading configuration for mosquitto"
+            pid=`cat ${PIDFILE}`
+            kill -HUP $pid
+        else
+            echo "mosquitto does not seem to be running"
+        fi
+        ;;
+
+    restart)
+        echo "Restarting Mosquitto message broker" "mosquitto"
+        if start-stop-daemon --stop --quiet --oknodo --retry 30 --pidfile ${PIDFILE}; then
+            rm -f ${PIDFILE}
+        fi
+        if start-stop-daemon --start --quiet --oknodo --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} -- -c @SYSCONFDIR@/mosquitto/mosquitto.conf ; then
+            exit 0
+        else
+            exit 1
+        fi
+        ;;
+
+    status)
+        status ${DAEMON} && exit 0 || exit $?
+        ;;
+
+    *)
+        echo "Usage: $0 {start|stop|reload|force-reload|restart|status}"
+        exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service b/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service
new file mode 100644
index 0000000..25f68fa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Mosquitto - lightweight server implementation of the MQTT and MQTT-SN protocols
+ConditionPathExists=/etc/mosquitto/mosquitto.conf
+After=network.target
+
+[Service]
+Type=simple
+ExecStartPre=/bin/rm -f /var/run/mosquitto.pid
+ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
+ExecReload=/bin/kill -HUP $MAINPID
+PIDFile=/var/run/mosquitto.pid
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb b/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
new file mode 100644
index 0000000..7554248
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
@@ -0,0 +1,80 @@
+SUMMARY = "Open source MQTT v3.1/3.1.1 implemention"
+DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker that implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1. MQTT provides a lightweight method of carrying out messaging using a publish/subscribe model. "
+HOMEPAGE = "http://mosquitto.org/"
+SECTION = "console/network"
+LICENSE = "EPL-1.0 | EDL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62ddc846179e908dc0c8efec4a42ef20 \
+                    file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
+                    file://epl-v10;md5=8d383c379e91d20ba18a52c3e7d3a979 \
+                    file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
+"
+
+SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
+           file://build.patch \
+           file://mosquitto.service \
+           file://mosquitto.init \
+"
+
+SRC_URI[md5sum] = "6b0966e93f118bc71ad7b61600a6c2d3"
+SRC_URI[sha256sum] = "156b1fa731d12baad4b8b22f7b6a8af50ba881fc711b81e9919ec103cf2942d1"
+
+inherit systemd update-rc.d useradd
+
+PACKAGECONFIG ??= "ssl uuid"
+
+PACKAGECONFIG[dns-srv] = ",,c-ares"
+PACKAGECONFIG[ssl] = ",,openssl"
+PACKAGECONFIG[uuid] = ",,util-linux"
+EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
+                WITH_DOCS=no \
+                ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
+                ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)}"
+
+export LIB_SUFFIX="${@d.getVar('baselib', True).replace('lib', '')}"
+
+do_compile() {
+    oe_runmake PREFIX=${prefix}
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+    install -d ${D}${libdir}
+    install -m 0644 lib/libmosquitto.a ${D}${libdir}/
+
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/mosquitto.service ${D}${systemd_unitdir}/system/
+
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
+    sed -i -e 's,@SBINDIR@,${sbindir},g' \
+        -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+        -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        ${D}${sysconfdir}/init.d/mosquitto
+}
+
+PACKAGES += "libmosquitto1 libmosquittopp1 ${PN}-clients"
+
+FILES_${PN} = "${sbindir}/mosquitto \
+               ${bindir}/mosquitto_passwd \
+               ${sysconfdir}/mosquitto \
+               ${sysconfdir}/init.d \
+               ${systemd_unitdir}/system/mosquitto.service \
+"
+
+FILES_libmosquitto1 = "${libdir}/libmosquitto.so.1"
+
+FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.1"
+
+FILES_${PN}-clients = "${bindir}/mosquitto_pub \
+                       ${bindir}/mosquitto_sub \
+"
+
+SYSTEMD_SERVICE_${PN} = "mosquitto.service"
+
+INITSCRIPT_NAME = "mosquitto"
+INITSCRIPT_PARAMS = "defaults 30"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --shell /bin/false \
+                       --user-group mosquitto"
-- 
2.9.5


