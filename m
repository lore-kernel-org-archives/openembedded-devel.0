Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.2916.1595584273698386904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 02:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,390,1589212800"; 
   d="scan'208";a="96851466"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 17:51:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 19A654CE4BDF
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 17:51:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 17:51:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-webserver] [PATCH] hiawatha: upgrade 10.10 -> 10.11
Date: Fri, 24 Jul 2020 17:51:00 +0800
Message-ID: <1595584262-85677-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 19A654CE4BDF.A4914
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../hiawatha/{hiawatha_10.10.bb => hiawatha_10.11.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_10.10.bb => hiawatha_10.11.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
index ed3df19390..89910841f6 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "3bf2c12c7037ecc3dfdbec72e7a2f04f"
-SRC_URI[sha256sum] = "b5e46f5757fa647e77d21d24f7eea912d59f26a75558cba780b45c1c3a33a4d9"
+SRC_URI[md5sum] = "6dcec72e94facbdc69b103006fa5819f"
+SRC_URI[sha256sum] = "79d85d165d68dd7043bbd337f5bc7dd10d8632d68ba61d0e557f84bd687c9727"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.25.1



