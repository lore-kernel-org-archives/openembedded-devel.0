Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.42521.1609134875945015598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 21:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,454,1599494400"; 
   d="scan'208";a="102979334"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 13:54:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D7F94CE5468
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 13:54:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 13:54:22 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] bridge-utils: upgrade 1.6 -> 1.7
Date: Mon, 28 Dec 2020 13:54:16 +0800
Message-ID: <1609134856-89864-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6D7F94CE5468.A733F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../bridge-utils/{bridge-utils_1.6.bb => bridge-utils_1.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/bridge-utils/{bridge-utils_1.6.bb => bridge-utils_1.7.bb} (95%)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
similarity index 95%
rename from meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
rename to meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
index 1c87c48bf..369232343 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 
-SRCREV = "42c1aefc303fdf891fbb099ea51f00dca83ab606"
+SRCREV = "ab8a2cc330253321be7bc69dea88bfaa3d48415e"
 
 SRC_URI = "\
     git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git \
-- 
2.25.1



