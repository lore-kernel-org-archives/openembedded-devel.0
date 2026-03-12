Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97D4105A56A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18537.1773312827006384909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sJjsJ982;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312826; x=1804848826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJjEG77afCFytriQF7BNMhbKEzQ/oXt91/0cGu5BenY=;
  b=sJjsJ982YGgG5LU3v4tQGVEnd7kKvxW3rzfrWvSp8Sz+8EK8LwT+PaLn
   eXMqb9ZywQNW4CwqHA6KWwemxRh6JKncAToNv9bemA95/6n5uM/AJP2Bj
   36CCqspMXmnNAUN53BDd3NGyEKH65YHXZ+CqnA5ug0WNeQ9B4kqria6aS
   PQiewB1c8xK3oVSSp+zPcRoijTajlLv/dVtVCusVLBgNVoHeLOWGDRWZ3
   0KamIzv13m46vGDiamm3S72rghjO61moBNVnPTjMfy1uIOrbWTCiu18ye
   PyumJibxpXjrXLMDPms23w6GNQWGoGLSreZi86w7kTjeFOy4tt3whD1oO
   w==;
X-CSE-ConnectionGUID: 6mUGgrtCTje8CXEORN9BPQ==
X-CSE-MsgGUID: QfC1usKDSfqTZKJa6C35rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232989824"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232989824"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:45 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 71832C01B2F
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 27C17C0081F
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2FC9218005BE;
	Thu, 12 Mar 2026 10:53:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/64] python3-inline-snapshot: upgrade 0.30.1 -> 0.32.4
Date: Thu, 12 Mar 2026 18:51:53 +0800
Message-ID: <20260312105220.1856-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125137

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.30.1.bb => python3-inline-snapshot_0.32.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.30.1.bb => python3-inline-snapshot_0.32.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.4.bb
index ea1f15a5bd..41b365963c 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "77c2e94a40f2da02909b39e3386c9fc23f532c92af45558e2d7bbabb5fd0cbc1"
+SRC_URI[sha256sum] = "f6c21f3a5cb8b4cc5a9ae80fa5d1b66bb642195884ddd6960d383c21a2258318"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


