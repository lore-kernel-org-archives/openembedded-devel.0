Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA95CD13D9
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12752.1762847745918828153
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QOse+p90;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847745; x=1794383745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hus92yqgGNabCogUGyJDC2oAi7w7EdS3ERA2/pn5x1w=;
  b=QOse+p90ra4xqU/go4wwh8lbjJkY/OsSAquD3mvTXk3FGseX/ZEQp7Cs
   THaPcVbkn9iq2ktVdzgBAaW92/5RJoEH9zmWXu//ZLVy4XawEbez/hQ5Y
   /mcYhmhDbsh7jKs71UlysU+t+tb67vl2+EWWPu2SFb75PGEx11eNIB0lH
   2bO+2q08WZTVpzOhmKWLm07QjxakZ2n7livhelZVYTi2VDoAusUqII8Qq
   XgEwBnTmGrxdxTfSoln4z5ZVjgT+EUkqGavYTtWZS4/NKY+AGpqnS6vJr
   BYfVjymb7FN/wHLjyIzQy5BkZsurXMm1PQZtksd8woUOm8sDgimtYZNgT
   g==;
X-CSE-ConnectionGUID: 8pJQvxH3Rr67oDhnMBM2AA==
X-CSE-MsgGUID: 8Jrv2aAgTjegmfNmeXmGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="206245407"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="206245407"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5FE46C00545
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:44 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1A49718002D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 98FF91800D75;
	Tue, 11 Nov 2025 07:55:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/23] python3-cerberus: upgrade 1.3.7 -> 1.3.8
Date: Tue, 11 Nov 2025 15:55:05 +0800
Message-ID: <20251111075517.1650-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121490

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Support for Python 3.14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cerberus_1.3.7.bb => python3-cerberus_1.3.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.7.bb => python3-cerberus_1.3.8.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
index 7ace68bbdf..c075f4279c 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
@@ -8,4 +8,4 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_poetry_core
 
-SRC_URI[sha256sum] = "ecf249665400a0b7a9d5e4ee1ffc234fd5d003186d3e1904f70bc14038642c13"
+SRC_URI[sha256sum] = "579554887ffd189226774b87570f4a76db75cf0efcbaffcacd5e98b8ee877f61"
-- 
2.43.0


