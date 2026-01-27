Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D5D2D8CC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6884.1769507063416976903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tFt2dtBG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507063; x=1801043063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GjvTizKPkgieJzVUdfZzzLxiROxcVGVjwb5kyJK7+Uk=;
  b=tFt2dtBGtdRchqa8M2OP1RKKU6Sr5MuHhEDgSARCW2DYF51KBaK9cQAt
   RIloAQtO1RJ+tlea4Je2lolove2OAatbZNF5dyG0vDKoQlAAivlFeIRL7
   mY8dXx5J5VVwger8WECv/Ys7HhlD/Ll3WnzcIhPOjeqc+AEmfJde/P9e9
   QNI+BFYxoneEMvTDb/7TlIauCPRy3G/DX24nr2Ro+laCbK4xZOtfUL19V
   oCRsnph9HxeFtQb1TJ+L2AgxpPF7xG2fqzB210YwyXIR0fy1/H7jTRBst
   S++vcGDGFAXuIEP0DYEMWE61qXCy+XK4iVddP2KVTXMXlBdD/3MzM+v4c
   A==;
X-CSE-ConnectionGUID: IZzUZ2+pSc+M40Hx8QAptw==
X-CSE-MsgGUID: +WgTYApdTdCRiiqIv0XOJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="215857484"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="215857484"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:22 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DABCF82070D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:21 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 905B9140125F
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id EC5A120000D2;
	Tue, 27 Jan 2026 09:44:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/25] python3-greenlet: upgrade 3.3.0 -> 3.3.1
Date: Tue, 27 Jan 2026 17:43:30 +0800
Message-ID: <20260127094339.1081-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123922

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.3.0.bb => python3-greenlet_3.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.3.0.bb => python3-greenlet_3.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.3.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.3.1.bb
index b25e781c19..1ee90f9f57 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "a82bb225a4e9e4d653dd2fb7b8b2d36e4fb25bc0165422a11e48b88e9e6f78fb"
+SRC_URI[sha256sum] = "41848f3230b58c08bb43dee542e74a2a2e34d3c59dc3076cec9151aeeedcae98"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


