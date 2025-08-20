Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA07CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.15262.1755679211890592643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VkvsCsdS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679212; x=1787215212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m8C0aE6XAVhv5fAOCLGMoAk/WwpMGsPlazIJR0cgxws=;
  b=VkvsCsdSILncCaqdUB1FG9moRi9+ksaNfTjiDWiXQbTas3f0ylRfiijT
   IwmXEcKRb/AVn8mdBb6oLR2EQfH2wR13YSgrwzqlWWt24Vi8nvAruhgCe
   vV1DNs8iVxkI1BK8jx1zfAU5qc2GPBrw9CGY5uik4FpwdiPHwagyt0Bne
   +0NqQeRK2erRAG1US4MDI6wBtGnxTDD6y0j5F0zQOBQty142qXWFA0IF1
   PEE2X7CNmmxyfJ3l2vdPNaeGXMW7CQex6S0R5CpM464tkbgFF5WOmUvKf
   C1LDdphCqg3EUjod5XK3jwkKz4cj+o3sYoCNM92JIzXwnBT1o6yupV9zi
   w==;
X-CSE-ConnectionGUID: ZqVsII8aTr67J3PVFFLoDA==
X-CSE-MsgGUID: jcHAXPAgTRSg530De68zfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210094297"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210094297"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4FC511C1C702
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 098D0C060BD
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id D9B621803FBC
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA2F81A0073;
	Wed, 20 Aug 2025 16:40:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/26] python3-fasteners: upgrade 0.19 -> 0.20
Date: Wed, 20 Aug 2025 16:39:45 +0800
Message-ID: <20250820083945.802-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119038

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- InterProcessLock now catches OSError and handles BlockingIOError correctly.
- Remove support for python 3.8, python 3.9 and pypy 3.9. It should still work,
- but is no longer tested.
- Add support for python 3.12, 3.13 and pypy 3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fasteners_0.19.bb => python3-fasteners_0.20.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.19.bb => python3-fasteners_0.20.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.20.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.20.bb
index 22e58c5668..05cf1e09cf 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[sha256sum] = "b4f37c3ac52d8a445af3a66bce57b33b5e90b97c696b7b984f530cf8f0ded09c"
+SRC_URI[sha256sum] = "55dce8792a41b56f727ba6e123fcaee77fd87e638a6863cec00007bfea84c8d8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


