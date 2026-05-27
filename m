Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD68CD6E47
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16960.1779875363919899971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nvLJmBEz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875363; x=1811411363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bwHyEbUTsUWCxq+IVLdWhe3Y55FwtMXKspiJ49meo/0=;
  b=nvLJmBEzLcqWZbNooapPW6iFuOxmVGo+D9zNq1/z+niq9vmyC5G49VTf
   NgnaIRbVCxjzpKnPyTROVj+XcDajzjxQafBw9Nwv3noNUD4Hpg1qgLvLQ
   ra7Blr+2UDSofGSxm+MHgg/sdmJzdS68Ut/R9ar+x/Kx+VP0PIz2p1pWS
   jgrXPDZIMAFzH5SxDZeNiDlq77Kfcdlt0MvfPuNm7w/ejHT1O///7UnvC
   70uQJ4HfavLccJHDYRiF4qgotA5zHULjfE4/6cyL66tElmnJSW6vMaRLN
   GAodl4IzXZkW0v6N04r2L9JVuj4V2GJtkwVI96zsmcL3eL09yTP+YJaoY
   g==;
X-CSE-ConnectionGUID: 8HEadSNSSc6viliYnFkgFA==
X-CSE-MsgGUID: RnIOfjKpSFCuY3pOZmnQPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="220931931"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="220931931"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:22 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5E9B633C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:22 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0FCE71811549
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 254AB82A2CC;
	Wed, 27 May 2026 09:49:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/56] python3-rich-toolkit: upgrade 0.19.9 -> 0.19.10
Date: Wed, 27 May 2026 17:47:48 +0800
Message-ID: <20260527094805.2039-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127246

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-rich-toolkit_0.19.9.bb => python3-rich-toolkit_0.19.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-toolkit_0.19.9.bb => python3-rich-toolkit_0.19.10.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.9.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.10.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.9.bb
rename to meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.10.bb
index b971b41948..cd171b77f4 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.9.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
 
-SRC_URI[sha256sum] = "fce5c6f41f79382ecf60a79851b2543f627568e3e07c78ab4b8542e1ca247d1c"
+SRC_URI[sha256sum] = "dc2e8c515ef9fbb4894e62bd41a2d2960dd7c2f505b5084894604d5ccfee3f09"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


