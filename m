Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B705CA101F
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.7938.1756890231044712977
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qBlen/a2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890231; x=1788426231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YL0S94mB4B5j6s2q2eEHEgR4kkzeOCzemSIqkC0btFQ=;
  b=qBlen/a269DtR/e16Dd3SIu5lM25AyHbWQsuVQhK9LpxRnjaZJy01LkJ
   ypafWHTFaJdvdqzvYvF68mf+YQWAB9EqqqrWvOxUd58nZhh+T7atAox5K
   u5GufuOoJs9y7+LSR2DCFE+MsAxdk+u9W6rlz7dfVJ9lKFQK2RSdIol7P
   eD7/0i3FB2RZX6igaJx7JWcWZLadOuSRvf6nmy9IP+SWdFrhjU7aKfhHW
   ipx59Dd2JHLlHhYaUOHcd02RtGFt/hI7idVd7FRYfgReeZ9ct2mnNFsW3
   VL2H2tZLGtmq1ujmMWPgTR993zPnd8iC4pa60e+mQdswd8Lsqfw+NWXC+
   Q==;
X-CSE-ConnectionGUID: /dCjW+Y2SiC+ZHv6OMO8qA==
X-CSE-MsgGUID: jXyWRjxlQfOcfwWJwmEnhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190352777"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190352777"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:50 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5479B145D
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0F8921150726
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 0203B1400BF4
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 250341A0073;
	Wed,  3 Sep 2025 17:03:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/56] python3-eventlet: upgrade 0.40.2 -> 0.40.3
Date: Wed,  3 Sep 2025 17:02:49 +0800
Message-ID: <20250903090317.2002-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119225

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.40.2.bb => python3-eventlet_0.40.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.2.bb => python3-eventlet_0.40.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.40.2.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
index 3c8397c3bd..057b73013a 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "42636c277f761d026905cd0ba0a11edec7600001be401d6ae7e9546559c8d8b0"
+SRC_URI[sha256sum] = "290852db0065d78cec17a821b78c8a51cafb820a792796a354592ae4d5fceeb0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


