Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.726.1586565554166311534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 17:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,368,1580745600"; 
   d="scan'208";a="88837614"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Apr 2020 08:39:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 08056406AB15
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2020 08:28:43 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 11 Apr 2020 08:39:08 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sat, 11 Apr 2020 08:39:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-prettytable: Enable ptest
Date: Sat, 11 Apr 2020 08:42:01 +0800
Message-ID: <20200411004205.23402-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 08056406AB15.AA645
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-prettytable.inc  | 13 +++++++++++++
 .../python/python3-prettytable/run-ptest            |  3 +++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-prettytable/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
index 07e896d2d..4897f27db 100644
--- a/meta-python/recipes-devtools/python/python-prettytable.inc
+++ b/meta-python/recipes-devtools/python/python-prettytable.inc
@@ -23,3 +23,16 @@ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
 UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
 
 BBCLASSEXTEND = "native nativesdk"
+inherit ptest
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
+	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
+}
diff --git a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1



