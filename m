Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3F9C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.12704.1716861017038116439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XuqA9ORf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861017; x=1748397017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gc/d7PnnQjuejsraP1VXCr+3PDK543dBMCvd72wwZGI=;
  b=XuqA9ORfjJFqDDfwXCKLGcDy2Kguly45BpKJVQ8gyZ4A3XkFDctmfVB3
   WoorwmAk5E7zSU3doIBvS5TdyPWCucQc9ZNjpin0L+D5hnH3Izk9mCdsQ
   VhjsyMUkeAnDnTc2p44biPdQmfPC8TSKav3PdPThiFw0IHZ1U+VO3rPbG
   SoO7uDjG8E8McQaAHeCOVeUmV5KlgiRPf8OUVuJ2mhR3kqV+6YolX1Klh
   VnrvvOT2yw3u2ikqiN+kG6OUE34GSYNMQDk0eK094ZlgS1a8LuJzE0y6Z
   /nBUqval2CV/z7uZdKgyKSRnNWzCirlv+v9G2I1sBTWO8do7pZYAm/I0y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160448560"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160448560"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92F57CA1EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C8756BF3C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6127441063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E5701A000A;
	Tue, 28 May 2024 09:50:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/40] python3-pyzstd: upgrade 0.15.10 -> 0.16.0
Date: Tue, 28 May 2024 09:48:05 +0800
Message-Id: <1716860901-863-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.830000-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrRUYppGmT91fIFck3f6fvyJZh
	jmb07zEXXpy2MhZGQqlJxz8LxBJ5e1R/KlnDpLSlJAtcI9QUBGt7tnRTJA7lM5oM2VEm6bO5vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgAFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipchnIKv4b01Y21hi6khsf8/17E+zTATkWEdAI4
	GPxn5zyHSbFua9AlDxzEfhi09NP9mLR1dNgLBet/JIaipmT4gmlBuwQifSfYf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110559

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Upgrade zstd source code from v1.5.5 to v1.5.6
- Fix pyzstd_pep517 parameter name in get_requires_for_build_wheel
- Deprecate support for Python version before 3.8 and stop building wheels for them
- Minor fixes in type hints
- Refactor README & CHANGELOG files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.15.10.bb => python3-pyzstd_0.16.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.15.10.bb => python3-pyzstd_0.16.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.10.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.15.10.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.16.0.bb
index c094a8d6f..77459c1c5 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI[sha256sum] = "83603a97fdbcf2139f475c940789f09e32703f931f29f4a8ddf3551e6700108b"
+SRC_URI[sha256sum] = "fd43a0ae38ae15223fb1057729001829c3336e90f4acf04cf12ebdec33346658"
 
 inherit pypi setuptools3
 
-- 
2.34.1


