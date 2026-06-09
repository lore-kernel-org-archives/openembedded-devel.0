Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92C2CD98C4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76251.1781001012412309304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HJJvYx/C;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001012; x=1812537012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FEPXmNzKejM9MMzREKY7TIToY7atXkbwt5HL6FGVazY=;
  b=HJJvYx/C7fuUWyDTQJN7Lx7C97bSB5ICfUiJ0eJg0WvejOOlUrz+szKB
   J7V8W0f9aSNDyuZCSv+T3ViofrNHHyuwOGcbZi9sSQ/ugV4/VQ8LK4UPe
   PGWLumTsuBHRNM/xDcWPC1QNpwnMQgo7Bbc0LiHiK83Oy1l4GNaesk2K0
   5j7I706z+81dN4YVl63R8Id1c+f0uZO1G6tRiC2HdmogmTGF7OLQxhXxR
   HwjXVhgfUvzy9eZXHKws8XMY8c9nduRKYU0mCKa5H4OGTOzpoKW34og6N
   xBjhwjidGL27WK2HoYSRcQQxyM3A7eqPb8J4VMDxvt9XrkqD6E2JRr/cG
   w==;
X-CSE-ConnectionGUID: MpwhL+gESyacCoITpYqEug==
X-CSE-MsgGUID: NPgTzL5wT9qSGHVZCtxTiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243544214"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243544214"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:11 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DD8FD42A305
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:10 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 92402C09B4C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9D18610003CF;
	Tue,  9 Jun 2026 10:30:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/30] python3-rich-toolkit: upgrade 0.19.10 -> 0.20.1
Date: Tue,  9 Jun 2026 18:29:07 +0800
Message-ID: <20260609102913.2204-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127478

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-rich-toolkit_0.19.10.bb => python3-rich-toolkit_0.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-toolkit_0.19.10.bb => python3-rich-toolkit_0.20.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.10.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.10.bb
rename to meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.1.bb
index cd171b77f4..3c1e867edd 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.10.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
 
-SRC_URI[sha256sum] = "dc2e8c515ef9fbb4894e62bd41a2d2960dd7c2f505b5084894604d5ccfee3f09"
+SRC_URI[sha256sum] = "c7336ae281f435c785acecaedc4b71d4b663dc73d9c8079fea96372527e822a4"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


