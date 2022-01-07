Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79481C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 08:08:30 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3931.1641542909951619848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 00:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 20788OcC017817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 7 Jan 2022 00:08:28 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 7 Jan 2022 00:08:23 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 00:08:23 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 7 Jan 2022 00:08:22 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: avoid textrel QA Issue warning
Date: Fri, 7 Jan 2022 16:08:21 +0800
Message-ID: <20220107080821.16187-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 08:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94678

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.0.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
index 593eb3955..fd4a78786 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
@@ -217,6 +217,11 @@ ALLOW_EMPTY:${PN} = "1"
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
+# WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
+#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]
+INSANE_SKIP:${PN}:x86 += "textrel"
+INSANE_SKIP:${PN}-opcache:x86 += "textrel"
+
 FILES:${PN}-dbg =+ "${bindir}/.debug \
                     ${libexecdir}/apache2/modules/.debug"
 FILES:${PN}-doc += "${PHP_LIBDIR}/php/doc"
-- 
2.17.1


