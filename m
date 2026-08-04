Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3D5C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10311.1785820764182203807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BFcpAFeA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820764; x=1817356764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h2FmSRhV84Kucb+YVDizDuqXfSTRv0N0z4x9C2tDsOw=;
  b=BFcpAFeA5f5rhI55/qVpjN6D6MfkV3SXIVMf/WtTwpfRnHUoxwiWeZUD
   wjMVOh9YYAQJvd64bMDKqlNCqYS/9Q4MdhkiEwRY2ntsq/2LAFYpTqFpQ
   Ch30HUAx+Yv9GRUNCrqMpoCkbchIiVldYKLIhADl2GIxAGOGJ6hh4S+jY
   xmiVFxwp6HsHL0uWFnyla2ZY23P4XiXwiiung/8N+hi4j3NzStQwHcKjl
   rmreSz1Jc4Mnh033O/ShQQzu6mmyGnmswtCzsj53LebaoYMBgbGxOxjUo
   ahPjczt2vkvjxNICbCC5sXMZ/wwtlFXYiW5eAtzW//sR17p116R8O0oNI
   g==;
X-CSE-ConnectionGUID: QCQQH9I3SY2bFxjvICEy0g==
X-CSE-MsgGUID: oFqSft20Tee3jdzN+leVQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249629986"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249629986"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:22 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 46EE61C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:22 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EBEB0C00D59
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0EA711800131;
	Tue,  4 Aug 2026 05:19:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/28] python3-nltk: upgrade 3.10.0 -> 3.10.1
Date: Tue,  4 Aug 2026 13:17:18 +0800
Message-ID: <20260804051726.1489-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128725

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nltk_3.10.0.bb => python3-nltk_3.10.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.10.0.bb => python3-nltk_3.10.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.0.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.0.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.1.bb
index 4842bc68ef..c66cfece43 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.0.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.1.bb
@@ -24,4 +24,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "4fbac1d98203cbcd1b5d94a2877fb822300072d80604a5e7fae49d2c5f84e8c1"
+SRC_URI[sha256sum] = "86a1b41d9ca0d35a2cb72fa60af4c9aaba9fe405b717161fd94cecd69f467007"
-- 
2.43.0


