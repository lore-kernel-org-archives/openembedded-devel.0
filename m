Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C675D29FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:04 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.40155.1730874776419811015
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HVHGpf9D;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874777; x=1762410777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6Dhj073ASOy5CQm4R5AzMZIMsrJxZ0LGfMl252BHlEI=;
  b=HVHGpf9DuW6BcNR70dPkrseox85cP50RAOHCfD0p1PkLSIOFYBrYO+Hl
   tvdYO7hcfq6Hccjy9wq1tk74pFvebQSu5qlgqn8Dd4CxCgHdENpUXG428
   StdG8ZU7KivqfyBewm+gOQgkezPiXBrhlC/P9RqRysoxxuE8ICY86Gd0h
   ChBc7rX45d+rfacVuxbdHYVUBMF2/vjnycG/WD7Wm1I/QMhelKlKGxMUo
   66Lb6lWNNCoPVa00TpqEf3jrGIcMz34WSfhA8eFMWRT7U8RTVWcLtNqmD
   EmlYKWphN4w16ryJBm7LPuzoLdwFupcOtmJsMVEIytPx5UOssTF+TF6FT
   Q==;
X-CSE-ConnectionGUID: ge450b9kQuiyW5q95dG0RA==
X-CSE-MsgGUID: F0xhRlPEQT2xDHNo64qYMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="178487510"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="178487510"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:32:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15947DB3C2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38066D3F09
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B39D22007955C
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FB651A000A;
	Wed,  6 Nov 2024 14:32:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 44/46] sanlock: upgrade 3.9.4 -> 3.9.5
Date: Wed,  6 Nov 2024 14:30:58 +0800
Message-Id: <1730874660-2364-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.832800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIjoXTYf2xFF08HitdqBBn7HEDUAqZUZM7g02I3oyGU8A91mbLHzEBrZ28
	gEzxS4tLBGBivVrAn4IAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzrHW5hA7A7l+kJK
	LGjrDsmKWX5PrmE8ZUbDRpZl3tD+IRu04lGQbSBy/o8hNKqS5gZAPOUBMQ0qM7QZUhWLXU17YRm
	T+EaA46iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113729

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.9.4.bb => sanlock_3.9.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.9.4.bb => sanlock_3.9.5.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.4.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.5.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.9.4.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.9.5.bb
index 9e879ff38..10a4db4d5 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "e077f1a99a07c32ef460db89ed395b441f5e8b03"
+SRCREV = "651d101aab40bb75cf348ab667eba04d6d771c21"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


