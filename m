Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.5848.1611623625893068383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 17:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; 
   d="scan'208";a="103824479"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 Jan 2021 09:13:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9EF7A4CE6031
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 09:13:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 Jan 2021 09:13:37 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ipy: upgrade 1.00 -> 1.01
Date: Tue, 26 Jan 2021 09:13:36 +0800
Message-ID: <1611623616-94203-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9EF7A4CE6031.A6C5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version 1.01 (2020-12-01)
------------
 * Update to support up to Python 3.9

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python3-ipy_1.00.bb => python3-ipy_1.01.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipy_1.00.bb => python3-ipy_1.01.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ipy_1.00.bb
rename to meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 14931546e..c141f6865 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/autocracy/python-ipy"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
 
-SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
-SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
+SRC_URI[md5sum] = "d6cf83e7f418ebbd23324ba1c658b907"
+SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1



