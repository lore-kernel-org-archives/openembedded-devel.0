Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 39A2D6D543
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 22:43:42 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l11so7766722qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 14:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=dZjMm/A9+y6w/I+awrbHv20iBX06e+NvnPhIgYxffdE=;
	b=OlBEzhiDdvx3FAvOxcfch5v7Ryi6b5V60CIuTLReENXQJmM+17+J2W0v7ZvlahSLmG
	Elxdyjmyou5YYOus0uu/T5psSBsqGimXjmtX5sdXV017ip0MNHZKEHRYIXbKZHZs8IrL
	p4o1PBuGp16NtmhGeLQjsPbRu4JI0nzK5QFAAHCY3EClnu+TWeTgsyAfVs0y64jHfU/h
	nLcEZM4wlZm19zyrJeiIwHH37Xi7Q8ajPMNZ8TNFyn6RUO0X9dCHQXOSJRc4jGxWgn3q
	h9dGo1XvnIZdOvYFTwRGQacBiEF9XVXcnjSfzPi46mXMu26uBMBPJU0MLMZk/Pvnpp1B
	d1RQ==
X-Gm-Message-State: AA+aEWa0WxzwUyABJPMPO94NHSoaHJgn0LkPNjm+n0gixSaLQf8JxhVM
	qqkVUfre/uoWxTVKuL/kJQDIFGIy
X-Google-Smtp-Source: AFSGD/XTDeuUL3+V6SXCnHhrrHuiRTIHBX8mk/zIOT5ye4xsAYqIz1OU3zdTEmioHTzAUnyna68NFQ==
X-Received: by 2002:aed:34e6:: with SMTP id x93mr7525170qtd.156.1543617822752; 
	Fri, 30 Nov 2018 14:43:42 -0800 (PST)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	c77sm6229610qkh.82.2018.11.30.14.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Nov 2018 14:43:41 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 30 Nov 2018 20:43:36 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Nov 2018 20:43:36 -0200
Message-Id: <20181130224336.15257-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libusbgx: Add recipe
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
X-List-Received-Date: Fri, 30 Nov 2018 22:43:42 -0000
Content-Transfer-Encoding: 8bit

