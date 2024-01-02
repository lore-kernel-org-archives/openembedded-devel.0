Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE67BC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:11:25 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.24401.1704179477822650129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="144531299"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="144531299"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:11:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F383D7AC6
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:11:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 548692563B
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:11:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC8CE6BC58
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:11:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C4471A0070;
	Tue,  2 Jan 2024 15:11:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-pydot: upgrade 1.4.2 -> 2.0.0
Date: Tue,  2 Jan 2024 15:09:37 +0800
Message-Id: <1704179377-8213-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-1.969000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrWuFm7TqL4eFT1guYHClQrznG
	P45AxioitWpzAKQ3uQs0jZmiiIwNTzbcBdSAvS61OWUWxTQJdI/hKQh1LCmGBpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly/s2yNvJEqbTYOunGXh2otAiDo
	E0RuZ79K66R63PHhs9NHkYWMEGGEdRw1x8EobpG3FhRZRM2bdTZgHh7vbghi6yejDUC+/Z2/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108003

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Broken parsing caused by `pyparsing` updates fixed.
  With this, the pydot project rises from the dead.
- (Internal) CI
  Modernized and clarified the development process.
- Reorganized package/module structure.
- Reorganized exception hierarchy
- API (minor): Renamed the first parameter of the parser functions
- Test suite option '--no-check'.
- Drop support for Python 2 and Python < 3.7.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydot_1.4.2.bb => python3-pydot_2.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-pydot/{python3-pydot_1.4.2.bb => python3-pydot_2.0.0.bb} (74%)

diff --git a/meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb b/meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb
similarity index 74%
rename from meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb
rename to meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb
index fde1029c7..f0a6abd73 100644
--- a/meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb
+++ b/meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pydot/pydot"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f6fa041dfcc7ff7747cfceaa34a3180"
 
-SRC_URI[sha256sum] = "248081a39bcb56784deb018977e428605c1c758f10897a339fce1dd728ff007d"
+SRC_URI[sha256sum] = "60246af215123fa062f21cd791be67dda23a6f280df09f68919e637a1e4f3235"
 
 inherit pypi setuptools3
 
-- 
2.34.1


