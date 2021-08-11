Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.5369.1628674892417376114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 02:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B9fUDS009297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Aug 2021 02:41:31 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 11 Aug 2021 02:41:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 11 Aug 2021 02:41:29 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] jemalloc: add ptest support
Date: Wed, 11 Aug 2021 17:38:41 +0800
Message-ID: <20210811093841.2184-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add ptest support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
2.29.2

