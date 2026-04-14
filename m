Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10E7ED7BB4
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:29 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15984.1776163223972188057
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TI03Lj74;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163224; x=1807699224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tsgWay/ITmxNQLX8v7BkPui+XNoGdIrLJ6o5NXGo7ZA=;
  b=TI03Lj74A0nb06QKQo3XqWc6yMwzY4QCXhl0OC1qPCZMtTuRIMSWe/Jm
   J+32yWkV7zmf7NRe5xYZFbNBx3ePBDhP9+Cmnz+SbL7DkrtxLDQ0GmUP/
   31cgQC+iJxOb8aKmu5R0d7XVtC7NB7d/iolpvjlhaAiTc7KGqplLGN5oX
   ovVnQGgBkETgLcZEWG3DqqNN5BAu9mnLm0nHLO9w5PxHitLM+lA0wZ4cF
   kw1RN8WztUd8uG7uaNcwOHubxV2Lk6Y2iJVR4Dl7zKd4C5sttK0Mobd5h
   eOe7jqLTIHRvlXeUfKAQS4Sl/zITsOTpZJHd9paoqKpRBCdMBfm8unMSK
   Q==;
X-CSE-ConnectionGUID: n8cYfWtUQpiP5KQ4GDZCFw==
X-CSE-MsgGUID: IRbFgRWKSv6KZT4t4MKFJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="241332021"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="241332021"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:23 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94F561000367
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:22 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 41E2E1000276
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id AB16314000E2;
	Tue, 14 Apr 2026 10:40:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/32] python3-inline-snapshot: upgrade 0.32.5 -> 0.32.6
Date: Tue, 14 Apr 2026 18:38:32 +0800
Message-ID: <20260414103845.1728-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126323

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
- Pydantic models, attrs and dataclasses with NewType-typed fields now generate
  correct snapshots that wrap the field value with the NewType constructor (e.g.
  Something(some_id=SomeID(1)) instead of Something(some_id=1)). This could only
  be fixed for Python >= 3.10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.32.5.bb => python3-inline-snapshot_0.32.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.32.5.bb => python3-inline-snapshot_0.32.6.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.5.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.5.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
index 32b8d15249..1bcd3a457f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.5.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "5025074eab5c82a88504975e2655beeb5e96fd57ed2d9ebb38538473748f2065"
+SRC_URI[sha256sum] = "224a96eeb86c4b2831d274239d3468dc0b7819264f608f595b2f9d01f79a6e38"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


