Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E548ACD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21494.1780394916172452142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fMHQwea2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394916; x=1811930916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q3JrYswUZW3dn39s1wtAIemsi/rcOtpkf239AL2rk4w=;
  b=fMHQwea2tqogSuVuJxKaUAjGihZFO0XxWIzvEh35wqZV3o5AxTDkMM2Z
   CR2GNr+GGTsSWKcBLteK90XyiPXIIx+B1OLJda8m8PnI7cI2CI2I8J+bO
   zfA2Tkh67b4Dhi92x9zX21s5xE71KQXWjOFc7XarGMpd1tOxdYE4ZiH+n
   hyhv32anLONVdYAXh1si721LZXyklyap5KzmroS6uJE8Cf7Bzbo2zxLUY
   iysanMLV4NrG8Cim4Jl6asn0EEByxLFrJRcWS0dCbcO69U+f1TZ+FT1T6
   XGMAdWPFXLDZN5dtzOYNE+ny5zs+jPuYKRVAN3J0bqEywZuoH+3NASdmK
   g==;
X-CSE-ConnectionGUID: e//0xhLnTRS8pYTMj6xKCQ==
X-CSE-MsgGUID: KlBU46AuS+uKwadRouJ8AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242125863"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242125863"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AB56D1C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5DC2818026D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 76BE618005D1;
	Tue,  2 Jun 2026 10:08:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/38] python3-inline-snapshot: upgrade 0.33.0 -> 0.34.0
Date: Tue,  2 Jun 2026 18:07:34 +0800
Message-ID: <20260602100755.2117-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127340

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- get_snapshot_value() now accepts a which parameter ("new" or "old") to select
  whether to return the new (just-compared) or the old (previously stored)
  snapshot value
- Example.run_pytest: deterministic test order by using -p no:ranodmly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.33.0.bb => python3-inline-snapshot_0.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.33.0.bb => python3-inline-snapshot_0.34.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.33.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.33.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.0.bb
index c39ea57961..cc665919fd 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "856cfc18dea755dd78ffa0fbac8c161038ca0bfb4bd0bbb5d519f4bca3dfeff4"
+SRC_URI[sha256sum] = "bb814ada843aba77356516dce5e07857bb76591c4258296a087a7cbe9e0d70f7"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


