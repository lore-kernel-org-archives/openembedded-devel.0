Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE755CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4297.1764669131770608971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MRjuVOde;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669131; x=1796205131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ke2PvJQ/qoZYAtEjtv4IrH+iSvOwZoMnjd8d9ijs5ok=;
  b=MRjuVOdeIVgDf6xF7Ub+gNvnTem5hNP83FH2XPWKLvOeK4m0OG3Yq7g+
   U2L32gPOC473pEBxQDvUNJaLRgLLPzea+2SQiC4bZngGjpXGky991t6Qh
   bNSditfsKu7/7YmaJFADnprkcaJUfDNfk9KVz7FzmAgsJMhhZOHabO+ND
   j3tT5dWlF0svCbVm9MLL0rvoeIFPwGyItw6HIELdi59W2HOpvOXGW2abf
   3FlJlag1aWGaMxuEa2jtT6YRc9ioROzyjTGQceAqmQhpKEIbCTFlmxITZ
   d5pxBfj12hGvATpqxz9mca3ZRvJWOWD2JBBy9mtlzNYTb0/gLsWYNwBIy
   w==;
X-CSE-ConnectionGUID: DUqYeoatTAq9YWEqqgkSXw==
X-CSE-MsgGUID: ApI3Ju+lQfGS2JCgqOfHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200028002"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200028002"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:09 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3A2411000352
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E324B1000467
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6DF03101A432;
	Tue,  2 Dec 2025 09:52:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/25] python3-networkx: upgrade 3.5 -> 3.6
Date: Tue,  2 Dec 2025 17:51:23 +0800
Message-ID: <20251202095132.652-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122249

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-networkx_3.5.bb => python3-networkx_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.5.bb => python3-networkx_3.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.5.bb b/meta-python/recipes-devtools/python/python3-networkx_3.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_3.5.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.6.bb
index a386313ddd..e49645db76 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7592b173aee2da0e062f9cfa0378e9d"
 
-SRC_URI[sha256sum] = "d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037"
+SRC_URI[sha256sum] = "285276002ad1f7f7da0f7b42f004bcba70d381e936559166363707fdad3d72ad"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


