Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F487D0C82C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55839.1768299877074328113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mkwzv5lk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299882; x=1799835882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xgpOF1We102X6oXTqDFCtYZu7NBVWFfecR5Y8vl6NbY=;
  b=mkwzv5lkI8jD6gBMzgKU1jTt8O1Ugk0099ipgDzXXhgwSJFV19zfWi6x
   NSzazXn7CXneF7UI6zbjdkr17RrBUyubY/Cg7iB6U4kcMGTl10FVdGh9t
   nyOZXKGBpPdiT63x1IfbDmEO2XFG26pxFvRzKj4GGweJSyFZPfdKYVETc
   8R0Ad6MgpV9JKgAYMkkIcl+nDzj8AzUEZck/qMUfLuXz082SdP8NCWtat
   m55btc5JtykNPASw9Y5eISz3nuvhPZR/F1Zl3zLmgpCORmoqzea9lbaMV
   Ga/rQy9MCCE6J6zF841PByrUUiL6XpLoy3cL1FPzrOmxUISlu6hCnjese
   Q==;
X-CSE-ConnectionGUID: JTiSkU5LSvqLTMa7kM4clQ==
X-CSE-MsgGUID: FH4NZLRjS5C+u5WTfpCaAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204607161"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204607161"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:41 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C13601C000BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7493E100137A
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AA0731019049;
	Tue, 13 Jan 2026 10:24:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/22] python3-pymongo: upgrade 4.15.5 -> 4.16.0
Date: Tue, 13 Jan 2026 18:23:28 +0800
Message-ID: <20260113102334.605-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123422

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.15.5.bb => python3-pymongo_4.16.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.15.5.bb => python3-pymongo_4.16.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
index 80f07e4425..75d0504d46 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3a8d6bf2610abe0c97c567cf98bf5bba3e90ccc93cc03c9dde75fa11e4267b42"
+SRC_URI[sha256sum] = "8ba8405065f6e258a6f872fe62d797a28f383a12178c7153c01ed04e845c600c"
 
 CVE_PRODUCT = "pymongo"
 
-- 
2.43.0


