Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C274CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.10931.1760433608895421163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X52JjqAH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433608; x=1791969608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FF7NUmTECaevr1/wEcdJZ+xyZ3oyz6CYQOA/XHUoe0c=;
  b=X52JjqAHAgGy6F3YrJI7s0UI8cOioC+YC58YdYZ84soF1YcPR5oi7iOg
   i0+X+uZcdTRBmjzmXAPECT8ko1L2eQhakIS7O/wMyUFSfEAJ8Dz55jnfC
   q9OQD3qdh5h7hPxi9YLQf0fzkNAA2l2gSnVT0AI6smoVxgH724fVgWP57
   lFH9mbaHxyVgiJ0QqGANYb7zp/DrTnizPoQ06KH/WMYKvtNC4J6chYPwz
   EVfs7QAx1uAUf2lWwCXKCWbtCVm7eITszN+f0aMnmLrUXjJjvQG7C7yKJ
   qdI+w2GSoe7i+udO91FQi+eFC+Xg/2hGO7wXvILMTZ8ygTBzksrhGT5zW
   Q==;
X-CSE-ConnectionGUID: n4bP9yLKTBiqw8xuD+f1Ug==
X-CSE-MsgGUID: T9U//nmoR+a4Y3XwE++wrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="216453966"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="216453966"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8015F42A31E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:07 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 39EE11000389
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BF163101BB77;
	Tue, 14 Oct 2025 09:20:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/44] python3-cachetools: upgrade 6.2.0 -> 6.2.1
Date: Tue, 14 Oct 2025 17:19:02 +0800
Message-ID: <20251014091927.493-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120576

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Add support for Python 3.14.
- Improve documentation.
- Update CI environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_6.2.0.bb => python3-cachetools_6.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.2.0.bb => python3-cachetools_6.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.2.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.2.1.bb
index 84899bd71e..78b4ab5e2e 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.2.1.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "38b328c0889450f05f5e120f56ab68c8abaf424e1275522b138ffc93253f7e32"
+SRC_URI[sha256sum] = "3f391e4bd8f8bf0931169baf7456cc822705f4e2a31f840d218f445b9a854201"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


