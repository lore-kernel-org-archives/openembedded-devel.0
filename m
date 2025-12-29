Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA3E9272A
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40576.1767000598171888543
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hKCchS3u;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000598; x=1798536598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qeBSqt1NvrkZQG1zq2of6m2S+5zxE03WRScWJEmJ7rs=;
  b=hKCchS3unuAKGjIGTCsFu+jTJP8qwrVfYBc7puUjbmPxidcYNNmYVkpN
   jq26usro4kQWb4ot0luto1YVP75fg3W0jvRHfheG8w3CtzXVM0jFoQXes
   Qg3E6VQXfEdXwGHRzh2Alxg/1qVq7wbD6XGmWv6MqSw76wBNktLOHPiPu
   MLc/UlGzlTHKJgWNdBT+ObdkfKDBVzd14duqOwVgPCM3uwWrEJWukdc5+
   /UN8lxE80lwnm105qKQFWXUdR7F+eMWlGmXp4LdX29rsu3MIVB5Qa6OuD
   yXeHz2lZBKC0MsUhtHgwWGi32KqBD4c4Taht7GunJtE+eZmxE8286NiUw
   w==;
X-CSE-ConnectionGUID: VBzZhD7KSO2TZGtVsJ+SnA==
X-CSE-MsgGUID: m0tzK5SqTdmOt0Iso5Zb0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="203073394"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="203073394"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:56 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 660BB1C1C711
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:56 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1CDE48D65DD
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B162010003AE;
	Mon, 29 Dec 2025 09:29:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/10] python3-marshmallow: upgrade 4.1.1 -> 4.1.2
Date: Mon, 29 Dec 2025 17:29:33 +0800
Message-ID: <20251229092936.1483-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122971

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Merge error store messages without rebuilding collections.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.1.1.bb => python3-marshmallow_4.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.1.bb => python3-marshmallow_4.1.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
index 2919897dc3..f3a905a36c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d"
+SRC_URI[sha256sum] = "083f250643d2e75fd363f256aeb6b1af369a7513ad37647ce4a601f6966e3ba5"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


