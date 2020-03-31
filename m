Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.1113.1585619554262056564
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 18:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,326,1580745600"; 
   d="scan'208";a="88257686"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Mar 2020 09:52:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D8851406AB15
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 09:42:11 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 31 Mar 2020 09:52:26 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 31 Mar 2020 09:52:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-simpleeval: Enable ptest
Date: Tue, 31 Mar 2020 09:54:56 +0800
Message-ID: <20200331015456.27897-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D8851406AB15.A8312
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-simpleeval/run-ptest            |  3 +++
 .../python/python3-simpleeval_0.9.10.bb            | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest b/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
index 633347a93..1cacf9af2 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
@@ -6,6 +6,18 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=dc9277482effe59b734b004cbcc1fee7"
 SRC_URI[md5sum] = "f175fc12d408487ca26fa3905e0a6691"
 SRC_URI[sha256sum] = "692055488c2864637f6c2edb5fa48175978a2a07318009e7cf03c9790ca17bea"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	cp -f ${S}/test_simpleeval.py ${D}${PTEST_PATH}/
+}
-- 
2.20.1



