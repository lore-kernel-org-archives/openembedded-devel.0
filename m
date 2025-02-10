Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2542C021AC
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.46632.1739178128861300739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G8+//x+5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178129; x=1770714129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FBuZ5c8M3ob8UlBBt01ax/8pgRaRAzhFSlERcdYk7oM=;
  b=G8+//x+5Q8JhfJIFiLxWw1VL0HeiacU+FPstNikCUtqSha8MsjxrEcr0
   7Nwh83AxCN2I8j+RcCdNwY/vsaaNkGThdXVSNVyjUC/KkhWuoXONNZdE/
   scLteueD/eim/MITQb20u99DXBQzcNQlxdO/7I6OhUp1ux5KYlgyrmy5X
   tY2J0c/+8+c4lcwO0/2Rgp9Jx/M6/+EuQg0iQBFMVxstm77xGjE9A9jS6
   ocZUObht67oFtzVM7lFqm1ZMxLhfyZbgm5nFfllX1QTRDLk1hxwvWHJA9
   GPx3B6v0ghKsgAlaWr+ZGK+EBanBKUewTKEiktYqtcacFX/HwwkSydmbH
   w==;
X-CSE-ConnectionGUID: anSu43LKQgSkQzfi20Uu/Q==
X-CSE-MsgGUID: NYgVB/U6SwGJkCSQWufOMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="176813952"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="176813952"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7996DE8528
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EC17156DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03F741A000B;
	Mon, 10 Feb 2025 17:02:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/66] python3-nanobind: upgrade 2.4.0 -> 2.5.0
Date: Mon, 10 Feb 2025 17:01:19 +0800
Message-Id: <1739178095-26432-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/wjakob/nanobind/blob/v2.5.0/docs/changelog.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.4.0.bb => python3-nanobind_2.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.4.0.bb => python3-nanobind_2.5.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.5.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.5.0.bb
index a151d6db4e..e37421caaa 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "a0392dee5f58881085b2ac8bfe8e53f74285aa4868b1472bfaf76cfb414e1c96"
+SRC_URI[sha256sum] = "cc8412e94acffa20a369191382bcdbb6fbfb302e475e87cacff9516d51023a15"
 
 inherit pypi python_setuptools_build_meta cmake lib_package
 
-- 
2.43.0


