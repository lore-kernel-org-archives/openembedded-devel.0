Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF87D60291
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 05:24:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAQ5OfZ9008048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:24:41 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 21:24:40 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Nov 2015 13:13:41 +0800
Message-ID: <1448514821-22998-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] phoronix-test-suite: uprev it to 6.0.1
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
X-List-Received-Date: Thu, 26 Nov 2015 05:24:43 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit systemd and move the systemd unit files to correct dir
2. inherit allarch
3. add bash/python/php-cli to RDEDEPENDS

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../phoronix-test-suite_5.2.1.bb                   | 24 ----------------
 .../phoronix-test-suite_6.0.1.bb                   | 33 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
 create mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
deleted file mode 100644
index 0fc5e8d..0000000
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Phoronix Test Suite"
-DESCRIPTION = "The Phoronix Test Suite is designed to carry out both qualitative \
-and quantitative benchmarks in a clean, reproducible, and easy-to-use manner."
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-SECTION = "console/tests"
-
-SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219"
-SRC_URI[sha256sum] = "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9"
-S = "${WORKDIR}/phoronix-test-suite"
-
-do_install() {
-	DESTDIR=${D} ./install-sh ${exec_prefix}
-}
-
-#RDEPENDS_${PN} = "php-cli"
-FILES_${PN} += " \
-	${datadir}/phoronix-test-suite \
-	${datadir}/appdata/phoronix-test-suite.appdata.xml \
-	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
-	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
-	${datadir}/mime/packages/openbenchmarking-mime.xml \
-"
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
new file mode 100644
index 0000000..7f617ce
--- /dev/null
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Phoronix Test Suite"
+DESCRIPTION = "The Phoronix Test Suite is designed to carry out both qualitative \
+and quantitative benchmarks in a clean, reproducible, and easy-to-use manner."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "console/tests"
+
+SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "c3b26fcc57a3a253e558f759fdc1089f"
+SRC_URI[sha256sum] = "27add54f4ecb464549de580cece84b4a4945b99df3ef7ff7034eb7f23ffb3b39"
+S = "${WORKDIR}/phoronix-test-suite"
+
+
+inherit systemd allarch
+
+do_install() {
+	DESTDIR=${D} ./install-sh ${exec_prefix}
+        install -d ${D}/${systemd_unitdir}/system/
+        mv ${D}/usr/lib/systemd/system/* ${D}/${systemd_unitdir}/system/
+        rm -rf ${D}/usr/lib/
+}
+
+SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
+RDEPENDS_${PN} += "bash python php-cli"
+
+FILES_${PN} += " \
+	${datadir}/phoronix-test-suite \
+	${datadir}/appdata/phoronix-test-suite.appdata.xml \
+	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
+	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
+	${datadir}/mime/packages/openbenchmarking-mime.xml \
+	${systemd_unitdir}/system/* \
+"
-- 
1.9.1


