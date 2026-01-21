Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08785C4450F
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9454.1768995030194169312
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jg8Sc8la;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995030; x=1800531030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=waskz+t20fU3F+gqZoXNWE5wnRIcWS272c1FO598waQ=;
  b=jg8Sc8lavP31SfbAan0iYhLd6J9f2m+xpiD9b7ADsaT2dBr0H2hNGPpO
   rh5dMW6Qc3USaO5brxKvQfUJe/luCtX9X/71IYlav2/KZWgv3ClCKEpwh
   CceXbJRPi5jIbPovji8dSoadARJ+0Ro1OpxzGgLAzg91FyQs2n5QF7Bgk
   VLE1KNT3aMqEx3TxLhkV/34IrzskS+o0FPu7/g341g2J8zh4ZlrywB7TU
   wSXs7LZGbR/delRBKNNA+BRS6nh4c/xmujSIRVvEkJ4g3d+WEExsOJkwy
   U/G5ngR1dloDkXG+tBvLT3Gq7ZA3KAeRQQDrkRV4F/gMAwbHZlnf7uIFk
   w==;
X-CSE-ConnectionGUID: /thVoxD3Szi4SDoCWd8vFg==
X-CSE-MsgGUID: 2ESs7u61RWq9pYcTF8dqkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="213994003"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="213994003"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:30:28 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id BCCE41000352
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 71F561802AEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id DD05B1404867;
	Wed, 21 Jan 2026 11:30:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-types-psutil: upgrade 7.2.1.20251231 -> 7.2.1.20260116
Date: Wed, 21 Jan 2026 19:29:08 +0800
Message-ID: <20260121112921.857-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123708

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.2.1.20251231.bb => python3-types-psutil_7.2.1.20260116.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.1.20251231.bb => python3-types-psutil_7.2.1.20260116.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20251231.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20260116.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20251231.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20260116.bb
index 90325c4db1..b9724695a2 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20251231.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20260116.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dbf9df530b1130e131e4211ed8cea62c08007bfa69faf2883d296bd241d30e4a"
+SRC_URI[sha256sum] = "4661be5d5d7acd5d8afb02a92d05160a6cbb2ce74723245b51f7ba7dfdb9f981"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


