Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4257AC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3312.1787132179675746840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kceokIP+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132191; x=1818668191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qTLVAQ1KiU2f2ADVXxB3LzO9nA1+YXqmC2op387uyFk=;
  b=kceokIP+bOqWr5CwR2BdODHDzBzVryGTf4cQtIpEvVPBjC8+qep9ViYV
   5Qv8z4I+mV8Uo+36bwNhRhv35AXpzqyxcv3lzkiKZ4zcsqvgp4nlMA/7M
   ghM0bhHRTd05foNpHB53xERLLsK1CMJupEcURE6dL6yG+LnxuU3CoaFyD
   b1r3NIaLJVKJKR247LLcZ/2z16ZpfVp7vJsACt8hM2SAw+nGc6G7XEpUs
   g3cK/bhgHrRpxxxQkvGxECi/ZCxFKDWNyCNH6sTru1Gt5GABd+G1kODYf
   Asz3n1P+m4dBYChgbpLXH5hTt44tNf1LRTkr5e1OcHMNcVkD7cH9ihjor
   g==;
X-CSE-ConnectionGUID: GDdVOHTtTx6ncXYkIGJ4rQ==
X-CSE-MsgGUID: PfrjfNQTQQmfmV3BVpxSpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251357073"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251357073"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 626991C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:27 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1D6D0148AD37
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 24B661801C11;
	Wed, 19 Aug 2026 09:36:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/70] python3-ipython: upgrade 9.16.0 -> 9.16.1
Date: Wed, 19 Aug 2026 17:34:42 +0800
Message-ID: <20260819093514.1101-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129308

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.16.0.bb => python3-ipython_9.16.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.16.0.bb => python3-ipython_9.16.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.16.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.16.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.16.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.16.1.bb
index b4bc03d47b..79aa7c1114 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.16.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=954609b5a3603364bc25989a92e38d67"
 
-SRC_URI[sha256sum] = "d2f92587b1ef51d84f934dffe05fabb9255f0038ed0a21426f2ea761e39ad09a"
+SRC_URI[sha256sum] = "5a3d1f9a47ff216d6cf9cf863124f6a2c1a198d1354c546a4d24a370a283b64c"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


