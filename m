Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCA9C021B0
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.46462.1739178118915531523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZH2UqCcU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178119; x=1770714119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=66dC9NNzqjbW2l6q6yXrbp5JliNI6kU12bf7HkJN6R8=;
  b=ZH2UqCcUB6kXVtOOOji/mLcah4EkZkrQSzVvlOlIa6kvpwWsRovAdRme
   cvHxRHNFr2bBtC8ZocnY/xEEtiaSfpaX/7I+GAGddNb+lNaX8ywn4hQB6
   1c/wKWHihiojES0RE8lddrXve61DuM0Gq37nLxPgcw90RzU40m1jfYK0P
   4dxPOiNCMuhGDHJsmoMw4T0CIE5GYlZFcbpp+y/8aIyhbox6Hw9TbLEcw
   1mzeuGf/0SvgcavfXJT4VG4xQ78JRgHHTKDkaQQIpQPyw1NR6v4ewcZrw
   B8vxvyfMxhkI5kHPGjYgxm0mCs0brSQuMRp6jiRxbuq/a+7dO5gngLJaR
   A==;
X-CSE-ConnectionGUID: y5rR6bGART6KJi4ZOvXB3A==
X-CSE-MsgGUID: p9OITmgkQwmK7Hqb87H74Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189493084"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189493084"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E98BF2A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5206210361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1650B1A000B;
	Mon, 10 Feb 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/66] parallel: upgrade 20241222 -> 20250122
Date: Mon, 10 Feb 2025 17:00:52 +0800
Message-Id: <1739178095-26432-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115352

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20241222.bb => parallel_20250122.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20241222.bb => parallel_20250122.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241222.bb b/meta-oe/recipes-extended/parallel/parallel_20250122.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20241222.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250122.bb
index 4fc5373abe..143839dad7 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20241222.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250122.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7a1b038cb198604107f9601b7c2a176e78d845858121708fa8690671cb301a79"
+SRC_URI[sha256sum] = "03c79e5b346e330cf9e5381c8e5a435fcbcdd08448964676b42f04e199bc8db3"
 
 inherit autotools bash-completion
 
-- 
2.43.0


