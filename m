Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A6CC624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9394.1788344986592877400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=incFXfFR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344995; x=1819880995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=brTZT8VllkqU/Iht3gGwsm1FKI3NysMrnBP39ubfMYk=;
  b=incFXfFR+xvrMHjNZD6CHSeC4zcJUVq8vQW2ghPJCEKSqrkmZCzYptP/
   DiOVVYMbTDieEgZrzybrX/nRoFX4bap9rrdibeT3BhVunn1o5ykcLxjHm
   1hx7FKsE2O2L4QRsYoaTt2VgSKyuYzBo/fTNtuz82/kg3Nd0ldKyzhM12
   33pDew+HiTwRFh/PYjmIC+/ODwq0lX8FPS/k2ZbD8kX6ge6fgW5HRMWf9
   ciGmUdUm//3Wzxx7x6eL2OtxzMMO7dEJa+xAe6wtJDIgVWr0tzvMOTWoy
   8zixOeH01CHOCv69fGAIlBHbBTTnU3glGX+iFqW5WCItTinVjQTjU1ZZY
   w==;
X-CSE-ConnectionGUID: A00IhmG3SLe+mpsiYDl/sA==
X-CSE-MsgGUID: gGVsZ43LTYCGevDu7nOw3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545570"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545570"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:54 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A07D71C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:54 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5141C1800261
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 4C79D2000224;
	Wed,  2 Sep 2026 10:29:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/34] python3-tox: upgrade 4.61.1 -> 4.61.2
Date: Wed,  2 Sep 2026 18:28:52 +0800
Message-ID: <20260902102900.1296-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129685

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.61.1.bb => python3-tox_4.61.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.61.1.bb => python3-tox_4.61.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.61.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.61.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.61.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.61.2.bb
index f1ddc7d723..45584298b5 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.61.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.61.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "d41ff6eb434d71763740ec90d869cb82688e6ff9204c913d8bea13fb75fc8f9a"
+SRC_URI[sha256sum] = "463b6eeaaf0929d60b4f7a87b26f4a7a764fe9832a74bf50b4e9d259b6a8e905"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


