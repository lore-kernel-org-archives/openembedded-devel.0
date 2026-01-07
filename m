Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABE6CD5837
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:34 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3063.1767781765784008388
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NeY2GYMZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781765; x=1799317765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nZcA7uy6b1KkJ7mEp6IofFEmK+i4KrN9qlPgRmV6q00=;
  b=NeY2GYMZSiRuQqc6745qPQCC2C7390m1Pn7BZZE1m0NFnOzCqFTjYRqf
   gLGkSy/k3FJOTmt+brULIaG48bxWVPbVRSN6jcZ8oyrjcJ2i1iTg8oykl
   lGdtxc7BoeCY4EUM/9IZq9gbm1jG6JH8ser5owKO0lC1T92VQQBx3W+kf
   a2Z7QuAqeN686qUbb1OZ2EjBgvJciQmV09JLfI/NAxwnmZ/aI2TyE68vI
   2/5kX/+0Uhx6GqJg1WeJwIrhNXru25z816ICeH0C39I1l3PGSA9WVejVw
   606+gRcb34keBnn1oeFSjB7BHjMwZ5xe1CoXx/dJZOqPkno3S0Ya9s6bV
   A==;
X-CSE-ConnectionGUID: qlCemsZGRXKl/UCx7f8QIQ==
X-CSE-MsgGUID: X1FzGqm3SGG0ierjMjD1iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="213016682"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="213016682"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 088F2C00549
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B4FB1C011A8
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D5C8282173A;
	Wed,  7 Jan 2026 10:29:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/24] libtracefs: upgrade 1.8.2 -> 1.8.3
Date: Wed,  7 Jan 2026 18:28:42 +0800
Message-ID: <20260107102855.228-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123209

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtracefs/{libtracefs_1.8.2.bb => libtracefs_1.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.2.bb => libtracefs_1.8.3.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
index 35eabc7b11..8f27db9bf0 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "03790961bf2e83b7b61fb6d326fb1076a4293adb"
+SRCREV = "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "
-- 
2.43.0


