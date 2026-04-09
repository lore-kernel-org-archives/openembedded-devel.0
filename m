Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0982BEA3C37
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128835.1775730848208905099
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MbE3CFQ/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730846; x=1807266846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GLaIc8ZSXOhymwDh4h8912UXnUqm/cgUKfVatHqzLno=;
  b=MbE3CFQ/svO1G0WHn+36eHyIhLAEdfukUx2oWgBJo1iMRf1wrfR4L2a0
   Odv2zQ6/snuaF0HSWF/v17zgXwdFoMBprTEuqsRm+sUlwz6BrBUM6kHgA
   DWhBqTlxsSXYIZgCjtjDsIja2m+uYkXoOhYgpStgYoYngFLFwPns4d81F
   PSBTQPZclLQ+h9J1U8SHA0KhFA4dujwys7SRkKiJLfzKHx7W9yRvcfDw8
   5huhlt/Hh9cgKQ45qAaysft5nWBVtWnYVb7qlq3XSZ1sibXJkKjUl3PIQ
   6WXIyt3n2uhjvvU4I9gm4SMcMTSrK0TgaWcqRma++9G8wprxJ7iUMm0cN
   Q==;
X-CSE-ConnectionGUID: YyYrGWE+Th2DMJPLTRm+eg==
X-CSE-MsgGUID: Sjw912W+Q+6j0lkppiGOfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="235843800"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="235843800"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C9B1A1000154
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:06 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7AF861C002CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id E5EAD404333;
	Thu,  9 Apr 2026 10:34:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/37] python3-marshmallow: upgrade 4.2.3 -> 4.3.0
Date: Thu,  9 Apr 2026 18:32:09 +0800
Message-ID: <20260409103223.1574-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add pre_load and post_load parameters to marshmallow.fields.Field for field-level pre- and post-processing
- Typing: improvements to marshmallow.validate
- marshmallow.validate.URL and marshmallow.validate.Email accept Internationalized Domain Names (IDNs)
  marshmallow.validate.Email also correctly rejects IDN domains with leading/trailing hyphens.
- Typing: Fix typing of nested in marshmallow.fields.Nested

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.2.3.bb => python3-marshmallow_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.2.3.bb => python3-marshmallow_4.3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.3.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
index d41ec8f6de..169726e527 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "3e3fef6b3603721a25a723b8caedfa488369bddaf9bc03b40b9442c90aebd22b"
+SRC_URI[sha256sum] = "fb43c53b3fe240b8f6af37223d6ef1636f927ad9bea8ab323afad95dff090880"
 
 CVE_PRODUCT = "marshmallow"
 
-- 
2.43.0


