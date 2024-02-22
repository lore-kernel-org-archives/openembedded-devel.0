Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E375C48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 02:23:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4441.1708568599128037672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 18:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=glQMA8ur;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708568599; x=1740104599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kt9eH4HVyAPGVIYnAbjldo32nA/RlY5nF1tp6nMVuKk=;
  b=glQMA8urPBPhdbFIq0q9uPFM6REJVioXmNEGJxL/aza0NFa2bZCg5D36
   240Y3oRIqnGXrckfnkSzQMZFV/YLIOJimJJqXxHh8kYOT9Y/uCc0AqQmc
   5NvSvzcQ2oruOHVCHS2kia/+wXUduDvtUCgJatyrzFxHa8rtuF29kAFHb
   9KubWKjXlWwdkmGp8yg52YCRtRnlG9jmuFvJN64LU8bV+7EWfHS+69tHX
   M2CbtZ+NKiX86cRIQpO0lJbTKcQDl2jPl4U9k/PB6qOKzWl2A7ju0KmOZ
   72H+OBV15wI+xSvRmWtMKxnwmp+3gC9uBGr3AaqGvFflqxChMnbOddiPc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="149559290"
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; 
   d="scan'208";a="149559290"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 11:23:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 746E313DF63
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 11:23:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ABD36D5EB6
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 11:23:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 333B32007912F
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 11:23:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D3D521A006A;
	Thu, 22 Feb 2024 10:23:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 2/2] python3-pydantic: upgrade 2.5.3 -> 2.6.0
Date: Thu, 22 Feb 2024 10:22:33 +0800
Message-Id: <1708568553-2751-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708568553-2751-1-git-send-email-wangmy@fujitsu.com>
References: <1708568553-2751-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28206.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28206.004
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
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 02:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108977

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


