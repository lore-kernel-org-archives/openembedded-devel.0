Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDCFCCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.11104.1760433619601511987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GmN3ZuCY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433619; x=1791969619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nBwN9blrCDO4rH3yWaWVYciXJSEBiCUqt+7JrEYq4eY=;
  b=GmN3ZuCYvhevNAOpWKWFECbv0XXW3czWuWyYjqANRgAOCUaEIso+MclN
   ALuZZtz4Uvf3sa8arvb5ma1voNovQ0L5tUehCQotSyjQcMD0Q2E4bG5pi
   HwENVKkg2+nMuxQwPivRXy/uwvXGLpID02YihCinefqrF4Lo7B+DgZWoF
   Olb1c1x5wRJY1fYjdzEiKKQftqMevtBe6RkJdr1EK9+IzF/Usd1h9DsJ4
   Psqu29zSEQCja93gkCosymjF3BZ2bTssFkjx/1kpkqNGCxHr/dRqq2BId
   X0qu9pBaT+Bay7rhMicNfePFE9IIR9H8VZqM+p1dndP96bEAGx4MB+GKX
   Q==;
X-CSE-ConnectionGUID: 8BHwK61ZTGuc59TtZA3i4g==
X-CSE-MsgGUID: mVwpfaOyTJGbiSF37f7Xag==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194722620"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194722620"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:17 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EBC521C0008E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A1DB41C0029C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 32AE5101BB77;
	Tue, 14 Oct 2025 09:20:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/44] python3-ipython: upgrade 9.5.0 -> 9.6.0
Date: Tue, 14 Oct 2025 17:19:08 +0800
Message-ID: <20251014091927.493-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120582

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.5.0.bb => python3-ipython_9.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.5.0.bb => python3-ipython_9.6.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.5.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.6.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.5.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.6.0.bb
index 058e83b373..b038be8a9e 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "129c44b941fe6d9b82d36fc7a7c18127ddb1d6f02f78f867f402e2e3adde3113"
+SRC_URI[sha256sum] = "5603d6d5d356378be5043e69441a072b50a5b33b4503428c77b04cb8ce7bc731"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


