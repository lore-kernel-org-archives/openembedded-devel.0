Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EE0D29FA2
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40031.1730874692168519270
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tiL/vS2g;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874692; x=1762410692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IJmoPSPkreMVBb6FDyoorIFtGZkkZroKWR4j6cbQdt8=;
  b=tiL/vS2gDXcXp8WOLzcmKselfAVg2qaHDKowqo+weaexiitD5Ef0m6G5
   Z7qrfvr4ZVppvI7IipasteKQMDMMkKLnTKNDuJJMMMwyYeFWZnqOunUvC
   dAk+1tkl7J9HN/c+bPQ/CFxWtMGsdguf9YFpDyRHJHd9vxM7c9h2Zml9X
   jh7jdEw/yFzUFLFTZI70T/tYVn8UCubxH4myDLGEN67hSF9dSDsQ6RHP0
   6heiFmR3gouCiu2AA+HeOxDFZMYFGYP9idYZJ2to73dbQNUO6NY9sAl/m
   Po78hvjpju4AvoxVnoKw/JsLfLT9lAZDAHgGC76vPnWUR4xnNSu0LugtI
   g==;
X-CSE-ConnectionGUID: H+l75uz3Sf+Mbtjn1wulmA==
X-CSE-MsgGUID: BT8fHnW+TGO17Q3H9vWVMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167636035"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167636035"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F1B9FD994D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 403FED3F08
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB7BD6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7A4041A000A;
	Wed,  6 Nov 2024 14:31:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/46] python3-icu: upgrade 2.13.1 -> 2.14
Date: Wed,  6 Nov 2024 14:30:42 +0800
Message-Id: <1730874660-2364-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.089600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgyy8RBbzC4lPfOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYb6BhbvCLU4dEf8EopP8i6iLa4ChNTVoC82YpzXNb/wZkNDatM4mUQK5d
	EJOYE+XgPp49jV1evCOYSXv9i86tHe9GNlXK+faR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113720

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-icu_2.13.1.bb => python3-icu_2.14.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.13.1.bb => python3-icu_2.14.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.13.1.bb b/meta-python/recipes-devtools/python/python3-icu_2.14.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-icu_2.13.1.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.14.bb
index 6a590de5f..facfa4ffe 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.14.bb
@@ -9,7 +9,7 @@ DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
 
-SRC_URI[sha256sum] = "d4919085eaa07da12bade8ee721e7bbf7ade0151ca0f82946a26c8f4b98cdceb"
+SRC_URI[sha256sum] = "acc7eb92bd5c554ed577249c6978450a4feda0aa6f01470152b3a7b382a02132"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.34.1


