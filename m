Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D50C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3312.1787132179675746840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aEEp4grv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132183; x=1818668183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ddj6FnElysjuasGs8sv2JkkbkpdGpn3FFTXhIzNUl58=;
  b=aEEp4grvxtbfhNJpN/iIOgVcdpB/V0piZ15ewIq38iAFHHrSeTi67QCV
   9cLIKJbSgNb+JwQ+ybVEicP9++aNKIamIN3Soc/1h8tzCM0Plh8ESwGSz
   UCmwWE7V9WDyPfYzPuN167Cd0UJsFNl9upKObge4bQ8kFdNl7h7NkN2b+
   JkvZewVgF84sfXB9A9EqLpW4s31QNYlz/1GQwNSRn3K9TtH8Xzs57bmRW
   iaolpAV5Wl9Vk0PC/pHPQZgYvD9J9eIg33pUvKrkKzZRKxz28W5V1x1o5
   5GuJBFZZum9JkLSRkzhz71g1t2kQZHcUk1CMxdDIstv5AvTXjxETwKLHw
   g==;
X-CSE-ConnectionGUID: MO4owSxMRtKdGhFBYnBPkA==
X-CSE-MsgGUID: o+OQYFwkR2S77ja+rgyObA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251357058"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251357058"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:21 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2E799100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D8B961800BEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C2B4A1801C11;
	Wed, 19 Aug 2026 09:36:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/70] python3-gevent: upgrade 26.7.0 -> 26.8.0
Date: Wed, 19 Aug 2026 17:34:37 +0800
Message-ID: <20260819093514.1101-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129303

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_26.7.0.bb => python3-gevent_26.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_26.7.0.bb => python3-gevent_26.8.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_26.7.0.bb b/meta-python/recipes-devtools/python/python3-gevent_26.8.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_26.7.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_26.8.0.bb
index 4cde4ba98d..3207dc351b 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_26.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_26.8.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "5b333a556e38a302b1b8c80525bef16d437e16f1e7767947789406841856a102"
+SRC_URI[sha256sum] = "96039f41bbde6dcd72559e5ffbd408a04f46774b47d991d4cf032da8fa79e5a0"
 
 CVE_PRODUCT = "gevent"
 
-- 
2.43.0


