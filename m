Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3745CD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21229.1780394934167967963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LXE4/oIV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394935; x=1811930935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B4MPN0PxiQcyUVJ6vpOZHVoI2/ytMXmfmWy3dbAlA2A=;
  b=LXE4/oIVVP9rxeO+/Q/TTFSl1cy9J7RqbkkMnjo0pdXAIDNZZmrZeZJO
   kUiIh4LHFugMF9wkNm9RCsVYsckRyqdYL5/p4DXxbwKIMrXuMkzuGorvZ
   b2hap5aW2/ysrOaCj0MIOy5UNkd3hf+pijvQO69Zl6/OkrUwEET60cGxE
   lDwhdYKWP6SvUBCdpFy/Bpb/E2YQmsuiv9kCbEJiNK3SdY1sNdV9XFu2c
   poMEXjK6ZGe15y8WhffZMwLqRAaFEESIY+mayiBInWZXpjIF+8Uvmm41R
   hfNeyk9nPO+c6NANwCt7TvYX2DKudEG1B/mR7GZ5sk3rGaHldOHHuYVfn
   g==;
X-CSE-ConnectionGUID: DBykQlkZR9S4ru8yrE79tg==
X-CSE-MsgGUID: g5OAEk3lTACUd0aWn7bMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="245981327"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="245981327"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:55 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 73AFC1C1C701
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:54 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2BA47181AA54
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1D8861800107;
	Tue,  2 Jun 2026 10:08:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/38] python3-starlette: upgrade 1.1.0 -> 1.2.1
Date: Tue,  2 Jun 2026 18:07:46 +0800
Message-ID: <20260602100755.2117-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support httpx2 in the test client
- Use httpx2 for type checking in the testclient module
- Add assert error for requires() when request param is not Request type

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-starlette_1.1.0.bb => python3-starlette_1.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_1.1.0.bb => python3-starlette_1.2.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_1.1.0.bb b/meta-python/recipes-devtools/python/python3-starlette_1.2.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.2.1.bb
index 7bddc99f7c..66a7148ce2 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.2.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "e83c7fe0ddecd8719c5b840080325aec0260acec86e9832899e377b91d65e90f"
+SRC_URI[sha256sum] = "9b9b5ebb992e67d6093741e63c2f59e4f6fff986f81163c087867bd7b924b3f6"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


