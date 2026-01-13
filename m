Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C44CD0C82A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56070.1768299872824245964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tYfPNbDE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299872; x=1799835872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QfFicFuUb0Bt1/1WqORqFp+H/trjPaxNUyJfHyjrg+8=;
  b=tYfPNbDEFZxgZ4O6S7BqbnejZmE3cQDh3/af3XXe6hMeZMvaQHsT+BH6
   AbGEfPezqshEZuoxdKDFp1oO1gJDw3wqWOge6dwbbNqZCxp5uznCD73GN
   JiWZh1xX1r32lScMFchazu+ubHY2TPn7z1ChmJk6taYg0727mUCejh8yG
   Md6NbNy8dJr+bkJBmKKbTWjyOI07gPC506u2XeTt99QldxQ47cCgMwmtz
   GPqmRqcPGI5SssOkD7X/gRHQISizGsfuKcPtz5bb+MGWXz89mIpYwHmcG
   yVbnZtYj1JeQOsF+LvqDkGLT/1F/mHBTCkYJfSe+cVPWRp7ADlOgcTuNX
   w==;
X-CSE-ConnectionGUID: Z5jqaCBuRfSD+kGa7I8Rjw==
X-CSE-MsgGUID: utGKqcKZQNGQFgIb4eYd1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="226265771"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="226265771"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5CEC11C1C703
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:31 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 14D4C140035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3A9651019041;
	Tue, 13 Jan 2026 10:24:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/22] python3-huey: upgrade 2.5.5 -> 2.6.0
Date: Tue, 13 Jan 2026 18:23:23 +0800
Message-ID: <20260113102334.605-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123417

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  "Modernize" build system to use pyproject.toml and github actions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.5.5.bb => python3-huey_2.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.5.bb => python3-huey_2.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb b/meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
index d80ece1fc7..4a85219852 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "a39010628a9a1a9e91462f9bf33dc243b006a9f21193026ea47ae18949a12581"
+SRC_URI[sha256sum] = "8d11f8688999d65266af1425b831f6e3773e99415027177b8734b0ffd5e251f6"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


