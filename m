Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3673.1599787725474155254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114577"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:28:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AA5D948990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:28:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:28:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.0.6 -> 6.0.7
Date: Fri, 11 Sep 2020 21:28:37 +0800
Message-ID: <1599830917-15480-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AA5D948990D3.A507F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-extended/redis/{redis_6.0.6.bb => redis_6.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.0.6.bb => redis_6.0.7.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.0.6.bb b/meta-oe/recipes-extended/redis/redis_6.0.7.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_6.0.6.bb
rename to meta-oe/recipes-extended/redis/redis_6.0.7.bb
index c9846c5c7..791e41e6e 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.7.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "2f65e1f5610d98dd48e10eef49c79b02"
-SRC_URI[sha256sum] = "12ad49b163af5ef39466e8d2f7d212a58172116e5b441eebecb4e6ca22363d94"
+SRC_URI[md5sum] = "ac57b7188b771bbc08e8d7d6dddb3a80"
+SRC_URI[sha256sum] = "c2aaa1a4c7e72c70adedf976fdd5e1d34d395989283dab9d7840e0a304bb2393"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1



