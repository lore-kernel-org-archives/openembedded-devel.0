Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDA6CED249
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8430.1763456957834653580
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LS34k0AY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456958; x=1794992958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kdwzAm4qaY6w9lwtW1H8rNpBKG++kFBKUQisa3YEJds=;
  b=LS34k0AYua43kU3nXnCseQ+EcFjDofo+8WYhi/tAZvZVg4I7XytyQznJ
   +ah1QUIDQy3YWK91ozTP7r+eNKpYS7TPftf2GzLEGdr7DxIEr/eZnCgO/
   pmcsViHQEWu3XxNQpjZGhh0SATBlxGidtQO/jeYoC2SLeVoYUMOEfvI6X
   As8cHxbFc91X9f1OVJs/g2+8Tv5RRfoll+7xiXJmZ8jDdrbnrNiL1Hj/8
   Ei4QFQez+rnch9Jii2o13J7eG/Z6Nt64e7e8KFVS0jvXZd0QwaiBMqYSX
   X1fMa4sDe/euW4UXx/ilG6bPt6Q4dinkVxNKSNn/trUY/vCIVEl7oy7ME
   A==;
X-CSE-ConnectionGUID: xdTGmFZySKCzC9YoaPzRVg==
X-CSE-MsgGUID: 417+Rhz9Q0Wrw+w/9EgoKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="207570391"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="207570391"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1DE431000349
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C88DC10001E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4AA0914002EB;
	Tue, 18 Nov 2025 09:09:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/29] python3-apiflask: upgrade 2.4.0 -> 3.0.0
Date: Tue, 18 Nov 2025 17:08:31 +0800
Message-ID: <20251118090846.1484-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121825

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add support for Python 3.14.
- Drop support for Python 3.8 and PyPy 3.10.
- Decouple from marshmallow and add an adapter system to support different
  serialization/deserialization libraries
- Add support for Pydantic models as data schemas
- Fix subclassed MethodView resources cannot be added as URL rules
- Add support for API key auth with APIKeyHeaderAuth, APIKeyCookieAuth,
  and APIKeyQueryAuth. Add support for runtime selection of authentication
  methods with MultiAuth. Deprecate the API key auth with HTTPTokenAuth
- Remove implicit security scheme naming rules
- Remove implicit schema naming change (i.e. 'Schema' suffix stripping)
- Deprecate the EmptySchema class. Use empty dict {} instead
- Remove the deprecated __version__ attribute. Use feature detection or
  importlib.metadata.version("apiflask") instead.
- Fix the support for marshmallow DelimitedList field in OpenAPI spec generation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apiflask_2.4.0.bb => python3-apiflask_3.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.4.0.bb => python3-apiflask_3.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.4.0.bb b/meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
index 96eb1f2f9d..3b9912454d 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b7894741cdea90013276873cdf635d5150e1deb3fe20d02d429866af960f275f"
+SRC_URI[sha256sum] = "2b8420a23b93a78407ef5fe3e1f79cdfc7baa9b3c53977a06d6ab68772a7c2b7"
 
 RDEPENDS:${PN} += "\
     python3-apispec \
-- 
2.43.0


