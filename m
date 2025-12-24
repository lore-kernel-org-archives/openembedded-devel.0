Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ECCE7543E
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117709.1766567661932342565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jP0btf59;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567662; x=1798103662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sOW4iOnuCpNk3eVo0+xG2ZEk37d9Y/KV4fuxplsJtl0=;
  b=jP0btf591NNxWbqCSYabsqhSMbhk6zxhozdEIMTDlUQ8UI7JqcQkvlso
   a1pdBhenXlifygVe+afmHYxJ0hBcQkQwukRZIGKhtDhkIfwOrMKFhAOMr
   poP6gf5Zdaksgt1s539CL4bl0OdOkED+/z4Pu6f/mPwEzEnM3+AghBYMn
   +FquUw24HFCK7rGKBYkOyg3rZ2ugfbYvBRe6k6iJ1xpipdEqV2wkefSKs
   gBuBfhmbDBgIF+vpDs7DcUvMHSVEW2H7Z6tkkfAB73RRY3n7stdN/9dEa
   bSrWQ4Qyaz0s9x8GMAenIbwQcDGddobiHeSYirUPal9Y/V+G5/DWHHTgd
   Q==;
X-CSE-ConnectionGUID: pI6T7PgRRzSvfvlW8lxsLQ==
X-CSE-MsgGUID: mmgx+tIjS6GrwK79l59qVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="211737306"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="211737306"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3CA071000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:20 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E6613C0218D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 48F6B200074F;
	Wed, 24 Dec 2025 09:14:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/28] python3-cmake: upgrade 4.2.0 -> 4.2.1
Date: Wed, 24 Dec 2025 17:12:50 +0800
Message-ID: <20251224091304.974-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix: add missing f-string prefix for --parallel bootstrap arg
- fix: workaround issue in lastversion with OpenSSL
- chore(deps): update clang to 21.1.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.2.0.bb => python3-cmake_4.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.2.0.bb => python3-cmake_4.2.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.2.0.bb b/meta-python/recipes-devtools/python/python3-cmake_4.2.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.2.1.bb
index 5782be0023..88f9ff38a0 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.2.1.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "7744c20e4a23e68dea276d819767d2bdbb45442cc342560b03ff693b755cd181"
+SRC_URI[sha256sum] = "a07a790ca65946667c0fb286549e8e0b5a850e2f8170ae60d3418573011ca218"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


