Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.7026.1608278983885442209
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708846"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:09:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 28FB14CE6017
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:09:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:09:37 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] spdlog: upgrade 1.8.1 -> 1.8.2
Date: Fri, 18 Dec 2020 16:09:21 +0800
Message-ID: <1608278961-111693-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 28FB14CE6017.A89C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/spdlog/{spdlog_1.8.1.bb => spdlog_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.8.1.bb => spdlog_1.8.2.bb} (93%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb b/meta-oe/recipes-support/spdlog/spdlog_1.8.2.bb
similarity index 93%
rename from meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.8.2.bb
index 34937c83c..67ec802cd 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCREV = "cbe9448650176797739dbab13961ef4c07f4290f"
+SRCREV = "de0dbfa3596a18cd70a4619b6a9766847a941276"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x; \
            file://0001-Enable-use-of-external-fmt-library.patch"
 
-- 
2.25.1



