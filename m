Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC9DFD7F8F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92760.1772187345142837553
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l3WB2kMR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187343; x=1803723343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zhHU7///oFWyf26CjbCpxlSMHH1mHPcPRE+ck/1WQMU=;
  b=l3WB2kMRr6yr3FiGZ9n4j/+VfU4fKQU9o3c9JbnRhYAfxFJ0mfbWA4mC
   9VwR6HrX/HP+8ly+rVzVMT74so6kHrWIuMD8Q8oVpiOHCKC/rkLR9kXej
   tgIBdY4vz/Mh/wfRwGnGTZOmIuAWYYA7jrJk077c5rtLHujrF8kFJuKKW
   xq8CVjM6uyWBmBD1Df3v0ZH76z503/OLQqaQRHTJoxHkLcWNZ18LrXDxG
   IW0faN67gNVIqy2MI6n5T/z9cMeGP8c08LCJ1Qx13ThwtNmZIGHcxQs5Y
   Q9UaGrDm4SBbglzkXvjZ2141XgeeZ3/qgp6cjH8YWs3yIx0bhWf3mHw24
   Q==;
X-CSE-ConnectionGUID: Wr0DYBiAQRGjv2ivRj02nw==
X-CSE-MsgGUID: 4jaT25OJTnK6zdgH1bNi5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210299572"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210299572"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id A6AE78200B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:43 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 55312C06BF5
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 677B518005BF;
	Fri, 27 Feb 2026 10:15:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 49/52] wavemon: upgrade 0.9.6 -> 0.9.7
Date: Fri, 27 Feb 2026 18:13:24 +0800
Message-ID: <20260227101327.1432-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124749

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wavemon/{wavemon_0.9.6.bb => wavemon_0.9.7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wavemon/{wavemon_0.9.6.bb => wavemon_0.9.7.bb} (92%)

diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb b/meta-networking/recipes-support/wavemon/wavemon_0.9.7.bb
similarity index 92%
rename from meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
rename to meta-networking/recipes-support/wavemon/wavemon_0.9.7.bb
index 4857c0af4f..e9786207f5 100644
--- a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
+++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.7.bb
@@ -13,8 +13,8 @@ PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 
 DEPENDS = "libnl ncurses"
 
-SRC_URI = "git://github.com/uoaerg/wavemon;branch=master;protocol=https"
-SRCREV = "8ba6604027c0aa5131070e3fafdcda323d58a7ad"
+SRC_URI = "git://github.com/uoaerg/wavemon;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "fb158b047c39af62b6627fc7e6c16e5017681d8f"
 
 # Needs some help to find libnl3 headers.
 # Reorder -pthread flag on the command line.
-- 
2.43.0


