Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925ABC624DC
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9736.1788344982559648167
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rKkIZ3OK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344983; x=1819880983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cWv/gm+/B6xD9P5VrOOcY9kfPnU2AE//NIDhvQ1kDiI=;
  b=rKkIZ3OK0dtxZ+kDxZxDZ/8lVAe4LJNntecqdnboeti5sgVMbUQLJg8Q
   FvWadSUm2hCjMpTOE33fmCnNuuRIMxbU8DnppXoF+jvlNeJqQGYLSFeno
   /nyDqRbPge0AygEH2p6X62oUYF+pxELUHPoD/TDLQCyRUcs1VRB04m3wU
   QveL2OP/d+8VeeTPOwFz7kPffQtwZBRe1hKJNmdbhRXnzrHUry1s70yLP
   wUHvbynn3j7kSpapxTbkz90sLAOutLD8/l3yaY9jUw6PcCL4oJJsQzLGi
   TIzj/B/c1Jo7xqKvX1zYIDrvd6vWBFAM4a86sabPMZipr8Ea24M3v2dys
   A==;
X-CSE-ConnectionGUID: JEcQbiEbSDyjvb5gUMXn8A==
X-CSE-MsgGUID: EcAl5E+cTVyyWELkKrxYkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253592395"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253592395"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:41 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C33CF10000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:40 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7967C18026DE
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8ED002000771;
	Wed,  2 Sep 2026 10:29:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/34] python3-kiwisolver: upgrade 1.5.0 -> 1.5.1
Date: Wed,  2 Sep 2026 18:28:44 +0800
Message-ID: <20260902102900.1296-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129677

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-kiwisolver_1.5.0.bb => python3-kiwisolver_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.5.0.bb => python3-kiwisolver_1.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.5.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.5.1.bb
index 6669559fcc..e878f2678b 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a2c756dc2da8fbde2a254cae9a9320e"
 
-SRC_URI[sha256sum] = "d4193f3d9dc3f6f79aaed0e5637f45d98850ebf01f7ca20e69457f3e8946b66a"
+SRC_URI[sha256sum] = "f1303ef2eec81262a4b708c3e858afe58d7c75ad91c1c05266eda7673369859a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


