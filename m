Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5876D68BFD
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37574.1766048644265359540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KPhC4iNq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048651; x=1797584651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=flQt1WMM8pZsL/+Hvjs3hVjmPa+d2gAclrFBjPx6NxY=;
  b=KPhC4iNqJC/MqPnF6FD/y2gtLHhP5btEpnlpjaTCdWDrnkYG8Hyg2fLc
   l4Ygp5spkoZeRvybxpZapQy6MhQXv/ApT1d4HrTipw+gRVHYrbGuiqZK1
   Wc8gZvo/TLFGkTd7eaHBi1lJ9ZMVI3FlFD9hlXfDtPTnrobGAuNc6K0ZI
   y/+lTl4TmnPZV23Qfvl6GIG/NvI6tUQzN1XA8ac2DctQ3du+h9vR+zlpD
   SF49OMVU0/xoLUNrcrp6wP/V3OKRuNihPhX0SxXaDpUWRSPMa26KGD5Tu
   eO/frRaaLkxDPlLFo46HfqnWgK7ieud2fvPil8Me6RaLPTn8z+UhMW/QT
   g==;
X-CSE-ConnectionGUID: lfXhymH2RnSzdodOYCySAg==
X-CSE-MsgGUID: s+WE0K3URdqIZBWGvRM+gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="227016419"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="227016419"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B6EFAC006C3
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6D70C8D9FCB
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EBC17101B4BD;
	Thu, 18 Dec 2025 09:04:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/20] python3-cachetools: upgrade 6.2.2 -> 6.2.3
Date: Thu, 18 Dec 2025 17:03:36 +0800
Message-ID: <20251218090346.735-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122744

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Improve documentation regarding @cachedmethod with condition parameter.
- Minor style and readability improvements.
- Modernize build environment.
- Update CI environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_6.2.2.bb => python3-cachetools_6.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.2.2.bb => python3-cachetools_6.2.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.2.2.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.2.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.2.3.bb
index f9eb66df8b..dc66db6536 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.2.3.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "8e6d266b25e539df852251cfd6f990b4bc3a141db73b939058d809ebd2590fc6"
+SRC_URI[sha256sum] = "64e0a4ddf275041dd01f5b873efa87c91ea49022b844b8c5d1ad3407c0f42f1f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


