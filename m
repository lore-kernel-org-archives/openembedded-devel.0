Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0B5E6B278
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:11:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96108.1766470269223937419
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WY3AQdf8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470270; x=1798006270;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YWv6uSicYm7SpciEEXT39nJC59jaj3JG32dwi1YGdHA=;
  b=WY3AQdf8WhPh6tszu/4UE51AiaRAKTy8vPXOagQBsTMrUXiuuE2hbidy
   gznibqZgry8P5t+QKUMkUzrF9vDVDhVRxtPIGfqtYiwR4cYJhzE2kIR0/
   l80SSltArSDJ4iM2P9edr2EkEFz/Oc/2addztpTCza5kvOt+l3fvaEpa2
   nVGy/CMp0hYmoKKSswedehHb+aPKuqM8+txRkUNvLZuUk37oJaqh0RR+J
   qYmBWB2Q0fea+/RKLaH/j15CcZqyrZPwe/UTUzrFsLCa0osof8jkGRLlM
   fzL1dDGqP8vs9ZXAX4numf431zcL/otecp+mO/GywRD5c8ZpsZO9ut1qD
   g==;
X-CSE-ConnectionGUID: Q0oT+fvvTNeUmG+ERayrPA==
X-CSE-MsgGUID: ROjF++DoTL2IvysbhNMAfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="211018730"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="211018730"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:11:08 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BF9661C1C704
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7B1221800097
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:07 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 526E510005B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:05 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 3/7] flatbuffers: upgrade 25.9.23 -> 25.12.19
Date: Tue, 23 Dec 2025 14:10:38 +0800
Message-ID: <20251223061043.659-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122819

Changelog:
  https://github.com/google/flatbuffers/releases/tag/v25.12.19

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index 8f40cbed4a..1168369f89 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "25.9.23"
-SRCREV = "187240970746d00bbd26b0f5873ed54d2477f9f3"
-SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
+PV = "25.12.19"
+SRCREV = "7e163021e59cca4f8e1e35a7c828b5c6b7915953"
+SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https;tag=v${PV}"
-- 
2.43.0


