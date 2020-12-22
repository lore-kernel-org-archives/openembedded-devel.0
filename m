Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7666.1608613381305547387
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 21:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,438,1599494400"; 
   d="scan'208";a="102806896"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Dec 2020 13:02:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0AD8B4CE4B3E
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 13:02:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Dec 2020 13:02:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 20.7.1 -> 20.12.3
Date: Tue, 22 Dec 2020 13:02:36 +0800
Message-ID: <1608613356-66897-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0AD8B4CE4B3E.A5251
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Add homepage description.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...thon3-autobahn_20.7.1.bb => python3-autobahn_20.12.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.7.1.bb => python3-autobahn_20.12.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
index 29f187cf8..90958dff5 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
-
+HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[md5sum] = "1ea21f5e751517a71f605eaaff7f0c38"
-SRC_URI[sha256sum] = "86bbce30cdd407137c57670993a8f9bfdfe3f8e994b889181d85e844d5aa8dfb"
+SRC_URI[md5sum] = "0a465e218d904f63537092b155489468"
+SRC_URI[sha256sum] = "410a93e0e29882c8b5d5ab05d220b07609b886ef5f23c0b8d39153254ffd6895"
 
 inherit pypi setuptools3
 
-- 
2.25.1



