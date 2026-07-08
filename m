Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67794C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4915.1783503960606734589
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c/tIHTrN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503962; x=1815039962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9cBhPfZguO1ul8gPRWQ8UhGF1Rk0ADxSwrK4E5Ujye0=;
  b=c/tIHTrNyW+cdIdrluqDRKhtNkqyeYNqA2tbOD6vT50/zH7rfYHH8wpA
   NehuhIGcFsDyTIfAv/iPvaXJ9/BvyZTlz8b5btm/7stP5nulF5j7kOCZt
   yIqD9ww+gfoKOyL8TNqL2oBEPRCygbOQ/JXTH0WfFXX/N0FJsGsUKNSbK
   xxvi6kT+Q+3990zl3Hf/yOXUDjcT96tQcMK0lrE7HVxgW0hreyZReDB0O
   y0IFwbKGmTTAyl+W2CRinYKFcZMVWtybCoyriD53sukDZWN8lAQ/Sqwml
   wqpmk0jFuSDiV0t1VBD+lI15YKUshO9jb5ji8eqHfsY4SsvGK+nnohmj5
   Q==;
X-CSE-ConnectionGUID: 78fT4wVmTtqp+aLUHn3fUA==
X-CSE-MsgGUID: RnVIAP8dSZmMS/ze1jymyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="244843007"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="244843007"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1003B42A339
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:59 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B4B82100596E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CBEE61800C26;
	Wed,  8 Jul 2026 09:45:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/37] python3-twitter: upgrade 4.16.0 -> 4.17.0
Date: Wed,  8 Jul 2026 17:44:38 +0800
Message-ID: <20260708094508.2060-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128099

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add reset_time parameter to TooManyRequests
- Replace deprecated datetime.utcnow() in MongodbCache.store

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twitter_4.16.0.bb => python3-twitter_4.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.16.0.bb => python3-twitter_4.17.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
index ad05e0ac47..5386e90d42 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48c84b17f84a9a623754604ab73f28fe"
 
-SRC_URI[sha256sum] = "1d95cbdc50bf6353a387f881f2584eaf60d14e00dbbdd8872a73de79c66878e3"
+SRC_URI[sha256sum] = "c232e9fffa0b15b81d5ff8ec59d46af85e330285ffc3e64614d2418fb9af71b5"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.43.0


