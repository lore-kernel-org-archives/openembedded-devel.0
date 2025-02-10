Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D636C021A8
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.46635.1739178133509907966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hfcAxEwl;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178133; x=1770714133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=loyHs4zEe7XnDkU9BNvgwVXyAVttltjD44x5rQgKWCQ=;
  b=hfcAxEwlvYDCeqbE4mjdkUBGm/9oqIP8LZ2CBmP3QJFQUaMbkc88JyPZ
   cMPBlYVgH/RV8F+Cmr5giOahcD+OeVrknztmGYgwWJlmpB6w8OqLD3ALx
   qwVwwVfl8YjAUaKl/vyaJm+w/LY5cMGF51vqTdzubpFuG1jryRqUoiX5f
   dZ0+zJAVrI+41sg2mgcGccoD/i2eQdCcXBEV9zjFlB4QZa74PgGspUVuD
   63ZXLlBjXUfXlgfCkBtyZ4F2XzpUUMerR2S1zqX9C8dO0ExA6+Tjhotrw
   mgVQexmaioIsEsv2TIN+XX6KW0A6aNUpjtJhXat7xhKyOcG4/cgqE5Irt
   A==;
X-CSE-ConnectionGUID: nvGtYBnOScCBwdAe21peeA==
X-CSE-MsgGUID: 9OKNrVD6SdKcsIPGfTNhcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168394116"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168394116"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BA7C96741
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04D46D5081
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9B7571A0074;
	Mon, 10 Feb 2025 17:02:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 64/66] python3-xlsxwriter: upgrade 3.2.0 -> 3.2.1
Date: Mon, 10 Feb 2025 17:01:33 +0800
Message-Id: <1739178095-26432-64-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115391

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added improvements to "autofit()".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.2.0.bb => python3-xlsxwriter_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.2.0.bb => python3-xlsxwriter_3.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
index e3376ab55b..a1fd09af49 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
@@ -17,6 +17,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "9977d0c661a72866a61f9f7a809e25ebbb0fb7036baa3b9fe74afcfca6b3cb8c"
+SRC_URI[sha256sum] = "97618759cb264fb6a93397f660cca156ffa9561743b1823dafb60dc4474e1902"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


