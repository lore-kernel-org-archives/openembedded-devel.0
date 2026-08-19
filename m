Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3119DC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3255.1787132124819660820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iFHTRSHK;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132130; x=1818668130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jgSReP5jbATcdFmQ1bE6hzrsfj/eoyNAaLJUGqYKtMI=;
  b=iFHTRSHKln9GM7vKI8NS9uPoSDafbxgHuvgR/79pEVCZ1OY2l8GWbscr
   LMFr2/R4BxgryHBXqQ8PQFwCmxTFw1gaViTeA88/ZEecxWF0enNyE8gFG
   BKEJfYG4maaadMW0cFsZJ+77mwxO7le16JAILX3q7UKq66dZ/XNGEWkyc
   Eu3R9tPumID7g1R4gCvlqMiqG9CQaELm3UxfxzGu0YJ4+lgt8/kyKOkUB
   /sEYLQuKcfT5DRLtUbVUKTc99CM/RQwQpowkHh4huqbm5SzBj97r9+UaN
   FLWKttLwBMvqKq9dtvE+RN0+bFDMjg+pp8J1MS+z0USFCO2ZbbBLeSHxK
   g==;
X-CSE-ConnectionGUID: n9GeS/HsTmmxzoa4RMRg/Q==
X-CSE-MsgGUID: kt67v5PORlKts9aG5gNN6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759346"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759346"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:30 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B5E14100037F
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:26 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6B63C10003A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5BEE01801C0A;
	Wed, 19 Aug 2026 09:35:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/70] botan: upgrade 3.12.0 -> 3.13.0
Date: Wed, 19 Aug 2026 17:34:08 +0800
Message-ID: <20260819093514.1101-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129274

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_3.12.0.bb => botan_3.13.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.12.0.bb => botan_3.13.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.12.0.bb b/meta-oe/recipes-crypto/botan/botan_3.13.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.12.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.13.0.bb
index ae122af77d..1813b51d16 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.12.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.13.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5370f98dc15f8c222ee1ce52cd61c8756a53be0dc57cc4c1b0714d5a09ad74fb"
+SRC_URI[sha256sum] = "12f5a8358890bbee82edfe9d2e7769b0a610b6dd0e0698aea13d20a675d84620"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
-- 
2.43.0


