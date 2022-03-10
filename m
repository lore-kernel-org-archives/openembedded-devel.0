Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A636C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 05:30:56 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.6499.1646890248488438311
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 21:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22A5UfMv008257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 9 Mar 2022 21:30:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 9 Mar 2022 21:30:41 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 9 Mar 2022 21:30:40 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libcereal: add ptest support
Date: Thu, 10 Mar 2022 13:30:40 +0800
Message-ID: <20220310053040.4056340-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 05:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95918

From: Mingli Yu <mingli.yu@windriver.com>

Add ptest support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-support/libcereal/files/run-ptest  | 12 ++++++++++++
 .../libcereal/libcereal_1.3.2.bb               | 18 +++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100755 meta-oe/recipes-support/libcereal/files/run-ptest

diff --git a/meta-oe/recipes-support/libcereal/files/run-ptest b/meta-oe/recipes-support/libcereal/files/run-ptest
new file mode 100755
index 000000000..9bc480aa7
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+for atest in test_* ; do
+    rm -rf tests.log
+    ./${atest} > tests.log 2>&1
+    if [ $? = 0 ] ; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 08291d2db..fc58a42d2 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -12,17 +12,29 @@ LIC_FILES_CHKSUM = "\
     file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
 "
 
+DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} "
+
 PROVIDES += "${PN}-dev"
 
 PV .= "+git${SRCPV}"
 SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
-SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
+           file://run-ptest \
+"
 
 S = "${WORKDIR}/git"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
+PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DSKIP_PORTABILITY_TEST=ON,,"
+
+EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '', '-DJUST_INSTALL_CEREAL=ON', d)}"
 
-EXTRA_OECMAKE = "-DJUST_INSTALL_CEREAL=ON"
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp ${B}/unittests/test_*  ${D}${PTEST_PATH}/tests
+}
 
 ALLOW_EMPTY:${PN} = "1"
 
-- 
2.25.1


