Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6417C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3255.1787132124819660820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hNWb0wUJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132128; x=1818668128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z3DKiUpfaeX0tuF6UrGYqftycsAs72e01K0W5guhZb4=;
  b=hNWb0wUJuzrhPPlq2BeNwH6vS08H0rerQLkUjoHMU2qWZSOwLBx9OpGr
   PnewC+sPclJI1xPHC6DMNriyhhzZBe3NMnDrF8jOWzThtLxp9Cdo4zzY8
   TaRzbZNumQJHoMey0YmiYPx2EL8N/VT2r5bVmZDjuGd2T7smIiJegdahl
   /HKjz5/1eCbZDVl/MIDu0a4voneJe/c09k+UYXubLRB4GauEH/NHo9EhS
   4C+posm+9N7HS7To2wlKSAuB6ChaZW5WGs4JwwGgMjP9oWmBnPH/aA99O
   ZPIKNegE9OfHGdFB28O0qPGxblHvHHEojvG3z5RQ/j+Br9WFL3G537X+X
   A==;
X-CSE-ConnectionGUID: ruBy/U3iQAiKo2T+irWtiA==
X-CSE-MsgGUID: sSfqFypUSxSD+6bX13Tivg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759338"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759338"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:26 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 099831002B81
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:23 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B2C04832873
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B51651801C20;
	Wed, 19 Aug 2026 09:35:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/70] b4: upgrade 0.15.2 -> 0.16.0
Date: Wed, 19 Aug 2026 17:34:06 +0800
Message-ID: <20260819093514.1101-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129272

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/b4/{b4_0.15.2.bb => b4_0.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/b4/{b4_0.15.2.bb => b4_0.16.0.bb} (80%)

diff --git a/meta-oe/recipes-devtools/b4/b4_0.15.2.bb b/meta-oe/recipes-devtools/b4/b4_0.16.0.bb
similarity index 80%
rename from meta-oe/recipes-devtools/b4/b4_0.15.2.bb
rename to meta-oe/recipes-devtools/b4/b4_0.16.0.bb
index 3a6fd79615..5679f47e38 100644
--- a/meta-oe/recipes-devtools/b4/b4_0.15.2.bb
+++ b/meta-oe/recipes-devtools/b4/b4_0.16.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_pep517 python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "b815f2aed2288718cfe2a14c76421a00bc4f0918ea32b45dd1645c999fdda69d"
+SRC_URI[sha256sum] = "071823a1e904508a6fd9aaf8cc2f9a92697e1dfa270000b4d1130015b56f4137"
 
 RDEPENDS:${PN} += " \
     python3-mailbox \
-- 
2.43.0


