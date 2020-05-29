Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.30554.1590739816903024628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343085"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:10:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FCA94BCC8A6
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:10:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:10:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mosquitto: upgrade 1.6.9 -> 1.6.10
Date: Sat, 30 May 2020 01:09:59 +0800
Message-ID: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2FCA94BCC8A6.A6394
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mosquitto/{mosquitto_1.6.9.bb => mosquitto_1.6.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.9.bb => mosquitto_1.6.10.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
index de43aae736..31b5f678df 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://install-protocol.patch \
 "
 
-SRC_URI[md5sum] = "52f5078ec18aaf623b14dfb121fd534b"
-SRC_URI[sha256sum] = "412979b2db0a0020bd02fa64f0a0de9e7000b84462586e32b67f29bb1f6c1685"
+SRC_URI[md5sum] = "960f963b81b7f93982d7511cd28082e5"
+SRC_URI[sha256sum] = "92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.17.1



