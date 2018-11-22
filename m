Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCD56C59B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:48:20 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 3F0D31C1AFD;
	Thu, 22 Nov 2018 13:48:21 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2018 13:48:17 +0100
Message-Id: <20181122124817.26024-1-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181121081012.118414-3-martin@geanix.com>
References: <20181121081012.118414-3-martin@geanix.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCHv2] iwd: add version 0.12
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
X-List-Received-Date: Thu, 22 Nov 2018 12:48:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The iwd wireless daemon is an alternative to wpa_supplicant. It is
controlled using the iwctl command line client (or the dbus interface).

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Changes since v1:
- add packageconfig for client, ead, and ofono
- split out packages for iwctl, ead, and iwmon
- add ptest support

 ...ble-serial-tests-in-automake-to-supp.patch | 32 +++++++++
 .../recipes-connectivity/iwd/iwd/run-ptest    | 30 ++++++++
 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb  | 68 +++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/run-ptest
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch
new file mode 100644
index 000000000..f9f073056
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch
@@ -0,0 +1,32 @@
+From 06a21885b89675ba094b573d5af8aa74729111d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Thu, 22 Nov 2018 10:03:09 +0100
+Subject: [PATCH] configure.ac: enable serial-tests in automake to support
+ ptest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Martin Hundebøll <martin@geanix.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8deb53a..1a5330b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,7 +6,8 @@ AC_CONFIG_AUX_DIR(build-aux)
+ AC_CONFIG_MACRO_DIR(build-aux)
+ 
+ AM_INIT_AUTOMAKE([foreign subdir-objects color-tests silent-rules
+-					tar-pax no-dist-gzip dist-xz])
++					tar-pax no-dist-gzip dist-xz
++					serial-tests])
+ 
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+-- 
+2.19.1
+
diff --git a/meta-oe/recipes-connectivity/iwd/iwd/run-ptest b/meta-oe/recipes-connectivity/iwd/iwd/run-ptest
new file mode 100644
index 000000000..f2db136b1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/run-ptest
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+run_test() {
+    test=$1
+    name=$(basename $1)
+
+    log=$(./$test)
+    res=$(echo $?)
+
+    # check for skipped test
+    case "$log" in
+        *skipping*)
+            echo "SKIP: $name"
+            return
+            ;;
+    esac
+
+    # check for passed / failed
+    if [[ "$res" -eq "0" ]]; then
+        echo "PASS: $name"
+    else
+        echo "FAIL: $name"
+    fi
+}
+
+for path in tests/*; do
+    run_test $path
+done
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
new file mode 100644
index 000000000..321b1ca01
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
@@ -0,0 +1,68 @@
+DESCRIPTION = "Wireless daemon for Linux"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+inherit autotools pkgconfig systemd ptest
+
+DEPENDS = "ell dbus"
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'readline', '', d)}"
+
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+    file://0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch \
+    file://run-ptest \
+"
+SRCREV = "d7609915db4b57229f7dd4c04b4eabcce637872a"
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "client ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} wired ofono"
+PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
+PACKAGECONFIG[systemd] = "--enable-systemd-service,--disable-systemd-service,systemd"
+PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
+PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
+
+EXTRA_OECONF += "--enable-external-ell"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
+
+do_compile_ptest() {
+    oe_runmake buildtest-TESTS
+}
+
+do_install_ptest() {
+    # remove intermediate object files
+    rm -f ${B}/unit/*.o
+    install -D -t ${D}${PTEST_PATH}/tests ${B}/unit/*
+}
+
+HAVE_SYSTEMD = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', True, False, d)}"
+
+# iwd service
+SYSTEMD_SERVICE_${PN} = "${@'iwd.service' if bb.utils.to_boolean(d.getVar('HAVE_SYSTEMD')) else ''}"
+FILES_${PN} += " \
+    ${datadir}/dbus-1/system.d/iwd-dbus.conf \
+    ${datadir}/dbus-1/system-services/net.connman.iwd.service \
+"
+
+# iwctl tool
+PN_CLIENT = "${@bb.utils.contains('PACKAGECONFIG', 'client', '${PN}-client', '', d)}"
+RRECOMMENDS_${PN} += "${PN_CLIENT}"
+PACKAGE_BEFORE_PN += "${PN_CLIENT}"
+FILES_${PN}-client += "${bindir}/iwctl"
+
+# ead service
+PN_WIRED = "${@bb.utils.contains('PACKAGECONFIG', 'wired', '${PN}-wired', '', d)}"
+PACKAGE_BEFORE_PN += "${PN_WIRED}"
+SYSTEMD_PACKAGES += "${PN_WIRED}"
+SYSTEMD_SERVICE_${PN}-wired = "${@'ead.service' if d.getVar('PN_WIRED') and bb.utils.to_boolean(d.getVar('HAVE_SYSTEMD')) else ''}"
+FILES_${PN}-wired += " \
+    ${libexecdir}/ead \
+    ${datadir}/dbus-1/system.d/ead-dbus.conf \
+    ${datadir}/dbus-1/system-services/net.connman.ead.service \
+"
+
+# iwmon tool
+PACKAGE_BEFORE_PN += "${PN}-monitor"
+FILES_${PN}-monitor += "${bindir}/iwmon"
-- 
2.19.1


