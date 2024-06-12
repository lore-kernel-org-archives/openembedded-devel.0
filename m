Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F5EC2BBCA
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2432.1718161119922720466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QW1hIMcC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161119; x=1749697119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VVM5yS/zrCVks3caoTa7n7kGZOx1karkqhciAZB6tUc=;
  b=QW1hIMcCb1BzhTGmlr+h2W4uCDDHQYO92Qh4LDyJrnKPP22XlC3UFio6
   5/J3vDqU68KGoPgFcHptXwkyOnSHNbTHN/MJbbLzA15nNw5pJryxEq9gS
   r7tlRVo1EFvFL/HSbvlT4aAcgmcR4wZmhqL2jP8HqgTU+emHi38sO1ksW
   zewTBUuDI7lLq5P2xdjEmiJzMWbYRWxShnR54uARiYSi308FiCyBbz72Y
   y0ffK6+Q7MXypy/VVx//XSXo0ogWRH3qGV0GUHgz/eHmZURrrhghIaw8f
   O4PGZmp2b5r39PcJvqhPlpQlVI+kZteph5H1gPtPRErEeFZJNBQsGDyAF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="150756295"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="150756295"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32437CA1E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D991D4BF3
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11764401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B03711A0002;
	Wed, 12 Jun 2024 10:58:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/43] python3-coverage: upgrade 7.4.1 -> 7.5.3
Date: Wed, 12 Jun 2024 10:57:38 +0800
Message-Id: <1718161096-29710-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--6.404000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrCZa9cSpBOblXy2/vm0e6zn3Y
	vtP37IU4Awr1d1MD+nhwAo5WoLmIXQDNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsLJjQpIWhSuM6WZ8G/zxUhOeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUcIn3wCvI9YeiJHhbcJRXjuaaqF/20NHb+/ZgSPazETjtCwNWGbhoI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110843

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Performance improvements for combining data files, especially when measuring
  line coverage. A few different quadratic behaviors were eliminated.
- Performance improvements for generating HTML reports, with a side benefit of
  reducing memory use, closing issue 1791. Thanks to Daniel Diniz for helping to
  diagnose the problem.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.4.1.bb => python3-coverage_7.5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.4.1.bb => python3-coverage_7.5.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.4.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.5.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.4.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.5.3.bb
index b3da5d571..0df341c54 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "1ed4b95480952b1a26d863e546fa5094564aa0065e1e5f0d4d0041f293251d04"
+SRC_URI[sha256sum] = "04aefca5190d1dc7a53a4c1a5a7f8568811306d7a8ee231c42fb69215571944f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


