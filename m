Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDF2665D46
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 06:30:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s386UDXS027991
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Apr 2014 23:30:13 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Apr 2014 23:30:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 14:31:02 +0800
Message-ID: <1396938662-31887-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bonnie++: update to version 1.03e
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Apr 2014 06:30:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
* use BPN in the file name in SRC_URI.
* install binaries in bindir and sbindir instead of base_bindir and base_sbindir.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   32 --------------------
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb |   30 ++++++++++++++++++
 2 files changed, 30 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
deleted file mode 100644
index bff0d72..0000000
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Tests large file IO and creation/deletion of small files"
-HOMEPAGE = "http://www.coker.com.au/bonnie++/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
-
-SRC_URI = "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \
-           file://gcc-4.3-fixes.patch \
-"
-SRC_URI[md5sum] = "77a1ba78f37bdd7f024b67e1e36ad151"
-SRC_URI[sha256sum] = "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac89396043b49612a26"
-
-inherit autotools
-
-SCRIPTS = "bon_csv2html bon_csv2txt"
-EXES = "bonnie++ zcav"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install () {
-    install -d ${D}/bin
-    install -d ${D}/sbin
-    install -m 0755 ${EXES} ${D}/sbin
-    install -m 0755 ${SCRIPTS} ${D}/bin
-}
-
-PACKAGES =+ "bonnie-scripts"
-
-FILES_${PN} = "${base_sbindir}"
-FILES_bonnie-scripts = "${base_bindir}"
-
-
-
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
new file mode 100644
index 0000000..b986823
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Tests large file IO and creation/deletion of small files"
+HOMEPAGE = "http://www.coker.com.au/bonnie++/"
+SECTION = "benchmark/tests"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
+
+SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
+           file://gcc-4.3-fixes.patch \
+"
+SRC_URI[md5sum] = "750aa5b5051263a99c6c195888c74968"
+SRC_URI[sha256sum] = "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb"
+
+inherit autotools
+
+SCRIPTS = "bon_csv2html bon_csv2txt"
+EXES = "bonnie++ zcav"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install () {
+	install -d ${D}/${bindir}
+	install -d ${D}/${sbindir}
+	install -m 0755 ${EXES} ${D}/${sbindir}
+	install -m 0755 ${SCRIPTS} ${D}/${bindir}
+}
+
+PACKAGES =+ "bonnie-scripts"
+
+FILES_${PN} = "${sbindir}"
+FILES_bonnie-scripts = "${bindir}"
-- 
1.7.9.5


