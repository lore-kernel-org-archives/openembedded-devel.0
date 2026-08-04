Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A393C55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:25 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10169.1785820759557003862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jr/aBGde;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820759; x=1817356759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UDdTsJXC22KpqWMLM//7XKCV+NfCQmSTE8yEP0jEFxE=;
  b=Jr/aBGde6gzlUl0t5qWn9g1jd9nZylY8QYYBX2hECtfuewneCFfuLfdC
   I/fJzXCgubJJZtvGggICQ4ecMTByuK5iOTKVewRhAM9Ekzg3rAUIfAiC+
   Og61xtdCfTTj8bsSojIQIqIAhBjtHD+Q1LFWLJhxg1lcvNKVyeG8pkRQI
   Z5OgsgF3dtZDujPYlTSmBvoNiOyVvmidO11mu+AJ0v8IKsaR5m8kq4qQw
   Hnc70ax4Ay+0wSJZmkTtHlwZmjzLKlWLURF+fiJP7gcsxz6+AnctTp8IZ
   2Eys8TcCJ0Vt55XT8JnmCRLmJb7WDsQ/pE/hmxwwcdCrU1+utbCszIRqQ
   Q==;
X-CSE-ConnectionGUID: LGP+8rjYRS2CPvx1s/CImA==
X-CSE-MsgGUID: jYlBZNPPSAa/SYFQPuyy1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="228505371"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="228505371"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:17 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E35EC1C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:17 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 976C3C00D59
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A8FBF1800139;
	Tue,  4 Aug 2026 05:19:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/28] python3-inline-snapshot: upgrade 0.35.2 -> 0.35.3
Date: Tue,  4 Aug 2026 13:17:16 +0800
Message-ID: <20260804051726.1489-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128723

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.35.2.bb => python3-inline-snapshot_0.35.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.35.2.bb => python3-inline-snapshot_0.35.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.3.bb
index 3ac79251de..466648f41c 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "6cfd2ea0b52d9cb9beb13c1e73d740ff86f630ba48d9ea6947e54e3ff8494876"
+SRC_URI[sha256sum] = "5d76f3b4b134fb190b7883669eb496f5c3e7d1c9549bbd6d78b5b8ac17e553e3"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


