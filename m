Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.15022.1605233045680005673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,473,1596470400"; 
   d="scan'208";a="101312261"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Nov 2020 10:04:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 111454CE3B74
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 10:03:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 13 Nov 2020 10:03:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zile: upgrade 2.4.14 -> 2.4.15
Date: Fri, 13 Nov 2020 22:03:57 +0800
Message-ID: <1605276237-25741-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 111454CE3B74.AEF01
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/zile/{zile_2.4.14.bb => zile_2.4.15.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/zile/{zile_2.4.14.bb => zile_2.4.15.bb} (80%)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.14.bb b/meta-oe/recipes-support/zile/zile_2.4.15.bb
similarity index 80%
rename from meta-oe/recipes-support/zile/zile_2.4.14.bb
rename to meta-oe/recipes-support/zile/zile_2.4.15.bb
index acd491498..41c4b76d2 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.14.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.15.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-SRC_URI[md5sum] = "c7d7eec93231c6878f255978d9747a73"
-SRC_URI[sha256sum] = "7a78742795ca32480f2bab697fd5e328618d9997d6f417cf1b14e9da9af26b74"
+SRC_URI[md5sum] = "05efa90dfee1821ca018b0b2ef8f50a8"
+SRC_URI[sha256sum] = "39c300a34f78c37ba67793cf74685935a15568e14237a3a66fda8fcf40e3035e"
 
 inherit autotools pkgconfig
 
-- 
2.25.1



