Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2978FC3065C
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.166877.1719305860159229161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rx4oDts3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305860; x=1750841860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D0U6uqGVK/RWsS+Pugl/id8X1dZE1PrWUdDnneNqyKE=;
  b=Rx4oDts3IzarVETA82h/3NGwjNcsJdi17u31lxIMCwtSEm514CFnCKfd
   4dbEujoWl1DnxwLBJYJU67pl0V0Ntz6jOyt85ifuEs7GAtAQlWDUO7FXK
   lDoXIu25nj2q8jyC9/VV83Dgihc9dzvClbSLkgszYGakBPG4y2yczIRUi
   +h6G7hlZDbFidVADP6iwFElqX0mfGwjOvF9vadojfuPzSG6Bw2/cPSO58
   0DLlDVOT+ic7boWTNuT6C4fBdFXIObsJdT3Fx4pRik3gO6oqVv87NVGt3
   JBaJ59V1YSVBCD/ND4G2i7tPw/Y4Eh2kb4BQwnBnZuH2skA0vaxWJ+9es
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254742"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254742"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9D02C9443
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31E0ED3F1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EEF8E20E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D8F21A0002;
	Tue, 25 Jun 2024 16:57:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 57/57] thingsboard-gateway: upgrade 3.5 -> 3.5.1
Date: Tue, 25 Jun 2024 16:56:30 +0800
Message-Id: <1719305790-11484-57-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--3.378900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bgl+ryMS6Q9gH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57NuTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFC8us2m2HJrHVHvmLQonx+bjnh
	rpRtKl4C7/w5kIApCrv7DqXYq5SvJuuaq37hI3N03zkbLjyHqCk6gmEZPkDVzny0LlGSBRGux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111069

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{thingsboard-gateway_3.5.bb => thingsboard-gateway_3.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.5.bb => thingsboard-gateway_3.5.1.bb} (96%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.1.bb
similarity index 96%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.1.bb
index 2c749eeba..7f2859186 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "6505d94d3173e2469950b03d5b99dac4210af7b659a3a1a3b58da35b2a984da6"
+SRC_URI[sha256sum] = "3d4ae3026b76be94aef67eba7d7e3a64e436ba9556d74ad142ba8988e4e4b253"
 
 inherit pypi setuptools3
 
-- 
2.34.1


