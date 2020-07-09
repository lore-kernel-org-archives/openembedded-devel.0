Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3490.1594323845177727681
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 069JhWZX002800
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Jul 2020 12:43:53 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Jul 2020
 12:43:29 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 8D7422018B;
 Thu,  9 Jul 2020 15:43:28 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cunit: add ptest
Date: Thu, 9 Jul 2020 15:43:15 -0400
Message-ID: <20200709194315.17281-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb  | 18 ++++++++++++++++--
 meta-oe/recipes-test/cunit/files/run-ptest | 19 +++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/cunit/files/run-ptest

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index babf8048a..c877d3bf1 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -7,16 +7,30 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
 S = "${WORKDIR}/CUnit-${PV}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
-    file://fixup-install-docdir.patch"
+           file://fixup-install-docdir.patch \
+           file://run-ptest \
+          "
 SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
 SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cunit/files/releases"
 
-inherit autotools-brokensep remove-libtool
+inherit autotools-brokensep remove-libtool ptest
 
 EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-console"
 
+TESTBIN = "/CUnit/Sources/Test/test_cunit"
+
+PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'test','', d)} \
+                 "
+
+PACKAGECONFIG[test] = "--enable-test,,,"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	install -m 0755 ${S}${TESTBIN} ${D}${PTEST_PATH}/tests/
+}
+
 FILES_${PN}-dev += "${datadir}/CUnit"
 FILES_${PN}-doc += "${docdir}"
 
diff --git a/meta-oe/recipes-test/cunit/files/run-ptest b/meta-oe/recipes-test/cunit/files/run-ptest
new file mode 100644
index 000000000..903c8c8d9
--- /dev/null
+++ b/meta-oe/recipes-test/cunit/files/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd $ptestdir/tests
+./test_cunit > cunit_test_out.tmp
+
+echo "--- Test output ---"
+cat cunit_test_out.tmp
+echo ""
+echo "--- ptest result ---"
+
+grep "Failures: 0" cunit_test_out.tmp > /dev/null
+if [ $? -eq 0 ]; then
+	echo "PASS: cunit"
+else
+	echo "FAIL: cunit"
+fi
+
+rm -f cunit_test_out.tmp
-- 
2.27.0

