Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDEBC021A9
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.46635.1739178133509907966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Duom5v2r;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178134; x=1770714134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mKHH4Fv9EnXzbOlt7qMhmn7XR5Qsw7d1qVHVkEZLZQw=;
  b=Duom5v2reMxVMHfFOoAO5szvdgAOrU0YB3/C0Jc4MgVkiefsnVBhwdEt
   WTQmoxQrAjt4qE0WHA4a9J504/606AcK3YMkiFZLDnfSSiIT83nbt0Hof
   dp7oUQhjf5j6dv7EYELbolxIv97v4pgvaWTGlwXjh2PUXClII/Qbm1ypy
   Zgm5YtIvDnpg1U4xKsRCBbI3XAI7/be+Kv6NpZzZV/8RZvPx4uDgmg0iq
   Bhc+yvdrKzvF6x47gukV5K4QpMh50LIK8/Aeoww3UMp0aG7Rhfzd/aCu7
   z9KaYkt15JUzAtoDgWAmpwEwCbqnH8/KFGaaHYwAxTtHm96t2RanH3lOf
   Q==;
X-CSE-ConnectionGUID: lwSQELroRZCjU0cpcqqG8A==
X-CSE-MsgGUID: bFzg74jeTd+AZmerTaam4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168394117"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168394117"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 63F48D4F41
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C8E9D968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E76E31A000B;
	Mon, 10 Feb 2025 17:02:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 65/66] python3-zeroconf: upgrade 0.141.0 -> 0.143.0
Date: Mon, 10 Feb 2025 17:01:34 +0800
Message-Id: <1739178095-26432-65-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115393

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add simple address resolvers and examples
- Eliminate async_timeout dep on python less than 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.141.0.bb => python3-zeroconf_0.143.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.141.0.bb => python3-zeroconf_0.143.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.143.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.143.0.bb
index a968a65182..470cbb0847 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.143.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "c0c41cfe1331cf885f132dd2400e4091f59ae0a571cae14f3db66919a055489b"
+SRC_URI[sha256sum] = "35f9390e4b862789f2d62da864bbf6ac26ad1d6dc8cf1e64a4d3554c85a05002"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


