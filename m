Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE05C2BA16
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2489.1718161122553454466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h+lCvQXa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161131; x=1749697131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YGPsYwFA8ueY26R6dgSC9CJ5ulqX7HRKRrAG6fZXRX8=;
  b=h+lCvQXaIj3gTYyCiWF7t4uK8J+O2gaY5UfSV0VJjpqK5by5yfeGui2d
   lsR4UrEanmseFbfTZKtf51Ul3JVtfLsEQ5jEQFOJdwiWtsraJ2pcM3wTf
   /JWGroISQsUcKEwE2A2dGAfOVbzvo1G1HCGhkIMUFnvAhIqD4mlo1WUsT
   obYwod9OxKQWqDlH6H09N7ERszX8xjV8ELqJr0In9Aj6EWc50UO2jFQ3g
   ZDas1DQ0KgXIbmIpXesgK3LTsNdSMBsLzgkr8+itIeluMn7+nEdi6SQgo
   L4LAhNoWsp7E6qsmdR97lNjBoJOzJIOA9KTIqM1zib59OFAghjizVZRcO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162710883"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162710883"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D1A38C68E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1859DD50E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A943401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1855D1A0002;
	Wed, 12 Jun 2024 10:58:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/43] python3-sh: upgrade 2.0.6 -> 2.0.7
Date: Wed, 12 Jun 2024 10:58:03 +0800
Message-Id: <1718161096-29710-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIyG4DaEvunvD8w+FNIW+6FMMmOVxO0wpV1G1
	tzfXobVkhjZ5IPQ5xUCwUE6XuLiq59NNmsZeo9Gq6VVGFc0OdljrB7L8vSEUn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix sh.glob arguments
- Misc modernizations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sh_2.0.6.bb => python3-sh_2.0.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.0.6.bb => python3-sh_2.0.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb b/meta-python/recipes-devtools/python/python3-sh_2.0.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.0.7.bb
index cbe000e31..8f8d970a9 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1"
+SRC_URI[sha256sum] = "029d45198902bfb967391eccfd13a88d92f7cebd200411e93f99ebacc6afbb35"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.34.1


