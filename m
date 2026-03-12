Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E64103E30C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:46 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18743.1773312760632654877
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dvRfqOlT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312760; x=1804848760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VB9JSlV9e9MjBnud/VJC41DWvg2AAzAAZYuc8a86jDE=;
  b=dvRfqOlTyR64udWyn2TUJTARnBM5pw5sAR7NJlvtiObgMpe0JAnLVaQk
   pXtAIuzPrKaicdjLhd2pqGxtiri+7GGTKEZR1jiyBUpP0gXrFl+ZuF8rq
   6vX9JWDlQrTLauS5VAxf31y9/VNICBiYDgeEXEbTa9O4ugF0aHziSitC6
   N1LExRBlza27szuyBakJvrWpkhX2THuYSD5DgvC6hYMSomrexlE7ok5GJ
   CCjL1tiju1ZsIa5p7EqANCzIGOddSpmT16nyqAdgABVRSP3VnbRXH4pyk
   A/Fm8ysymIoUaLpcRnfViHgLMW+g/UzbINBJ8E5Pwr0dz3xMtySo7kXY8
   Q==;
X-CSE-ConnectionGUID: bsMmvLoYTK+7/nHQhB5ueA==
X-CSE-MsgGUID: zOG1TTjMTBueDh5J1rG4RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449353"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449353"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:39 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1E7805C02
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C5C43C01291
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E1BB218005BE;
	Thu, 12 Mar 2026 10:52:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/64] gperftools: upgrade 2.18 -> 2.18.1
Date: Thu, 12 Mar 2026 18:51:22 +0800
Message-ID: <20260312105220.1856-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125106

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  fix for compilation failure on PPC.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gperftools/{gperftools_2.18.bb => gperftools_2.18.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.18.bb => gperftools_2.18.1.bb} (97%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.18.bb b/meta-oe/recipes-support/gperftools/gperftools_2.18.1.bb
similarity index 97%
rename from meta-oe/recipes-support/gperftools/gperftools_2.18.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.18.1.bb
index bc84ba54c6..f2244c43fa 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.18.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.18.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRCREV = "6ed73507dd3970a123e267a50b3ee73392e3b053"
+SRCREV = "d837a42788ba591d5d791c3b686f2738e7a93562"
 SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https;tag=gperftools-${PV}"
 
 SRC_URI:append:libc-musl = " \
-- 
2.43.0


