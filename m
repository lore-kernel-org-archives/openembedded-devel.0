Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A885EC5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3373.1787132228346066539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ReFz2pNt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132228; x=1818668228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jad4y0O9BVCPGyvDCee8brSMsmGnc2ce+pY/WdmnUKM=;
  b=ReFz2pNtE1rFiBRZJNR4/oJCXUyOeMuk942o9XYTkYbeMgEevp/t33Yb
   PNntLn5bTHVBdjMYz3gR8oWIuIqxdX0EV0iVcnfxfFdy+DDbz0a162NC2
   KXa97rWDil0CjRNtOBoqx9VAse6DAAke2uqHD9BuEld25hF7riXZImc4k
   b3J283x/ycdbrtzz3IEuQ50f/V9nYkUGUTxyVQMr7VNott9LPFvEPoBlM
   a5Yqbod0nF7FlTHhO80TQ7plIHa/5x8WlFk15Uhx0a+RJTvw4HYNV4C71
   ZyukKcGYz8rftaiiPZDUrlWE/0pPqT4oSfkCOYrasGDtVdc7nEzyzmPga
   w==;
X-CSE-ConnectionGUID: K2qnddQLSNyvMSaDWYJWNw==
X-CSE-MsgGUID: pEzcaQh1Twyj+SVaou1YgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835457"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835457"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9A4701C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:06 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4A7E7C09664
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3F1751801C20;
	Wed, 19 Aug 2026 09:37:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 60/70] python3-tornado: upgrade 6.5.7 -> 6.5.8
Date: Wed, 19 Aug 2026 17:35:04 +0800
Message-ID: <20260819093514.1101-60-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129330

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Form-encoded ''POST'' bodies are now subject to a limit of 1000 arguments by default. This
  prevents a CPU and memory denial of service attack. This limit can be overridden via the
  '.set_parse_body_config' function.
- Multipart parsing now rejects requests with an excessive number of parts earlier in the parsing
  process, limiting memory consumption.
- The deprecated mixed-case arguments to '.RequestHandler.set_cookie' now enforce the same
  restrictions on invalid characters that were introduced in Tornado 6.5.5 for the standard
  lowercase arguments.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tornado_6.5.7.bb => python3-tornado_6.5.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.7.bb => python3-tornado_6.5.8.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.8.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.8.bb
index 544c8606e5..0f5509536d 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.8.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c3ddfc2"
+SRC_URI[sha256sum] = "9452e1b208a8bd771e2cb1f2ff564985b9b214bdebbe622793e1799e0a6bd23f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


