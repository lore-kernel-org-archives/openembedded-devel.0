Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889F3C021AD
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.46464.1739178120388111908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U8ul3hFw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178120; x=1770714120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eQMaQx9KirWm8Yq/Xs5DhOuVFN/N6CucYhm9w+PveV0=;
  b=U8ul3hFw5KFaDuGUO+KcLU7CMYY3CyfwOQlyzL3m0k8oGTLVMKRCEJ8e
   9n9e3yJ/CWjdhHRlqu56mKrIG+WJ4+Ax0LOQBpTV3Z93ocn9mpguo3P0E
   zqJw+PWPuLg6ekc5s/jUO08Lj1M4zVGXZxC/WuTQ7JPbQvuxLfg2yrlan
   JPWjDziXaY+yCNmiUOtTh60INEa0AWQu8ESl/5EdhfUYmo1oqwrpoSPnB
   sl2MSLV2L/Zxecg7dpjR7cYP+8zdV24YULWb9+y997NnXqmZ4xRILilmp
   fhcGsZFuoljW/h9SEaMY9Bd2wWkJJgN9yJAXblefBDyeZ14wAnMinHRp1
   g==;
X-CSE-ConnectionGUID: wKIJztc7T12FO0PZqiymUw==
X-CSE-MsgGUID: wclP0Y2fQe2YGMxLSXBO8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="188641295"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="188641295"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA2EAE8521
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A4061CFBA2
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 479D71A0071;
	Mon, 10 Feb 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/66] python3-black: upgrade 24.10.0 -> 25.1.0
Date: Mon, 10 Feb 2025 17:00:56 +0800
Message-Id: <1739178095-26432-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115356

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/psf/black/releases/tag/25.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-black_24.10.0.bb => python3-black_25.1.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_24.10.0.bb => python3-black_25.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_24.10.0.bb b/meta-python/recipes-devtools/python/python3-black_25.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_24.10.0.bb
rename to meta-python/recipes-devtools/python/python3-black_25.1.0.bb
index 612a2a5ab3..f87b1e84cb 100644
--- a/meta-python/recipes-devtools/python/python3-black_24.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-black_25.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "846ea64c97afe3bc677b761787993be4991810ecc7a4a937816dd6bddedc4875"
+SRC_URI[sha256sum] = "33496d5cd1222ad73391352b4ae8da15253c5de89b93a80b3e2c8d9a19ec2666"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


