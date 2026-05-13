Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A98CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139.1778645484645100898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HVVgGAbe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645484; x=1810181484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hOuRzUui0BTn50eWEfSg4a9X5+TxmDv8n1jz0NIr77k=;
  b=HVVgGAbeoTPRbb274OuuLrArXJIC7zJ5w37u9M5XRQs8kpDWWMGLMX6Z
   6NIviEsqFq8eedwblVF+DGOcuIRWthXO+dggxkHNmxjZUdvDoAzG0tL/V
   WwE5QbiARfivNstfZ8lGRLj25gFZLOgdAbwer3zLdqeDeANaRH3ynApH1
   hG0+Ll7D29zbD8XtzCI41VWdd7MeJr1Wf+tVCM7iUa6DMF2w3s+ZDZFpW
   JJ4IaGgfbjQXcTVC0Uc3BJvoB+I9h++GwtQrtzArGttgB1oMdcmoL9W8E
   +khv2LxvqR5aqyOuWQIfDmBl28PHA2+F8SG3Q/MbH652rSDKiYwH+2JFc
   Q==;
X-CSE-ConnectionGUID: aRmqjv1PQGeoEogdrZicSg==
X-CSE-MsgGUID: 1P0X6H1ySIWYMqAtEcIVsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240265698"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240265698"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:23 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 27B4A42A33E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:53 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C6AEE1004160
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 435FC1400254;
	Wed, 13 May 2026 04:10:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/56] python3-pycurl: upgrade 7.45.7 -> 7.46.0
Date: Wed, 13 May 2026 12:05:34 +0800
Message-ID: <20260513040555.377-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126916

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycurl_7.45.7.bb => python3-pycurl_7.46.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.45.7.bb => python3-pycurl_7.46.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.7.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.45.7.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
index 72338bb0e1..8bcd65309d 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "9d43013002eab2fd6d0dcc671cd1e9149e2fc1c56d5e796fad94d076d6cb69ef"
+SRC_URI[sha256sum] = "422ed7005b98768fe60fe6b6cb8bb6a4e1fc18b5433402e8fbdaba91811c4604"
 
 DEPENDS = "curl"
 
-- 
2.43.0


