Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3F2D2D8D0
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:48 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7133.1769507082669502987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yy35Q7pk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507082; x=1801043082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D8PLD1Nzhj1NSGDalUyCgThby2EjBCjmJwKApTFCXYE=;
  b=Yy35Q7pkHCwrGqrd81YDoEAGNAA6/L8KRUuoujtqDrLhwnmRkrZ/JiM2
   YKUCkufoe4l+LUQ7EtSPohvkglwDzHYtCpONhg92uMCqW6IZz5mvnJzKv
   xDS0ytWmo4TE/1dBAIXWidvmtjsDGxLGqe3PKUFdgdq4mXNpBOuJMIXg3
   ZkNE2cGe//22ky5ukKfrapZYzhPBn+A1+IwruZTROZFyn+bVE2CF6nH1H
   7P4jUQNuB2qZuomg/fQhKOuAdjMolsAaEy1o2Nma422kJPpPg/TeVLhEW
   mg3QZrwnF6ZdrlByjTQLhHiyraG5tJUcqEA7dy/OnB6HJsaKYzWNqS2ns
   Q==;
X-CSE-ConnectionGUID: kTX8znRhQE6TBcrPAw6Lug==
X-CSE-MsgGUID: IqL6ASEaQXauJLnbEjrcEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227279326"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227279326"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:43:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 86D44820709
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:54 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3CB02C0118D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 91E7320000D2;
	Tue, 27 Jan 2026 09:43:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/25] googlebenchmark: upgrade 1.9.4 -> 1.9.5
Date: Tue, 27 Jan 2026 17:43:18 +0800
Message-ID: <20260127094339.1081-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123928

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.9.4.bb => googlebenchmark_1.9.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.9.4.bb => googlebenchmark_1.9.5.bb} (91%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.5.bb
similarity index 91%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.5.bb
index 7f6755d51e..b72b57f4df 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.5.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "eddb0241389718a23a42db6af5f0164b6e0139af"
+SRCREV = "192ef10025eb2c4cdd392bc502f0c852196baa48"
 
 EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=yes \
-- 
2.43.0


