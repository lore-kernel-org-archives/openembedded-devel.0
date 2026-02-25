Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE07EFD22E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42055.1772012318895928097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YrPE9WJH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012319; x=1803548319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GeneQfNkNwKEgt/SCGlRde5K2SG8M7hsQdP6/Y8tvRM=;
  b=YrPE9WJHzpEcrUOV4DnkgPabI8JgtStKuZbv5txhh+obUAno68uYc4IH
   lI5qDSGEeNUEP47+BMg8PtnSmJQhQ5unk0qZf/Mel3Eo5f5+cprtASVY5
   VlA1Deo+vvmFog8+fy/VBRxVn4NmqPwuWyB2Xc3GO0kgel9wqEZKw8udN
   DoYriUTwKU04Mmhjf0ZtuSZmgViCMKOHnz+qpnVoiCjZWP67Jn96dGOxz
   JKuSPeRdYGjUjZMAk6GImDyWS4DpdfynTT434eTP2YPBqHP80u/sNLmHk
   e2yxsFSOhAP1viIXjK2KGEGIlbUVBEkmtv9BMFh5wl7NYgqrmQxxurY25
   A==;
X-CSE-ConnectionGUID: /fafYKfaTuyF8DiRzxtqNA==
X-CSE-MsgGUID: PV7fGeGuTleY2uA3skgmNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209814752"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209814752"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 6465D1C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:39 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 14A31180199B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3B8D8101BB70;
	Wed, 25 Feb 2026 09:38:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/33] python3-asgiref: upgrade 3.11.0 -> 3.11.1
Date: Wed, 25 Feb 2026 17:37:23 +0800
Message-ID: <20260225093727.1284-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124641

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- SECURITY FIX CVE-2025-14550
- Fixed a regression in 3.11.0 in "sync_to_async" when wrapping a callable
  with an attribute named "context".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.11.0.bb => python3-asgiref_3.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.11.0.bb => python3-asgiref_3.11.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.11.0.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.11.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.11.1.bb
index 6cf2e73e7a..e372d4771b 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[sha256sum] = "13acff32519542a1736223fb79a715acdebe24286d98e8b164a73085f40da2c4"
+SRC_URI[sha256sum] = "5f184dc43b7e763efe848065441eac62229c9f7b0475f41f80e207a114eda4ce"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.43.0


