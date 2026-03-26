Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC54B10A3D73
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46433.1774526283721514317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rezff1Yn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526284; x=1806062284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGqbAFWIKq/gFuUKqkkfiXAk2oZV0xn0lsjF1aPoOho=;
  b=rezff1YnHWksEokBfa05sfQZYIjZ5K0DKQXMOLolJyck2BUFHrX2Djf6
   DpIuWliklb3oRLVrbmslsAZr6X4je3jHSbxU0JqOHjFEn7ilNse40afTt
   Fb17fqRx9Jju+0OV+QO5JoD4Xwh4cerRy/TP9/2kO6Sbb9bck9+Hwowpf
   W8xe9Z3OAuFRy0nSElHW9Npu5+lNZ0T7VpIDChH/y10IyWyrvFagY1bMI
   23r9Md//CFqeNDtLiXmlHIlo62+jx8tkzuzoqkB96aFzAagAFmp3F0MxV
   MVzO/42Hg30HqaLURLwNnd+jVzzHcYlbuJHbgxcx8bOP4+ADD0GZbzMFu
   w==;
X-CSE-ConnectionGUID: QJHT4opXT0ei29423Qu5IQ==
X-CSE-MsgGUID: 58Ctk1iiQmSNoszwzXHrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420918"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420918"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:04 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 115EC100014E
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B5E6F101B166
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3F63D1807148;
	Thu, 26 Mar 2026 11:58:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/63] python3-starlette: upgrade 0.52.1 -> 1.0.0
Date: Thu, 26 Mar 2026 19:56:22 +0800
Message-ID: <20260326115634.1199-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-starlette_0.52.1.bb => python3-starlette_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.52.1.bb => python3-starlette_1.0.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.52.1.bb b/meta-python/recipes-devtools/python/python3-starlette_1.0.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_0.52.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.0.0.bb
index a06feb1b73..8f50678875 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.52.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "834edd1b0a23167694292e94f597773bc3f89f362be6effee198165a35d62933"
+SRC_URI[sha256sum] = "6a4beaf1f81bb472fd19ea9b918b50dc3a77a6f2e190a12954b25e6ed5eea149"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


