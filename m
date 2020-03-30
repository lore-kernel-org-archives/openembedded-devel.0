Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.44447.1585547626336853691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 22:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; 
   d="scan'208";a="87872113"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 13:53:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 31F2C49DF12E
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 13:43:28 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 13:53:46 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 13:53:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlparse: Enable ptest
Date: Mon, 30 Mar 2020 13:56:14 +0800
Message-ID: <20200330055614.18410-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 31F2C49DF12E.A8CDC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-sqlparse.inc  | 16 ++++++++++++++--
 .../python/python3-sqlparse/run-ptest            |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-sqlparse.inc b/meta-python/recipes-devtools/python/python-sqlparse.inc
index 473232d65..45a1e5677 100644
--- a/meta-python/recipes-devtools/python/python-sqlparse.inc
+++ b/meta-python/recipes-devtools/python/python-sqlparse.inc
@@ -4,7 +4,9 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch"
+SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
+            file://run-ptest \
+	    "
 
 SRC_URI[md5sum] = "423047887a3590b04dd18f8caf843a2f"
 SRC_URI[sha256sum] = "e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d12c548"
@@ -12,4 +14,14 @@ SRC_URI[sha256sum] = "e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d
 export BUILD_SYS
 export HOST_SYS
 
-inherit pypi
+inherit pypi ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unixadmin \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest b/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
new file mode 100644
index 000000000..40c284799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest
-- 
2.20.1



