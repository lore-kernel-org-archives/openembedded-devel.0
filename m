Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49868C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7652.1787731785967421453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nYul7O4w;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731786; x=1819267786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=48rW5UwBT5eKgYiT5S/X3i1CPgED3Ffudws517EBgdE=;
  b=nYul7O4w9NXGgBE4NKA2/kXYSyGl/O06RglnA+WWu/9oy0BpCIVYxNJM
   ZYObWt1P+7LE6NmAFb17u56eDpEqql+JUfmUOvmtamAzwr1DNdYgyKMB1
   55I3utq7y70fuO0zrbcadV1I6K6dpANQR73CHEY4cvPcdy04o/ZZbo1B6
   Ck0lQzF8DwKrh/V6xIOg22BBN6uOhMWFtwveNKWEZXNn60tnT05zuG8Z3
   iRKD26vWPrCA62JMCrgNF1Us6+FwZu62bHBFI3vUT4g4aRR3NjAInmnW1
   ZGABIJSeTzhsiSJGWAab/KEKqMo8VEEyP77OH+Zj8QKO7pzAyfX0Q+Qdc
   A==;
X-CSE-ConnectionGUID: pzkJEtY8SOSkDHLeQfFW8w==
X-CSE-MsgGUID: U0FhlUglROqyj2evixXV2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240168274"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240168274"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:44 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 463EF820C03
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:44 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F3F098D29D1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id F122C1404AFF;
	Wed, 26 Aug 2026 08:09:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/23] python3-autoflake: upgrade 2.3.3 -> 2.4.0
Date: Wed, 26 Aug 2026 16:09:11 +0800
Message-ID: <20260826080926.989-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129500

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autoflake_2.3.3.bb => python3-autoflake_2.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autoflake_2.3.3.bb => python3-autoflake_2.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-autoflake_2.3.3.bb b/meta-python/recipes-devtools/python/python3-autoflake_2.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-autoflake_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-autoflake_2.4.0.bb
index 8767d6f4d5..5aaa2ca1be 100644
--- a/meta-python/recipes-devtools/python/python3-autoflake_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-autoflake_2.4.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=88246be6a34c1496c253f58599f3db85"
 
-SRC_URI[sha256sum] = "c24809541e23999f7a7b0d2faadf15deb0bc04cdde49728a2fd943a0c8055504"
+SRC_URI[sha256sum] = "ef7c496d9bce9d2cef049f24e482d1d3090c37fbd44e5e85dfb00db3c78ee16c"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


