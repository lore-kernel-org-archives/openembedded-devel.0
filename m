Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45F6D3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4134.1765274204700998149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZeHJFTz7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274205; x=1796810205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N0i50lnQXSeznDh9WrOeI4ShAXtNzcW/vMlZ5lkZA18=;
  b=ZeHJFTz7QtfJExeZ3cZ8QifjqqUOm9adu78kfzYLBbSpK5tMcekkN/uj
   qcoC/EklZnQFX23MyX1aqCyKzGyTNzr4j9Te+YLexTKl9wOb8Bvq1c1A2
   pMNnoRDF50/XrF/kVsMXpycXCxbA/nv0ukcvzUgembTBkdtJiLldOtnQv
   dppfDY6GuXc3kFHAxkNwYRLLDlVEg1AJKTAl28rdNbtDIxn6FNPLHSbC5
   NLQd8Lpo885XsgLNfkZ172jU98fVbdWRTX5/iVOMHTvKkUyGbJ/woVrG+
   5CfQ+Y56P0JsZBT69U4ZLlO8KafbvEgRHtThuJbj0hMAQvsd3wZJISrJb
   A==;
X-CSE-ConnectionGUID: 3TjbaDkBT7qnB8axzNmMuQ==
X-CSE-MsgGUID: UUzZgQGtTzecywGaP7n38Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209421556"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209421556"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B6DC1100036C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:44 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5B90E1C00F99
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 0094B20002BC;
	Tue,  9 Dec 2025 09:56:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/38] python3-fastapi: upgrade 0.122.0 -> 0.124.0
Date: Tue,  9 Dec 2025 17:55:34 +0800
Message-ID: <20251209095552.690-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122424

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.122.0.bb => python3-fastapi_0.124.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.122.0.bb => python3-fastapi_0.124.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.124.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.124.0.bb
index 7dc5d833bc..af04dc0eba 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.124.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "cd9b5352031f93773228af8b4c443eedc2ac2aa74b27780387b853c3726fb94b"
+SRC_URI[sha256sum] = "260cd178ad75e6d259991f2fd9b0fee924b224850079df576a3ba604ce58f4e6"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


