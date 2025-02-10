Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B315AC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.46476.1739178139714219319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kiGX+9jL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178141; x=1770714141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WVAqUmStTdqbPRgVmmQHYbFpwniJ7RPrlOIRlFaus5Q=;
  b=kiGX+9jLMkLLbjT77tkiUedLwTOB0M49sX7Ny9T2Ll5GCnsaTeQEoAyt
   2O420gTCBUJjkTUiiNsbtqMVruQdQKR6LJslW8t5QUjut8VsPpmsKZhzk
   7D6TZgVcK9WeoMC2hXv9xeH2v+CaGJz771MsYdH15Kf/LaRTZ11rcRBf8
   MA+KeOuBID0nLfAKKaJH8PxqhtL8nYdg9irv+2C+WhQl2HIowa1hG1uPU
   1Mf7UfwNvep2tMDI6E7Vdnx9p+9ePCNj7bFvNYHX2S1PFLbsVt8TgvQBo
   vL5sihivmQRpm+JubelZiEE5HVOfcbRJoRP3QnNBht98y0xToZKPJdRQ7
   A==;
X-CSE-ConnectionGUID: fNi1YJYpRCqFdspjoTvwxw==
X-CSE-MsgGUID: rxwtheL6RT6eT1lXM30ZPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189426358"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189426358"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:08 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79ECDD6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40BE0D968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 066881A006C;
	Mon, 10 Feb 2025 17:02:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/66] python3-prettytable: upgrade 3.12.0 -> 3.14.0
Date: Mon, 10 Feb 2025 17:01:22 +0800
Message-Id: <1739178095-26432-53-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115394

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add add_divider() method to create sections
- Fix sortby at class declaration
- Fix divider intersection for border styles
- Add missing quote to deprecation warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-prettytable_3.12.0.bb => python3-prettytable_3.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.12.0.bb => python3-prettytable_3.14.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.14.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.14.0.bb
index 007c0bffac..93409cdc82 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.14.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
 
-SRC_URI[sha256sum] = "f04b3e1ba35747ac86e96ec33e3bb9748ce08e254dc2a1c6253945901beec804"
+SRC_URI[sha256sum] = "b804b8d51db23959b96b329094debdbbdf10c8c3aa75958c5988cfd7f78501dd"
 
 inherit pypi ptest-python-pytest  python_hatchling
 
-- 
2.43.0


