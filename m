Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752C1CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.24191.1761696938200576367
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DPvWMr08;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696938; x=1793232938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sok5iPKQ8zUnRVNnkgtcg/7RLMWDGbjsgzEzulyM0kQ=;
  b=DPvWMr08Ut/Y52bv0ejx9EoQ13b9y20m0iLx1lmSy4cB60b5RSeNJ9nP
   bGyDUNhet1z6BMlQs9OHXe79ReCR4P8k8nrrmCSj/YK3njqhMyIE0+iz0
   35Jv+Yt2YDOJkEzvi79Vjmt1n6jfNx3euyM7NJG8z7yRN8dG1ASUWVRNk
   jwfLfabpE2/Sk270YPonuaJQ4RGcf7wXC9lIjdIWpxQTZceblSRLM/KGR
   vUwRZJwgo9YpacSQXc5wJAeis2OF6lq4A/HmByjPNI0xjRS0/D2CA0jnu
   n+wnT+GouvVb/sZE++0ABQbDdoJZqvvqaE0e6CFwUVCgD/QUgeBusFsDr
   w==;
X-CSE-ConnectionGUID: nidORnICQiKHm8dxCLQIpQ==
X-CSE-MsgGUID: oh+xc0hqQiusZoSvODKnHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196243052"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196243052"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:36 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 54E38100034D
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:36 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1BC331800EA0
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6D48C82C0FC;
	Wed, 29 Oct 2025 00:15:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/32] lvm2: upgrade 2.03.35 -> 2.03.36
Date: Wed, 29 Oct 2025 08:14:44 +0800
Message-ID: <20251029001505.528-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121117

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index c4c5974460..09ee410614 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "38c1124a478fa3889c649338b6e8ccdc0370e201"
-PV = "2.03.35"
+SRCREV = "c8b7a765cbd731af32964adaf921f9e19d56a048"
+PV = "2.03.36"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


