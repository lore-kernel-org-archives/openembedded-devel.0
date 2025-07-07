Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97046C83F15
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.56129.1751879228940391649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kRbgie0E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879238; x=1783415238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7s87dLQsRc4tyVS7lrbmGsJxRco2WWoEo/RlOP8Qigs=;
  b=kRbgie0EZeKKTlCvSguxLP1dFmei7qt2UFZboePdiSfVWjfLm1kYRZpb
   tYTUu+14etr6TnG+XKMX9+YJi/ika6cnHcVCVdVH4O64jbNahLJlAcFaa
   MgvgSoHH906C534iWj7AudYNnC+XVlPvCfyUoIK/Uyeu6KyiGy3qQEFUn
   YrDBa85Kh+GGtlvKGdc5F2ZHkwTBEumr9bSIlxW61bCXqTFHdrOzXNsss
   u8ml5aG1n6IIkdQnIIMZBi8bw0awvuavQG+/amHljlNSRvbEm628H62ak
   n/VXvgt2UsPYF7qwo47W1pLk2OQor3x9KWQgP5GJ/cRw46IbzP+MLR1Ro
   A==;
X-CSE-ConnectionGUID: i8z+NalPQ+GrmuqRV1nn0w==
X-CSE-MsgGUID: 5qrNOdEGQnSvdKW1NGBzFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205437840"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205437840"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:17 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9AE2D1446
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 1A523C00D62
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 67E8CD4F46
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:15 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB5B01A000B;
	Mon,  7 Jul 2025 17:07:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/35] python3-asgiref: upgrade 3.8.1 -> 3.9.0
Date: Mon,  7 Jul 2025 17:06:38 +0800
Message-ID: <20250707090656.1216-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118263

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Adds support for Python 3.13.
* Drops support for (end-of-life) Python 3.8.
* Fixes an error with conflicting kwargs between AsyncToSync and the wrapped
  function.
* Fixes Local isolation between asyncio Tasks.
* Fixes a reference cycle in Local
* Fixes a deadlock in CurrentThreadExecutor with nested async_to_sync ->  sync_to_async -> async_to_sync -> create_task calls.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.8.1.bb => python3-asgiref_3.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.8.1.bb => python3-asgiref_3.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.9.0.bb
index 5d68b3e3f9..5befa43ae7 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.9.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
 
-SRC_URI[sha256sum] = "c343bd80a0bec947a9860adb4c432ffa7db769836c64238fc34bdc3fec84d590"
+SRC_URI[sha256sum] = "3dd2556d0f08c4fab8a010d9ab05ef8c34565f6bf32381d17505f7ca5b273767"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.43.0


