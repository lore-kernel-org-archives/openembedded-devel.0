Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.2380.1609832419178500403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 23:40:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193273"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:40:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 071FB4CE6031
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 Jan 2021 15:40:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:40:10 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] thin-provisioning-tools: upgrade 0.8.5 -> 0.9.0
Date: Tue, 5 Jan 2021 15:40:08 +0800
Message-ID: <1609832408-108263-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 071FB4CE6031.A389E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...isioning-tools_0.8.5.bb => thin-provisioning-tools_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_0.8.5.bb => thin-provisioning-tools_0.9.0.bb} (92%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.9.0.bb
similarity index 92%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.9.0.bb
index 3f82734ac..9a05e05f3 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.9.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
            file://use-sh-on-path.patch \
 "
 
-SRCREV = "5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4"
+SRCREV = "d6d93c3157631b242a13a81d30f75453e576c55a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



