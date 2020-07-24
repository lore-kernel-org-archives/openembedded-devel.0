Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2916.1595584273698386904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 02:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,390,1589212800"; 
   d="scan'208";a="96851464"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 17:51:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B20E04CE5059
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 17:51:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 17:51:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-webserver] [PATCH] nostromo: upgrade 1.9.7 -> 1.9.9
Date: Fri, 24 Jul 2020 17:51:01 +0800
Message-ID: <1595584262-85677-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B20E04CE5059.A34AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../nostromo/{nostromo_1.9.7.bb => nostromo_1.9.9.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nostromo/{nostromo_1.9.7.bb => nostromo_1.9.9.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
rename to meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
index d13ef74feb..e726c9ac66 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
            file://nostromo \
 "
 
-SRC_URI[md5sum] = "6189714845b3ad5d0fc490f8cf48dacf"
-SRC_URI[sha256sum] = "33c635f317fb441e10d5297bb4218ae0ea62c48f2fc3029c08f5d2167c6cdfca"
+SRC_URI[md5sum] = "a054eb8e09560082793aaad676e33bd3"
+SRC_URI[sha256sum] = "1fad0a28d934835b582cedc98857e12e5adb991b14b87b52b39e6a501f4a9486"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1



