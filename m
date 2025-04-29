Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD04C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 07:21:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.11904.1745911285455854565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 00:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cq5sl97U;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745911286; x=1777447286;
  h=from:to:cc:subject:date:message-id;
  bh=qd+QIluquWwDNMJ2PGZtshFZUqazLn9UWy6/Gf7ItEE=;
  b=Cq5sl97UUMu/9sSc/JrvsJivMEL2YU3Scti/LvCIUTtQs5JeqF8UQx1n
   4HkwlxLZWbIGmf10nWTD9GWMvI1FvxI/7ftfaJPVDJ7oQrapNYPEdazd1
   XhrruBkAvHfoYq6l0IKFrgLQALmQQXy++jAwdRuO/yz7l0QBo1sFUBvMP
   uoWz9qzrchksRsvJfH6oOp87aOysokf5BMXViR6iBGPLyW+rKzzw3BpYY
   Tw2A41sVZ9YiEesIfvNBsOowzoWw8ES3K9LpKMtIKoOt2HTVC8BUyqCi+
   bC+Hae4JL5kZCWw2/0I7dxvgCdenRvxFox784JzvKGCNkbnsOkkfFw3so
   A==;
X-CSE-ConnectionGUID: 5vESpSjMRBikFnxtg1L5Aw==
X-CSE-MsgGUID: kTe6QcTMQ7aJ2aWO0HG6nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="200857166"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="200857166"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 16:21:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA8D2D4809
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 16:21:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 840F1BF49B
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 16:21:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 157971A0071;
	Tue, 29 Apr 2025 15:21:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] procmail: Add -Wno-implicit-int to fix error of do_compile
Date: Tue, 29 Apr 2025 15:21:13 +0800
Message-Id: <1745911273-27541-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 07:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117230

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 32fc12c7da..86d75e8c7c 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -37,7 +37,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.43.0


