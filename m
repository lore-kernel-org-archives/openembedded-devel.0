Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3944CA0EC3
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.13439.1754296438419731426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wz7AWhLp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296438; x=1785832438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ajru8LkVyEAxfodLjQbx0F7dVpw0aVLpXXcaNNaccMM=;
  b=Wz7AWhLpGtYEWkhWC43fWFgww09WEpNTfss5kuHA4jJD1wOvGiMNx8UZ
   cgpGU7M0a7o1fceYVHNNktq020neCkSZZDnr086B5Orbe/vqtFuMQF6rD
   ryFWqRU+xWnuZyMrStEhzLCdopzwcZmYh4iC+Xd7yn0f1J0AocTXIDFaG
   EuH9F/YsOQVlGNqlQZppAEuSy3l1qIKVoLZoYhKgxjsT4S9rn7/D8qQQ7
   802KoqfUHmrS98xq9j9MwO2paOLp4kRyvrvCfrcku3362MSU5m6pyRwxK
   KMVC8UVUyW7CUE/Nkm3m85da5Q23o2Cm1fjBYPnwmk250DPvXdNTR6tBi
   g==;
X-CSE-ConnectionGUID: 3NmOc++/RWS7Le3VErRM5g==
X-CSE-MsgGUID: 0LUci11RRDGto2qSFVnqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208890685"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208890685"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C6F4A1000346
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:56 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3AE2B1800BFB
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3505B1A0071;
	Mon,  4 Aug 2025 16:33:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/18] python3-freezegun: upgrade 1.5.3 -> 1.5.4
Date: Mon,  4 Aug 2025 16:33:31 +0800
Message-ID: <20250804083340.1649-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118842

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * Fix: Ability to yield fixtures (broken in 1.5.3)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-freezegun_1.5.3.bb => python3-freezegun_1.5.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-freezegun_1.5.3.bb => python3-freezegun_1.5.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.3.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-freezegun_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-freezegun_1.5.4.bb
index 26b14fc8ce..a6e31228c3 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/spulec/freezegun"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
-SRC_URI[sha256sum] = "d7c6204e33a50affd7c7aa284f4f92e04e96f72d63313b89ceaaf60d9c64bc5e"
+SRC_URI[sha256sum] = "798b9372fdd4d907f33e8b6a58bc64e682d9ffa8d494ce60f780197ee81faed1"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


