Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7193.1611313037259107431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103737141"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 18:55:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B1A084CE603C
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 18:55:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 18:55:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] openldap: upgrade 2.4.56 -> 2.4.57
Date: Fri, 22 Jan 2021 18:54:52 +0800
Message-ID: <1611312892-27601-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B1A084CE603C.A5575
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.56.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index 4c0f179cb0..a282523a3c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5391b559d23a2237bdb21e7a62dae7c3 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
-SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
+SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
+SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.25.1



