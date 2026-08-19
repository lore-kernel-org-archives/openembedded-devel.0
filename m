Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E3FC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3258.1787132144375481651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HSxC+DP+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132150; x=1818668150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4WOdcXfGPawnnc3mFbRl5UXqyGTsZ789Bghwhd/bkQ=;
  b=HSxC+DP+PwfHB5HnLm7itkDWEC3JnNQD99hYwIWa2oJHoL/oS4nRJCm0
   Lq346K0KdG1qc9B1ZV3PpWOpOyWXd7l2AzEitRKAaAC96VgDiOjsYUa9Y
   9HQCMOi1CJsWXG4eNWqzd7yALfl30uWRRTUZV7y/qrO6Q5qwf9EYtKsvP
   WOHidQAsjcOqZWKhS9zFCgQ1b8wxGdmx30tsAZ4mEvx76oFns+hcNC9dN
   ulAhuC23FfICCGFHnHmEbopGoS9VpLJ9AnOvpewMk9xxYBSaYCUSHeh6D
   18lg4g2OznWis/Hs1rdcbbESKv5qeppJj3i5j9uktGQ+W1Bn38D9HAbyN
   A==;
X-CSE-ConnectionGUID: OLnSuH3yQlm7C+lT8/L/zA==
X-CSE-MsgGUID: WRo5OuEjSAWCraR/mkn/BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507803"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507803"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:50 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2173CC020D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D1026832854
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D8D231801C0A;
	Wed, 19 Aug 2026 09:35:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/70] osinfo-db: upgrade 20251212 -> 20260812
Date: Wed, 19 Aug 2026 17:34:19 +0800
Message-ID: <20260819093514.1101-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129285

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libosinfo/{osinfo-db_20251212.bb => osinfo-db_20260812.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libosinfo/{osinfo-db_20251212.bb => osinfo-db_20260812.bb} (90%)

diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20251212.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20260812.bb
similarity index 90%
rename from meta-oe/recipes-support/libosinfo/osinfo-db_20251212.bb
rename to meta-oe/recipes-support/libosinfo/osinfo-db_20260812.bb
index 441e440467..fff5cc4e10 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db_20251212.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20260812.bb
@@ -8,7 +8,7 @@ DEPENDS = "osinfo-db-tools-native"
 
 SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "70fe571c605541e7be76b50f430c1cd13959c5b9"
+SRCREV = "ae7a0bfe36940a7dde23fcd95ce60c0608cb7e33"
 
 
 inherit allarch autotools-brokensep
-- 
2.43.0


