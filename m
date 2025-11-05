Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24196CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2916.1762386265994331990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FEFl55pi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386266; x=1793922266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7GD5WoD858C9EcBrQ0NW6tPuiNAXmvrMzk8Z9c2t2sY=;
  b=FEFl55piYwPbagxEYmV+qJKqXSrTeRSqGlJf1A/0iSV0/lXgwZZB05yL
   WyJcqnEcORkeiLTEaBPfgDUR9P08LrH5BECqMfgEW43k2z91a1bxhY8jG
   IQb7aycc7cY/YkO45/sOc197cyCFgdCGFDoRVoYPYdUCiler5QBlRMOnL
   RzfsimU/SvvIRQ9eCFaeEWqKhkmNUl8c3d/68p1H7NEQuOXlMR+x8Pxrl
   BY/OxYnM+uJsd0CUpi+Ngcefx0dtZcjZe2QSvOxZ2mZ+nqdIr222QKDwI
   raM5IgtwEYHFoJHUixjAymplFoMqD7vqFf/drhFptOvynklA7jVPcjmir
   g==;
X-CSE-ConnectionGUID: 8zerY6//Sqel/AWChRMQYw==
X-CSE-MsgGUID: 8cXOfLUnSU+R8+fiGcnaqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197066956"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197066956"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:24 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 6273D821108
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 19842C00326
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9075A100310E;
	Wed,  5 Nov 2025 23:44:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/12] python3-virtualenv: upgrade 20.35.3 -> 20.35.4
Date: Thu,  6 Nov 2025 07:43:59 +0800
Message-ID: <20251105234402.423-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121348

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.35.3.bb => python3-virtualenv_20.35.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.35.3.bb => python3-virtualenv_20.35.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.35.3.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
index 3d9b6a097f..28444f12c4 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "4f1a845d131133bdff10590489610c98c168ff99dc75d6c96853801f7f67af44"
+SRC_URI[sha256sum] = "643d3914d73d3eeb0c552cbb12d7e82adf0e504dbf86a3182f8771a153a1971c"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


