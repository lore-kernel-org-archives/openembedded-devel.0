Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 940A6607AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:51:31 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 67F621C1B09;
	Thu, 22 Nov 2018 14:51:32 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2018 14:51:27 +0100
Message-Id: <20181122135127.60927-1-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181122124817.26024-1-martin@geanix.com>
References: <20181122124817.26024-1-martin@geanix.com>
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
X-List-Received-Date: Thu, 22 Nov 2018 13:51:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The iwd wireless daemon is an alternative to wpa_supplicant. It is
controlled using the iwctl command line client (or the dbus interface).

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Changes since v2:
- add patch to make client unit test depend on packageconfig
- remove split of packages

Changes since v1:
- add packageconfig for client, ead, and ofono
- split out packages for iwctl, ead, and iwmon
- add ptest support

 ...ient-unit-test-conditional-on-enable.patch | 59 +++++++++++++++++++
 ...ble-serial-tests-in-automake-to-supp.patch | 32 ++++++++++
 .../recipes-connectivity/iwd/iwd/run-ptest    | 30 ++++++++++
 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb  | 43 ++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-make-client-unit-test-conditional-on-enable.patch
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/run-ptest
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-make-client-unit-test-conditional-on-enable.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-make-client-unit-test-conditional-on-enable.patch
new file mode 100644
index 000000000..bce87f66b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-make-client-unit-test-conditional-on-enable.patch
@@ -0,0 +1,59 @@
+From b327b775db4e250d3448ab30ce97ca0acfea7603 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Thu, 22 Nov 2018 14:31:11 +0100
+Subject: [PATCH] Makefile: make client unit test conditional on
+ --{enable,disable}-client
+To: iwd@lists.01.org
+
+The iwctl client and its unit test depends on readline. If building on a
+host without readline installed, default make target succeeds when
+configured with --disable-client, but the following make check target
+fails.
+
+Fix this by making the test-client target conditional on the
+--{enable,disable}-client configure flag.
+
+Upstream-Status: Submitted [https://lists.01.org/pipermail/iwd/2018-November/005178.html]
+Signed-Off-By: Martin Hundebøll <martin@geanix.com>
+
+---
+ Makefile.am | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index db64c38..262e80d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -297,9 +297,11 @@ unit_tests = unit/test-cmac-aes \
+ 		unit/test-crypto unit/test-eapol unit/test-mpdu \
+ 		unit/test-ie unit/test-ssid-to-utf8 unit/test-ssid-security \
+ 		unit/test-arc4 unit/test-wsc unit/test-eap-mschapv2 \
+-		unit/test-eap-sim unit/test-client unit/test-ecc \
+-		unit/test-sae
++		unit/test-eap-sim unit/test-ecc unit/test-sae
+ 
++if CLIENT
++unit_tests += unit/test-client
++endif
+ 
+ ell_pem_files = cert-ca-key.pem cert-client-key.pem cert-client-key-pkcs8.pem \
+ 		cert-server-key.pem cert-server-key-pkcs8.pem \
+@@ -404,6 +406,7 @@ unit_test_eap_mschapv2_SOURCES = src/eap-mschapv2.h src/eap-mschapv2.c \
+ 				unit/test-eap-mschapv2.c
+ unit_test_eap_mschapv2_LDADD = $(ell_ldadd)
+ 
++if CLIENT
+ unit_test_client_SOURCES = unit/test-client.c \
+ 				client/adapter.c \
+ 				client/agent.h client/agent.c \
+@@ -414,6 +417,7 @@ unit_test_client_SOURCES = unit/test-client.c \
+ 				client/network.h client/network.c \
+ 				client/properties.h client/properties.c
+ unit_test_client_LDADD = $(ell_ldadd) -lreadline
++endif
+ 
+ unit_test_ecc_SOURCES = unit/test-ecc.c src/ecc.c src/ecc.h
+ unit_test_ecc_LDADD = $(ell_ldadd)
+-- 
+2.19.1
+
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
index 000000000..c9aec91ce
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Wireless daemon for Linux"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+inherit autotools pkgconfig systemd ptest
+
+DEPENDS = "ell dbus"
+
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+    file://0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch \
+    file://0001-Makefile-make-client-unit-test-conditional-on-enable.patch \
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
+# iwd service
+SYSTEMD_SERVICE_${PN} = "iwd.service"
+SYSTEMD_SERVICE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
+FILES_${PN} += "${datadir}/dbus-1/"
-- 
2.19.1


