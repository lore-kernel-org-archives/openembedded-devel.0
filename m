Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0744BCD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76243.1781000995194882629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=soQovj+q;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000995; x=1812536995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V3yairmBWBcBSC8kYvzP9bbvx8FZsk8RwXCWMmVWzrE=;
  b=soQovj+qXYtgAWfI+QDAFLomGfxppAqSl5h1ZDpraOlnbISJ77v5TU2z
   rz17uUxQpL9RichkFnEu22IRGmPozOuNUctzZCIOdq7H3bHYGrU5gjwRt
   EexnwZNuDJwz5hgupDpGg/OvN0HopeI6isz/55cGi0hUJI0vG3tq67Fqq
   gNB2zSN6v1aFA2QqOcVOovEn2tL4QigmIQYIxtqIfNlT1m8pOSHp4/upk
   qnhU2o6e7TpQaNS+xcT/f/zhFhcICalqrxYdL/PnEeDN6AtoyyrUDVLeI
   Ef0g4Mzr/2CBRHauB0ljpB61U4Yk/U065tr6r0xt/W29xNx2XI8LjN5rS
   Q==;
X-CSE-ConnectionGUID: png2ZOpMSPqHn+j/m97C4g==
X-CSE-MsgGUID: yz7oTL33THelnTg7D6TsvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="231500933"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="231500933"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 985D81002B85
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:53 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4CC93C170A9
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6A95D10003D0;
	Tue,  9 Jun 2026 10:29:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/30] python3-beautifulsoup4: upgrade 4.14.3 -> 4.15.0
Date: Tue,  9 Jun 2026 18:28:56 +0800
Message-ID: <20260609102913.2204-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127467

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eautifulsoup4_4.14.3.bb => python3-beautifulsoup4_4.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.14.3.bb => python3-beautifulsoup4_4.15.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.15.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.15.0.bb
index bd9725e2de..743f9b4c7a 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86"
+SRC_URI[sha256sum] = "288e3ca7d54b06f2ac191970bc275c1939cb46d450b255bf6718b04aa37ab4f7"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


