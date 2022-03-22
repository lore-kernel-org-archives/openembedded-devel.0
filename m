Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F050EC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 02:22:11 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.4970.1647915730819404923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 19:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22M2M2A1011790
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 19:22:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22M2M246003141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 19:22:02 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 21 Mar 2022 19:22:02 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 21 Mar 2022 19:22:02 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] pv: update from 1.6.6 to 1.6.20
Date: Mon, 21 Mar 2022 19:22:01 -0700
Message-ID: <20220322022201.16957-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220322022201.16957-1-Randy.MacLeod@windriver.com>
References: <20220322022201.16957-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 02:22:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96123

Add the HOMEPAGE which isn't availabe via https
and change the SRC_URI to use https.

Drop the obsolete SRC_URI md5sum.

Add ptest support. cksum is needed by the tests and it
is currently not build for busybox so add coreutils as a
ptest dependency.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/pv/pv/run-ptest |  7 +++++++
 meta-oe/recipes-support/pv/pv_1.6.20.bb | 27 +++++++++++++++++++++++++
 meta-oe/recipes-support/pv/pv_1.6.6.bb  | 16 ---------------
 3 files changed, 34 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-support/pv/pv/run-ptest
 create mode 100644 meta-oe/recipes-support/pv/pv_1.6.20.bb
 delete mode 100644 meta-oe/recipes-support/pv/pv_1.6.6.bb

diff --git a/meta-oe/recipes-support/pv/pv/run-ptest b/meta-oe/recipes-support/pv/pv/run-ptest
new file mode 100644
index 000000000..3f5956f4c
--- /dev/null
+++ b/meta-oe/recipes-support/pv/pv/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+rm -rf tests.log
+sh -e run-test.sh pv . > tests.log 2>&1
+sed -e 's|\(.*\):.*OK|PASS: \1|' \
+    -e 's|\(.*\):.*FAILED|FAIL: \1|' \
+   tests.log
diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-support/pv/pv_1.6.20.bb
new file mode 100644
index 000000000..867a621d1
--- /dev/null
+++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Terminal-based tool for monitoring the progress of data through a pipeline"
+HOMEPAGE = "http://www.ivarch.com/programs/pv.shtml"
+
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
+
+SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.bz2 \
+           file://run-ptest \
+"
+SRC_URI[sha256sum] = "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603"
+
+UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
+UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar.bz2"
+
+inherit autotools ptest
+
+LDEMULATION:mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
+export LDEMULATION
+
+RDEPENDS:${PN}-ptest = "coreutils"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/autoconf/scripts/run-test.sh  ${D}${PTEST_PATH}
+    # sed -i -e 's@\$SRCDIR/@./@g' ${D}${PTEST_PATH}/run-ptest
+}
diff --git a/meta-oe/recipes-support/pv/pv_1.6.6.bb b/meta-oe/recipes-support/pv/pv_1.6.6.bb
deleted file mode 100644
index 244d14001..000000000
--- a/meta-oe/recipes-support/pv/pv_1.6.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Terminal-based tool for monitoring the progress of data through a pipeline"
-
-LICENSE = "Artistic-2.0"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
-
-SRC_URI = "http://www.ivarch.com/programs/sources/${BP}.tar.bz2"
-SRC_URI[md5sum] = "ff3564fddcc2b9bd4a9c1d143aba4b4c"
-SRC_URI[sha256sum] = "608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1"
-
-UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
-UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar.bz2"
-
-inherit autotools
-
-LDEMULATION:mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
-export LDEMULATION
-- 
2.31.1


