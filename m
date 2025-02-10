Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8F7C021A8
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.46619.1739178109628401903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oWT6vYOb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178110; x=1770714110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JJf+KaW5YkG++OrylobS0EQ9GeW0bDgONAYVHG+Wuv8=;
  b=oWT6vYObG7hiVWgn3u7/4TyTHHzwwjmsE3jefmU7Ih11MEiAgA4GOxm5
   onFbl83rLp2DwOv+ZSeVctQojSJR/q49MUw+tGByzGGsMxuaHE6/DsxeK
   lCYJwv1XrCyaz0eK46OqT5uc6l4RMUZAqp69rtakurLijL5paZQqM1kEo
   RFW3iWWrG5W9ac+MV6AEW8C1fOB57uk2RdopYT3dK5QV0PfxfCJDsuR7T
   OoqUaphca8Xkixdv1jvxgTCkzaMYdrF0+tTWdtGj/RDMsVWndC+Y9TJC0
   35cX6jvwX3QzZkHWI64+REqdhyPVcX+aB801bwO3cYk+m+DQQ4ILndSar
   g==;
X-CSE-ConnectionGUID: gYOQmrCsQi6pnrJx4vHYPg==
X-CSE-MsgGUID: HNB5y9rKSvuf+NUKPAZYfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="176813914"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="176813914"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B50BED4C6C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E2EAD88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 21EB91A000B;
	Mon, 10 Feb 2025 17:01:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/66] ctags: upgrade 6.1.20250119.0 -> 6.1.20250202.0
Date: Mon, 10 Feb 2025 17:00:32 +0800
Message-Id: <1739178095-26432-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115331

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250119.0.bb => ctags_6.1.20250202.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250119.0.bb => ctags_6.1.20250202.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250119.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250202.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250119.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250202.0.bb
index 5281d79c4c..16047591b7 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250119.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250202.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e2308b07c4d8e4d3b6b59547e75f51b1c6046f29"
+SRCREV = "ba8960c3b26ca92f710d9dbbf45802cdd2a3fbd9"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


