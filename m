Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D873CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19049.1779190860429485076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jxujTQMk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190860; x=1810726860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ka74XxU/AaLfg/+BFWZEo956jAgZOoYeA7z537cQ8Jc=;
  b=jxujTQMkf2kgHIJjhqrEgZAmArWyeTyXOC6hDr9xLupYilBdXFZjk5wn
   dM56V1/WTA9sun4dfDL/nCwaj+E8Lc51TuZZMvQhIgQEu1uPLw47niS5p
   bcrIDWJT4Fhz7SOCcthTm8xHRgj9NSdiJH1yHvthXAZ2E1QYpnS0B7tY6
   3aoP2XVUcbXcEcUD3dL/LxaR/KKshIzDpR9E3/7YfCHeD7J+Qy0vQ6zVw
   bksUAgCF1nWzbdwqtPvUnVQfl9RyWdOhzICcLb2mCa/vGDUy94mfx4psc
   xwt/GIA9VGoNsOA3xQGb8j6qJmNG189LVr9rQ1VYWqwX8iK77PVq2GsGg
   Q==;
X-CSE-ConnectionGUID: iXrMTyuwTred0i8u+nKaNA==
X-CSE-MsgGUID: BGeURyxYSkCPnHcpgWuOcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995256"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995256"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:58 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DFF067329
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:58 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9239110000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 17311405ECF;
	Tue, 19 May 2026 11:40:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/38] python3-thrift: upgrade 0.22.0 -> 0.23.0
Date: Tue, 19 May 2026 19:39:13 +0800
Message-ID: <20260519113921.655-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127092

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-thrift_0.22.0.bb => python3-thrift_0.23.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.22.0.bb => python3-thrift_0.23.0.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.22.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.23.0.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.22.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.23.0.bb
index 2dba3d48a6..aed56e00e7 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.22.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.23.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "42e8276afbd5f54fe1d364858b6877bc5e5a4a5ed69f6a005b94ca4918fe1466"
+SRC_URI[sha256sum] = "5f43448a92c36ed6a450048355d10e231a1787e4c28965f08fabac0eb978914c"
 
 inherit pypi setuptools3
 
-- 
2.43.0


