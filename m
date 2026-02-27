Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EEBFD9E2C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92432.1772187233033603596
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GCCWtD6e;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187233; x=1803723233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wqf4tcqvsQq8xhHUOQVTUwOThvSEmuqTjAssHo0JHjY=;
  b=GCCWtD6eoA3MpAzG0bshfz7AHpQNrX+y+6BE5V83/mgz57CScRJP/XcQ
   btv+L9ezw5FDkfLm1UbjYzuYuCPvsSC9QTEo97+sfauB3PUY5HJH7o8dn
   bGJIs1477JTVkcH7fGgyjPtAgJEd/I2npeSvfQ+5V6wakfEPCgA+ZjvgP
   V9LfsNKPWswBRjlASkV7gWFBx8pFdAUfl9v/6QwtQG7TjH+3YS/nhj63N
   lyduOBIjpejNCeV8O+qsje6fbBk2/1jkGoMrJtlgQVlFh2x4Vr6Z7QrvH
   XZjjC/54FdNnoxUFOc3AKU5F2mjhQNHDTGz1IQf9ceaQOKWNgRaN2Fu26
   g==;
X-CSE-ConnectionGUID: 2Ch50EDFR6GfZs1OaAuv/A==
X-CSE-MsgGUID: yCV7yh45R8eOJzQeWzQINw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219257516"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219257516"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 12A74C00354
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:51 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BC8D5180ABDC
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C9EF3180059F;
	Fri, 27 Feb 2026 10:13:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/52] python3-fastapi: upgrade 0.128.0 -> 0.133.0
Date: Fri, 27 Feb 2026 18:12:42 +0800
Message-ID: <20260227101327.1432-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.128.0.bb => python3-fastapi_0.133.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.128.0.bb => python3-fastapi_0.133.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.133.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.133.0.bb
index f047f5321a..1d860f8d68 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.133.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "1cc179e1cef10a6be60ffe429f79b829dce99d8de32d7acb7e6c8dfdf7f2645a"
+SRC_URI[sha256sum] = "b900a2bf5685cdb0647a41d5900bdeafc3a9e8a28ac08c6246b76699e164d60d"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


