Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BD2CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13255.1764062257679808342
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NhvPiIeC;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062258; x=1795598258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JrWtDRC9BvT0dqVO65geXAR0e/AOeAyD6XO8Ifvklk0=;
  b=NhvPiIeCmyPe/EN/BIyKUc4nFm9rqI4ylchq2FrrDWEITGqpnDX7gFc7
   fciv0gibX1vOgJyHwD51sK5eKQdgFrH3PtZ+lhZki3Ty54qdmzOeyMKEx
   qDSgSywzoodHf06rTejbBYj61hEXrW1IrkmA3/4UzgmYBXNP1f0h/l1ME
   n+YA+1PxDOnX13SVfd9e3cH1dlCpBa/S1fupYRg1+6dIf6LsaEQwapmV2
   k4jGpE0qneFIZ+k96DaK2UZrXZCrVDo8yi/6y/QO/7ToC0P9Uw6YWAZ/d
   uqkgSaxU2n2kmnKYu4Z9PVTWjuF4We4IcNAoa6AycaLMxuBWWvKtUQtDw
   Q==;
X-CSE-ConnectionGUID: JF47p0kgSnG3n8pZPbEAqg==
X-CSE-MsgGUID: hRznSTpCSLGJyAvhA/NK8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199294234"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199294234"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:37 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4028E367
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:36 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E7BC41C0015D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A4783101A420;
	Tue, 25 Nov 2025 09:17:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/26] sanlock: upgrade 4.1.0 -> 4.2.0
Date: Tue, 25 Nov 2025 17:17:12 +0800
Message-ID: <20251125091714.1420-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122050

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_4.1.0.bb => sanlock_4.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_4.1.0.bb => sanlock_4.2.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
index 2f4886057e..8babaf8017 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "57013022da9c06c13f65a24684522a04323f59b6"
+SRCREV = "efe86d2e691383da07942fe9a4bccab13046f3d4"
 
 
 CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
-- 
2.43.0


