Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6858.1589433189244497910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2020 22:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; 
   d="scan'208";a="92037677"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 May 2020 13:13:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8226D4BCC89B
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 13:12:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 13:12:59 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] modemmanager: upgrade 1.12.8 -> 1.12.10
Date: Thu, 14 May 2020 22:12:45 +0800
Message-ID: <1589465565-3274-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 8226D4BCC89B.A3EB5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
index 47a86b9194..deab6f0466 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
@@ -14,7 +14,7 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "68b53d0615ba0d3e2bbf386ed029dfe644a6a30a79ab8d85523527bb4e713aff"
+SRC_URI[sha256sum] = "b2b3058bbb72adf98b24707fdbebe58e590644a38145e30d574f685f154bf8aa"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1



