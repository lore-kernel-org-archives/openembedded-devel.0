Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C488EC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 05:35:45 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.80997.1656999341016842344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 22:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2655ZV2D018610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 4 Jul 2022 22:35:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 4 Jul 2022 22:35:31 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 4 Jul 2022 22:35:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] php: upgrade 8.1.6 -> 8.1.7
Date: Tue, 5 Jul 2022 13:35:30 +0800
Message-ID: <20220705053530.316900-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 05:35:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97702

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
https://www.php.net/ChangeLog-8.php#8.1.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75749fa360f32ed0b5c2e09c359e245e58cc7131)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.6.bb => php_8.1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.6.bb => php_8.1.7.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.6.bb b/meta-oe/recipes-devtools/php/php_8.1.7.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.6.bb
rename to meta-oe/recipes-devtools/php/php_8.1.7.bb
index 96af595a4..e9e8eccf3 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.7.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "7b353304b7407554f70d3e101a226a1fc22decae5c4c42ed270c4e389bfa1b66"
+SRC_URI[sha256sum] = "b816753eb005511e695d90945c27093c3236cc73db1262656d9fadd73ead7e9d"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


