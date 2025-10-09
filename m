Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2CBCCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.5575.1759990113844112406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dQxmUA0n;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990114; x=1791526114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vg0F0Fig0j5eF+mpwCHNJpNns+G8lTLZcZZl4291D9k=;
  b=dQxmUA0nqQaE7Zi5o2cvT1gCfvxOo5f3OoJIqytbdw/6Y/r0/6YHNX6G
   nNoTDBgrs1xKao8IDXRyY8rEWZSY+P7FF0yXWXLP9sRrVd+B1t5P3whis
   VEjV51zIHSm7YW5K0qrQoBSuH/yMl1rOrMcfPa0Nhu/39rPsfzrr5zxDm
   l10k0nCBr2SNghVlMGyPcLVamwD6rGUnHWlhYYq89MeIJt/OUXPr+M/tV
   iXU50C6WnQ7sm8rrMkFYkirKjyunpP+kq9MmOdiXaiXZ0QpyQ5dHboQ2O
   NKjgVcGlYavksl4AjXaF/f7YNprxQVSQJjsFBmrQrGs9RZlyXRn/RAvDd
   A==;
X-CSE-ConnectionGUID: KnPq8Y6wT9K/nO45LYcKuA==
X-CSE-MsgGUID: Gi8DYmMRQ2uAkf1FjH4pMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="219034446"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="219034446"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 598A93052
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:32 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 10F701C00CD5
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9D99A1001CFB;
	Thu,  9 Oct 2025 06:08:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/22] python3-asgiref: upgrade 3.9.1 -> 3.9.2
Date: Thu,  9 Oct 2025 14:07:56 +0800
Message-ID: <20251009060809.445-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120406

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.9.1.bb => python3-asgiref_3.9.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.9.1.bb => python3-asgiref_3.9.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.9.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.9.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.9.2.bb
index 0af6eec5ce..078f425d2b 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.9.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[sha256sum] = "a5ab6582236218e5ef1648f242fd9f10626cfd4de8dc377db215d5d5098e3142"
+SRC_URI[sha256sum] = "a0249afacb66688ef258ffe503528360443e2b9a8d8c4581b6ebefa58c841ef1"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.43.0


