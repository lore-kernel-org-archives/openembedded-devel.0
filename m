Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.133.1615424198180041015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 16:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12B0uVpI004495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 16:56:31 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 16:56:29 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 10 Mar 2021 16:56:28 -0800
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] php: allow php as empty
Date: Thu, 11 Mar 2021 08:56:27 +0800
Message-ID: <20210311005627.35738-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Since commit c4ffcaa2[php: split out phpdbg into a separate package],
package php is empty, we might met error:
nothing provides php needed by php-cli-7.4.9-r0.corei7_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index f8a8755b9..e19d5dd21 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -214,6 +214,8 @@ RDEPENDS_${PN}-cli = "${PN}"
 RDEPENDS_${PN}-modphp = "${PN} apache2"
 RDEPENDS_${PN}-opcache = "${PN}"
 
+ALLOW_EMPTY_${PN} = "1"
+
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
-- 
2.17.1

