Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475DCCAC5A0
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.15061.1758015728104745413
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QmYMvzML;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015729; x=1789551729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EzasBMngIuE+ID0+kO2DXm9hVsH17Ua1DdwWZI7RmxE=;
  b=QmYMvzMLIBuDyK9evyPgtV2UgORVU6sMhkPNNS7Vj26aYn85o8WpmlFE
   5xtpgQNGrzx/IXESyYSItAmYbtiC0ihY25MVjzcjXQXRDI6yKkwkjXYGS
   bLuwOgpS0V8Yu1taSX7kf/HaCHUQhn0tIpbm8X07jsGnVJg4Mug9RZDFZ
   1UfRMc1Z9ZHn3fdR2kB9fCQEqPa/YRQZNa1B18UZHb5zkouCxt/TKVYua
   Vc+WquEtgxxTksbSMQVvnAMLJqaMEdy24Q1JxNF7FsdQ105woz1QAj2FF
   0CLR98FT7re3jWj4ABXQ75ht0EnEU5m+Ram76awj+v5lPebCt1GqC1Kbv
   A==;
X-CSE-ConnectionGUID: tIHbD076QK2L7LcpMRfbeA==
X-CSE-MsgGUID: +mcgjh2bTn+7KIKz3VNoHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200927282"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200927282"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0B8B58203E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B951C8D6FA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 05CFB2003490;
	Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FF961A009A;
	Tue, 16 Sep 2025 17:42:02 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/42] python3-expandvars: upgrade 1.1.1 -> 1.1.2
Date: Tue, 16 Sep 2025 17:41:32 +0800
Message-ID: <20250916094152.1479-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119444

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-expandvars_1.1.1.bb => python3-expandvars_1.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-expandvars_1.1.1.bb => python3-expandvars_1.1.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb b/meta-python/recipes-devtools/python/python3-expandvars_1.1.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-expandvars_1.1.2.bb
index 03e3d361b4..6fc4489328 100644
--- a/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-expandvars_1.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sayanarijit/expandvars"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b2e744064bd184728ac09dbfb52aaf4"
 
-SRC_URI[sha256sum] = "98add8268b760dfee457bde1c17bf745795fdebc22b7ddab75fd3278653f1e05"
+SRC_URI[sha256sum] = "6c5822b7b756a99a356b915dd1267f52ab8a4efaa135963bd7f4bd5d368f71d7"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


