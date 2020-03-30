Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.55330.1585587381629600887
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02UGu0f4023733
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 09:56:10 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 09:55:49 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-more-itertools: upgrade 8.1.0 -> 8.2.0
Date: Mon, 30 Mar 2020 12:55:48 -0400
Message-ID: <20200330165548.16512-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-more-itertools_8.1.0.bb  | 5 -----
 .../recipes-devtools/python/python3-more-itertools_8.2.0.bb  | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb
deleted file mode 100644
index 9a09c10b1..000000000
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit pypi setuptools3
-require python-more-itertools.inc
-
-SRC_URI[md5sum] = "a552b06cec1bdf01d60f952dbcc9a021"
-SRC_URI[sha256sum] = "c468adec578380b6281a114cb8a5db34eb1116277da92d7c46f904f0b52d3288"
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
new file mode 100644
index 000000000..c3b34d364
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
@@ -0,0 +1,5 @@
+inherit pypi setuptools3
+require python-more-itertools.inc
+
+SRC_URI[md5sum] = "55e7e0a5eabc5a57bc8353c65c6f9965"
+SRC_URI[sha256sum] = "b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507"
-- 
2.24.1

