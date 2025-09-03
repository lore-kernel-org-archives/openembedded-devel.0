Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611C1CA1013
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:11 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8064.1756890236702565008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gwTWMYhB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890241; x=1788426241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OIHE+YYIUAC5ocQExgQTbI+rSuF0sxuigC5gsKMLVr4=;
  b=gwTWMYhB8MEmp4bU4cMS/xliw3edMS2Gwm9yJCPEsx/KwXC3sDKdVOju
   t1gDgwaW278t8+h88M+NH9N0+pbG87CTIDJFnXMQOALNwTXgCJjNxdDjl
   rLHw8CZE5SBy4zlpeKLABEnMUcYlmVT6va+fgaNZIsojkpA/eO7lN5WxS
   1WMM0l32PJABnqxz91F7hGNccnmAIeS82eKW637AGo4Rub0yios9xry75
   9gTv/bRrWsYW3Mq4iAD5kP+d/VCFyxI3CUg9+QV9JTpSupbaqy6R+7IDw
   HMDHxWztWblWPuIEJV74zW7tp33ai8oGGFKKiK9RF3dmtjrCn5MBbJ67w
   Q==;
X-CSE-ConnectionGUID: U52uUSn5Taaxv6ZV4EASmg==
X-CSE-MsgGUID: FbXRHO7pSbG+4Xv9Nwkapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190352807"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190352807"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:04:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B57611C1C71B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6D5A88A5C59
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 4E7FD2005D22
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B3D91A0086;
	Wed,  3 Sep 2025 17:03:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 55/56] swagger-ui: upgrade 5.27.1 -> 5.28.0
Date: Wed,  3 Sep 2025 17:03:16 +0800
Message-ID: <20250903090317.2002-55-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119252

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.27.1.bb => swagger-ui_5.28.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.27.1.bb => swagger-ui_5.28.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.28.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.28.0.bb
index f1eb6e4423..e4bee6e8a9 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.28.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "43ed706e9519841e97401cfad83faca564b37eaf"
+SRCREV = "01e23904eec6075e032e07f3235607b463d9ecf3"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


