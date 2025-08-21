Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C01DCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4683.1755766819305666738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jpevyz1k;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766819; x=1787302819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lc8dowwoivHnqAp+p4c1oCJw+MWiPJo1fg1hQcoripc=;
  b=jpevyz1k4QQNWL18PgUmNXTAimtwKqZITQbsKGAtBOlwje+qhx1Zb2S0
   Ww1eG7hEZPuvKKIn+QJPJRX8zn7EQwRSW9ABi77RkZHtheYBa4noIAw7h
   bLYi5wyifsZ+666Nm5FQHntXYTak0zs6dXakU+Y4GhXcTmzeLezXxD3JT
   Ha4kIP+8iqHOK4ZAuGln6+NDRiTqctPimk3EKUjinYXc2nVpcSKzZBeJ2
   QNtBPDIa9sccuUOB4GonpdxSRGUGlNLE9xkmp7yTa9KuS1+1RZ5nqy4QP
   5aRv/fI0T3oLIkoA0SWztI0D3a4jbMsn/PXPbu+mvSz7f8j3lkEWIdg0U
   A==;
X-CSE-ConnectionGUID: R6cFSYMfT5OJm90jV8QSVQ==
X-CSE-MsgGUID: 0bDlecPCToeCnPpj6LD0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="189091981"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="189091981"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:17 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BAAF726D4
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 78075101B145
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 4235410001A7
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DB141A0096;
	Thu, 21 Aug 2025 17:00:10 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/21] python3-virtualenv: upgrade 20.32.0 -> 20.34.0
Date: Thu, 21 Aug 2025 16:59:52 +0800
Message-ID: <20250821085954.2056-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119069

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.32.0.bb => python3-virtualenv_20.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.32.0.bb => python3-virtualenv_20.34.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.32.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.34.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.32.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.34.0.bb
index 72946161b1..fff81b2fc2 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.34.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "886bf75cadfdc964674e6e33eb74d787dff31ca314ceace03ca5810620f4ecf0"
+SRC_URI[sha256sum] = "44815b2c9dee7ed86e387b842a84f20b93f7f417f95886ca1996a72a4138eb1a"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


