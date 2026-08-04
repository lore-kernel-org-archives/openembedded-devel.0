Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81450C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10313.1785820766267479725
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Svlebyzi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820766; x=1817356766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HUSslAS2dsMC2DOemzqQS1KqjunbSNCIQuGWyqdada0=;
  b=SvlebyziF1R44mk6c3za6LUzHrC9Aq09hg3qfjFnV+Iyy40uE40K7KPx
   Q/6cR7GkAONdQk0lINkUfGjiOfNtjffu3h/ZpmDL4kacu4WafCjBcjhKH
   I54ocVmtbxKhAP9zW8CN1tNloIx6OqztyN+W0J8iwm2u6q7iZQFAqECia
   WD2usIzPq2vbK4yiB7Za6pRCVJamYRYGXQ444g5W8DlIqPSZpHtC7Y6MS
   9kQYN/4e54466uD3fkED/tna7Zka1h2q6ZGJcClmrxZ+KoFrR0EbVJFQ+
   sVHG57zJTu5cNBnzSTubukvSjQduIey08TxGbh4B5jpcuhWS8XUbIhW/S
   w==;
X-CSE-ConnectionGUID: jQsVvNzAQuWTz3QzjswQaQ==
X-CSE-MsgGUID: 068ZgJk6Qlikq6reLXJgKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249616356"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249616356"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:25 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9AD1E1C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:24 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4E13B101D691
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6492B1800122;
	Tue,  4 Aug 2026 05:19:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/28] python3-rarfile: upgrade 4.4 -> 4.5
Date: Tue,  4 Aug 2026 13:17:19 +0800
Message-ID: <20260804051726.1489-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128726

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rarfile_4.4.bb => python3-rarfile_4.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.4.bb => python3-rarfile_4.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.4.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
rename to meta-python/recipes-devtools/python/python3-rarfile_4.5.bb
index fe1bc7d7e9..028dcbeace 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.5.bb
@@ -8,7 +8,7 @@ inherit setuptools3
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "b7d29d671223cdc80e8b992df212d152ad88e6c961d4426c3fb2fefe8dd86fdf"
+SRC_URI[sha256sum] = "7425d0afa180f0092db903abb1526a130b36858980aad90b3694f48e41420155"
 
 inherit pypi ptest
 
-- 
2.43.0


