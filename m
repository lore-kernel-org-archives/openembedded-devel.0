Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3733.1599787789760235866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:29:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4023648990E7
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:29:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:29:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] spdlog: upgrade 1.7.0 -> 1.8.0
Date: Fri, 11 Sep 2020 21:29:48 +0800
Message-ID: <1599830988-15560-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4023648990E7.A24CB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/spdlog/{spdlog_1.7.0.bb => spdlog_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.7.0.bb => spdlog_1.8.0.bb} (93%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.7.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.8.0.bb
similarity index 93%
rename from meta-oe/recipes-support/spdlog/spdlog_1.7.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.8.0.bb
index ce491da0d..b79eb7c28 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.7.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCREV = "616caa5d30172b65cc3a06800894c575d70cb8e6"
+SRCREV = "4a9ccf7e38e257feecce0c579a782741254eaeef"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x;"
 
 DEPENDS += "fmt"
-- 
2.25.1



