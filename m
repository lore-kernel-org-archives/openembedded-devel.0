Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A73ACCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2914.1762386264142570654
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CYfzBiXW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386264; x=1793922264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KWsQm1SxCl/wyXxGGz12BhNrYTioLrf6uybUlBN/89w=;
  b=CYfzBiXWjeZljUr3ggmTDDpSclFZJ19i1LZe+WAFS1mPMfVQN+WZBNjz
   oGR42IOr4jskX1Q5ghM1cYRMWv/U3NXj/QhDN3iLbADmAGDO1xIHup6vX
   q49qaL4ka3ZPsdP7G5kZJspZyD0yPTwkaKK58PFSvTSi6eNjPb/7CLzVh
   hgYyeV+7PpU8khKoiTcDNlorDbP/FS21HPgMi0DFpyHJ4sv4gDrw5I9hZ
   E59QDX04UCSsubMGDucuDpTQeV4ZzoZDfhBXCRwqEFGYg1YxwfKoJEEnz
   TtWn8bZ/AiXieWVpZXXSZI7RqmWDST1X7QDcIP/QNeoUgj2sIBYB0eJs1
   Q==;
X-CSE-ConnectionGUID: pVFzPPRuR5i5OtelfKPmNA==
X-CSE-MsgGUID: KjeTDsapTICWk5EJkyWs8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218187881"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218187881"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:23 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 7315EC020DD
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:22 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3152C18002C9
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B5B581000357;
	Wed,  5 Nov 2025 23:44:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/12] python3-starlette: upgrade 0.48.0 -> 0.49.1
Date: Thu,  6 Nov 2025 07:43:58 +0800
Message-ID: <20251105234402.423-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121347

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.48.0.bb => python3-starlette_0.49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.48.0.bb => python3-starlette_0.49.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.48.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.49.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.48.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.49.1.bb
index ef1986f46b..f295b9b050 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.49.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "7e8cee469a8ab2352911528110ce9088fdc6a37d9876926e73da7ce4aa4c7a46"
+SRC_URI[sha256sum] = "481a43b71e24ed8c43b11ea02f5353d77840e01480881b8cb5a26b8cae64a8cb"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


