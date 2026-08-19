Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA9AC5DF8C
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3358.1787132231687944470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fsS4VNrn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132232; x=1818668232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b4xvUJ+9TrlheEYvtgiq/RI7W/k4fHPhUcVKvXmxQig=;
  b=fsS4VNrns3L/RkR9bQjqCJq/QHV2DqUp57TtjjoukTjSu3erorEkLjMC
   Po7Qs/3l4D8HQ21oKmY9994lDWgnqYYUPFRrDiO3rVwtwJLb/RcJXoB41
   21NvubE3ZRIsosl8vKAT/sJkCrU6YjT+p1xV1EL9Ic5H9cM8dhW9QfePj
   thVwKWv7LS1k0w3QJgZutJSK80X/i5eowyiSq4B15ooPidx7jc/5ePiwX
   DkOH1CU9bNwN7y/kYIR4S33O6/VdbD1HBovNwSm7I4EFYmwtrTF1mhsPN
   cSKlBQUiXTpSAiUPA4rog/5uWzkbDwVS4r7gjWxBTU4+XLhXSteGwKGfq
   w==;
X-CSE-ConnectionGUID: v/JIoqKLQKaJIZwNuu0nfw==
X-CSE-MsgGUID: HXZTrFT6RTuoO0KTP39LSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="250051595"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="250051595"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 27FE0100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D201D1800BC2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C014C1801C28;
	Wed, 19 Aug 2026 09:37:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 62/70] python3-trio: upgrade 0.33.0 -> 0.34.0
Date: Wed, 19 Aug 2026 17:35:06 +0800
Message-ID: <20260819093514.1101-62-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129332

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-trio_0.33.0.bb => python3-trio_0.34.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.33.0.bb => python3-trio_0.34.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.34.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.34.0.bb
index 5db81fcfb0..79c9e379a2 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.34.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970"
+SRC_URI[sha256sum] = "63b9485408bdfdde544fced107045a8c0086cdc4bd0ef2f797b9e0dd111b964b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


