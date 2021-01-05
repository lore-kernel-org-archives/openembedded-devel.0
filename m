Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2329.1609832475374338065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 23:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193318"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:41:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CD1214CE1505
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 Jan 2021 15:41:12 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:41:13 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pykickstart: upgrade 3.26 -> 3.31
Date: Tue, 5 Jan 2021 15:41:04 +0800
Message-ID: <1609832464-108345-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CD1214CE1505.A7279
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...{python3-pykickstart_3.26.bb => python3-pykickstart_3.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.26.bb => python3-pykickstart_3.31.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.31.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.31.bb
index 7aeb5d6c9..dd0938e86 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.31.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "4c93e84c8798da511da1c05f1912d2f908f8f85f"
+SRCREV = "9c9c63e0e10c6f311c9e46dfd20d1d2201878e1b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.25.1



