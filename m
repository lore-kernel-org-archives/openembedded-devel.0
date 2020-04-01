Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.5448.1585744543513097491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 05:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 031CZgu7014112
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2020 05:35:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Apr 2020 05:35:42 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-parallax: add new recipe
Date: Wed, 1 Apr 2020 20:35:40 +0800
Message-ID: <1585744540-351499-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Parallax SSH provides an interface to executing
commands on multiple nodes at once using SSH. It
also provides commands for sending and receiving
files to multiple nodes using SCP.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
new file mode 100644
index 0000000..d658bd6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Execute commands and copy files over SSH to multiple machines at once."
+HOMEPAGE = "https://github.com/krig/parallax/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18"
+
+SRC_URI[md5sum] = "f8d04e9e246291536b705df7f60a55c9"
+SRC_URI[sha256sum] = "e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410b3c4ba"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

