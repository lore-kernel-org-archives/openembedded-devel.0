Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F313DD6ACC6
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37578.1766048650898991132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GXZ910sO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048651; x=1797584651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=heRe9D7Fy5U9Q8Ub52hC1rVAhkmvIJp56E1ScDy9zAY=;
  b=GXZ910sOEnI0FtoFCWOAlNeNqOnHvl2vrIqLRmBY1rYrovMpf1qOJV3u
   fPmNk/E7cQ8CVTttspUUIvASTuwB4/m29tjYLjKNnxX5UXEjFYIhWBOXu
   ejTdAmUpHWEa/gqj4nweBz49dteUWaY6KZHvVxYxM+SiFIwuNRtJjUxFr
   WYt68odFTM5OvF8lZcpRermZ/XHQEbFVmIep+bAliBkhOsneY86vKhRXo
   LrflgxYwdusNJY2XShSj0ZOg3HFpQcP/pk3OFUTcFOgUvlU/vOgehdtUA
   0XyjXlpUZsBcLSaj/8BFlBZORCf/V8Jrj/r45d9h2v679774VOUnpfYbd
   g==;
X-CSE-ConnectionGUID: x/Nc/lKIQCi17FWLm5JChg==
X-CSE-MsgGUID: Ij994ti7T9G1Ur/GCES18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="211041372"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="211041372"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 289281C1734A
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D51C7C00745
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 54293101E51F;
	Thu, 18 Dec 2025 09:04:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/20] python3-black: upgrade 25.11.0 -> 25.12.0
Date: Thu, 18 Dec 2025 17:03:35 +0800
Message-ID: <20251218090346.735-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122743

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-black_25.11.0.bb => python3-black_25.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_25.11.0.bb => python3-black_25.12.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_25.11.0.bb b/meta-python/recipes-devtools/python/python3-black_25.12.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_25.11.0.bb
rename to meta-python/recipes-devtools/python/python3-black_25.12.0.bb
index ce8130d54a..9bdf8df3e4 100644
--- a/meta-python/recipes-devtools/python/python3-black_25.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-black_25.12.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "9a323ac32f5dc75ce7470501b887250be5005a01602e931a15e45593f70f6e08"
+SRC_URI[sha256sum] = "8d3dd9cea14bff7ddc0eb243c811cdb1a011ebb4800a5f0335a01a68654796a7"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


