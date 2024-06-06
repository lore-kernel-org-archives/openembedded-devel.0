Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C911C27C6F
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9823.1717664813903026654
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BhSYjLGB;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664813; x=1749200813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bCPUhrqMKG+yhmuntfxeH16m+d8cJ6pOJPlMoAJEjlM=;
  b=BhSYjLGBlXrMnhZpJTE04FPL1GfMkopCdNqO4wz3qnDEaWlPZFrvn7at
   +U8MaBO8NRy44xRxlee5RB29t8HLmQxbKpWeqPtO+yHfg1PcD+OX1bc8n
   Ioz4/EFnjY7JDy485AyWOgEyzrKh8s60uO8jKvb6FGgn6S8sv0O04pMZA
   iMk4i5qVAK1x9Y8tL1QoqjQoapaFw+siZe+kn75j7EHNltyNjeC2xHJCt
   jzjFARy8f6A/cJ+PuJEPgcYWAUCVVfpwYUI03DkqX4BFrhJAjbCmTKwBq
   p8f41GpF08C1mx7sQ/yATDaLLFypmT++1wzIx7EvNfniA2ehx/32oejfd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141239172"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141239172"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:51 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 839FDC68E4
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD44BD3F03
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F4E2401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CEAC1A000A;
	Thu,  6 Jun 2024 17:06:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/36] composefs: upgrade 1.0.3 -> 1.0.4
Date: Thu,  6 Jun 2024 17:06:05 +0800
Message-Id: <1717664795-13902-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-3.592800-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrWfgivgcUPZNfJLE56rrFzYiL
	DMCX3SQ8m6WfEFBBxPp28TUhL61rfSGIqlqmIVBSkYD8wAZKsSBNLPQl0QAltIwnGKAoIKJLk3N
	F02ivE9euJw86xBeRDdTOKyA8bVcHb3gilrWi3Gg/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqkHJEEn3XMkOuZvZnhv1kuR9GF2J2xqMxRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07blX3
	Pe+qTcqReY98EeY8L40FxsTTjoZbLQw6xAEJO6Nau0OuKen77Yz8MZdpOsMbsQjpNW/ePq5MiJQ
	kCB2wc5XcRWhkudY6Pl5pxuIvEvd8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added LCFS_MOUNT_FLAGS_TRY_VERITY/tryverity mount option to do best-effort fs-verity
- Use the new loewerdir+ and datadir+ overlayfs mount options from linux 6.6
- mkcomposefs is now multi-threaded when computing digests and copying files
- mkcomposefs now uses copy_file_range when copying files
- Added some initial rust crates to handle composefs dump files
- Added fuzz tests
- Documentation updates
- Fix some crashes and leaks
- Improve error reporting
- Fix build on various libc types and versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../composefs/{composefs_1.0.3.bb => composefs_1.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/composefs/{composefs_1.0.3.bb => composefs_1.0.4.bb} (95%)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
similarity index 95%
rename from meta-oe/recipes-support/composefs/composefs_1.0.3.bb
rename to meta-oe/recipes-support/composefs/composefs_1.0.4.bb
index 38fc8d267..aaf33b40e 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 PV .= "+git${SRCPV}"
-SRCREV = "ecef20c18c81943bd17b489ad1484f361b99c792"
+SRCREV = "7623e4dc89f62ada5724d4e41d0a16d2671312f5"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


