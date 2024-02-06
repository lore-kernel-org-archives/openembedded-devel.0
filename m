Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58150C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:48:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.17481.1707209282484910522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YO6vg6ma;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707209282; x=1738745282;
  h=from:to:cc:subject:date:message-id;
  bh=nGqx2AI8OIeDVOFbp26NZpDpnQn46nYr3DHIXMbR14k=;
  b=YO6vg6ma7VEz+YlljE1iNWu8m8qcDt1Z/5xF8BYKzHCjOJ8h4C/whjf9
   TNLHVLtID6YHqOtPd8YQrmoam7ZYVo5HyhQkK57bU7vUxYiankJROGf0k
   HWLzbJygxr3B/5BhZN/BR6XLDanl3vea0AckoV2hxnuneJmCVEzFfstbL
   kEkaquBiq5XB5xrOiiSwsnE1oSmq5/fHWQ8DUH+G6YLUX8Fvp/OWmR+z0
   XkZQX/+dpyBw2azb8+L1kdmzccP4fXu04xFLtEBipGY7rIEQ+Pi4Ylikm
   w5YE0BccMOfsVSToK/hSqxo8qB0UtZUQ/0PCWIyNzL7oJzZDfvLdts8dT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136989608"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136989608"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:47:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A557DC1FB8
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:47:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EBCDBCF7C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:47:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83DD21EA8AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:47:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 215051A006A;
	Tue,  6 Feb 2024 16:47:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.3 -> 2.6.0
Date: Tue,  6 Feb 2024 16:47:36 +0800
Message-Id: <1707209256-6015-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-4.923600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrNi8L88UV9IDT+1Zj+w66+hxq
	dt22rdOgbkdDsltVts2qLHYw/Ac7JnYMpxnz5ObKXoBhYs0FZYY0x1JSmIVxrSWT5HLhPbcevqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcUJ52LFhfM6uZnq
	CQAugVqLF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyfWXUqN8fqRH8Jhcn1Mr/U3b/r
	6ZaaYGhqa8WTE0D8m3loiZSvMZGqyiZwL8GmjTwPQRUY8/PycyTnCh0W3of3sCgUUaihWpD/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108619

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Drop Python3.7 support
-Drop Python 3.7, and PyPy 3.7 and 3.8
-Use positional-only self in BaseModel constructor, so no field name can ever
 conflict with it
-Make @validate_call return a function instead of a custom descriptor - fixes
 binding issue with inheritance and adds self/cls argument to validation errors 
-Exclude BaseModel docstring from JSON schema description
-Introducing classproperty decorator for model_computed_fields
-Explicitly raise an error if field names clashes with types
-Use stricter serializer for unions of simple types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.5.3.bb => python3-pydantic_2.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.3.bb => python3-pydantic_2.6.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
index 21341d26c..af465f423 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a"
+SRC_URI[sha256sum] = "ae887bd94eb404b09d86e4d12f93893bdca79d766e738528c6fa1c849f3c6bcf"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


