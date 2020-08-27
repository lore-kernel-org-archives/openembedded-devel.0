Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.14108.1598515234288919363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 01:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07R80VmI003546
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 27 Aug 2020 01:00:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 01:00:18 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <trevor.gamblin@windriver.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-texttable: add recipe
Date: Thu, 27 Aug 2020 16:00:16 +0800
Message-ID: <20200827080016.26124-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-texttable_1.6.2.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
new file mode 100644
index 000000000..b507008f4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "module for creating simple ASCII tables"
+HOMEPAGE = "https://github.com/foutaise/texttable/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=af37e32174857b1f2043245f3651c824"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "763141f0bdf598cdc5cf780ed4d2eb94"
+SRC_URI[sha256sum] = "eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

