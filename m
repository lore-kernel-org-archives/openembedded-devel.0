Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5395.1600305889990464411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331796"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:24:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C089A48990D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 09:24:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:24:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.0.7 -> 6.0.8
Date: Thu, 17 Sep 2020 21:24:46 +0800
Message-ID: <1600349086-4647-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C089A48990D9.A0E24
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-extended/redis/{redis_6.0.7.bb => redis_6.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.0.7.bb => redis_6.0.8.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.0.7.bb b/meta-oe/recipes-extended/redis/redis_6.0.8.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_6.0.7.bb
rename to meta-oe/recipes-extended/redis/redis_6.0.8.bb
index 791e41e6e8..64b137c1be 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.8.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "ac57b7188b771bbc08e8d7d6dddb3a80"
-SRC_URI[sha256sum] = "c2aaa1a4c7e72c70adedf976fdd5e1d34d395989283dab9d7840e0a304bb2393"
+SRC_URI[md5sum] = "70113b4b8ea7ee4c7e148be62b5d1e0b"
+SRC_URI[sha256sum] = "04fa1fddc39bd1aecb6739dd5dd73858a3515b427acd1e2947a66dadce868d68"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1



