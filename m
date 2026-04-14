Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4615DED7BB8
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15991.1776163240207910742
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gh5EMv3e;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163240; x=1807699240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wS9HTjENpIJPxv95QDzPqS7IxtBNs7hv+zV0c5PU3wY=;
  b=Gh5EMv3elQFJj1aLI4fTpRq+0vOIXgpTSARmmSoOthv1k+iY5kwmhFki
   pLo0l/sNuLXJrg9m8KuPDzXw2pIZEe7KCo8Y4g0ltIuIsaLIEeyN7tEpE
   4BiGFhwehoqXB9FrJ75pMcfP6mLCZRHpH9lzB7BGtg9Chq5+g5hFXZkc2
   xsiDzHASJCqcTehYUIbsSoUqGw/+d7DpiJISSMUPiOEUBNfdJbMIVPjup
   AZWKIvwkqi6yq66Pv3m01M/VHrHTBYrUNzMPLXh2OCsqlzY764Siz16IR
   MWTx8IB3BiR7mZcz999DjcXj1G0f9oGF6qL6sJIpGEpCta8FENL4b9zz4
   A==;
X-CSE-ConnectionGUID: q2r2xcdCRxGzucK9J6COKA==
X-CSE-MsgGUID: eyYvckszTEuHVkaYiH5feQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="215917436"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="215917436"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:38 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C38251002B99
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:38 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7D70CC008A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0842714000E2;
	Tue, 14 Apr 2026 10:40:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/32] python3-smbus2: upgrade 0.6.0 -> 0.6.1
Date: Tue, 14 Apr 2026 18:38:39 +0800
Message-ID: <20260414103845.1728-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126330

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-smbus2_0.6.0.bb => python3-smbus2_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.6.0.bb => python3-smbus2_0.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.6.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb
index 33613d9abe..1b9a879234 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2a3eca2de44816126b3c6f33811a9fba"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9b5ff1e998e114730f9dfe0c4babbef06c92468cfb61eaa684e30f225661b95b"
+SRC_URI[sha256sum] = "2b043372abf8f6029a632c3aab36b641c5d5872b1cbad599fc68e17ac4fd90a5"
 
 CLEANBROKEN = "1"
 
-- 
2.43.0


