Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BD1CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76509.1781001010666241103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mo/nHiEu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001019; x=1812537019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=97yARwUMJDyOXEYHl+f1qw6DiSNS2XV7E+K9aUv2kdw=;
  b=Mo/nHiEua3seSYKWzNwwwtBlcd1RWwlVRBL0oQzrwMRoK1g3XxyXsDLd
   7NKJoIKLd886shruPnVRURNhmyB9uxgayEWBvdgXHgqpro73NLpRZBVXX
   5kklfALZKEzHPag+NPR5Jx8tzf+jHt++tRkNsi2TSUxIn+tplT7URU035
   K9RC0Vm9AAfX8wCkGQ5czUU2QqBjj2o/x7Mn8k+aJSoCYpUJ3Au1nUJQY
   V4J45d2fA3ymG/muVgidwbG70f3kiQQ91jfdU8zql0Xhl1UTAhzQk+lQm
   XDa+fVI8iVgnTUMj5aSOc/ycZRy0fpivgoN38Kz1ufBm9jMLRYzMoUXq8
   g==;
X-CSE-ConnectionGUID: is0YmMT6TWa5DQZPXn3LBA==
X-CSE-MsgGUID: ZGh66At2RFuYWuC6m/HC2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="229674142"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="229674142"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C118A277
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:18 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 72680C03F6C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7DDCF10003C5;
	Tue,  9 Jun 2026 10:30:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/30] python3-uvicorn: upgrade 0.44.0 -> 0.49.0
Date: Tue,  9 Jun 2026 18:29:12 +0800
Message-ID: <20260609102913.2204-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127483

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-uvicorn_0.44.0.bb => python3-uvicorn_0.49.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uvicorn_0.44.0.bb => python3-uvicorn_0.49.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.44.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-uvicorn_0.44.0.bb
rename to meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
index ce92c96d8d..7145973628 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "6c942071b68f07e178264b9152f1f16dfac5da85880c4ce06366a96d70d4f31e"
+SRC_URI[sha256sum] = "ebf4271aa580d9de97f93192d4595176df6e91f9aae919ca73e4fc07df1e66a3"
 
 SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 
-- 
2.43.0


