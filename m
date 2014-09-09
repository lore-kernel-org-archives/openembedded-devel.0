Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79058605BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 05:57:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s895vOF4015807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Sep 2014 22:57:25 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 22:57:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 13:57:27 +0800
Message-ID: <1410242247-29767-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] zeromq: following ptest formatting
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
X-List-Received-Date: Tue, 09 Sep 2014 05:57:29 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-connectivity/zeromq/files/run-ptest |   10 ++++++++++
 meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb |   17 +++++++----------
 2 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100755 meta-oe/recipes-connectivity/zeromq/files/run-ptest

diff --git a/meta-oe/recipes-connectivity/zeromq/files/run-ptest b/meta-oe/recipes-connectivity/zeromq/files/run-ptest
new file mode 100755
index 0000000..9c76aee
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in `ls *`; do
+   if [ ./$i ] ; then
+       echo "PASS: $i"
+   else
+       echo "FAIL: $i"
+   fi
+done
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
index 014114f..80907fa 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://www.zeromq.org"
 LICENSE = "LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
 
-SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
+SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz \
+           file://run-ptest \
+           "
 SRC_URI[md5sum] = "f3c3defbb5ef6cc000ca65e529fdab3b"
 SRC_URI[sha256sum] = "1ef71d46e94f33e27dd5a1661ed626cd39be4d2d6967792a275040e34457d399"
 
@@ -14,14 +16,9 @@ S = "${WORKDIR}/zeromq-${PV}"
 #CFLAGS_append += "-O0"
 #CXXFLAGS_append += "-O0"
 
-inherit autotools
+inherit autotools ptest
 
-do_install_append () {
-        install -d ${D}${bindir}/tests/zeromq-${PV}
-        install -m 0755 ${B}/tests/.libs/* ${D}${bindir}/tests/zeromq-${PV}
+do_install_ptest () {
+        install -d ${D}${PTEST_PATH}/tests
+        install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
 }
-
-PACKAGES = "${PN}-dbg ${PN}-test ${PN} ${PN}-staticdev ${PN}-doc ${PN}-dev ${PN}-locale"
-
-FILES_${PN}-dbg =+ "${bindir}/tests/zeromq-${PV}/.debug"
-FILES_${PN}-test = "${bindir}/tests"
-- 
1.7.10.4


