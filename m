Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B69CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19021.1779190770021256583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cqDiwH4z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190773; x=1810726773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eevIWMASBIEBComaqqX5fDX3oicWIK+ZJ0UPVvlhtsQ=;
  b=cqDiwH4zB5ou6lS07GkhSSEWU8BXmvMhTcpkMQXJ2TQs7ANZY/CW+RRT
   yptiJLo1TyDKUaJzFS0K7LtSxs4WlyqN8sVMNa5eM8KI/K4TqkAYma/rN
   BInaevkq3o1xE2mL0kCKEJ3J8W/uGwC1kDKiY7UkrNYQoxGqj9EksPVz0
   sPin2Y7OzLhvaM7Cc8sxUj/b8cFBrWpydFIiWcIAUvWv+N+IXtqcvFSyY
   okkBqxlXaN5FWv0D2X6NYKJtjMoK5yWODqe40fS/FQxg63mqvUOOH/cH1
   Bj40R8LElbMkwBqnmv5eZYajk3f40pAqpY6Ahz0gFv8pw8N6YpjrENBXq
   g==;
X-CSE-ConnectionGUID: RdP2lAIPQIagcpexuCdg3Q==
X-CSE-MsgGUID: F4yU0890RreAwFPaNk1NyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="227255573"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="227255573"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 614FDC000B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:32 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1BB7A18107BB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id AFB484066DE;
	Tue, 19 May 2026 11:39:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/38] ctags: upgrade 6.2.20260426.0 -> 6.2.20260510.0
Date: Tue, 19 May 2026 19:38:46 +0800
Message-ID: <20260519113921.655-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127065

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260426.0.bb => ctags_6.2.20260510.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260426.0.bb => ctags_6.2.20260510.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260426.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260510.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260426.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260510.0.bb
index c3e6df01b2..19f4fd3480 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260426.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260510.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0498b5983b38f835ece70890ea171d1c1204f284"
+SRCREV = "76e4cc275815e0440afbf45a30d692e62729d851"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


