Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4794C54756
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.8722.1724833546681138626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NJHdtipl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833546; x=1756369546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gWFC4aZ76W7MOXYAGHjDjtnBPcEVZsp0VzmuI6Ki9L0=;
  b=NJHdtipl3ZyF0xySmeqb/3O8jXchNCa9NI8JTJCCPMtG+1pOjZT74HbF
   RMlj//2y/822zBrEEG8iApBjQVkFh26weXzZoGjVZrBR0orzVUvqSjQOm
   DOwR2xgS+YsDZxBoRqBBM3AfR9zgBCQQUI/jMjfRFwFeJBk/Hh8OUgE9X
   WX86BOtsBRfNFostNG6HoBkn2+M4+8/TvJMYRpSSyEiet+5fcSmdD7Tli
   6v9QdvvL2TWg3CA5/pWHlSkIgGG6oVVW8OekOtaSJjczVmDk4k69+WGBt
   VVzTRGt4xlROidK/P+TaNutd01rXfCm0/r6HIruz3QNR5GYEvhPoWHdnJ
   Q==;
X-CSE-ConnectionGUID: LyiXiy6xTP2vSIMNu1LQnA==
X-CSE-MsgGUID: jyMz2zcRTdybJmMZhkYfTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="159907250"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="159907250"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FBE050B28
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76ADED3F0E
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B97F6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ACC2C1A0002;
	Wed, 28 Aug 2024 16:25:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/46] python3-aiohappyeyeballs: upgrade 2.3.4 -> 2.4.0
Date: Wed, 28 Aug 2024 16:24:56 +0800
Message-Id: <1724833525-2162-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.920200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFonA2
	ojUPmp9YOrHegya9v5UMyw6hMrtYUO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFLMuWyTDieh+eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDu1LHJehRHKEhoQjmHVNU1esWFT5q8kAvSMN8TMooKIB2+qGth1DN3q98WImRRqpjyJkX
	lFqzXLtQ6tB1qrlMMG41MDMPzgpO4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111995

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add support for python 3.13
- Fix a trivial typo in readme.md
- Correct classifier for license python-2.0.1
- Adjust license to python-2.0.1
- Remove upper bound on python requirement
- Preserve errno if all exceptions have the same errno
- Adjust license classifier to better reflect license terms
- Add link to happy eyeballs explanation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.3.4.bb => python3-aiohappyeyeballs_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.3.4.bb => python3-aiohappyeyeballs_2.4.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.4.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.0.bb
index f9816f6d1..940492283 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "7e1ae8399c320a8adec76f6c919ed5ceae6edd4c3672f4d9eae2b27e37c80ff6"
+SRC_URI[sha256sum] = "55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


