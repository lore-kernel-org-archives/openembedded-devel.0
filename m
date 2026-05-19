Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D57CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 08:58:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17023.1779181119221587379
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 01:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LweUX/Zw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779181119; x=1810717119;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5siIRqGLYs/eU7IeJR2n051r1ExWx+dkRGi1bXH9mPA=;
  b=LweUX/Zwz9ydKiPOQGKNpcaHB095KNSKn5O1iQgB/oOn5XzIhVKtS/Wu
   Qi9iK6wb2wuvi26pytzaBhpFSlyfHtRVmFlBUXGSdxlA7Bgrm8bEEh9O9
   iGkyeY53WQbGLam/v9oACpqYf3R/37lun9tBhxTp2uV2H6q1yRLg5P6CM
   dUWEF7UlfSxxVj2DbwTlJ8Fc1JgkBFKlU8UpIB6Fx3Gufdo0xcVheR4hG
   JCfaaVBnnlb4qzY/JvQi2xR3R2dNYEsEIe8Q39EOmythaO/ruD1lnYDwe
   8c0VsGn3aWK71bepZBpTLQTQkF/nzIR6x5lyCbRt9zlxuLZNwHJTT+lNl
   g==;
X-CSE-ConnectionGUID: +IGLGKnuTlClOLOTJcYd+Q==
X-CSE-MsgGUID: OXwre2hYTwOb5HPAzpGCcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="239219203"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="239219203"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 17:58:37 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 72F411C00092
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 08:58:37 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1F237100025F
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 08:58:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 90B9C4029AB;
	Tue, 19 May 2026 08:58:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycurl: Use pep517-backend Fixes
Date: Tue, 19 May 2026 16:58:30 +0800
Message-ID: <20260519085830.632-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 08:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127061

From: Wang Mingyu <wangmy@fujitsu.com>

QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
index 8bcd65309d..fa98ad1e03 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
@@ -16,6 +16,6 @@ SRC_URI[sha256sum] = "422ed7005b98768fe60fe6b6cb8bb6a4e1fc18b5433402e8fbdaba9181
 
 DEPENDS = "curl"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND  += "native nativesdk"
-- 
2.43.0


