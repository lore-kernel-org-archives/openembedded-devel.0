Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.31893.1612766201669003785
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 22:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,161,1610380800"; 
   d="scan'208";a="104318771"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Feb 2021 14:36:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 295424CE6F7A
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Feb 2021 14:36:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 14:36:39 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-periphery: upgrade 2.1.0 -> 2.2.0
Date: Mon, 8 Feb 2021 14:36:38 +0800
Message-ID: <1612766198-76789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 295424CE6F7A.A7D23
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...hon3-periphery_2.1.0.bb => python3-periphery_2.2.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.1.0.bb => python3-periphery_2.2.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
index 3cd9004df..a01071151 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
@@ -4,11 +4,13 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b"
 
-SRC_URI[md5sum] = "27cdd7e026438067a238fb04ed5766a3"
-SRC_URI[sha256sum] = "57baa82e6bc59b67747317d16ad0cf9626826e8d43233af13bce924660500bd6"
+SRC_URI[md5sum] = "0a5b866443edab0dab62cea56ed96f1e"
+SRC_URI[sha256sum] = "391e5bdfe2511aa7369002d4861df795dbb2889426b1b2cc1e6c9d85939da4dd"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-periphery"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
+RDEPENDS_${PN} += "${PYTHON_PN}-mmap \
+		${PYTHON_PN}-ctypes \
+		${PYTHON_PN}-fcntl"
-- 
2.25.1



