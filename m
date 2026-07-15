Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22242C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3447.1784112020077028792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lih36h4V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112020; x=1815648020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NpUVFUBeCca2HDRnMhtAhII3ZZNx8ju62cBr68cBD8o=;
  b=Lih36h4V+KmogxRs7VdYH4GrMQ6sziXjk6Hg51V8WOCAWS130N6017VR
   nO1+OwgWv8YAMqv4YN9bWOYF0R957eXb5dK27lTNdSsV4IaQm1fegoHyn
   42w7z/WJZYyNN65IW46Nju0xjygRQSJ0krupnGh494/3bt4HQ9cwu/QxT
   5J5IEKSRfc1AwgMzJKjoeM6GYi3YYke8s0hlMg2pe4Qj2tpAkjgsbTVt0
   9Orrps4P90qQ3pt6nc9XuUFrUuQbQ6kSruau48YJGV+ePsF2hjzRZbjZT
   i1luRIaZfNybQ7iGW2vvT7o13bi8rUeA6BsFZ2h9TB2vFt3yD/nDH28Xe
   w==;
X-CSE-ConnectionGUID: wKibj6EMRD6Fm7QFe1m6WQ==
X-CSE-MsgGUID: SZubQwJ9T5m9jjTw/kqhbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247513120"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247513120"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:18 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 630EE1002819
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 15C148606D6
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3BC101802731;
	Wed, 15 Jul 2026 10:40:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/44] python3-term: upgrade 2.5 -> 3.0
Date: Wed, 15 Jul 2026 18:38:57 +0800
Message-ID: <20260715103914.2120-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128200

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Remove deprecated license classifier.
- Upgrade .readthedocs.yaml.
- Upgrade sphinx and sphinx-rtd-theme in docs extra.
- Require Python >= 3.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-term_2.5.bb => python3-term_3.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-term_2.5.bb => python3-term_3.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-term_2.5.bb b/meta-python/recipes-devtools/python/python3-term_3.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-term_2.5.bb
rename to meta-python/recipes-devtools/python/python3-term_3.0.bb
index fe0aabf0ff..b4f801bf4d 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-term_3.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
 
-SRC_URI[sha256sum] = "846fda941dbb8a7c9f246e99bf5ee731910fc4a4cc54b7e36457c133c9f6b78b"
+SRC_URI[sha256sum] = "a6a81535e68fd98d25b1e2a1dff15400c5678e7f942e2d5bb5bde56784534d98"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


