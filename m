Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.1907.1588837691858732258
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 00:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0477mAw4028165
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 00:48:10 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 00:48:09 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pid: add the missing rdepends
Date: Thu, 7 May 2020 15:48:08 +0800
Message-ID: <1588837688-255041-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pid
 [snip]
ModuleNotFoundError: No module named 'fcntl'
ModuleNotFoundError: No module named 'logging'
ModuleNotFoundError: No module named 'tempfile'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pid_2.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb b/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
index b8dd0d7..ef19478 100644
--- a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "ad352ee1dc28b9746a15451c0c53e9d7"
 SRC_URI[sha256sum] = "96eb7dba326b88f5164bc1afdc986c7793e0d32d7f62366256a3903c7b0614ef"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-fcntl ${PYTHON_PN}-logging ${PYTHON_PN}-io"
-- 
2.7.4

