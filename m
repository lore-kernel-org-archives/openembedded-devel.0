Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.6724.1611026699816351005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 19:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
   d="scan'208";a="103603836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Jan 2021 11:24:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F3854CE6016
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Jan 2021 11:24:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 Jan 2021 11:24:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-snappy: upgrade 0.5.4 -> 0.6.0
Date: Tue, 19 Jan 2021 23:24:55 +0800
Message-ID: <1611069895-4653-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0F3854CE6016.A11EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-snappy_0.5.4.bb => python3-snappy_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snappy_0.5.4.bb => python3-snappy_0.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
index 1836473b8b..64787feecc 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
@@ -4,7 +4,7 @@ DEPENDS += "snappy"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb"
 
-SRC_URI[sha256sum] = "d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2"
+SRC_URI[sha256sum] = "168a98d3f597b633cfeeae7fe1c78a8dfd81f018b866cf7ce9e4c56086af891a"
 
 inherit pypi setuptools3
 
-- 
2.25.1



