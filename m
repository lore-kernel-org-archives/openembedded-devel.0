Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.53718.1594024492384030997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 01:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95816744"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:34:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 661314CE5057
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2020 16:34:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:34:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: Enable ptest
Date: Mon, 6 Jul 2020 16:34:31 +0800
Message-ID: <1594024472-6363-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 661314CE5057.A026E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/fuse3/run-ptest         |  3 +++
 .../recipes-support/fuse/fuse3_3.9.2.bb          | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/fuse3/run-ptest

diff --git a/meta-filesystems/recipes-support/fuse/fuse3/run-ptest b/meta-filesystems/recipes-support/fuse/fuse3/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/fuse3/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
index 24b17fc93..357a1de1d 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
@@ -20,7 +20,21 @@ S = "${WORKDIR}/fuse-${PV}"
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
 
-inherit meson pkgconfig
+inherit meson pkgconfig ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+        ${PYTHON_PN}-pytest \
+	bash \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/test
+        cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
 
 DEPENDS = "udev"
 
-- 
2.17.1



