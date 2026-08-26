Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7E8C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:53 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7617.1787731784456719103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DdePMgUK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731784; x=1819267784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tkor9UJHdWCr7xVCWL/iJN8ICH464bdBDBG+gdDsfTI=;
  b=DdePMgUKGWRvnsfTxc1RSof7/fYQ4ibXPm0QIYAXhdLMthBKPdmjtU/8
   BXZLln7MYEC+xuldfzsHluNEnabAG5uD0KVh1P407o50pup1Dp1/WK+0v
   mTn6FErkB4rZ/XdH50rDZos0Os/NfL38blpZQFmUIKomA2PhWlpzkepsV
   BaELjGfMov7AzpWcAgldP/u7iRFveX7NmCgS6pJignbjDoma+jMFrswxg
   RVMr1qdWGkxXQOoLWDx2qnIy1mx4cLIEyn0TRBX3thQEbSy7eW9tyao7L
   oY4vguEtEXHSAxOWr3mI58Nlwy2GrEYbJimFiyCrjnNurWSI0/zEk1M1F
   A==;
X-CSE-ConnectionGUID: +0YJUaMmQyS2+ZCqiQ7mxQ==
X-CSE-MsgGUID: C1nKHyOIRo6Pwn9TSsX4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="250877994"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="250877994"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9B82E3DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:42 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4F6131032B97
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5862814001C3;
	Wed, 26 Aug 2026 08:09:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/23] python3-astroid: upgrade 4.3.0 -> 4.3.1
Date: Wed, 26 Aug 2026 16:09:10 +0800
Message-ID: <20260826080926.989-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129499

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_4.3.0.bb => python3-astroid_4.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.0.bb => python3-astroid_4.3.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.0.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
index 81c5db78a1..2ad1135b50 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "2b5b5048d6edc40e748e2728790e444b81c3d358e19cc89db6e973236192362f"
+SRC_URI[sha256sum] = "bb359253d8ced6635a3881c17ebcbbc0e0b65ca23b555a9bd03c92a3cbf4caa7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


