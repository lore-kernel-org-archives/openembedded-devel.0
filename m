Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E68CCDE006
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7025.1782378158131322016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ugfjd7dg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378158; x=1813914158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fAjQV4vmtavE3852hf5jVQQX7x8k5xPC4rHVyhPX3wc=;
  b=Ugfjd7dgBjrqfqHV0SUn7Qzg4mns17G4IHYsZcmg2SCmrkYMuXVO7X3C
   g2D/+Q+nujRdmcUtG7X4Y1RFBamkoXBSQWb1XiOhQMdBYFvQrAzQoN2oC
   NDuzDR7hD5e/FynaS1Fs1hx+IYjNWfPj/oUOOQdIf9/dYkkIMcGEf8Q4F
   skTAo2T6CnLqDS9mtzHB2GAn4JPPHO04OoDdlfMnzP5I5ryOVG5vsChhK
   sNa+Rou2YoDe+CStGOP4eDjnPXaAhfsoz4pAo8bFPPFLZ58EIQ56A4zVV
   7EL1c9bSPjFEcLFnuOql1J8sZga56ejWtTZUKO9uj5Sk4WiWT0AJv4c08
   w==;
X-CSE-ConnectionGUID: rEfrYO3FRja3iU93vTKtUA==
X-CSE-MsgGUID: 24tq2lq9TjuBdVENKNgXug==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743192"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743192"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:36 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9879D100016B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:36 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4B09218ABD3F
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 682941017328;
	Thu, 25 Jun 2026 09:02:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/47] python3-tqdm: upgrade 4.67.3 -> 4.68.3
Date: Thu, 25 Jun 2026 17:01:21 +0800
Message-ID: <20260625090127.1563-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127773

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.67.3.bb => python3-tqdm_4.68.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.67.3.bb => python3-tqdm_4.68.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.67.3.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.68.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.67.3.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.68.3.bb
index 1637021999..333455a3d4 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.67.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.68.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
+SRC_URI[sha256sum] = "00dfa48452b6b6cfae3dd9885636c23d3422d1ec97c66d96818cbd5e0821d482"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.43.0