The libusbgx allow easier use and setup of USB gadgets. To easy
integration on different systems a libusbgx-config package is provided
so it can be used to start and enable respective USB gadget schema.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../libusbgx/libusbgx-config.bb               |  12 ++
 .../libusbgx/libusbgx-config/usbgx.default    |   2 +
 .../libusbgx/libusbgx/gadget-start            |  11 ++
 .../libusbgx/libusbgx/usbgx.initd             | 143 ++++++++++++++++++
 .../libusbgx/libusbgx/usbgx.service           |   9 ++
 .../recipes-support/libusbgx/libusbgx_git.bb  |  40 +++++
 6 files changed, 217 insertions(+)
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx-config.bb
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx-config/usbgx.default
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/usbgx.initd
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx_git.bb

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
new file mode 100644
index 000000000..b269e33c4
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
@@ -0,0 +1,12 @@
+SUMMARY = "USB Gadget Configuration Files"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://usbgx.default"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    install -Dm 0644 ${WORKDIR}/usbgx.default ${D}${sysconfdir}/default/usbgx
+}
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx-config/usbgx.default b/meta-oe/recipes-support/libusbgx/libusbgx-config/usbgx.default
new file mode 100644
index 000000000..f690dfe2a
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx-config/usbgx.default
@@ -0,0 +1,2 @@
+IMPORT_SCHEMAS=""
+ENABLED_SCHEMAS="$IMPORT_SCHEMAS"
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
new file mode 100644
index 000000000..1a106b785
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+[ -r /etc/default/usbgx ] && . /etc/default/usbgx
+
+for i in $IMPORT_SCHEMAS; do
+    /usr/bin/gadget-import "$i" /etc/usbgx/"$i".schema
+done
+
+for i in $ENABLED_SCHEMAS; do
+    ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
+done
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.initd b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.initd
new file mode 100644
index 000000000..d1938078f
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.initd
@@ -0,0 +1,143 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          usbg
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Example initscript
+# Description:       This file should be used to construct scripts to be
+#                    placed in /etc/init.d
+### END INIT INFO
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="Load USB gadget schemas"
+NAME="usbgx"
+DAEMON=/usr/bin/gadget-start
+DAEMON_ARGS=""
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
+#
+# Function that starts the daemon/service
+#
+do_start() {
+    local status pid
+
+    status=0
+    pid=`pidofproc $NAME` || status=$?
+    case $status in
+        0)
+            echo "$DESC already running ($pid)."
+            exit 1
+            ;;
+        *)
+            echo "Starting $DESC ..."
+            exec $DAEMON $DAEMON_ARGS >/dev/null 2>&1 || status=$?
+            echo "ERROR: Failed to start $DESC."
+            exit $status
+            ;;
+    esac
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop() {
+    local pid status
+
+    status=0
+    pid=`pidofproc $NAME` || status=$?
+    case $status in
+        0)
+            # Exit when fail to stop, the kill would complain when fail
+            kill -s 15 $pid >/dev/null && rm -f $PIDFILE && \
+                echo "Stopped $DESC ($pid)." || exit $?
+            ;;
+        *)
+            echo "$DESC is not running; none killed." >&2
+            ;;
+    esac
+
+    return $status
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+    local pid status
+
+    status=0
+    # If the daemon can reload its configuration without
+    # restarting (for example, when it is sent a SIGHUP),
+    # then implement that here.
+    pid=`pidofproc $NAME` || status=$?
+    case $status in
+        0)
+            echo "Reloading $DESC ..."
+            kill -s 1 $pid || exit $?
+            ;;
+        *)
+            echo "$DESC is not running; none reloaded." >&2
+            ;;
+    esac
+    exit $status
+}
+
+
+#
+# Function that shows the daemon/service status
+#
+status_of_proc () {
+    local pid status
+
+    status=0
+    # pidof output null when no program is running, so no "2>/dev/null".
+    pid=`pidofproc $NAME` || status=$?
+    case $status in
+        0)
+            echo "$DESC is running ($pid)."
+            exit 0
+            ;;
+        *)
+            echo "$DESC is not running." >&2
+            exit $status
+            ;;
+    esac
+}
+
+case "$1" in
+    start)
+        do_start
+        ;;
+    stop)
+        do_stop || exit $?
+        ;;
+    status)
+        status_of_proc
+        ;;
+    restart)
+        # Always start the service regardless the status of do_stop
+        do_stop
+        do_start
+        ;;
+    try-restart|force-reload)
+        do_stop && do_start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|status|restart|try-restart|force-reload}" >&2
+        exit 3
+        ;;
+esac
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
new file mode 100644
index 000000000..74541d3c2
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Load USB gadget schemas
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/gadget-start
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
new file mode 100644
index 000000000..d73ca6106
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "USB Gadget neXt Configfs Library"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libconfig"
+
+inherit autotools pkgconfig systemd update-rc.d
+
+PV = "0.2.0+git${SRCPV}"
+SRCREV = "45c14ef4d5d7ced0fbf984208de44ced6d5ed898"
+SRCBRANCH = "master"
+SRC_URI = " \
+    git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH} \
+    file://gadget-start \
+    file://usbgx.initd \
+    file://usbgx.service \
+"
+
+S = "${WORKDIR}/git"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "usbgx.service"
+
+INITSCRIPT_NAME = "usbgx"
+INITSCRIPT_PARAMS = "defaults"
+
+EXTRA_OECONF = "--includedir=${includedir}/usbgx"
+
+do_install_append() {
+    install -Dm 0755 ${WORKDIR}/gadget-start ${D}/${bindir}/gadget-start
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -Dm 0644 ${WORKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -Dm 0755 ${WORKDIR}/usbgx.initd ${D}${sysconfdir}/init.d/usbgx
+	fi
+}
+
+RDEPENDS_${PN} += "libusbgx-config"
-- 
2.19.2


