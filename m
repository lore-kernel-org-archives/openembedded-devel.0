Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDDEC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 03:58:46 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.4084.1637294325366363253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 19:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AJ3wimi000777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 19:58:44 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 18 Nov 2021 19:58:44 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 18 Nov 2021 19:58:43 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 18 Nov 2021 19:58:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: correct module name and library name
Date: Fri, 19 Nov 2021 11:56:27 +0800
Message-ID: <20211119035627.20514-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 03:58:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94056

From: Changqing Li <changqing.li@windriver.com>

wrong name make service apache2 start failed with failure:
httpd: Syntax error on line 511 of /etc/apache2/httpd.conf: Syntax error on line 1 of /etc/apache2/modules.d/70_mod_php8.conf: Cannot load /usr/libexec/apache2/modules/libphp7.so into server: /usr/libexec/apache2/modules/libphp7.so: cannot open shared object file: No such file or directory

httpd: Syntax error on line 511 of /etc/apache2/httpd.conf: Syntax error on line 1 of /etc/apache2/modules.d/70_mod_php8.conf: Can't locate API module structure `php7_module' in file /usr/libexec/apache2/modules/libphp.so: /usr/libexec/apache2/modules/libphp.so: undefined symbol: php7_module

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php/70_mod_php8.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php8.conf b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
index 5a9dc91c6..58ce408aa 100644
--- a/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
+++ b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
@@ -1,4 +1,4 @@
-LoadModule php7_module lib/apache2/modules/libphp7.so
+LoadModule php_module lib/apache2/modules/libphp.so
 
 <FilesMatch "\.ph(p[2-8]?|tml)$">
 	SetHandler application/x-httpd-php
-- 
2.17.1


