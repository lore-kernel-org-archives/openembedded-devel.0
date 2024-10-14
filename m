Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D3CCFC50F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.50489.1728896164520041880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GNeZ+caY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896164; x=1760432164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WEdM0dZ6DE8qegrtdmuwGOTjlG8wCT1FKwqdLbL/4Fc=;
  b=GNeZ+caY2i0p1AkhM0ErMLaapsaPHPwSMavtJqoyrF+qJ2SYmotZHvNE
   QxdLrz+QwLwrJAXXuNqVTMY6YAwefPUl6566qBiTiJWSJdisv9L0LRdVX
   3lmu9Mh5LDaVY57+XflCuydlj26QK25HradvImO+a1ofYStJSMM7JYHOr
   l6DcDo76pSjxRu6ASxtSM4ZWBlh1Z6QsHAQ0SK5sQCLRKUu3CZF9Zs9LR
   1laNWT543qPnbVfspD38gVQsT1k+pVJuxBtFNJWIH7MYpoyPXFK9KAKIb
   4f2C7K0nHfGH/AQPoIMsMhTjla84Do5eSYcdHWPUrgpYGzg0xasafibAf
   Q==;
X-CSE-ConnectionGUID: iGH8Y7frTNueiSdy2V6GiQ==
X-CSE-MsgGUID: 04/SqAjfQF6VAegYHggIIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671121"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671121"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55F0B55CD6
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9909A159BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18BAC6C9D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7C381A000A;
	Mon, 14 Oct 2024 16:55:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/54] python3-asyncinotify: upgrade 4.1.0 -> 4.2.0
Date: Mon, 14 Oct 2024 16:54:37 +0800
Message-Id: <1728896115-2944-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrRoIl/zW0OjhvlErTvPSJzj4Mnet0RXZKvr5k1hPnrRJF5mvg9Somyfuea
	1R32UJNOK0XskRXEc/LmVuUzIdHK2cFZgtHOEnjB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112867

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.1.0.bb => python3-asyncinotify_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.1.0.bb => python3-asyncinotify_4.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.1.0.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.2.0.bb
index eeb44aa51..839d32596 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "41743900519ebdefe53e751df1d39689aca88794d783af945d306348a1398501"
+SRC_URI[sha256sum] = "dac1d75e16a4919c6eab84a90ff51218db622c5524a84a5c501a0b62ea7ec7ea"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


