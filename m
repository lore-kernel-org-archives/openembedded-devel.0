Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF1C04FF6
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:27 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2710.1713318080356860534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GUz2QNV4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318080; x=1744854080;
  h=from:to:cc:subject:date:message-id;
  bh=JES2zkdo9B5XobHG2oXXGW8E9IecJBONYEbWqX0SdYY=;
  b=GUz2QNV4F0Pk1y5XXnhM/VaED2WAO5p1KsMeLwTaVz6Eq0Yn+wyljtNh
   uXtTrHcA2WwC+qIigsVkhLRqrUZru94TjIxIIOfA/EPNxNnyO5olvFJaF
   pUufzmZTxN2KIkGmzw2YkBUTY8wS4hnLEQKqMUquPMH8mch7lvPa8pMWS
   eQloqp0+LMqheInYsq8qTwfSQpb/GGwGAQy6E9mJANCn7ls1FZzWFWM29
   ThNycVZ+dtGsrAP5zBGucqNiH3EMOP/82s2633WHGpd/dMbSbpHIOxnMt
   GMlqbw1+ouUs8E9/rlmapMTKCu6gb4JEjsTvM025jWtrHCUE1TEvalBDp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="157724895"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="157724895"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52AD6D3ECA
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 89DA1174A2C
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EF964224617
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 98D411A0002;
	Wed, 17 Apr 2024 09:41:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/49] abseil-cpp: upgrade 20240116.1 -> 20240116.2
Date: Wed, 17 Apr 2024 09:40:13 +0800
Message-Id: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--3.841000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrWvaFnGMIvOqKso3EN6f9DNTS
	AFXbQjEdN+23Pcx1Dm4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2ibX
	CUqG8SZnss9r//dw7twYUFsN5WfiFrsq/7BhdGyA6N/cDgNNi4U50qcJ5WOMhmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1bgTrkKo/GuVWcaVYuG/HlbuSJEylofXeiCU4/qVWJwEU8L880YkKhfhLT
	Fpr/SmeUqOn9QfDV53Wz4DFVo6LlwMyN9p/wKqF8r64759oAVlTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109987

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Added absl::NoDestructor<T> to simplify defining static types that do not need
 to be destructed upon program exit.
-Added configurable verbose logging (also known as VLOG).
-Added absl::Overload(), which returns a functor that provides overloads based
 on the functors passed to it. Note that this functionality requires C++17 or
 newer.
-Bzlmod is now officially supported (previously it was supported by the community).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{abseil-cpp_20240116.1.bb => abseil-cpp_20240116.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.1.bb => abseil-cpp_20240116.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
index e6c65d306..2aef97391 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "2f9e432cce407ce0ae50676696666f33a77d42ac"
+SRCREV = "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
 BRANCH = "lts_2024_01_16"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.34.1


