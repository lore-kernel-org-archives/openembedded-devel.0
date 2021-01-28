Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.71.1611852708850424885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 08:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 10SGpfXO028865
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 08:51:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 08:51:36 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 28 Jan 2021 08:51:36 -0800
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libgpiod: add ptest
Date: Thu, 28 Jan 2021 11:51:29 -0500
Message-ID: <20210128165129.30314-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Added ptest for libgpiod. Requires CONFIG_GPIO_MOCKUP
kernel config to be enabled.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-support/libgpiod/files/run-ptest   | 12 ++++++++++++
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/files/run-ptest

diff --git a/meta-oe/recipes-support/libgpiod/files/run-ptest b/meta-oe/recipes-support/libgpiod/files/run-ptest
new file mode 100644
index 000000000..4cda05d44
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+testbin="gpiod-test"
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd $ptestdir/tests
+
+./$testbin
+if [ $? -ne 0 ]; then
+	echo "FAIL: $testbin"
+else
+	echo "PASS: $testbin"
+fi
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
index c0cf54589..e6b6476e2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
@@ -4,11 +4,14 @@ AUTHOR = "Bartosz Golaszewski <bgolaszewski@baylibre.com>"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz"
+SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
+           file://run-ptest \
+"
+
 SRC_URI[md5sum] = "4765470becb619fead3cdaeac61b9a77"
 SRC_URI[sha256sum] = "c601e71846f5ab140c83bc757fdd62a4fda24a9cee39cc5e99c96ec2bf1b06a9"
 
-inherit autotools pkgconfig python3native
+inherit autotools pkgconfig python3native ptest
 
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
@@ -31,3 +34,10 @@ PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
 RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
+
+PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
+}
-- 
2.29.2

