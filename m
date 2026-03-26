Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E731E10A3D67
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:43 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46424.1774526260077735084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YNJtgbpM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526260; x=1806062260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mHpNPmGRCYCeR95Ny15zL+8GU5ZNczCZjCiceL2jS0o=;
  b=YNJtgbpMlFDZem7Y/6Pm4Q02k1buTsBMg7XhG5DAWxqt21uLKiA8r4gL
   swv/ZAlhSjGYYpyqPHn4WnEQzyVkrQ0Q7Z2XQeqqGROH1L1hVWe3sCxlB
   YHumNRDIc7kG6PtY+TL8ZXUAL7Z/mTYdImrTNf2hrVys7a9KxdmbkK1MC
   DkHMyqevZ3fsxozXgh/QT2H/+oiBR0r4Vyrb0QxYSWFCVNT2eh/CZGWUq
   3v13KKJOZIzBd/SuOTWxnKuNz/MSkBUJcpgCuRaZrOy5piXRyCg3KNqoM
   HR462DoTI4iIMqCp7fi9CcC8c1ceKscakyFVG2tLFbLocDZAgGRd2qdmG
   g==;
X-CSE-ConnectionGUID: +uXPAIrATISMSfX3ydMbsA==
X-CSE-MsgGUID: fWcjNjFyS3G29CtZYhkvhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520840"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520840"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8856082008F
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4282714003C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D89251807148;
	Thu, 26 Mar 2026 11:57:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/63] python3-identify: upgrade 2.6.17 -> 2.6.18
Date: Thu, 26 Mar 2026 19:56:06 +0800
Message-ID: <20260326115634.1199-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125691

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-identify_2.6.17.bb => python3-identify_2.6.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-identify_2.6.17.bb => python3-identify_2.6.18.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.17.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.18.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-identify_2.6.17.bb
rename to meta-python/recipes-devtools/python/python3-identify_2.6.18.bb
index 0ec329c954..7418b43150 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.17.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.18.bb
@@ -6,7 +6,7 @@ PYPI_PACKAGE = "identify"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f816b0b596b204c9fdf076ded172322f2723cf958d02f9c3587504834c8ff04d"
+SRC_URI[sha256sum] = "873ac56a5e3fd63e7438a7ecbc4d91aca692eb3fefa4534db2b7913f3fc352fd"
 
 RDEPENDS:${PN} = " \
 	python3-ukkonen \
-- 
2.43.0


