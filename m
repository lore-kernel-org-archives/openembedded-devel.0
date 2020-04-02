Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5810.1585794005465642611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 19:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,334,1580745600"; 
   d="scan'208";a="88365633"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 10:20:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 202F6406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 10:09:42 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 10:20:00 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 10:20:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-parse: Enable ptest
Date: Thu, 2 Apr 2020 10:22:31 +0800
Message-ID: <20200402022231.29910-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 202F6406AB15.A667C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-parse.inc       | 14 +++++++++++++-
 .../python/python3-parse/run-ptest                 |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-parse/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
index adae26129..ecfd67172 100644
--- a/meta-python/recipes-devtools/python/python-parse.inc
+++ b/meta-python/recipes-devtools/python/python-parse.inc
@@ -6,9 +6,21 @@ LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e7388
 SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
 SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
 
-inherit pypi
+inherit pypi ptest
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-logging \
     "
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
+	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
+}
diff --git a/meta-python/recipes-devtools/python/python3-parse/run-ptest b/meta-python/recipes-devtools/python/python3-parse/run-ptest
new file mode 100644
index 000000000..40c284799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parse/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest
-- 
2.20.1



