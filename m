Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A6C531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44796.1784715880346029216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tc1rQGJp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715880; x=1816251880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8X/1A3W+/o1YhAslHbnDIuxb+eIvb70o64mGTigiTfc=;
  b=tc1rQGJp7J2Ug3NVGCdzE2+AA+8yUm+9nzF725QNrf5UDBqNDxWvcYz4
   OuwVfa6I9vEm0w1aekdqlywHtqrbnCYCa0NS0ojjLZqoGpv0C3lEtC9lh
   O2qWTKYD3eRXt3XAmlhF335inDHxpIakGnKpGyEcJ5lxWMVskhVre4+bo
   0+MncKkyx8xqj75tVQWw2vPTZinE0pNOWudMwMyChVfXoY2Kl/mXDiAOv
   L5CNaTEnmAEYU6F1C1d7LAMI1a1hqex56jNgOP9VeM2eUCmIZlo4ysOuR
   EWxzSwdZBM/02zqoxaR8bG0C8jVjhXlEUDPnX2bwTZTtpS8SSCnjsmxIs
   Q==;
X-CSE-ConnectionGUID: 1NBz25mxR6a6NEpKT1Bteg==
X-CSE-MsgGUID: tQDn2z4rT8mxwb0GFtzr4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="227106953"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="227106953"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B368B42A302
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:38 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 63DD2180F57E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6848440433C;
	Wed, 22 Jul 2026 10:24:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/37] python3-rich-toolkit: upgrade 0.20.1 -> 0.20.3
Date: Wed, 22 Jul 2026 18:23:10 +0800
Message-ID: <20260722102320.1019-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128397

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-rich-toolkit_0.20.1.bb => python3-rich-toolkit_0.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-toolkit_0.20.1.bb => python3-rich-toolkit_0.20.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.1.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.1.bb
rename to meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
index 3c1e867edd..3f54f47790 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
 
-SRC_URI[sha256sum] = "c7336ae281f435c785acecaedc4b71d4b663dc73d9c8079fea96372527e822a4"
+SRC_URI[sha256sum] = "223dd2cfba325ed55e94933b9e53f3aca13e9fdf76622bd564c18109a2273c1b"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


