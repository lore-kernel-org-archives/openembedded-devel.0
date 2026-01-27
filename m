Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AE9D2D8DA
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:45:48 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6918.1769507140593774595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SV+Tantq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507145; x=1801043145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WK7kPAUe1C8zTj/lUnwpUmaIkD7BknoEda2Ob5ZNbrI=;
  b=SV+Tantqd7wIMByTM4p/U+MXug4b2BysIwhNLcu/5a1tFH5FjLw9KtEP
   IQalu61YaM2m7FqGngNHQuMKNxSn1c3KQNgWg6aBokce/dQ1QBzPJtATQ
   PQv4rHnLjfOXKnCtgpNI+VQ4moXw2dEtNbkTMOSvW1TADbe8sKHbADufZ
   b7P864MZUIvFTSHEdW9LOs64QPAx6J5W3mDEBeP4KhNAH6GjZwrxGlNuq
   dRb0J8Gu2wHgXMyY12G848BsTyGngjjqa6bnrkWd/Cmvx731m1Wv5XfK1
   penAPugJ8iPNWjVUOb98iy7wkyVL3PrR5xLkMvCkfiBI5t4NHdM1bd9aa
   A==;
X-CSE-ConnectionGUID: T2u9DabVRIG7h8C623nwvQ==
X-CSE-MsgGUID: npUiGceERZ+iyuWoHtIX8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206088410"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206088410"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:37 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E04021C1C720
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 96A641401253
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id F334C20000D2;
	Tue, 27 Jan 2026 09:44:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/25] python3-ukkonen: upgrade 1.0.1 -> 1.1.0
Date: Tue, 27 Jan 2026 17:43:38 +0800
Message-ID: <20260127094339.1081-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123935

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ukkonen_git.bb => python3-ukkonen_1.1.0.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ukkonen_git.bb => python3-ukkonen_1.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-ukkonen_git.bb b/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-ukkonen_git.bb
rename to meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
index b9e85e78be..8fc5af1ef7 100644
--- a/meta-python/recipes-devtools/python/python3-ukkonen_git.bb
+++ b/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
@@ -6,9 +6,8 @@ PYPI_PACKAGE = "ukkonen"
 
 inherit setuptools3
 
-PV = "1.0.1+git"
-SRC_URI += "git://github.com/asottile/ukkonen;protocol=https;branch=main"
-SRCREV = "ad108a16e8203867f4860287b61149e0bdd838ca"
+SRC_URI += "git://github.com/asottile/ukkonen;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "5fa9858f0997927d9f9c1794e1741fe8dbd4c1e8"
 DEPENDS += " \
 	python3-pip-native \
 	python3-cffi-native \
-- 
2.43.0


