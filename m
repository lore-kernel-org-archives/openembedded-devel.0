Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 603296D470
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:06:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6P76C2E023275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 00:06:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 25 Jul 2019 00:06:26 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jul 2019 15:06:25 +0800
Message-ID: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libseccomp: import from meta-security
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
X-List-Received-Date: Thu, 25 Jul 2019 07:06:51 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-security/libseccomp/files/run-ptest    |  4 +++
 .../libseccomp/libseccomp_2.4.1.bb                 | 41 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-security/libseccomp/files/run-ptest
 create mode 100644 meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb

diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest b/meta-oe/recipes-security/libseccomp/files/run-ptest
new file mode 100644
index 0000000..54b4a63
--- /dev/null
+++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+cd tests
+./regression -a
diff --git a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
new file mode 100644
index 0000000..dba1be5
--- /dev/null
+++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
@@ -0,0 +1,41 @@
+SUMMARY = "interface to seccomp filtering mechanism"
+DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+SECTION = "security"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
+
+SRCREV = "fb43972ea1aab24f2a70193fb7445c2674f594e3"
+
+SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.4 \
+           file://run-ptest \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig ptest
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
+
+do_compile_ptest() {
+    oe_runmake -C tests check-build
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/tools
+    for file in $(find tests/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find tests/*.tests -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find tools/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
+    done
+}
+
+FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
+FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
+
+RDEPENDS_${PN}-ptest = "bash"
-- 
2.7.4


