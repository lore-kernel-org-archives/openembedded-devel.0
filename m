Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C178AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:00:16 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.17861.1702544415798100829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="131333733"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="131333733"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:00:13 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DF4CD7AF1
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:00:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97C7AD88DE
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:00:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3431202E428C;
	Thu, 14 Dec 2023 18:00:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pint: upgrade 0.22 -> 0.23
Date: Thu, 14 Dec 2023 16:59:47 +0800
Message-Id: <1702544387-28194-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-0.555900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyPaLJ/Ca3ST9Z+
	ZZLkF+TOy0/1NpQXQBGzeBloshj2ekz5mWBF5saRaDCzqDR7DPZZ+CK+BxQ9k2Oy1hnSiR5Rvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgFXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qex9GgLAHOBFiJ0RPnyOnrZJY1Jf+K6gyKed8lhytkzMtQgqvJBMi0ESH98a61vGf7Yb/B
	YpskUdggawotpInQdjPrFYWL25k2JHF8Dxh+YbhbbHlauii65NLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107442

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add _get_conversion_factor to registry with cache.
- Homogenize input and ouput of internal regitry functions to
  facility typing, subclassing and wrapping.
- Generated downstream_status page to track the state of downstream projects.
- Improve typing annotation.
- Updated to flexparser 0.2.
- Faster wraps
- Add codspeed github action.
- Move benchmarks to pytest-benchmarks.
- Support pytest on python 3.12 wrt Fraction formatting change
- Fixed Transformation type protocol.
- Documented to_preferred and created added an autoautoconvert_to_preferred
  registry option.
- Enable Pint to parse uncertainty numbers.
- Optimize matplotlib unit conversion for Quantity arrays
- Add numpy.linalg.norm implementation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.22.bb => python3-pint_0.23.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.22.bb => python3-pint_0.23.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.22.bb b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.22.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.23.bb
index 0eed33f79..82709ea08 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2d139f6abbcf3016cad7d3cec05707fe908ac4f99cf59aedfd6ee667b7a64433"
+SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


