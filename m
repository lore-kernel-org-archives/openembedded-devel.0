Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8B3C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:53 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6691.1714628986112840832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tZKMfigy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628988; x=1746164988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sxqoQKgbwUHpciWcyp2gUVTzCZmwf+u6pavMhBX5/bs=;
  b=tZKMfigypiYLCj4SXJMO6IuJohZ3AlSmjUH4Uhd2N2i1dkG2ERPD3Nre
   3Fc2RZePZFy3z7UrqRIafQy9kAg64iVLiJXk4n7sKwXWH00RsNCzkW4Dx
   dPkBCW4jfm5jIOsmuyLDgyUPAtEAh/Hcj+ZSTLMeI3XRYoOTE+cmWWXo1
   k+NyCQvQ08wGKs81YgozLPmPV07M83TpQjwULtV4wTQO5cVv2jzhXpz47
   6/8EfiSMKN2z7/KayAuU7/pDuVPjuWTJONELwfaWe+uLfhLt/oe2jApEA
   TftRvObaQDefi4gStjQEE7Y9duWgsPmteEq6chulqAwuZSKhxrZLA2dC5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157231725"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157231725"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 88EEAE8F88
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C4BEFC19D2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AF5B223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:26 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A0441A000C;
	Thu,  2 May 2024 13:49:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/30] python3-platformdirs: upgrade 4.2.0 -> 4.2.1
Date: Thu,  2 May 2024 10:48:13 -0400
Message-Id: <20240502144829.241208-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-1.652900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrWq/snXbxpCAsAkOSASMZR76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74C0oMqkY991yYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXITLf5aNvX8k3InpwQlgOEO9xJcYg+vsINHK6
	vtZogFTrOYWjGKmC6tspyK8ZULWsRUq8r9V0O4AyzO2503X9AzC7LTmcU/Rn4RZbRsQk5MBUB1Q
	Pq9bxnWZkAxAwjIrrMHz/H0kiLyEqGAtHMDjkk9
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110239

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Switch to ruff for formatting and use codespell and docformatter
- Use hatch over tox
- chore: various minor fixes
- chore: update dead Microsoft's known folders documentation link
- Allow working without ctypes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.2.0.bb => python3-platformdirs_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.2.0.bb => python3-platformdirs_4.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.2.1.bb
index 19c95b374..5f0aafc93 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.1.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ef0cc731df711022c174543cb70a9b5bd22e5a9337c8624ef2c2ceb8ddad8768"
+SRC_URI[sha256sum] = "031cd18d4ec63ec53e82dceaac0417d218a6863f7745dfcc9efe7793b7039bdf"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


