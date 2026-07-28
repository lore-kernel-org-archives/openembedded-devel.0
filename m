Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08974C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5627.1785218820361991143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aBf3Q8cH;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218820; x=1816754820;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XI9B7KtCz7JEDKKzKimD4nd3Z1RVO9KRHlLRCHMFqWc=;
  b=aBf3Q8cHW5exZj41Evohe45olaO+ype5m/VUx/YolCaHZ5ChFxIDQCVc
   cy7RMfOndMBWoK1iKdS7gEKRZ6QYDEOVMB4VK0+v6CQ4naEP6OQzha423
   CHZLMoY8HIdbZmtq2QtLWkooW9ZshJf7hmerX9w3TxNIydthHF21JzfdI
   Bqkc1r8SNzhD8uZewlocP6Lb+zQezXNli/SB2RRbt41Tu4qPIRT/xGVSr
   tFlEspsB4xaae+xTgIWAvoAsS+CaYSoma/xik9vO/nB+WCZZB4fohVnh6
   qn9iD93DOHZNinMaNdrv/yidVHZCrPKCanty9y1+bCobIYAISAmcfj0A/
   w==;
X-CSE-ConnectionGUID: 3AYxhBWlTEiXU1Vj06pfPA==
X-CSE-MsgGUID: J0WKHE8QRImFoJhhqWWUXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="226549412"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="226549412"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:58 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D102EC00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:57 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 85DE818578FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:57 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E2BCB10005F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:55 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-gevent: upgrade 26.5.0 -> 26.7.0
Date: Tue, 28 Jul 2026 14:06:20 +0800
Message-ID: <20260728060645.819-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128477

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_26.5.0.bb => python3-gevent_26.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_26.5.0.bb => python3-gevent_26.7.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb b/meta-python/recipes-devtools/python/python3-gevent_26.7.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_26.7.0.bb
index a36ca98d00..4cde4ba98d 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_26.7.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "1655eb04c1e20d71b2aa4a3c7528162dd58ff6cc46a037af1f01f534c80fefba"
+SRC_URI[sha256sum] = "5b333a556e38a302b1b8c80525bef16d437e16f1e7767947789406841856a102"
 
 CVE_PRODUCT = "gevent"
 
-- 
2.43.0


