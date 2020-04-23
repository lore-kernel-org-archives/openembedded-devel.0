Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.936.1587618745114553986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 22:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,305,1583164800"; 
   d="scan'208";a="89684431"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Apr 2020 13:12:23 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C25374BCC894
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 13:01:47 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Apr 2020 13:12:24 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 23 Apr 2020 13:12:31 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 5.0.8 -> 5.0.9
Date: Thu, 23 Apr 2020 06:12:14 -0700
Message-ID: <20200423131214.86232-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C25374BCC894.A364B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-extended/redis/{redis_5.0.8.bb => redis_5.0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_5.0.8.bb => redis_5.0.9.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis_5.0.8.bb b/meta-oe/recipes-extended/redis/redis_5.0.9.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_5.0.8.bb
rename to meta-oe/recipes-extended/redis/redis_5.0.9.bb
index 2aec1b46a..d04293369 100644
--- a/meta-oe/recipes-extended/redis/redis_5.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_5.0.9.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "1885f1c67281d566a1fd126e19cfb25d"
-SRC_URI[sha256sum] = "f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7"
+SRC_URI[md5sum] = "c94523c9f4ee662027ddf90575d0e058"
+SRC_URI[sha256sum] = "53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.17.1



