Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3618.1599787269617252785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114318"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:21:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2DF9848990E7
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:21:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:21:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] libdnet: upgrade 1.12 -> 1.14
Date: Fri, 11 Sep 2020 21:21:02 +0800
Message-ID: <1599830462-14744-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2DF9848990E7.A5632
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libdnet/{libdnet_1.12.bb => libdnet_1.14.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libdnet/{libdnet_1.12.bb => libdnet_1.14.bb} (90%)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
similarity index 90%
rename from meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
rename to meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
index 5b27cfe15..df48782ee 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
 SRC_URI = "git://github.com/dugsong/libdnet.git;nobranch=1"
-SRCREV = "12fca29a6d4e99d1b923d6820887fe7b24226904"
+SRCREV = "3e782472d2a58d5e1b94d04eda4a364c2d257600"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



