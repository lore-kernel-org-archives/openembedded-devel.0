Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D667CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16791.1779875331619399937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bIwYHfku;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875335; x=1811411335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IMbDUxu5S1ZJvDrHSe1rCjYnt0pmre9RKJZEVi0Q0Fo=;
  b=bIwYHfkuHioWCLwcXaw7KJuodXf6744vZzZmHC+QsEjuWvqrDx0CKR55
   32jj4q3kHU91pEssBr/E5fmSGRsKCF58jSkcwhIa9X7HRfgvDdM4E5Vi/
   gp8LnZt56BjIKPqCh/2WtB5ARtL4CSk+16xCyrjunUpy+jR02/AQZZQ4h
   Q5qIYzApaE/fxHarhaVyJAyrjx1fKuckOMMMc0LXTw5TspW91RUcP5iZM
   vzJSmMep2KPSZ7P9uGg+mfzB+aJ2fwhmJptM1LGNH/Fav/CJDHW0oO498
   ujfF1LDkfq+77jJZ/NQ3guDMlqrsDghQ5YYETYusk52wZOh/MubkYezIA
   A==;
X-CSE-ConnectionGUID: x1bJVTitQvy7DpXCxjvckA==
X-CSE-MsgGUID: hRaSzVRQSA+FeWZvNR/IOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264201"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264201"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:55 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 212EF1C1C717
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:55 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C830AC09665
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C87AD82A2CC;
	Wed, 27 May 2026 09:48:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/56] python3-black: upgrade 26.3.1 -> 26.5.1
Date: Wed, 27 May 2026 17:47:31 +0800
Message-ID: <20260527094805.2039-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127229

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-black_26.3.1.bb => python3-black_26.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_26.3.1.bb => python3-black_26.5.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_26.3.1.bb b/meta-python/recipes-devtools/python/python3-black_26.5.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_26.3.1.bb
rename to meta-python/recipes-devtools/python/python3-black_26.5.1.bb
index 9589530d73..00f027ea85 100644
--- a/meta-python/recipes-devtools/python/python3-black_26.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-black_26.5.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
-SRC_URI[sha256sum] = "2c50f5063a9641c7eed7795014ba37b0f5fa227f3d408b968936e24bc0566b07"
+SRC_URI[sha256sum] = "dd321f668053961824bcc1be1cc1df748b2d7e4fa28086b08331e577b0100a73"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


