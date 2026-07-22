Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A0AC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:25:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44801.1784715891720964876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T8MWJ+Xc;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715891; x=1816251891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5iBL9WJG+XlV1zhvmWcbdUTsM9CE2kDhh9G2GFgDxfc=;
  b=T8MWJ+XcZTHbFx5P5QXRGwRPAc47RrNq0u91ySR84gAaMYXfa6iFcyIc
   vdyfiuRKjjRhMgysdr1Whu9oz9XlqG7bMk1mJLQC0R3p4AfZpu3AHoi+r
   yf7ZaiVwych1nieVZeSOTS9keISbDn8uSJWh8NxSy6vmnvrvrNbjO6tOT
   xFSjVjSHdELBLRpORTgnUc/PzvL7geJCYajlFix+fRodTR0y5Yz0IQVLp
   RxB9sIETEfu4gm9SJGn1g96GYm8/iP2h/og1oStdZttGR6MuLjZWS/yap
   9ffHa3d6Vypgt4qYevomZKi2HdGyl4Tzgr2fscv6ZpypUKrTC5Cu74hfk
   w==;
X-CSE-ConnectionGUID: DINk+sMLQ+WQCYx7Q21ShQ==
X-CSE-MsgGUID: nSKdETg3QOGRAWYROODGbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="236182627"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="236182627"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EA4801C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 95671102FB8E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 98E9C4046B3;
	Wed, 22 Jul 2026 10:24:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/37] sexpect: upgrade 2.3.15 -> 2.4.0
Date: Wed, 22 Jul 2026 18:23:17 +0800
Message-ID: <20260722102320.1019-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128404

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sexpect/{sexpect_2.3.15.bb => sexpect_2.4.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.15.bb => sexpect_2.4.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb b/meta-oe/recipes-devtools/sexpect/sexpect_2.4.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
rename to meta-oe/recipes-devtools/sexpect/sexpect_2.4.0.bb
index 72ccd1d6b7..bfcec4ea44 100644
--- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
+++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https;tag=v${PV}"
-SRCREV = "d3645392424d47532be90fcbc0abf3148324785b"
+SRCREV = "108b189f34d627b3fb14574b26f71664fdf698de"
 
 
 inherit cmake
-- 
2.43.0


