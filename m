Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.5280.1585791938707910994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363703"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:45:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1EAC150A999D
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:35:26 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:45:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:45:52 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] nostromo: upgrade 1.9.6 -> 1.9.7
Date: Thu, 2 Apr 2020 02:15:31 -0700
Message-ID: <1585818933-28648-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1EAC150A999D.A3B25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../nostromo/{nostromo_1.9.6.bb => nostromo_1.9.7.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nostromo/{nostromo_1.9.6.bb => nostromo_1.9.7.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
rename to meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
index a6b1ff0fc..d13ef74fe 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
            file://nostromo \
 "
 
-SRC_URI[md5sum] = "27aa241d78ff78920354c3e03a5026ea"
-SRC_URI[sha256sum] = "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af44c7cdb1f411e8eb"
+SRC_URI[md5sum] = "6189714845b3ad5d0fc490f8cf48dacf"
+SRC_URI[sha256sum] = "33c635f317fb441e10d5297bb4218ae0ea62c48f2fc3029c08f5d2167c6cdfca"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.17.1



