Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1444.1626855072391870518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 01:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16L8BA95025174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 01:11:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 01:11:09 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 21 Jul 2021 01:11:09 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V3] lmdb: add recipe
Date: Wed, 21 Jul 2021 04:11:09 -0400
Message-ID: <20210721081109.23229-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

lmdb provides a high-performance embedded transactional
database in the form of a key-value store.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-dbs/lmdb/files/run-ptest | 25 +++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb  | 39 ++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
 create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb

diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
new file mode 100644
index 000000000..a6a7549b9
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+cd tests
+
+retval=0
+for t in mtest*
+do
+    mkdir testdb
+    ./$t > /dev/null && ./mdb_stat testdb > /dev/null
+    if [ $? -ne 0 ]; then
+            echo "FAIL: $t"
+            retval=$(( ${retval} + 1))
+    else
+            echo "PASS: $t"
+    fi
+    rm -rf testdb
+done
+
+if [ $retval -eq 0 ] ; then
+    echo "PASS: lmdb"
+else
+    echo "FAIL: lmdb"
+fi
+
+exit $retval
\ No newline at end of file
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
new file mode 100644
index 000000000..0746da141
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -0,0 +1,39 @@
+# SPDX-FileCopyrightText: 2017-2019 Volker Krause <vkrause@kde.org>
+# SPDX-FileCopyrightText: 2019 Hannah Kiekens <hannahkiekens@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY = "Lightning Memory-Mapped Database (LMDB)"
+HOMEPAGE = "https://symas.com/lightning-memory-mapped-database/"
+LICENSE = "OLDAP-2.8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
+
+SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
+           file://run-ptest \
+"
+
+SRCREV = "LMDB_${PV}"
+
+inherit base ptest
+
+S = "${WORKDIR}/git/libraries/liblmdb"
+
+LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
+
+do_compile() {
+    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
+}
+
+do_install() {
+    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
+    cd ${D}/${libdir}
+    ln -s liblmdb.so.${PV} liblmdb.so
+    rm liblmdb.a
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
+        install -m 755 ${S}/$test ${D}${PTEST_PATH}/tests
+    done
+}
-- 
2.32.0

