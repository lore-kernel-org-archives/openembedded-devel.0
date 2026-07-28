Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E1CC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5781.1785218839448015618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pDRX/2Uf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218839; x=1816754839;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qp82oJOYf8imGe9wkuyiLpnOFz70TroCiDXKe5MO0pc=;
  b=pDRX/2Uf/XD68YseuNjUSra17rJlWr2kleGMuy6VhoL4DAAozeM5KCuM
   d8u7j2TK6XcRtSQEIRAeo+I4RwGmEweJjKFI8cLLPJxPiW8phPZCJIr8r
   j8Ot59GiZqcvFQJHkDd5hO+ANVK7mrRB/Ioq8JGOCckoHgNEVHpPRjX9s
   SOSJnPwUqPb2WFRvVdDSwXaDW4WuvXkxZ9gtyr9+Xz5H+okhP53BeKqTJ
   69KZpAw1DJuQF+c1VJ4dnXOvuRW3ncvP0B8bmP/9RTX0Oe1nn+XYKk8pT
   7fH3PtBranBg29KcKFupbSs7BlXRJ4Q3EH5MDzqHDdoKmQhIkyKw67p/k
   g==;
X-CSE-ConnectionGUID: i8BcUH/6S2W0YxOrwroWew==
X-CSE-MsgGUID: bi/ml0VqTI6Sw7WJMxhKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248832240"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248832240"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:18 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C64E81000361
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6AE791C0028C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:17 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id BE76410005EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:15 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-pytest-env: upgrade 1.6.0 -> 1.7.0
Date: Tue, 28 Jul 2026 14:06:35 +0800
Message-ID: <20260728060645.819-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128492

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pytest-env_1.6.0.bb => python3-pytest-env_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-env_1.6.0.bb => python3-pytest-env_1.7.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pytest-env_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
index 860a534aaa..0930573448 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b70ef84b3d8d608b13b0287ed49df651"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "ac02d6fba16af54d61e311dd70a3c61024a4e966881ea844affc3c8f0bf207d3"
+SRC_URI[sha256sum] = "0c1dc1101fb8d3ab3611e8f8d657ba06c3c0c167fc85c90457e5b27f2508f43e"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


