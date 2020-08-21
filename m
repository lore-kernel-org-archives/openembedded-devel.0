Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.130052.1598000871950512148
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98384382"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:07:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2830648990CF
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 17:07:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:07:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] openldap: upgrade 2.4.50 -> 2.4.51
Date: Sat, 22 Aug 2020 05:07:31 +0800
Message-ID: <1598044054-6555-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2830648990CF.AFBD1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../openldap/{openldap_2.4.50.bb => openldap_2.4.51.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.50.bb => openldap_2.4.51.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb b/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.50.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.51.bb
index 3a130f970..d2c574608 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "f9ed44ef373abed04c9e4c8586260f9e"
-SRC_URI[sha256sum] = "5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8"
+SRC_URI[md5sum] = "0d2025896cf1c17af7304ecc57ec9531"
+SRC_URI[sha256sum] = "f490775ea4c6506b7210ee55a102c8f4aacfe9d1c8eaa633c7316d33a714be62"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.25.1



