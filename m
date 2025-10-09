Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB98BCCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:09:04 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.5583.1759990138321961362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HlDUd75F;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990138; x=1791526138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BN/eLZ2nl74nUdynzvYU7kdOcUicJ1Slx7rdAYbM91I=;
  b=HlDUd75FTClL8NhHNidMLPy6ZPLfItzN0dwvniomV0vNgkT/G6vUKTOw
   UL9AaPmMgdLQRQqnhy4GYxEuaQga2OxuTewJaMszaZWEe5jmrILh3WSy4
   dCjJTROlqBUtLOwbpBsErcdfTc5pfQ1MaHyBoMU+MGxQRoM/iiaSQpZrW
   treEl7BnptSdniT1SJcXl4HGz0nVfyMXg+y67VOw50CLOS9T4ABI/3Tfm
   BOajsF2WGkB4LFTNcOrN4G/izAvYtve0jQ0cJIIsccTYckBn/1up5Dqkv
   BllGOuqGZry2n5UgrV2Qt/FfBc67ZGwJu4fFgLy5UdnoZo3qECJhfUKEp
   w==;
X-CSE-ConnectionGUID: 7ConLm+BRZuAdy8q0+i3iw==
X-CSE-MsgGUID: 42KQZ6FgSeW+ZrjsjVRBMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="203403411"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="203403411"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:56 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BBF531C1C733
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:56 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 76C61C02F30
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 28F711001CFE;
	Thu,  9 Oct 2025 06:08:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/22] python3-typer: upgrade 0.19.1 -> 0.19.2
Date: Thu,  9 Oct 2025 14:08:08 +0800
Message-ID: <20251009060809.445-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120417

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.19.1.bb => python3-typer_0.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.19.1.bb => python3-typer_0.19.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.19.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.19.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.19.2.bb
index b731efcfca..eaa416f021 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.19.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "cb881433a4b15dacc875bb0583d1a61e78497806741f9aba792abcab390c03e6"
+SRC_URI[sha256sum] = "9ad824308ded0ad06cc716434705f691d4ee0bfd0fb081839d2e426860e7fdca"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


