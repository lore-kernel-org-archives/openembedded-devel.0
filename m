Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E52E75432
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117304.1766567649290676355
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R1y8ECte;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567649; x=1798103649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aV3KCOMoR+aIK3yC2QfwD7W1qhbrvD72HJOzsGkCzK8=;
  b=R1y8ECteS22UNN88mc0Y3jCE7hJw3rCASq8HMXHr0zAMZSE0e2lyzPSs
   qjaiMk+7F6YmSuFRwYsZ6kkrAwZ7LRe64Cf9zlz6MUj5EBkfXivaVYbUm
   KBMaWrLIscpXvxoZFTIwd+wFQXzNtDvbovikX2lpJVj2XPrX99wUEXRFq
   zTl1p++NXt48kNwGpZAnbFkhyQSuCykMBEUsxMhj0Zua9C+cLuUQNyQzy
   7HykaY6FA0BEEQ0ut0SMM1Oj2gMDef/Ur3DBv74q02pJjK9MyZvtkjDRN
   ezJUqthqNy2nsYGu3r0dpotmZVa75BBsJ/8K6VZQsCF1y29IUIHGm+9BJ
   A==;
X-CSE-ConnectionGUID: GHB148y9TF25RKZmOCBU8A==
X-CSE-MsgGUID: INELi290RVS8cprmrVmitQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="227738265"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="227738265"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C8FA31002B82
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 848CF8D29C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9F715200074F;
	Wed, 24 Dec 2025 09:14:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/28] lvm2: upgrade 2.03.37 -> 2.03.38
Date: Wed, 24 Dec 2025 17:12:44 +0800
Message-ID: <20251224091304.974-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122858

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index ccefa206b6..9e6bd807a2 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "d34fc799fd86538756ba56b37e1ab56ab1b75d13"
-PV = "2.03.37"
+SRCREV = "657e10bd75fcb3dffbd40bb1ffc6f1bfd768a10e"
+PV = "2.03.38"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


