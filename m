Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC68CAC5AA
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.15058.1758015726070597579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sFrnI/28;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015731; x=1789551731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3XLg/e0a2S8G+X0emQf40OatpFVnkwjzewAc8OWf/EE=;
  b=sFrnI/28rgNcVh9+Cx3qwwjt8jYgAW8M2nKV4tkiyZYQrqtvL1byxsYT
   TeiUWuKm7WAZFzzrCbFlpkEZlzPfqOzNRsBX98kBPKLPjYvVyoKPmV0My
   1Joi/NGiAw1OvMkO+32IL/13bHsC50EQNHzjC38m8/6NUsIeSAaO8bZ9y
   LeL6hK5GwTRyZg/1midjLH6TMWRMVTp60ixXZwCbkVwMK+H84qzwOmm14
   ESQxwD9o9VaxDgw2C8SZC3bv1U9n+LWXSy9OCoQPomqQZjv3/qSXyFXfo
   xqNFrCsqWrLwxa55ixC0jbv8CfspQvUnG3KsRc2kemLnAjPVAlBP8b+8y
   g==;
X-CSE-ConnectionGUID: NYGs2wuGRy2E+lnoCPw4Cw==
X-CSE-MsgGUID: pv/OuhYRRdKPPq4GCQDEJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191834350"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191834350"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id AD3651C00081
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 656B21800E8E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id AACF84029B2;
	Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 46CD61A0071;
	Tue, 16 Sep 2025 17:42:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/42] python3-regex: upgrade 2025.8.29 -> 2025.9.1
Date: Tue, 16 Sep 2025 17:41:40 +0800
Message-ID: <20250916094152.1479-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119452

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2025.8.29.bb => python3-regex_2025.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2025.8.29.bb => python3-regex_2025.9.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2025.8.29.bb b/meta-python/recipes-devtools/python/python3-regex_2025.9.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2025.8.29.bb
rename to meta-python/recipes-devtools/python/python3-regex_2025.9.1.bb
index c3e9002267..5dde7967e3 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2025.8.29.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2025.9.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "731ddb27a0900fa227dfba976b4efccec8c1c6fba147829bb52e71d49e91a5d7"
+SRC_URI[sha256sum] = "88ac07b38d20b54d79e704e38aa3bd2c0f8027432164226bdee201a1c0c9c9ff"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


