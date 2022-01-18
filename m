Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C1CC433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 06:01:10 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.9219.1642485668580135400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 22:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20I617AS017863
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 22:01:07 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20I616ZQ018805
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 22:01:07 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 17 Jan 2022 22:01:06 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 22:01:06 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 17 Jan 2022 22:01:05 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] php: avoid textrel QA Issue warning
Date: Tue, 18 Jan 2022 14:01:04 +0800
Message-ID: <20220118060104.10360-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <84d5e5db-6b07-c88d-a719-bc71bcdaac1a@gmail.com>
References: <84d5e5db-6b07-c88d-a719-bc71bcdaac1a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 06:01:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94906

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.0.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
index 593eb3955..43e86fe55 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
@@ -217,6 +217,11 @@ ALLOW_EMPTY:${PN} = "1"
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
+# WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
+#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]
+INSANE_SKIP:${PN}:append:x86 = " textrel"
+INSANE_SKIP:${PN}-opcache:append:x86 = " textrel"
+
 FILES:${PN}-dbg =+ "${bindir}/.debug \
                     ${libexecdir}/apache2/modules/.debug"
 FILES:${PN}-doc += "${PHP_LIBDIR}/php/doc"
-- 
2.17.1


