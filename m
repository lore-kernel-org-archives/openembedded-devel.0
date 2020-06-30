Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5975.1593480471667516957
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532628"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:27:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B2644CE4B19
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:17:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:27:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.0.4 -> 6.0.5
Date: Tue, 30 Jun 2020 09:27:35 +0800
Message-ID: <1593480455-5088-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7B2644CE4B19.A3544
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-extended/redis/{redis_6.0.4.bb => redis_6.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.0.4.bb => redis_6.0.5.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.0.4.bb b/meta-oe/recipes-extended/redis/redis_6.0.5.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_6.0.4.bb
rename to meta-oe/recipes-extended/redis/redis_6.0.5.bb
index ffa28ccfe..893f323d3 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.5.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "37200b25c282f94da4521bc510d79ced"
-SRC_URI[sha256sum] = "3337005a1e0c3aa293c87c313467ea8ac11984921fab08807998ba765c9943de"
+SRC_URI[md5sum] = "617d680fc0944c217e2350a365686eb0"
+SRC_URI[sha256sum] = "42cf86a114d2a451b898fcda96acd4d01062a7dbaaad2801d9164a36f898f596"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.17.1



