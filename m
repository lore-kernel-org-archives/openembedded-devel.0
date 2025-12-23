Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6915E6B27F
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:12:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95981.1766470312197547361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ho79yNJT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470312; x=1798006312;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FfM/pLB7/oMZpNLbU5QQH/75sqy3Q3EqA9/JRzbvCVU=;
  b=ho79yNJTanhQXyCwplFusf6kkxKWOKF3BYpuMdYMcBe97mnweEH0ctWg
   hqfnPjEiwQtjA5+pkL0cIlfvnmQ60XNWfQctwrrfJXbJSuyBfLCBGiZmD
   MNxj7EW/zXUTh/frlq6fPNXcNWqyVpLZGssh/3Yoxl796R/G0vFngNJnI
   atlsoCt6vY1FDHLCoWiZ7FvtSb4oWMzRLKztW2KoCIeyHSpcDOMNMpvW1
   Huff93KhXp8shmMHYZhOo+5/0KWoOU/Pg5ZkDy9pg9e45t8T1w9Tlus87
   mApqgXDZJm8/4iPVX7qq6mnfFcGFIz5im2iAew/b5Ty+gcIvC8LRl0eIK
   g==;
X-CSE-ConnectionGUID: eARkwS4iTJuzxJ8JtRth1w==
X-CSE-MsgGUID: DoLHLzrGQ/ONZnjKdTej2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="202559022"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="202559022"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:11:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7FEE81C1C718
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:50 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 37C8918000F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:50 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0C2C210005BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:47 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 7/7] python3-uvicorn: upgrade 0.38.0 -> 0.40.0
Date: Tue, 23 Dec 2025 14:10:42 +0800
Message-ID: <20251223061043.659-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122823

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-uvicorn_0.38.0.bb => python3-uvicorn_0.40.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uvicorn_0.38.0.bb => python3-uvicorn_0.40.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
rename to meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
index b0ce49be97..56d58ded0a 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d"
+SRC_URI[sha256sum] = "839676675e87e73694518b5574fd0f24c9d97b46bea16df7b8c05ea1a51071ea"
 
 SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 
-- 
2.43.0


