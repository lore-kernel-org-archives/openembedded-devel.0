Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DC1CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11085.1781686707999152583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oy3yblv5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686710; x=1813222710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jarX1k8QV0H1hMvRIL8vqzzbyvqbL0r+ecFn7UKaDfk=;
  b=Oy3yblv5I3ymp/VvtE84ZsK0Jd4Zj7IPsfCfBL5Mcrgy2jyhHSNJFO0D
   UkHHwGg0bQ2GmFbRw07+5VcOKoGIFGkN0ANTExQXIA0jW+6YGTs74mOkp
   /PrsO0pOJwQ5p88hgGhHXgeXqOWItzd7Fq5mHrxKz74BPbBUIZehX8l1q
   2FeciASFvpyoADUOY8m43M6pHFGe5agn9sGPqrRCnEbRkkOHsFtEIEWRb
   jWMnhF/8KhnpC0xbDPCZT2DqJ5Gfyhi3XjurMDBwpvGJaQjHjIE/riEDI
   vjy3GF+Tks75UZnDcjGgfQaq7je2FQopX0kJnqRH94wjGDAFsDvFicffx
   A==;
X-CSE-ConnectionGUID: yLRl3W/pSHOKx9X2GIilEQ==
X-CSE-MsgGUID: IKDWON+XSQayx+uuFkANFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="243835436"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="243835436"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:29 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4DA5D1002B93
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 097121400618
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2C2E91000A79;
	Wed, 17 Jun 2026 08:58:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/17] python3-elementpath: upgrade 5.1.1 -> 5.1.2
Date: Wed, 17 Jun 2026 16:57:59 +0800
Message-ID: <20260617085807.542-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127645

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.1.1.bb => python3-elementpath_5.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.1.bb => python3-elementpath_5.1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
index d89a012f9a..466b97ec92 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c04ab6ce886cc843af8941bb199406ba"
 
-SRC_URI[sha256sum] = "c4d1bd6aed987258354d0ea004d965eb0a6818213326bd4fd9bde5dacdb20277"
+SRC_URI[sha256sum] = "43d67a38700153eb45349c6e14a4d4b3a06e390c31df06539f730a96baf9a7fc"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


