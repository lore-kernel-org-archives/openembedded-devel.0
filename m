Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2259.1600790932070019068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2020 09:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08MG8KYV008470
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2020 09:08:40 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 22 Sep 2020
 09:08:15 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 2AA8520180;
 Tue, 22 Sep 2020 12:08:15 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-oe][PATCH] libssh2: enable ptest
Date: Tue, 22 Sep 2020 12:07:51 -0400
Message-ID: <20200922160751.26050-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-support/libssh2/files/run-ptest |  7 +++++++
 .../recipes-support/libssh2/libssh2_1.9.0.bb    | 17 ++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libssh2/files/run-ptest

diff --git a/meta-oe/recipes-support/libssh2/files/run-ptest b/meta-oe/recipes-support/libssh2/files/run-ptest
new file mode 100644
index 000000000..2a7922f1a
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+for test in $(ls $ptestdir/tests)
+do
+	./test-driver --test-name $test --log-file $test.log --trs-file $test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./tests/$test
+done
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index c1f337a44..a1d85617a 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
+           file://run-ptest \
 "
 SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
 SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += "\
                  --with-libz \
@@ -26,3 +27,17 @@ PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_L
 PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-ptest = "bash"
+
+do_compile_ptest() {
+	sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
+	oe_runmake check
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	install -m 0755 ${B}/tests/.libs/simple ${D}${PTEST_PATH}/tests/
+	install -m 0755 ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
+	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
+}
-- 
2.27.0

