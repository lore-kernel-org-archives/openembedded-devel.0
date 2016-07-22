Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73553607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 02:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M2shsG008015
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:54:43 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jul 2016 19:54:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jul 2016 22:54:41 -0400
Message-ID: <1469156081-157926-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] minicoredumper: add the recipe
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
X-List-Received-Date: Fri, 22 Jul 2016 02:54:43 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

minicoredumper provides an alternate core dump facility for Linux
to allow minimal and customized crash dumps

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../minicoredumper/files/minicoredumper.init       | 40 ++++++++++++++++++++++
 .../minicoredumper/files/minicoredumper.service    | 11 ++++++
 .../minicoredumper/minicoredumper_1.0.2.bb         | 31 +++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
new file mode 100644
index 0000000..90ef7fa
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# minicoredumper This shell script takes care of starting and stopping minicoredumper.
+#
+# chkconfig:   2345 24 89
+# description: minicoredumper.
+#
+# processname:
+# config:      /etc/minicoredumper/
+
+### BEGIN INIT INFO
+# Provides: minicoredumper
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Should-Start: $syslog $network
+# Should-Stop: $syslog $network
+# Short-Description:
+# Description:
+### END INIT INFO
+
+. /etc/init.d/functions
+
+case "$1" in
+    start)
+        echo "|/usr/bin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
+        ;;
+    stop)
+        echo "core" > /proc/sys/kernel/core_pattern
+	;;
+    status)
+        if  grep -q minicoredumper /proc/sys/kernel/core_pattern ; then
+            echo "minicoredumper is running"
+        else
+            echo "minicoredumper is stopped"
+        fi
+        ;;
+    *)
+        echo $"Usage: $0 {start|stop|status}"
+        exit 2
+esac
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
new file mode 100644
index 0000000..851b54c
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Enable minicoredumper.
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
+ExecStop=/bin/sh -c '/bin/echo "core" > /proc/sys/kernel/core_pattern'
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
new file mode 100644
index 0000000..babe544
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
@@ -0,0 +1,31 @@
+SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
+to allow minimal and customized crash dumps"
+LICENSE = " LGPLv2.1 & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=45445387350de96a0e70410470ee5cab"
+DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux"
+
+inherit autotools pkgconfig systemd update-rc.d
+
+SRC_URI = "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
+           file://minicoredumper.service \
+           file://minicoredumper.init \
+"
+SRC_URI[md5sum] = "5ba9d116b52a8e2fb93456260644e753"
+SRC_URI[sha256sum] = "1b0eeb3d70dbd2ad6f2f673e4e3446e5dd784e132730e21d8f9dc0977e47dd9a"
+
+SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "minicoredumper"
+INITSCRIPT_PARAMS_${PN} = "defaults 89"
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/minicoredumper
+    cp -rf ${S}/etc/* ${D}/${sysconfdir}/
+
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
+}
-- 
2.8.1


