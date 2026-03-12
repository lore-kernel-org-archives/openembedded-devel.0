Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3F3103E314
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18528.1773312801222598154
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MeycuAO0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312801; x=1804848801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nzlkI7DLd0UZMdh2j3QU7rSViRJZqzkLHncRxAG2PYw=;
  b=MeycuAO0RqdKY0APQ96I6DHUfPRJCrdYbkVoczmexspsUG1+Ne38Iqe2
   dse8XgN7/mPRD7356pyJGRSsc20FOsSwycyhT6tau5/m9Sp8xc8qcoyJ/
   +ZJfOZH/7ITOQtvn9Xxn9JjfNJT4xTQFNtTZaHlYwUXhV6JyPe29hfDpM
   MYRbhNMdjZWeazwQYhHoqlszLGrvgNjCaRJpqKFYa7Xw7s2kuzjxeriSR
   l8xcdMaIXJ3pSatyDii6vi8SLN3mvBrDMLmC9/bUlM+VjXCTJZK8ZnS5+
   iTQtZSTOhd69XBDk/PIFgfEJmoWWJU10lTE/oSxrP+RezsXZ1mgWxJqDN
   Q==;
X-CSE-ConnectionGUID: FqMMPHxvRs66pWdAbNf9qg==
X-CSE-MsgGUID: z4pZovGURPmMDqWHKCtQfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449391"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449391"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D94D54071DD
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8451C18041AA
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A2E0A18005BE;
	Thu, 12 Mar 2026 10:53:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/64] python3-apispec: upgrade 6.9.0 -> 6.10.0
Date: Thu, 12 Mar 2026 18:51:41 +0800
Message-ID: <20260312105220.1856-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125125

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Support links (#615). Thanks @kingdomOfIT
- MarshmallowPlugin: Handle DateTime fields with the "iso8601" and "rfc822" formats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.9.0.bb => python3-apispec_6.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.9.0.bb => python3-apispec_6.10.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.9.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.10.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-apispec_6.9.0.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.10.0.bb
index 4b6f3b51c6..52ebc43c6e 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.10.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "7a38ce7c3eedc7771e6e33295afdd8c4b0acdd9865b483f8cf6cc369c93e8d1e"
+SRC_URI[sha256sum] = "0a888555cd4aa5fb7176041be15684154fd8961055e1672e703abf737e8761bf"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.43.0


