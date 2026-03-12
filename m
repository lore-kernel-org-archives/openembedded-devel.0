Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17827105A57C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18860.1773313201202800916
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bo2ht0cS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313199; x=1804849199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yvrGjwHQjN50EC2opibgYm5ak2htp2FtvEwVOcR8dsU=;
  b=bo2ht0cSKnfqgiE7BEtfNAX5ca/v6qdHuobToG6OhXdlKR06s268JhWF
   REMiHNhZXUfXhE0pvJRXNWO585XwYk1lvIdwMu7CHsnKIzucJi+fgTSRK
   MuDOIKqRoRCU4ILWnVOVZbgFooS7QQhFNDEYXy9w1dtqdCWzuUvK7Uxq4
   9+8JtX9Ip8AGzsLmCeghtYcUE8/CtxEj1E2CaBcwhS6N+5Dhx0i32OwyO
   3r4rT7eMlGq+j+uw99tGlkOCcvu2WV6OpACsDYTomM5PzJc/985mAFFZO
   SVbARm5OEdnKiVrkk84nk4uOUjFon9DhbbMHqryRo/pSvrwtMcrOlPhvZ
   Q==;
X-CSE-ConnectionGUID: VvlEMyQUTLSDBUHGrTE32g==
X-CSE-MsgGUID: zdEzbM3cS3y0SuV8hiaBBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233021939"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233021939"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:59:58 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A88AE1000A12
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:59 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5BDFD18041B1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 75CF98288E8;
	Thu, 12 Mar 2026 10:59:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 57/64] python3-tqdm: upgrade 4.67.2 -> 4.67.3
Date: Thu, 12 Mar 2026 18:59:33 +0800
Message-ID: <20260312105940.1900-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125157

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  fix py3.7 dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.67.2.bb => python3-tqdm_4.67.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.67.2.bb => python3-tqdm_4.67.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.67.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.67.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.67.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.67.3.bb
index f5ee2d3e4c..1637021999 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.67.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.67.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "649aac53964b2cb8dec76a14b405a4c0d13612cb8933aae547dd144eacc99653"
+SRC_URI[sha256sum] = "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.43.0


