Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF889C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3262.1787132149482839872
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MHPlXfI+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132149; x=1818668149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+3AlN2Va/NUeTmzNKuGfkunwbyvBwW3Bm0AxtxeTqZ8=;
  b=MHPlXfI+YHnAfiCjtum7hSdF5jtje/pSNZ1ElzbMulmHp8cM9SVqMdXa
   ZG1DPTgDgJlUblf+l4rHQBNH+sMfayaY3FGidoIVFzVUJBcC4t1mqKnkt
   V2O/a19wMhDI8eN5ThliEFYHPR3xqOJw9vl9gyQkepm1JmyaHRR5YoUS+
   TpJpN0t9w0tadqVFd30E000CH+iz9x6XsncCYeJbXoqFEypnUiEayvqXQ
   BUqLNBeIBcN+js495lHxCOnUTRCFQBuB1dhvVCpcACY3h91XFoNLcrSvq
   ciVObYDjAAtHSe7iFXoHo4hKxsypDG260g8nVsARhizG2rW1cw1vHea6k
   g==;
X-CSE-ConnectionGUID: y7YXTVgNTtuxj2F1LiMdpg==
X-CSE-MsgGUID: rVDYidyHSuW0zG4sJb0V1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="238053882"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="238053882"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:48 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E5FC51C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:47 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A0DC7C01816
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A50181801C11;
	Wed, 19 Aug 2026 09:35:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/70] poke: upgrade 4.3 -> 5.0
Date: Wed, 19 Aug 2026 17:34:20 +0800
Message-ID: <20260819093514.1101-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129286

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/poke/{poke_4.3.bb => poke_5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/poke/{poke_4.3.bb => poke_5.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.3.bb b/meta-oe/recipes-devtools/poke/poke_5.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/poke/poke_4.3.bb
rename to meta-oe/recipes-devtools/poke/poke_5.0.bb
index 14597c93c2..ede460fca0 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.3.bb
+++ b/meta-oe/recipes-devtools/poke/poke_5.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
 
 DEPENDS = "flex-native bison-native bdwgc readline"
 
-SRC_URI[sha256sum] = "a84cb9175d50d45a411f2481fd0662b83cb32ce517316b889cfb570819579373"
+SRC_URI[sha256sum] = "6873d59abe821c8111b88623ea7ad9e090892fa95c75562606dd88374e2f5b8f"
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/poke/"
 UPSTREAM_CHECK_REGEX = "poke-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


