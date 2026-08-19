Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B85C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3323.1787132174634019608
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rB+FFnVc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132175; x=1818668175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mZBdHHadvSTtVHVE/kIIAO+lAHSgurMt/al7PwvOpF0=;
  b=rB+FFnVc9r4ekwZOsc51rvHqhEYYFbjQNf9GUOJ6OIRwsgfz1PzJf5Rk
   pZzpyhxgguwvyPZc6OQqlstIcgjCdEo4Vjxxd+NClXHHNwUz/bejtidLA
   NwO3/UyVdS9Dn/OYZg24F/0kAgM/BI9bLcd4fG9oyuLCLBxKI206WbYdd
   tzXU3EK0U6hw9UbmM/7vw0wiay6Re+E9qJJa8YmenUIym4iLlowqm45m8
   gGtixEZbAuxhgixx4yMRWNgzzT4lS9vNqhQUdxXQyUxil3zJXXJ/dnT99
   jFVKsKcH9yARMNfXYe4opKHgVnWcYPWqhps7CW2xVaacCWS2n3SKCa8Vb
   w==;
X-CSE-ConnectionGUID: rVUWRFrvSV2TVmeIfpqjaQ==
X-CSE-MsgGUID: TIZ9358DTBeKdBbJnExN1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251797021"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251797021"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:13 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B90291002BA6
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:12 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 747648412D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 83BA11801C23;
	Wed, 19 Aug 2026 09:36:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/70] python3-eventlet: upgrade 0.41.1 -> 0.41.2
Date: Wed, 19 Aug 2026 17:34:34 +0800
Message-ID: <20260819093514.1101-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129300

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix compatibility with greenlet >= 3.4
* CI: Run apt-get update before installing system packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.41.1.bb => python3-eventlet_0.41.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.41.1.bb => python3-eventlet_0.41.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.41.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
index 00bccc9e16..864aa20ba8 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "e91010caa1880bb511de6ce2ed2186ef3493e0762a4d3ee93e97a0fcccdaaa28"
+SRC_URI[sha256sum] = "721b86b77fca33a735598292022ac6feef99747bf48f52defdada6b572acd5af"
 
 CVE_PRODUCT = "eventlet"
 
-- 
2.43.0


