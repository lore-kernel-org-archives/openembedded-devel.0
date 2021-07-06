Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.2443.1625551032652961693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jul 2021 22:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1665vBqB018727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 22:57:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 5 Jul 2021 22:57:09 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 5 Jul 2021 22:57:09 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] lmdb: add recipe
Date: Tue, 6 Jul 2021 01:57:08 -0400
Message-ID: <20210706055708.22017-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

lmdb provides a high-performance embedded transactional
database in the form of a key-value store.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-dbs/lmdb/files/run-ptest      | 14 +++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       | 39 +++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
 create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1b21ec654..c83bd0913 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -211,6 +211,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     influxdb \
     leveldb \
     libdbi \
+    lmdb \
     mariadb \
     postgresql \
     psqlodbc \
diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
new file mode 100644
index 000000000..9c9e6e70d
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+cd tests
+
+for t in mtest*
+do
+	rm -rf testdb && mkdir testdb
+	./$t > /dev/null
+	if [ $? -ne 0 ]; then
+		echo "FAIL: $t"
+	else
+		echo "PASS: $t"
+	fi
+done
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
new file mode 100644
index 000000000..7f97a0d15
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
+SRC_URI = " \
+    git://github.com/LMDB/lmdb.git;nobranch=1 \
+    file://run-ptest \
+"
+SRCREV = "LMDB_${PV}"
+
+inherit base ptest
+
+S = "${WORKDIR}/git/libraries/liblmdb"
+
+do_compile() {
+    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="-Wl,-soname,lib${PN}.so.${PV}"
+}
+
+do_install() {
+    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="-Wl,-soname,lib${PN}.so.${PV}" install
+    cd ${D}/${libdir}
+    ln -s liblmdb.so.${PV} liblmdb.so
+    rm liblmdb.a
+}
+
+INSANE_SKIP += "ldflags"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
+        cp ${S}/$test ${D}${PTEST_PATH}/tests
+    done
+}
\ No newline at end of file
-- 
2.32.0

