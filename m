Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BB11049509
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:37 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18531.1773312807683905270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RSYiKqpb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312807; x=1804848807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qN/ReKHJwk1iWgzg6NeNwVOkZ37841CtgtJQ61JAaXA=;
  b=RSYiKqpbSfrxRezK2xjreGR9aJr9qaprE/MZGAKeXYmZPWukrTyNGU3d
   gtadsI6qcjPGx1O8IEORl/wDU1obDyKDfT0ZuN2UwB9BmFOY2JtvBYSi3
   0vzcGrgr6wPX7W/HOvcZSDgcUj1+pHx77UhzrfhiFiWbxWv3eUh4wSEn8
   5wEWBq/mRYn2lQmcAsE9JPyWjT1OxA0egSBesCP4YY1PRrslvoZ+ZWG0Q
   PajblyrdVqPzoT3RtiyF0z3rSSW0fVyhUX+OQZO/3ebd1pCDvrRyPHEph
   emT2BypgczWtHfJ/nUUoqdDJCCRJ3BBzjFfVM7oVieSBpIkHTnZM5sVqr
   A==;
X-CSE-ConnectionGUID: Dfv1SQxYQGSFv0dtQy0Y4w==
X-CSE-MsgGUID: WrAVA7CRRgOoWdZKrCpV2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233688014"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233688014"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:26 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3FA3982071C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E84568D65DF
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0977A18005B4;
	Thu, 12 Mar 2026 10:53:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/64] python3-cachetools: upgrade 7.0.0 -> 7.0.4
Date: Thu, 12 Mar 2026 18:51:44 +0800
Message-ID: <20260312105220.1856-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125128

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix and properly document @cachedmethod.cache_key behavior.
- Minor documentation improvements.
- Fix DeprecationWarning when creating an autospec mock with @cachedmethod decorations.
- Provide more efficient clear() implementation for all support Cache classes
- Various test improvements.
- Update Copilot Instructions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_7.0.0.bb => python3-cachetools_7.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.0.0.bb => python3-cachetools_7.0.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.0.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.0.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.0.4.bb
index a018bb389d..f6d9d80454 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.0.4.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "a9abf18ff3b86c7d05b27ead412e235e16ae045925e531fae38d5fada5ed5b08"
+SRC_URI[sha256sum] = "7042c0e4eea87812f04744ce6ee9ed3de457875eb1f82d8a206c46d6e48b6734"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


