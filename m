Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F11BC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:01 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9743.1788344994619929356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eUX28uuR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344995; x=1819880995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+QVHsGiR67OH46GqNpXWq2inYzCntkbc0BpJUTJqnmE=;
  b=eUX28uuRi8JtNgTTRtVZokOhHXYvIQ+nRpMlgRpVfH82s3Z9ikD7qOMY
   hca6mwTy9+pbBNVZEmWAmisWbMgWrNVivsuL8vaVLV0A9VNv8JSwOf2OO
   Joh9rIrhYhHNlzSRe6QIHSlRcYw9T3ywPTJWU2cCYg23LI6+bwirYogPe
   kKl8WyyWY1JyqGkG9/pJp+yVkV65IeTbnQyjMmbJZxxdwGL1Fia+ti+52
   re2dnOF6I9CEPjKtgQH/bDi82tXNXkhOC+sypoRrPuib1VjmtkH9CDXVc
   8P8NzjCIdb91Oe+oblULnRGwcQke+Qt+Rq4mdkWAEXw7zlkqayyAnhsjh
   Q==;
X-CSE-ConnectionGUID: 6SrVmx7UR32GWBPzT0s4kQ==
X-CSE-MsgGUID: jvS44J+pRi+S835k9zEH1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253592411"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253592411"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:53 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EEF1010000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:52 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 949591C00174
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id B4DD72000770;
	Wed,  2 Sep 2026 10:29:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/34] python3-responses: upgrade 0.26.2 -> 0.26.3
Date: Wed,  2 Sep 2026 18:28:51 +0800
Message-ID: <20260902102900.1296-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129684

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.26.2.bb => python3-responses_0.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.26.2.bb => python3-responses_0.26.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb b/meta-python/recipes-devtools/python/python3-responses_0.26.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.26.3.bb
index af0eb88b47..b85279d11c 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.26.3.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "9c9259b46a8349197edebf43cfa68a87e1a2802ef503ff8b2fecbabc0b45afd8"
+SRC_URI[sha256sum] = "b0c11ca8131b8b227b8d5108e6ed39772222bd5aab030ed430e8f99057c4c409"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0


