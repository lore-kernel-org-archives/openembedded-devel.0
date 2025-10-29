Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE54BCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:22 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.24201.1761696973564304475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kghsPVhi;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696973; x=1793232973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n3rSerV0u9aFTkPATX4Jr6EpVOfpXNpmsv1WKHSL8Tg=;
  b=kghsPVhi6AuqlprRk1ezqgnioE5Rs8ZXMxwzWIdZVagyqRg53dK7VtV1
   Kbtn8vq9r0CJq1B4n5Zz+8AXlIn1pfQ/8XFWZi43hpV4MC7MixB15sgDZ
   bwgu93NM9aw8/2u8PzoyBiRSWE7o7B5i19ZmgUDmSPloGAeLcCLAAzaEP
   PUJ0kJb2204K/14fbjQhkz5SMY9rFG2vpfrz3A7I7TcTFs3cRdGqZc6RM
   hu39e8bv3T6X5cZsabKxNJjpnuCO2l/gQF36es6nOz2yzu+CEaRRLbOsb
   IDMjd7iDJgiOl0jV++zFxhhe/FgJ0fYL1Wh/r2S1mZtOS8gHj8vKvX90D
   w==;
X-CSE-ConnectionGUID: VfK/5bCAR5GA3YIpEuH7Yw==
X-CSE-MsgGUID: J87uIJfgQPKh7qNFIddaCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196354404"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196354404"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:12 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1C6CC100034D
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CB592C00218
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 212CE82C0FE;
	Wed, 29 Oct 2025 00:16:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/32] python3-typer: upgrade 0.19.2 -> 0.20.0
Date: Wed, 29 Oct 2025 08:15:01 +0800
Message-ID: <20251029001505.528-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121134

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.19.2.bb => python3-typer_0.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.19.2.bb => python3-typer_0.20.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.19.2.bb b/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.19.2.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
index eaa416f021..db682c5d35 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "9ad824308ded0ad06cc716434705f691d4ee0bfd0fb081839d2e426860e7fdca"
+SRC_URI[sha256sum] = "1aaf6494031793e4876fb0bacfa6a912b551cf43c1e63c800df8b1a866720c37"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


