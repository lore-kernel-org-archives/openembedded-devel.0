Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A686ACD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:21:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.251.1778646060736926471
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s2Sh34eO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646060; x=1810182060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VvAqis+DqkcWLCfTC5OO2fFfT+fA+h1zBhE67krMv54=;
  b=s2Sh34eOPcT1rvcCHDxTOMm2noCmX1lTGDzQFuRU8z4evcEm4wiq1ocO
   r0fGGhn9vwtU9Ky3o7nyZLJmYAi0n6xIrCuYMWT9CFwkP5+e6DbpomOie
   nwu3nVB+TPQkJ6Vj7uAZqO7O3ATPRkqZsiZZkClfL4gLX1tvkq4rILPsi
   LCZB3MU9A6rwxjI4NVaSxWe6yyd/EhBsk2Fnay5wWYZ6j2AQ3uwfp5iOH
   7hjJm1BBX2wYtjGoM30XRRGKRw+BXO61Oj+NzTJ/xCKvEucpSmof4Mo2O
   XTmAmEnwljK0QU2DXOVF612S4cY21/AkTl7MkxK/DjG6RIbkRFEGf13hY
   w==;
X-CSE-ConnectionGUID: 4kg7Ia5xTZmRK5dKvNoIUg==
X-CSE-MsgGUID: 6n7kUIGMT/SCHcD5EAA5SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228216566"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228216566"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:59 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 33ACE1C000E0
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:29 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DC9BAC0034F
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5CE691400243;
	Wed, 13 May 2026 04:20:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/56] python3-wtforms: upgrade 3.2.1 -> 3.2.2
Date: Wed, 13 May 2026 12:19:45 +0800
Message-ID: <20260513041952.450-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126938

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix :class:'~validators.Disabled' validation with provided formdata.
- End support for Python 3.9, start support for Python 3.14.
- Add Tamil and Serbian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wtforms_3.2.1.bb => python3-wtforms_3.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.2.1.bb => python3-wtforms_3.2.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.2.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.2.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.2.2.bb
index f7cbff2f4e..3adb2a57b4 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.2.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
-SRC_URI[sha256sum] = "df3e6b70f3192e92623128123ec8dca3067df9cfadd43d59681e210cfb8d4682"
+SRC_URI[sha256sum] = "7b00c73f8670f35d4edb0293dcd81b980528bee72fd662b182aaba27ae570b93"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


