Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E85CA0EC0
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13438.1754296437615756567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZALc0s5k;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296439; x=1785832439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQ2mcOlGSMw165nIrjIWaWwVFDerws4rKjBxipwnPtU=;
  b=ZALc0s5kthaAzlUlDPxxsFPeRfmr85aetvjeWbqklRhl51aCcjwWnBqn
   xr+jH3b8fTg3jdx0uyCAJMUUGUCSdaG09pqILPJbUj83gdiHNioC4Tcct
   O58Axwj7hJwJItyhc90Su4WHbyMcZRiSqSyrh+Ao7WGqfKlQe3WSC1jdf
   VM7GaqNJxq1N1ZPqpGD9mAf9HfgjFBEkBahYgtnKCwX0+wUxj1q9/uTC1
   hW+88UxyxznjCRSkgqL6Iyyl+FBFF3RkJH+SGyCGiPDVtOVNnWk6PEDWl
   kCh5OG4+T65ot9/Z1TKYOREGr8rnEIlizkZv+iXV/l+erwkrXfv2Hy7kU
   g==;
X-CSE-ConnectionGUID: rYJ0VvouQDiNvdqWfE/uDA==
X-CSE-MsgGUID: kI3s/aYMSlul6h7jvx/1Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="187291971"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="187291971"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:59 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 02C5D147A
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 67176C012B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63E241A0078;
	Mon,  4 Aug 2025 16:33:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/18] python3-polyline: upgrade 2.0.2 -> 2.0.3
Date: Mon,  4 Aug 2025 16:33:34 +0800
Message-ID: <20250804083340.1649-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118845

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove deprecated toml dependency in favor of native tomllib (or tomli on older Python versions).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-polyline_2.0.2.bb => python3-polyline_2.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-polyline_2.0.2.bb => python3-polyline_2.0.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
index a91ceb76ee..371bcf0163 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/frederickjansen/polyline"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
 
-SRC_URI[sha256sum] = "10541e759c5fd51f746ee304e9af94744089a4055b6257b293b3afd1df64e369"
+SRC_URI[sha256sum] = "abc786b9332e84f27e6e59fd4fcbcb0c4b9af6a7f7b4175e2eb6c2786278deae"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


