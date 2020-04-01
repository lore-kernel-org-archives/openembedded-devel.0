Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2747.1585704785349458333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,329,1580745600"; 
   d="scan'208";a="88306230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Apr 2020 09:33:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7522649DF125
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2020 09:22:45 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Apr 2020 09:33:01 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 1 Apr 2020 09:33:07 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-networking][PATCH] kea: upgrade 1.7.5 -> 1.7.6
Date: Wed, 1 Apr 2020 02:06:39 -0700
Message-ID: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7522649DF125.A0044
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/kea/{kea_1.7.5.bb => kea_1.7.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.5.bb => kea_1.7.6.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.5.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.5.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
index 38a256afd..51e361c58 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.5.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "1f771e0209c9149bcf8fb91a25db03bf"
-SRC_URI[sha256sum] = "9b89b75cd8fd71e0ad7cb32c1b996177ba617bea2d162851eed42eea739e9999"
+SRC_URI[md5sum] = "26f48997a37a670a406d5020ce64a7fb"
+SRC_URI[sha256sum] = "1da3d50e0c8e92e1aa6d66100b5afd7b93ba2c50b0a4ea114fd9dcb8be982ca9"
 
 inherit autotools systemd
 
-- 
2.17.1



