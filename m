Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4019.1588906855699669902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 20:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04830sT4005149
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 20:00:54 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 20:00:35 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-ptyprocess: add the missing rdepends
Date: Fri, 8 May 2020 11:00:33 +0800
Message-ID: <1588906833-65091-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import ptyprocess
 [snip]
 ModuleNotFoundError: No module named 'fcntl'
 ModuleNotFoundError: No module named 'pty'
 ModuleNotFoundError: No module named 'resource'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python-ptyprocess.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
index 0cc9114..a6dc21c 100644
--- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
+++ b/meta-python/recipes-devtools/python/python-ptyprocess.inc
@@ -15,6 +15,9 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-resource \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

