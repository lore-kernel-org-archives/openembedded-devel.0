Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236EEE92725
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:11 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40570.1767000602464050010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WflHKudr;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000602; x=1798536602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GB8a0Kt59NNxQwfFEp9d1G25qv0UpjrFQpx+nIpe0vg=;
  b=WflHKudrZJVrin/kSe/NzInh00kpC/oPKIU4vcST2am41YkFi560UWAp
   YNy7fnlDw6WsAtxaggv8U/YO1B5X4P8zBk1o/Y0RaFvN7Tm2ckxty/+4N
   RWmoL+NKnoiORtvONtKZpUstH1nLsszAlBmdiLp6DRmZUPTXqhWc1kCTp
   gDVWfBNbykNGFIDrGPbM5/7logc07ymvieg70SKbXaZVG1R5W8BQpXbuM
   Y3qfngRKrjnBYMtEM11gxG/eCt6ge0X6gC+oUQU5I1EaqqW/l6dzGC/Td
   z6/BBfjzi0yrgCXortCw02rG1bRNWCFK7TE0WjdNg5X0+wXnVAI9P7fqx
   Q==;
X-CSE-ConnectionGUID: yCbvPNejRG+DG+JVHQN53A==
X-CSE-MsgGUID: r8Yyq8I/RMWOEZtp5f7dwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="212187859"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="212187859"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:30:00 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9AEAA1C00081
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:00 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4F2A318009DD
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C5645100036E;
	Mon, 29 Dec 2025 09:29:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/10] python3-typer: upgrade 0.20.1 -> 0.21.0
Date: Mon, 29 Dec 2025 17:29:35 +0800
Message-ID: <20251229092936.1483-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122973

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.20.1.bb => python3-typer_0.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.20.1.bb => python3-typer_0.21.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.20.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.21.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.20.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.21.0.bb
index d12b681dff..cbd0df4b64 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.21.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "68585eb1b01203689c4199bc440d6be616f0851e9f0eb41e4a778845c5a0fd5b"
+SRC_URI[sha256sum] = "c87c0d2b6eee3b49c5c64649ec92425492c14488096dfbc8a0c2799b2f6f9c53"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


