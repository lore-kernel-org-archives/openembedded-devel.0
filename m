Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0950C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9394.1788344986592877400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZoS9Mo5e;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344988; x=1819880988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Avq9NmMJqnzGvveENBgOXYZM6f4qDBxtlj2nM4Vr0QA=;
  b=ZoS9Mo5eQ9s8fMMF/qRGD8iNsIMPGAJRaPdz+vsA7A/yrjjuswZvIA8R
   2Q6nZoGpYDGFb4+OYXPXGardVUW8avKo3TFhsCzwwGGETZMHE4oqVBVIW
   +QV7b7oOjf9P3lhHE6FuM9jU2j76IZj5CEk6SVD9bVlcDThlhq/2n0YVw
   ZcWPCH9Ofcaa+lnrGSgVxmnh6A1Wiek0duZvds0kpk7VA8ztHQ5RS8xDP
   PQ10eRYy3ddbUyVa0GOAU3iOJHiLwGtRCbaHjk+EUnI+8CJ4KbpoFRtwB
   9d0MiWAT1tUISXrsu/vppGE60YYdOLwteujEZwCGv9gEp9An0/qTqlx9o
   Q==;
X-CSE-ConnectionGUID: Do4LLe2JSb2+PnZyP2AklA==
X-CSE-MsgGUID: 1b76+eT2TlOUOB20xMWIog==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545564"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545564"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:48 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 630F65507
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:48 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EB2D71C00174
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 17DAE200076B;
	Wed,  2 Sep 2026 10:29:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/34] python3-pyais: upgrade 3.2.1 -> 3.2.2
Date: Wed,  2 Sep 2026 18:28:48 +0800
Message-ID: <20260902102900.1296-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129681

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_3.2.1.bb => python3-pyais_3.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_3.2.1.bb => python3-pyais_3.2.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb b/meta-python/recipes-devtools/python/python3-pyais_3.2.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.2.2.bb
index 2343d82dcb..cf02a1b02c 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "e69a48b31f04ff1bb8c3abb24a311b558a329944"
+SRCREV = "bf1a07fcac5c42d49d682635bba44e493d5e6025"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


