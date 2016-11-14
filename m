Return-Path: <Fang.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC6736FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:28:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAEASSX4020033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 14 Nov 2016 02:28:29 -0800
Received: from pek-fjia-d1.corp.ad.wrs.com (128.224.159.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 14 Nov 2016 02:28:27 -0800
From: Fang Jia <fang.jia@windriver.com>
To: <dompe@hpe.com>
Date: Mon, 14 Nov 2016 18:28:03 +0800
Message-ID: <1479119283-10410-1-git-send-email-fang.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: ops-dev@lists.openswitch.net, openembedded-devel@lists.openembedded.org
Subject: [meta-foss-openswitch][PATCH] open-vm-tools: add init script
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
X-List-Received-Date: Mon, 14 Nov 2016 10:28:36 -0000
Content-Type: text/plain

- Add init script to support not systemd system.
- Use ${libdir} in case the board is a 64-bit machine.

Signed-off-by: Fang Jia <fang.jia@windriver.com>
---
 .../recipes-extended/open-vm-tools/files/default   |   3 +
 .../recipes-extended/open-vm-tools/files/init      | 105 +++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_10.0.5.bb          |  23 +++--
 3 files changed, 125 insertions(+), 6 deletions(-)
 create mode 100644 yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/default
 create mode 100644 yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/init

diff --git a/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/default b/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/default
new file mode 100644
index 0000000..782e015
--- /dev/null
+++ b/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/default
@@ -0,0 +1,3 @@
+#Defaults for vmware-tools
+RUN_DAEMON="no"
+OPTIONS=""
diff --git a/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/init b/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/init
new file mode 100644
index 0000000..a8dafe5
--- /dev/null
+++ b/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/files/init
@@ -0,0 +1,105 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:
+# Required-Start:      In vmware environment
+# Required-Stop:
+# Default-Start:
+# Default-Stop:
+# Short-Description: Open Vmware Tools Daemon
+### END INIT INFO
+#
+# You can edit /etc/default/vmware-tools to modify the default configuration.
+#
+
+set -e
+
+# source function library
+. /etc/init.d/functions
+
+# /etc/init.d/vmtools: start and stop the VMware Tools daemon
+DEMEO="/usr/sbin/vmtoolsd"
+DEFAULT_CONFIG_FILE="/etc/default/vmware-tools"
+
+test -x $DEMEO || exit 0
+( $DEMEO -\? 2>&1 | grep -q VMware ) 2>/dev/null || exit 0
+
+# Defaults
+RUN_DAEMON="no"
+OPTIONS=""
+PIDFILE="/var/run/vmtoolsd.pid"
+
+# Reads config file (will override defaults above)
+if test -f $DEFAULT_CONFIG_FILE; then
+    . $DEFAULT_CONFIG_FILE
+fi
+
+if [ "$RUN_DAEMON" != "yes" ] ; then
+	echo "vmware-tools disabled in $DEFAULT_CONFIG_FILE"
+	exit 0
+fi
+
+if [ ! -x /usr/sbin/vmware-checkvm ] || ! /usr/sbin/vmware-checkvm > /dev/null 2>&1
+then
+	echo "open-vm-tools: not starting as this is not a VMware VM"
+	exit 0
+fi
+
+check_for_no_start() {
+    if [ "$RUN_DAEMON" != "yes" ] ; then
+	    echo "vmware-tools disabled in $DEFAULT_CONFIG_FILE"
+	    exit 0
+    fi
+}
+
+check_status() {
+	RET="0"
+	start-stop-daemon -q -K -t -x $DEMEO || RET="$?"
+	if [ "$RET" = "0" ]; then
+		PID=`cat $PIDFILE`
+		echo "vmtoolsd($PID) is running"
+	else
+		echo "vmtoolsd is not running"
+		exit $RET
+	fi
+}
+
+export PATH="${PATH:+$PATH:}/usr/sbin:/sbin:/usr/bin"
+
+case "$1" in
+  start)
+        check_for_no_start
+        echo "Starting VMware Tools Shell server"
+	for i in vmhgfs vsock vmci; do
+		modprobe $i >/dev/null 2>/dev/null &
+	done
+        start-stop-daemon -S -m --background --pidfile $PIDFILE -x $DEMEO -- $OPTIONS && echo "done." || echo "FAILED!"
+        ;;
+  stop)
+        echo -n "Stopping VMware Tools Shell server"
+	start-stop-daemon -K -o --pidfile $PIDFILE --name vmtoolsd && echo "done." || echo "FAILED!"
+	if [ -f  "$PIDFILE" ] ; then
+		rm -f $PIDFILE
+	fi
+	sleep 1
+	for i in vmhgfs vsock; do
+		modprobe -r $i >/dev/null 2>/dev/null &
+	done
+        ;;
+
+  reload|force-reload|restart)
+	$0 stop
+	sleep 2
+	$0 start
+        ;;
+
+  status)
+        check_status;
+        exit $?
+  ;;
+
+  *)
+        echo "Usage: /etc/init.d/vmtools {start|stop|status|reload|force-reload|restart}"
+        exit 1
+esac
+
+exit 0
diff --git a/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb b/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
index 6938950..a6949d7 100644
--- a/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
+++ b/yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
            file://0001-Fix-kernel-detection.patch \
+           file://init \
+           file://default \
            "
 
 SRCREV = "538ea037a1549b6fd4e57529f7448a3fd2aa47af"
@@ -41,24 +43,33 @@ EXTRA_OEMAKE = "KERNEL_RELEASE=${KERNEL_VERSION}"
 
 CFLAGS += '-Wno-error=deprecated-declarations'
 
-FILES_${PN} += "/usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
-		/usr/lib/open-vm-tools/plugins/common/lib*.so \
-    ${sysconfdir}/vmware-tools/tools.conf"
+FILES_${PN} += "${libdir}/open-vm-tools/plugins/vmsvc/lib*.so \
+		${libdir}/open-vm-tools/plugins/common/lib*.so \
+		${sysconfdir}/vmware-tools/tools.conf \
+		${sysconfdir}/init.d ${sysconfdir}/default"
 FILES_${PN}-locale += "/usr/share/open-vm-tools/messages"
-FILES_${PN}-dev += "/usr/lib/open-vm-tools/plugins/common/lib*.la"
-FILES_${PN}-dbg += "/usr/lib/open-vm-tools/plugins/common/.debug \
-		    /usr/lib/open-vm-tools/plugins/vmsvc/.debug"
+FILES_${PN}-dev += "${libdir}/open-vm-tools/plugins/common/lib*.la"
+FILES_${PN}-dbg += "${libdir}/open-vm-tools/plugins/common/.debug \
+		    ${libdir}/open-vm-tools/plugins/vmsvc/.debug"
 
 CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
 
 do_install_append() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vmtools
+
     ln -sf /usr/sbin/mount.vmhgfs ${D}/sbin/mount.vmhgfs
     install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}/vmware-tools
     install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
+
+    install -d ${D}${sysconfdir}/default
+    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/vmware-tools
 }
 
 do_configure_prepend() {
     export CUSTOM_PROCPS_NAME=procps
     export CUSTOM_PROCPS_LIBS=-L${STAGING_LIBDIR}/libprocps.so
+    export CUSTOM_DNET_CPPFLAGS=-I${STAGING_INCDIR}
+    export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}
 }
-- 
1.9.1


