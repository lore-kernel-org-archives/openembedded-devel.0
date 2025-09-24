Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97988CAC5BC
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8322.1758704444729047245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nw83jhGC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704444; x=1790240444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EGF+TXWwSVShYZFi0m+gAz5jDXCilzlzEi6rrIL2Jyg=;
  b=Nw83jhGCXxCM2pB6Ff+1Q/3sEzXs98q+AHUQ0Ys10ZVVcy+I+Ec1zJ9P
   gx15h39eETbQnc+1sBnfMyh86INJLw+SWXOR44P91bVTD3CHshobEwpMr
   srG7IiFjihHb9al8DqtY4RBODTocBvYU3U+km66pv+BciSNHUKStT5TQm
   7GTUnfEg4P8m2atC8drtSIeHk2HBnBXCghZJyMhJTUr6HziTLOFNERHs/
   fQMut1FjLZVuTw3K+/m5d08m7Xw/qGu3rIDnemZYYe6By0oHzAOsqgOMN
   mkK7GMHgxjSQd+nPssoyW3gr7xW3xcxWvS3y7jNkpz8vHo0OAq7SZ2SLg
   w==;
X-CSE-ConnectionGUID: ReScVk+XQV2ZNwtx+C3BWQ==
X-CSE-MsgGUID: KV2xDTi5QjmgtAZ3ZU/NCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="214326376"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="214326376"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3752BC00562
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E1C87C02457
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:42 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 61FE1100310A;
	Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F1271A0078;
	Wed, 24 Sep 2025 17:00:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/29] python3-black: upgrade 25.1.0 -> 25.9.0
Date: Wed, 24 Sep 2025 17:00:15 +0800
Message-ID: <20250924090029.1786-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119780

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-black_25.1.0.bb => python3-black_25.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_25.1.0.bb => python3-black_25.9.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_25.1.0.bb b/meta-python/recipes-devtools/python/python3-black_25.9.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_25.1.0.bb
rename to meta-python/recipes-devtools/python/python3-black_25.9.0.bb
index f87b1e84cb..3925a9ff0b 100644
--- a/meta-python/recipes-devtools/python/python3-black_25.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-black_25.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "33496d5cd1222ad73391352b4ae8da15253c5de89b93a80b3e2c8d9a19ec2666"
+SRC_URI[sha256sum] = "0474bca9a0dd1b51791fcc507a4e02078a1c63f6d4e4ae5544b9848c7adfb619"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


