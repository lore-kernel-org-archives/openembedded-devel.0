Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F82BD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4121.1765274186929967132
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R/wzw4b7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274186; x=1796810186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/i67X4kN13E+4IcKN8i952MIL30jOXUHYp5GkMdHyYE=;
  b=R/wzw4b7EIG21eyEWEsWRxoqUYEOEwmS5uDG8Txp6yRL2KXBaSti9ZAm
   yPYIQ+FtwfLI12MeD1YjCS6j1jgpgR+XLT0XEWkt6BP5ORdcsl9Hv2ikt
   1bV8+OI/r2QXYk3IrNkD0VRvOh8r+BTVfD6POm0AA7foiYNPFejgrqLGq
   PNV0mILkpyapLYPvqge2tRyYJNm71IFrwaj2BTP3eNJ3KTWRtQ6PI9Adw
   SzQ6YEh0tOaqeeVF58F//+KdirB8cB/FaT3bdYvNgtAZaB0XjUH2pd89R
   qT84qE7yxqZNlBPkzkv+YAr8iNKQznLLzWdmT9LmFdotx2eXc2EKTqJmX
   g==;
X-CSE-ConnectionGUID: WnhZLsxJSIaKA/NADGMY4Q==
X-CSE-MsgGUID: c6koDGsvRnqM1KK8LTgN0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="210560017"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="210560017"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:24 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 84629100036E
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:25 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 293821C00F99
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id BE2B020002B2;
	Tue,  9 Dec 2025 09:56:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/38] libnftnl: upgrade 1.3.0 -> 1.3.1
Date: Tue,  9 Dec 2025 17:55:22 +0800
Message-ID: <20251209095552.690-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122412

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnftnl/{libnftnl_1.3.0.bb => libnftnl_1.3.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.3.0.bb => libnftnl_1.3.1.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.0.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.3.0.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
index 705681641a..2d2f3d41a6 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.0.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "d36691a4ac486857fd437d3a9aa3701a073a9539"
+SRCREV = "0f48d7638800bb48c863e6b7e5f2fe92972bb31c"
 
 
 inherit autotools pkgconfig ptest
-- 
2.43.0


