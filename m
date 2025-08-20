Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402D1CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.15387.1755679204792210627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TvsD3fmD;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679210; x=1787215210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FrrL2pWm/P1OKyVLY6JaDpULGQ3IW2wPWitiPETohmk=;
  b=TvsD3fmDEWMWynQvPpilcJi6t0DBSxrHzNqdvfkMd1W5XUEDrq+4VrnZ
   QPlYoFCvtWZb+3LuVydnE6AOzJhMOznVPaRqq5jerZZh6GVMrCgM6JetV
   Qp7nnT1ClUw6b5uw1Hij5OQuwadYlE3Vr9ecnO4LRukzDb+IQY4kx5heo
   Fom5i2g1v8/NoUvxaZm2UJDciK4n3u/mh9I9B8p+URQOb7zss9wtIqJMq
   SQeU7gqmwE0wQ4k5mFMelTM4jf9wk9+dwNZwGMvnsjMa2ADl6YuLWH52b
   UiksKPFDbg0rSXgRXVGrEIGOTSIp2QsHO5R81z90de1N4wbYCyLcqdJCZ
   w==;
X-CSE-ConnectionGUID: rME4XCuzQky63QkBAcYajg==
X-CSE-MsgGUID: sBFmdRxaS1S8IcJSay98aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="188971871"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="188971871"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8216F820712
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 37324C011BC
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 158AE1803FBA
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B5591A0071;
	Wed, 20 Aug 2025 16:40:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/26] python3-elementpath: upgrade 5.0.3 -> 5.0.4
Date: Wed, 20 Aug 2025 16:39:44 +0800
Message-ID: <20250820083945.802-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelo:
 Fix default/fixed values processing of schema annotated XML data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.0.3.bb => python3-elementpath_5.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.0.3.bb => python3-elementpath_5.0.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.0.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.0.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.0.4.bb
index 8659d4f8ba..150a7245e0 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "61040ca014769d507ce19d26521a4bf1c64d2bd0776466e45030dbfe181f7062"
+SRC_URI[sha256sum] = "85ed93565d6e94aefa160b12f36b12cbe4be6bf9bbde06b80f2c5c94829a25fb"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


