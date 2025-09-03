Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D343CA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7935.1756890228719380268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pARqfLb5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890231; x=1788426231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X0n5VHrxSudApW8LtUfCv4NGHZ1QqWqr6ZRpiH9hkRE=;
  b=pARqfLb5xpWo3dbOgcLTCkdnPjPtVZQyL0A3taznyLEXcaIHDn5NrDEP
   l7V4SElp9i30ExhvfSHHA3VwsBkybKm5DANiAqdlDQ+yEXn5fgWgh0j0T
   a5Pkrh2op0YrrdB9ef67JjSc+iESRvUUuQa3d1gFXoXftpvusnawf+KAb
   W/93CPJiaq/B4z6hi7d1pZ05fnXDa3xEIEQeEFqy1bTtnwW+Tdc5hVFac
   5hCRiZeGJ/aF4NTuJE7fd+pDtmWOpkOnsHdek/4/GoMvqbcDUY5ZZllDI
   w7fnkGIZIj5K6UpABs4o5UGU5gHDdjX6TGgZCCMG5WExuqB+UaGY5lolB
   g==;
X-CSE-ConnectionGUID: 05QwlL3vR3aLag1mQ5xJ1Q==
X-CSE-MsgGUID: Kki4q6koSxOzxSyk0UJ3Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455942"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455942"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A4B8A1C00094
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5D6421C2AF42
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 34F731802277
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E1371A0087;
	Wed,  3 Sep 2025 17:03:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/56] python3-cachetools: upgrade 6.1.0 -> 6.2.0
Date: Wed,  3 Sep 2025 17:02:45 +0800
Message-ID: <20250903090317.2002-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119219

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_6.1.0.bb => python3-cachetools_6.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.1.0.bb => python3-cachetools_6.2.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.2.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.2.0.bb
index 702f87f94d..84899bd71e 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.2.0.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "b4c4f404392848db3ce7aac34950d17be4d864da4b8b66911008e430bc544587"
+SRC_URI[sha256sum] = "38b328c0889450f05f5e120f56ab68c8abaf424e1275522b138ffc93253f7e32"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


