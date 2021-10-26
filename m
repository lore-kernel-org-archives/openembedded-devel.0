Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53D0C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 08:00:13 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.8993.1635235212585002714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 01:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19Q7xtBm022278
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19Q7xkFJ021130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 00:59:50 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 00:59:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH 4/7] jemalloc: add ptest support
Date: Tue, 26 Oct 2021 15:58:34 +0800
Message-ID: <20211026075837.39670-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026075837.39670-1-mingli.yu@windriver.com>
References: <20211026075837.39670-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 08:00:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93592

From: Mingli Yu <mingli.yu@windriver.com>

Add ptest support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/jemalloc/files/run-ptest | 19 +++++++++++++++++++
 .../jemalloc/jemalloc_5.2.1.bb                | 17 ++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jemalloc/files/run-ptest

diff --git a/meta-oe/recipes-devtools/jemalloc/files/run-ptest b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
new file mode 100644
index 000000000..ea9d80cbb
--- /dev/null
+++ b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+saved_dir=$PWD
+for dir in tests/* ; do
+	cd $dir
+	for atest in * ; do
+		if [ \( -x $atest \) -a \( -f $atest \) ] ; then
+			./$atest > ${atest}.stdout 2> ${atest}.stderr
+			if [ $? = 0 ] ; then
+				echo "PASS: $dir $atest"
+				rm ${atest}.stdout ${atest}.stderr
+			else
+				echo "FAIL: ${dir}/${atest}"
+			fi
+		fi
+	done
+	cd $saved_dir
+done
+
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index b191f729a..b5d53bb11 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -15,14 +15,29 @@ LIC_FILES_CHKSUM = "file://README;md5=6900e4a158982e4c4715bf16aa54fa10"
 
 SRC_URI = "git://github.com/jemalloc/jemalloc.git \
            file://0001-Makefile.in-make-sure-doc-generated-before-install.patch \
+           file://run-ptest \
 "
 
 SRCREV = "ea6b3e973b477b8061e0076bb257dbd7f3faa756"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools ptest
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
+
+do_compile_ptest() {
+	oe_runmake tests
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	subdirs="test/unit test/integration test/stress "
+	for tooltest in ${subdirs}
+	do
+		cp -r ${B}/${tooltest} ${D}${PTEST_PATH}/tests
+	done
+	find ${D}${PTEST_PATH}/tests \( -name "*.d" -o -name "*.o" \) -exec rm -f {} \;
+}
-- 
2.17.1


