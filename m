Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.1504.1590046522528645391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 00:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,416,1583164800"; 
   d="scan'208";a="92705691"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 May 2020 15:35:27 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D82234BCC89E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 15:35:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 May 2020 15:35:25 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] openldap: upgrade 2.4.49 -> 2.4.50
Date: Fri, 22 May 2020 00:35:24 +0800
Message-ID: <1590078924-3370-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D82234BCC89E.A2CF9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../openldap/{openldap_2.4.49.bb => openldap_2.4.50.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.49.bb => openldap_2.4.50.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.49.bb b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.49.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.50.bb
index 670c704e6f..b62b13a443 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.49.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "2a47a6bb4319357ea7b032c45283e79e"
-SRC_URI[sha256sum] = "e3b117944b4180f23befe87d0dcf47f29de775befbc469dcf4ac3dab3311e56e"
+SRC_URI[md5sum] = "f9ed44ef373abed04c9e4c8586260f9e"
+SRC_URI[sha256sum] = "5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1



