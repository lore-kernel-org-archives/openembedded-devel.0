Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F526C44510
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3424.1784112010722241244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bhiWDqfW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112014; x=1815648014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AnVo2+tInCQCrL/s7F4hZS1OIpgbymv5ARSnMS3Y69g=;
  b=bhiWDqfWTDj8xlQNUnHnNpaqLvP2zX7kYPqtP24DlSH3z6waPj2D5SKj
   pSiJD1DOCRmQokWkrZeiYZMqg98OU2ocpFtkFgtFxn4BF+mbkWExYuNpk
   ql+OjnVIx1tTZJ3Y+oUfyU1jQyEZ0X/4ikkI1A1ZKAcO01P1Neylvubku
   14mn921Kkweb1mkGiAyiOFhnqXxmL1BcXE3JaxYGjhEBUwWFZCpfRM///
   SkOJQE3z72PQZOU0TByBvvPdP2HE64wlw2PldXYpaIcA0QJSSFdb0tjEV
   jnavYVFv2cjDTUdZCbIcF+gc2i5OS2PmIYy2C9Q7HPiiiCUVdz2TRLwxf
   A==;
X-CSE-ConnectionGUID: /wWQnvTARjuZXuNGUOUx4Q==
X-CSE-MsgGUID: H+yg3bJYQeicETErUhBlnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="235473307"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="235473307"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:13 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C7ACB407579
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:13 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 78286102095F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7A90B1801122;
	Wed, 15 Jul 2026 10:40:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/44] python3-pikepdf: upgrade 10.9.1 -> 10.10.0
Date: Wed, 15 Jul 2026 18:38:54 +0800
Message-ID: <20260715103914.2120-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128197

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pikepdf_10.9.1.bb => python3-pikepdf_10.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.9.1.bb => python3-pikepdf_10.10.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
index a0ab6f275a..7355c68c8b 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "410fcf32bc9c8a0a96d94bbd6268ba7585333b1423b93a5fa2ef3c05f4eba3da"
+SRC_URI[sha256sum] = "9f134806b2fe608ccb21379a664ddcefeac3f6944100d343b350299d3c69754e"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
-- 
2.43.0


