Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1F6CA1014
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7935.1756890228719380268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=joDUHaQt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890230; x=1788426230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3u5Vp/E7ypjFqD1UbN7e/P0T9aglTh/jzUc7fyc2WZM=;
  b=joDUHaQtHFqGW7nrO+/y4auSn+NiIPuVgoR2Z6MEULJ/whgflcNaxYWb
   IXfQL4uSTZzVKFk8UnzuVbHZ2H+4KVX/9A4Vdj/kvgSw47dZ8DbkD/mJK
   nXjTHbeMLeowK5WZ343vaAxI+HgTIb0xtR9C0u2Vv204S+y/Fwz0d90fX
   aOc0LySirKUZo2Yb8MS2ZW/cm+6xC6nk5ZRLwDSpf3Hiqb9EPNEEWhT50
   AXLnSpAVS4y/Ybmx18Jyiy0UHwQrrHre0lu55rWVssCSY0SKB9ISNOrSl
   tHr8A4D5qt7zmGox1jkmJRe08cr+AYI7C/um+S6wYtri2hVCPQB07Su5Y
   A==;
X-CSE-ConnectionGUID: aixlz7R/RlCX7Hcwju3fwQ==
X-CSE-MsgGUID: li7klgUlQHGF88fYj21YTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455936"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455936"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 125F48204FF
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AA82918C18A9
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id C13D240CDCE
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B69341A0074;
	Wed,  3 Sep 2025 17:03:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/56] parallel: upgrade 20250722 -> 20250822
Date: Wed,  3 Sep 2025 17:02:41 +0800
Message-ID: <20250903090317.2002-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119217

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250722.bb => parallel_20250822.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250722.bb => parallel_20250822.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250722.bb b/meta-oe/recipes-extended/parallel/parallel_20250822.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250722.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250822.bb
index fc7376ce56..27a65ae1af 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250722.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250822.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "91a81ff4129cdf5ad3c3c45ec033e75f2bbea5447f4b6813a0d8cfe8e5c7843b"
+SRC_URI[sha256sum] = "019d328722867cffe918c449364308c0df048456c69299b91451a3e6fac9167a"
 
 inherit autotools bash-completion
 
-- 
2.43.0


