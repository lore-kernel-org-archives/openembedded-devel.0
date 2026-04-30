Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9383CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17454.1777546225991760313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qEEUBMEN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546225; x=1809082225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2z872W+zvy91PNpszjQxjy+Fnzq7Jo098UfUwrRkFjM=;
  b=qEEUBMENoFYBZKQR5pmHp0y+2+jMmKuNnRZNo4gGT3TK5e6YfQkS92g+
   xEVdBilfj+x3jyaLUu82/vYKqw4Xis0M3oA33gzmfv5Rnoe+nhcaXvcI7
   iZIqKgVW76WxTSUkW76SxMRWjJMdqeQL/m6RiiGxTYdYlpgYpZciI9rhQ
   TrQvwHalX9FR69Uo5PocNaArX8fsSDx7Mb35NQGIJABrdwxFZF6UICZIp
   nrr2EkBAiytdNTIwNz8GTJM7OR/OK/pWHRjfFqV8VTfeTkzVY5s6eBLTQ
   guzeYYdYvL4PChPsWiQADI13nDAKHz4iTOc5w6a4UIJQM9ZLjIR0Fl9rF
   w==;
X-CSE-ConnectionGUID: TvCZQGeETPiTXFCWrDdV+w==
X-CSE-MsgGUID: CrkzK7YsQdycYVmqGHVE1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636951"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636951"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:23 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8BF9A8204C9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:24 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4560A14003FE
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D86C61801130;
	Thu, 30 Apr 2026 10:50:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/64] python3-flask-marshmallow: upgrade 1.4.0 -> 1.5.0
Date: Thu, 30 Apr 2026 18:48:54 +0800
Message-ID: <20260430104924.1106-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126705

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-marshmallow_1.4.0.bb => python3-flask-marshmallow_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-marshmallow_1.4.0.bb => python3-flask-marshmallow_1.5.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0.bb
index 189ed5335b..a311730980 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_flit_core
 PYPI_PACKAGE = "flask_marshmallow"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "98c90a253052c72d2ddddc925539ac33bbd780c6fba86478ffe18e3b89d8b471"
+SRC_URI[sha256sum] = "7c06b56e41647eccdb3cd57c25b109f19191b4c62509362bd64920cdf601a066"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.43.0


