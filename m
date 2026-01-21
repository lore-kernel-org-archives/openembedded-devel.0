Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D11AC44516
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:32:51 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9488.1768995160633541977
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lk+XgV8D;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995159; x=1800531159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F+x9bLqaziiNaLH85z7MRrovuX02aLGFKOvBwUYbDXE=;
  b=lk+XgV8Dyey2S1jlfH620bi0Uy9JPCUTZDaN+0X+8nalWUr2kZsdsT9P
   Cj6z4kVW+guAayqkCeIiwTPUaTQHAeH75Bd3ZtMCuPZeJ6MlTLgdjIgYL
   9QSk20EC5+YZSR2LWgWaB9EQt43DbnzTS+iCJXSKxQI3ZmeO1X/cfSE4X
   ICvs9fNob0kXnuiLGlTUV+g9LmHKLgjHIdq1G9oKMiXfHLxgHJCkCqylr
   nJMzf5TSNL+5qp7uZaJW/k751TlfD4rZxL1mhJ9r7OjDjrWGcmBIzugQl
   BR+MQLRFr6T/SGf68s5pP6rgI33wdkYzFwPBU8jLGEX6oruSKOtmLRQEj
   g==;
X-CSE-ConnectionGUID: hBZZ+4ufSN+9UKtjrpIlFg==
X-CSE-MsgGUID: q9S1hmePSFq+Cts666/Dkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="205395394"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="205395394"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:32:37 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 11F461C1C736
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:39 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C27291401252
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5098F1401D61;
	Wed, 21 Jan 2026 11:32:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/30] catch2: upgrade 3.8.1 -> 3.12.0
Date: Wed, 21 Jan 2026 19:29:13 +0800
Message-ID: <20260121112921.857-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123713

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/catch2/{catch2_3.8.1.bb => catch2_3.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.8.1.bb => catch2_3.12.0.bb} (89%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb b/meta-oe/recipes-test/catch2/catch2_3.12.0.bb
similarity index 89%
rename from meta-oe/recipes-test/catch2/catch2_3.8.1.bb
rename to meta-oe/recipes-test/catch2/catch2_3.12.0.bb
index 48ed26708c..cd51686c0d 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.12.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
-SRCREV = "2b60af89e23d28eefc081bc930831ee9d45ea58b"
+SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
+SRCREV = "88abf9bf325c798c33f54f6b9220ef885b267f4f"
 
 
 inherit cmake python3native
-- 
2.43.0


