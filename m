Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E8BFD7F64
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92728.1772187237793369370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bIH8pMfK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187240; x=1803723240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rzECLpBTcy4O//84owwiSzKFKXd2EHKTO/b2CWTtSNU=;
  b=bIH8pMfKX/aCTejreAYl/Ccnq8+HtHAwzhJV0Q7FESjGT4TaVSsO4JIB
   xlg5LSEKGip7KyeChUNocgIaIuZIPiv+rmqyoqsAmWWRr784hZTYPrh2L
   5WYhfHxbrvel7EE2Htdpvd3YDTitGx+kyE4KSyCTGMdZ+PS4dJ9952m9v
   7crA6BdbcMQhF5psEBKw1GWvw1+U+c0VtJIxK/JHaVXj92qkUqRaK/eLu
   +OmNYk6LzU0OvQolsE1FEeuLIQc0q0AQN6JPvFc/rXsE7eC5TAOUDs5np
   wrxyCBkz4hxaPbcl6MZCUZDbBReB6j56kssj0xMl8BoLx93Sr18zcTsX9
   w==;
X-CSE-ConnectionGUID: b0xrihzZQlaHcfDe6g67kg==
X-CSE-MsgGUID: 9LaioY6YRpO+RwxgJp/L1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231299921"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231299921"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 8AEF08204D6
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:01 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 40FF9C060BC
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4EE3418005A1;
	Fri, 27 Feb 2026 10:13:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/52] python3-fsspec: upgrade 2025.12.0 -> 2026.2.0
Date: Fri, 27 Feb 2026 18:12:46 +0800
Message-ID: <20260227101327.1432-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2025.12.0.bb => python3-fsspec_2026.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2025.12.0.bb => python3-fsspec_2026.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2025.12.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2025.12.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2026.2.0.bb
index ea3e63968f..3b165a663e 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2025.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "c505de011584597b1060ff778bb664c1bc022e87921b0e4f10cc9c44f9635973"
+SRC_URI[sha256sum] = "6544e34b16869f5aacd5b90bdf1a71acb37792ea3ddf6125ee69a22a53fb8bff"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


