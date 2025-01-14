Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218E9C02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.40071.1736843359300513619
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jrzff4+H;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843359; x=1768379359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jp4qCWL8VAlQm1boTq8NMYy3FjiukCODkfYNre67ah8=;
  b=jrzff4+H+TON/mxTca4mYvDZHYJXlD2wGGwhj5fURgjQ6JqgaFqHiLPD
   0RCd3Br3GbD3e+30yIR0gLyW744OPtKNdo93mE0VHSVjtYwdfaGUyIx6G
   hl3g/vymB6dBBDCfCqRsorTzUxOw9MDgunF1ir7llVDLOBzoSiAi8FqMM
   TrNojPhAsoMzqLY3ZP1/laaS7aOuyz6iUsbjmQIUnb9I6rGowCA//V2eF
   aP9bKN7lS8uBglB1DHKHj7FWT/xloLM9Z52lO/oFcAze6WawZx4L+cY98
   2s9og+E7W3YtAOhp7NWiZx38uREQIvLkekZjpf822PmofHjUErM0gr6vw
   A==;
X-CSE-ConnectionGUID: DEvqcpPETO61010V0Q21vg==
X-CSE-MsgGUID: y64n5GlFROKrbJEBfOuZIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186435903"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186435903"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 37986E614A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 11455BF4BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C3E820071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4892D1A000B;
	Tue, 14 Jan 2025 16:29:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 28/30] thingsboard-gateway: upgrade 3.5.3.1 -> 3.6.3
Date: Tue, 14 Jan 2025 16:28:47 +0800
Message-Id: <1736843329-4131-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--3.378900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bgl+ryMS6Q9gH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57NuTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHaRQKKLR3IU+Xaa3r0X0sZMB6
	hJX8BruguAOJlWLRTnYZeuwoUY+S3MzXDzBeKAd7Mn6aMYFWw8eP5s38HeE54Z1qhdedcopux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114872

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ngsboard-gateway_3.5.3.1.bb => thingsboard-gateway_3.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.5.3.1.bb => thingsboard-gateway_3.6.3.bb} (96%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.3.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.6.3.bb
similarity index 96%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.3.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.6.3.bb
index 54ec1ca34b..9fc7d781a7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.3.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.6.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "73e6d8e04ed32dab8ea31f716348add13c8b5ab23a6aa93b49917d2903a071c3"
+SRC_URI[sha256sum] = "a5ccad7d6940d194f9f39cc7fc22ab72b3d124066837cde27d92d090ce458a88"
 
 inherit pypi setuptools3
 
-- 
2.43.0


