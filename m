Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3E9C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:48:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6972.1704721724383776956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="133099453"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="133099453"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:48:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 60EFBD66C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:48:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8477130FB0
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:48:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FD8F6BC70
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:48:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A497B1A0072;
	Mon,  8 Jan 2024 21:48:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lz4: upgrade 4.3.2 -> 4.3.3
Date: Mon,  8 Jan 2024 21:47:57 +0800
Message-Id: <1704721677-30785-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--1.595800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNEzEoOqAAVLNV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S7bjSuu7rCVMEWrHSLM+JHQwMpQtM57Kzd6Fvb0rNO4Qr6i
	c+exR5gJfuqMjYz5fEW6rVqCNhhpTxnoGeMZzba9PwsZry2zgPS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108156

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Add .readthedocs.yml
-Build wheels for Python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lz4_4.3.2.bb => python3-lz4_4.3.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.3.2.bb => python3-lz4_4.3.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb b/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
index f0c8684b0..746926da4 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "e1431d84a9cfb23e6773e72078ce8e65cad6745816d4cbf9ae67da5ea419acda"
+SRC_URI[sha256sum] = "01fe674ef2889dbb9899d8a67361e0c4a2c833af5aeb37dd505727cf5d2a131e"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


