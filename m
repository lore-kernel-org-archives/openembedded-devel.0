Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C606C61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7657.1787731798982055850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oqjBPJgq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731799; x=1819267799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D0+1DUbFoCyr2be/NF2NVgtLaJ1DIVclA95fkMvA3IQ=;
  b=oqjBPJgqeP/1ATbSv27orK7KPItZaBLTlSrWkP1cVuMDfWY/0JWVkdGZ
   Eib8GYxyRdjsZjboL7PrHMPvYRBJtM1/YxWL+PpLRstiQal+gQaS0/WyY
   xvmSogJg22bG0IuD840g1+KNNhvL0w2rm/Ihi6W2k6K8ebYVoCFC4sWOP
   xuuaricVgpNrgeRugBrE1Alb+LWsKXeN3oLP+rgOo0tsRLGuKnEH48NBw
   Y+AQ4wLe8fuI1b8vDjPHkmStilRvk2Z96pv0bVAY1YcyMZW2K2xPVG2D3
   iXdh9UZfMNmsOuJEePM+UNhutzbkrZoOFPetBs28w7m8YNQXh5ynHc+Lm
   A==;
X-CSE-ConnectionGUID: I5UusyfPSCWHY76Ygv+ZWg==
X-CSE-MsgGUID: 9jnAwHmMR+C5ac6qduPudA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="230415713"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="230415713"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:57 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 47E5A40757B
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 00406C021A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0787F1404AFF;
	Wed, 26 Aug 2026 08:09:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/23] python3-nanobind: upgrade 2.15.0 -> 3.0.0
Date: Wed, 26 Aug 2026 16:09:19 +0800
Message-ID: <20260826080926.989-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129508

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.15.0.bb => python3-nanobind_3.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.15.0.bb => python3-nanobind_3.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.15.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_3.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_3.0.0.bb
index 9623214657..ec264b3f5f 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_3.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "3eace37a3b8cdadd531fcc6145263985b29821467161d34ff722b0644cf445b5"
+SRC_URI[sha256sum] = "68583c41d58af77649b830407d2ba84627f21f07ad4ae2e32c6988fb96eaa71a"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.43.0


