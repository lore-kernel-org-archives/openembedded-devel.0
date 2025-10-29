Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C46CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.27253.1761696967208203478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RLRiO8rt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696970; x=1793232970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RxiaSS0jv8Cj2zNF6e1a9rW++82fKSbIUcireqSzTO4=;
  b=RLRiO8rtV/D1YEvvOaYU5nDmSeEIbMb3c3WtsDF42dPcfxbRtgUn4RoH
   dzfqnmOpYZGewwfUKOr4bQFxrk+bX1h7FMHo+ZB/91cBEzqlF1pKi7Pzt
   JIioT9UueLJVTLTdbMJyAckmsNbzt8DioVlTIH+05Tp6wZeJ6a+9C22/Q
   z0jZKoPDUAutQYRiV4EWDbfGPW735k/uhXHQpAwszo8O9an/h/saKRxK8
   +AmjHAkKXAu7QaElGWr94+yOKjRAfVT7elxD2qIDcUrhk2P6TuzGjog2o
   SsGvn8lAyiiT1j8BB41ZXwDbDy8YiezAK/cN5oJdUVK9ILMjfdpKduV66
   A==;
X-CSE-ConnectionGUID: g1ZVK0HhSgmD7+dRuy4aDA==
X-CSE-MsgGUID: Mvp4OayVTSquFTTcZdrTcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196243105"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196243105"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:09 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EB70D1C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:09 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A3AF1C0009D
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id CCF22826FCD;
	Wed, 29 Oct 2025 00:16:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/32] python3-serpent: upgrade 1.41 -> 1.42
Date: Wed, 29 Oct 2025 08:15:00 +0800
Message-ID: <20251029001505.528-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121133

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
   added test-requirements.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-serpent_1.41.bb => python3-serpent_1.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.41.bb => python3-serpent_1.42.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb b/meta-python/recipes-devtools/python/python3-serpent_1.42.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-serpent_1.41.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.42.bb
index f6c7b5443b..c165a02caa 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.42.bb
@@ -2,7 +2,7 @@ SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7c28f460fafe7be454fcdcac0b60263"
 
-SRC_URI[sha256sum] = "0407035fe3c6644387d48cff1467d5aa9feff814d07372b78677ed0ee3ed7095"
+SRC_URI[sha256sum] = "8ea082b01f8ba07ecd74e34a9118ac4521bc4594938d912b808c89f1da425506"
 
 inherit pypi ptest-python-pytest setuptools3
 
-- 
2.43.0


