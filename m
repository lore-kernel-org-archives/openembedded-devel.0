Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.12218.1596172887901448762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199292"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:21:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C4FF94CE5440
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:21:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:21:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] paho-mqtt-c: upgrade 1.3.2 -> 1.3.4
Date: Sat, 1 Aug 2020 01:21:15 +0800
Message-ID: <1596216075-3418-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596216075-3418-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596216075-3418-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C4FF94CE5440.A552F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.3.2.bb => paho-mqtt-c_1.3.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.2.bb => paho-mqtt-c_1.3.4.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.4.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.4.bb
index 3a1222e89e..2d4e39bf97 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http \
            file://0001-Fix-bug-of-free-with-musl.patch"
 
-SRCREV = "3148fe2d5f4b87e16266dfe559c0764e16ca0546"
+SRCREV = "2d3d0941a9233889d4d5cc37f5182bbefea261ad"
 
 DEPENDS = "openssl"
 
-- 
2.25.1



