Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5A0C25B10
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6682.1714628967326746876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=je4sVmLg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628970; x=1746164970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LhGx1a2+yb4KlYJmeyAJZzZy4zmIZAUCERxxt2gJ2HI=;
  b=je4sVmLgqztIOTTQe3jBRl3IRK++8LaGpSW3y7ryqZ9duwP2e0n1vjJT
   1RW8rHEfW/PY/sTfh4o7xZd2slP5/6TVd0jhRlLyw+o+q9ptEaxRTZSql
   lkNXFKFPD3mthQ0yLJaHog1ZSF5lFR3Hl+pxTgexmY24wNgUEAzN1qSqt
   x29RQAMnHN0xDxxhrezC6wyLfORJVVvcI6obl2wmjWKmhI00iB0E9MGdi
   J9XhHQDq7RMILgHyV/kOVxhFE0n7VGLMiexTFPsOZrqk/mNNOKHxuuUng
   rOcuLouhLkmSar9E8gbLbw8+2zVdZGJ46t8r7GwSCN7IoZRoxCOYHHHFo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157281960"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157281960"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DF6FD6EFC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D03E51DFC1
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68797223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:25 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 16BDA1A0002;
	Thu,  2 May 2024 13:49:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/30] python3-mypy: upgrade 1.9.0 -> 1.10.0
Date: Thu,  2 May 2024 10:48:11 -0400
Message-Id: <20240502144829.241208-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--3.367700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO3Ow
	/jufb+urNcMtTw5wc5O6lR6MMqavZ1nGEjlsas2yxi///JpaHQOoWh/LtczE0xhSCKZBIQo80gO
	XuK3NJnJIPH++v5X5undpZTmN1jrYseY8I2CDJmQ/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IXymVDB8yZElJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMORGX+cP4rwxNMbkLzo6Ws5czywu20IZX8HW9LD25XU3tVndOmJBUXCvaz2ZymRARBCExp
	vhT3z0UwIQW9K/ugSjf4bZ1vD/U6W4wbpXTb5DJKKve1kh3RY37qSWrndbmQn0bOriG5BVc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110217

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix incorrect inferred type when accessing descriptor on union type
- Fix crash when expanding invalid Unpack in a Callable alias
- Fix false positive when string formatting with string enum
- Narrow individual items when matching a tuple to a sequence pattern
- Fix false positive from type variable within TypeGuard or TypeIs
- Improve yield from inference for unions of generators
- Fix emulating hash method logic in attrs classes
- Add reverted typeshed commit that uses ParamSpec for functools.wraps
- Fix type narrowing for types.EllipsisType
- Fix single item enum match type exhaustion
- Improve type inference with empty collections
- Fix override checking for decorated property
- Fix narrowing on match with function subject
- Allow +N within Literal[...]
- Experimental: Support TypedDict within type[...]
- Experimtental: Fix issue with TypedDict with optional keys in type[...]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mypy_1.9.0.bb => python3-mypy_1.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.9.0.bb => python3-mypy_1.10.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.9.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.10.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.10.0.bb
index e51264f8a..534ff9066 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.10.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3cc5da0127e6a478cddd906068496a97a7618a21ce9b54bde5bf7e539c7af974"
+SRC_URI[sha256sum] = "3d087fcbec056c4ee34974da493a826ce316947485cef3901f511848e687c131"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


