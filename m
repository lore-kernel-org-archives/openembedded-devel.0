Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2305.1615337619509010625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 16:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A0rXnk021265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Mar 2021 16:53:34 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 16:53:32 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Mar 2021 16:53:32 -0800
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: update RDEPENDS
Date: Wed, 10 Mar 2021 08:53:31 +0800
Message-ID: <20210310005331.23711-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Since commit c4ffcaa2[php: split out phpdbg into a separate package],
package php is empty, remove it from RDEPENDS to avoid error:
nothing provides php needed by php-cli-7.4.9-r0.corei7_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index f8a8755b9..d6df998f3 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -208,11 +208,8 @@ MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp
 PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
 
 RDEPENDS_${PN} += "libgcc"
-RDEPENDS_${PN}-pear = "${PN}"
 RDEPENDS_${PN}-phar = "${PN}-cli"
-RDEPENDS_${PN}-cli = "${PN}"
-RDEPENDS_${PN}-modphp = "${PN} apache2"
-RDEPENDS_${PN}-opcache = "${PN}"
+RDEPENDS_${PN}-modphp = "apache2"
 
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
-- 
2.17.1

