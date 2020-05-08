Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6243.1588923382482684954
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 00:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0487a0Ym013583
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 May 2020 00:36:11 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 00:35:50 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pyudev: add the missing rdepends
Date: Fri, 8 May 2020 15:35:48 +0800
Message-ID: <1588923348-255260-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pyudev
 [snip]
 ModuleNotFoundError: No module named 'fcntl'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
index f39847f..49a3628 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
@@ -17,5 +17,6 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-fcntl \
     libudev \
 "
-- 
2.7.4

