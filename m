Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBF8CAC5B2
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8229.1758704449044617767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e5Nzai0z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704449; x=1790240449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ooSZO9bOCp6j95cIRNFpp+Z4aa3M57Fpxko8bVU7u7Y=;
  b=e5Nzai0zAf/2mSJk2uYtYgcA/+/0mK6bO3TDgguh/RMV5dLPHAI/nREk
   1NO+EZcGnaSQQJz7ZwhHzeXEnQoDPXcTweZqEvYRPwJa0vEDENorYwBW+
   d0rya0C97KW3HEtbMS5ZQ3iRX1/95nIri1DfikfMrTckDm81euCewZSuc
   6UP0c12EfAhK9mMnZVULYHUwbTgi0KK3CowBlQZQzfS2b9a8YYh75orSw
   O2n5jutVZYC81CfS1386ulbZ75jYwFTntW6tn12l1FGCDrvVOQGTL6M4C
   mt0t27S8kAEZIIsx67H+l9OK1pcAOKNyr6Lx3aGogyj8/IQbs1mln3f/U
   A==;
X-CSE-ConnectionGUID: uOHY7+q9TBC9r9a55Qzheg==
X-CSE-MsgGUID: vvGsjYH0R+Odsac6eWHiUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="202273878"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="202273878"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 886C01000347
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4D39A1C00160
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id A70E01400BE2;
	Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C22781A0086;
	Wed, 24 Sep 2025 17:00:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/29] python3-typer: upgrade 0.17.4 -> 0.19.1
Date: Wed, 24 Sep 2025 17:00:29 +0800
Message-ID: <20250924090029.1786-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119792

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.17.4.bb => python3-typer_0.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.17.4.bb => python3-typer_0.19.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.17.4.bb b/meta-python/recipes-devtools/python/python3-typer_0.19.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.17.4.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.19.1.bb
index f3a995cfa9..b731efcfca 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.19.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "b77dc07d849312fd2bb5e7f20a7af8985c7ec360c45b051ed5412f64d8dc1580"
+SRC_URI[sha256sum] = "cb881433a4b15dacc875bb0583d1a61e78497806741f9aba792abcab390c03e6"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


