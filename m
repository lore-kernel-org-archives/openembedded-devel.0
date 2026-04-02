Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B701112274
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7238.1775096156180116148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B/xl/f/8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096158; x=1806632158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mW8Y7w71p3Br6iWB7o2vjjX2OKqIgM1HrpVpOHQxyY4=;
  b=B/xl/f/88xs/8dJMUrYYczpp2ixnOUfFDt1+LBouG6BCh5sPc0L+g1nh
   GZIOx/vTB4UmXh8lK3keoDKU1Cow3fIstV+42+EuC1a+dEC5g3Z/+XKNS
   C1M5V3H5x0Z9Pom+x8lNl+2CBDgLfi0F25K9iJiES9uh11opo135hEqBC
   0HZdFRX1NAEEQLPmyb2PrVlg9FeoLElBm+0eFh8wWL5eQOI9TVlJSIrcm
   CKloImu/GiAUKQh2zt+PAeO3EavC+vT9kNeD0hc1HErH2Z1dLhN/+b8pq
   exIjtbYOVh37sbQQcbzJjjBAzwISJjPUQA33aRNB5S86pBgQukURe0ahb
   Q==;
X-CSE-ConnectionGUID: lpnh00iSRkSapSt3FKrl0A==
X-CSE-MsgGUID: DPi7CZJcQbGKJQ9u/E4ORQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214299318"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214299318"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 898411C166C9
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:57 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3EAE818578C5
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D48C9100249C;
	Thu,  2 Apr 2026 02:15:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/39] python3-regex: upgrade 2026.2.28 -> 2026.3.32
Date: Thu,  2 Apr 2026 10:13:47 +0800
Message-ID: <20260402021355.1324-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125947

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.2.28.bb => python3-regex_2026.3.32.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.2.28.bb => python3-regex_2026.3.32.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.2.28.bb b/meta-python/recipes-devtools/python/python3-regex_2026.3.32.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.2.28.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.3.32.bb
index 4ad0eadc98..a2091df806 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.3.32.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a729e47d418ea11d03469f321aaf67cdee8954cde3ff2cf8403ab87951ad10f2"
+SRC_URI[sha256sum] = "f1574566457161678297a116fa5d1556c5a4159d64c5ff7c760e7c564bf66f16"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


