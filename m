Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484AAC43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16858.1782811357150392452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G3a18P40;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811357; x=1814347357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=woarjhTu20p7nPFul8Eqi0PaW+xnsNW5ZaaPjpU66IY=;
  b=G3a18P40MvqN88dHyCXZt35rmT1dfAx1o4EUSfSQXSiot0CvG+AD4bUR
   G/9qbZLMH6wJTnfL3RMVSAg9ZnNmZypwIvGIyRiJS5zu4ulH6zCiMWalU
   /a4WPtLE9qalDvZ1s7sm/HRz8x6BNpwp7nb9ePxRAcRdCj96lQxmXG+KH
   sqf2XkCcwIQlMIMakzPeggqh89weLf75vZ+xqa41wXA8mPcnFS/xFaX8t
   qtZF5N3G8dXQeKQkim+qlXKgHhxa2PCh989Ewo+fLmHw+H14lJbD9nIXM
   vTwJK0iMUCCz/FAhr3keTIw9glFLI87GCG43qatDxBaX/C0bU/X2mHIJ5
   g==;
X-CSE-ConnectionGUID: GPgg3YjER5imIDLu5AzMSg==
X-CSE-MsgGUID: i/TBaAPuR7C3BX36X5DG/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="249218230"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="249218230"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:35 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 928D91C000D4
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:35 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 433CDC03F74
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6AA5582DDC7;
	Tue, 30 Jun 2026 09:22:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/37] python3-fastapi: upgrade 0.138.0 -> 0.138.1
Date: Tue, 30 Jun 2026 17:21:44 +0800
Message-ID: <20260630092206.322-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127957

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Refactor Library Skills, make info easier to find for agents.
- Simplify pull request workflow triggers.
- Update issue-manager to 0.7.1.
- Update issue-manager to 0.7.0.
- Update sponsors: Add TestMu again.
- Update zizmor workflow security checks.
- Bump pydantic-settings from 2.14.1 to 2.14.2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.138.0.bb => python3-fastapi_0.138.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.138.0.bb => python3-fastapi_0.138.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.138.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.138.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.138.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.138.1.bb
index 6a9b79eb44..87bcadc0c3 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.138.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.138.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "d445a4877636ad191e7053e08c9bf98cb921a6756776848400bb773d1740c061"
+SRC_URI[sha256sum] = "96e3702dce09ee0dce48856135620d3d865ca684a79fe7513fd7b13a12f82862"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


