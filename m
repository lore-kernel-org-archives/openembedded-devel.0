Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83F0CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:18:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.232.1778645912125428250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jj7+JjAk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645912; x=1810181912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VSaaZSAB5xPQtV0OHzmVoSoXCsD5vQJreO/twyOalF4=;
  b=Jj7+JjAkWDoLPqgRlSfy96O0w+wDiafpRsKIAiVZTFIv0U18yHA7MHKy
   3MtitiTYRxLu/kgnyGRddrEgAtQQumwDQgOTC31JjNcUSyAxuXvmBqOPA
   NL4A8lfdnDamg/3oXsEoEH1l4C8Sp3+BRfrNrTJ0v/p31J2ICCelHek4S
   Uwg0XMHX14MdWh98leViSyJGRAN5P04M+JQp2aCUlW5wlT5J7RxH+aj2n
   r3Oa0j/e8Ii60FCwGM55rSX5Rb7rJjadap+Ne00dIfpK/+fQ0FyQH+LR5
   A4H36OKX+Z3vqxL2cav+PIEiKVx9avIM7fFEj5oE28St0uDDl1qD4BtzI
   g==;
X-CSE-ConnectionGUID: IDRhIQOUSP2JexFpX40KKQ==
X-CSE-MsgGUID: mLGnQOWJQ728jVcMemB0ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228216022"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228216022"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:18:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8A2BD18A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3D1431802AFE
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BF9F41019058;
	Wed, 13 May 2026 04:16:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/56] python3-sentry-sdk: upgrade 2.58.0 -> 2.59.0
Date: Wed, 13 May 2026 12:16:10 +0800
Message-ID: <20260513041626.412-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041626.412-1-wangmy@fujitsu.com>
References: <20260513041626.412-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126928

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.58.0.bb => python3-sentry-sdk_2.59.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.58.0.bb => python3-sentry-sdk_2.59.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.58.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.59.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.58.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.59.0.bb
index d752b7cca7..b0bb943518 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.59.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "c1144d947352d54e5b7daa63596d9f848adf684989c06c4f5a659f0c85a18f6f"
+SRC_URI[sha256sum] = "cd265808ef8bf3f3edf69b527c0a0b2b6b1322762679e55b8987db2e9584aec1"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


