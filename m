Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9460E77194
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.58740.1735543846399626492
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OtP1YP2c;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543848; x=1767079848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UYqJ69wv63ZBlIpV6VJZvRSlD53fGzk1xMEidv401DE=;
  b=OtP1YP2cjHgnAigPNCkyKRydXU8wn1nWb8Zzjy7BC/Dal2agGpfNIBX+
   7FeKxp667lxa+NcNIKsAaLAc+algr7X0ugXoaecMsnhB/XOxM/oM+5R2B
   i6zXJB3ImoI+SFWbW7zQ9NcM8cC/rD9jqDQU/g4yI1fhapPuqwz40fKN5
   LV8zD6IuG3fWVj0F6+45zLcOEIiY63faCBmmT5n0VO/xX1y+/4CnsQZcs
   jGOkQdcz6vuQhmF48k6ZCwpjKKDFR9rF9piKcGPQiyUfehmMK2/nXsW3g
   FaELXQCZw6ujj4E/8LV0cFcOwTR3Dwago8eCB96jFmZ/9U8t/vB0pqyrL
   g==;
X-CSE-ConnectionGUID: 4Q1YDFeLSPe5pw5o+V+UWA==
X-CSE-MsgGUID: auTDA3syRlSZ2E3TbHH+Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="173278784"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="173278784"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A82D3C2260
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B89CBF3D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01EE370BE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1E681A0003;
	Mon, 30 Dec 2024 15:30:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/18] python3-pulsectl: upgrade 24.11.0 -> 24.12.0
Date: Mon, 30 Dec 2024 15:30:32 +0800
Message-Id: <1735543836-2512-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZ0ISD95D3EinyrZ4d14iAg2aQOPDA0jmlztFOlTI8zOYIeufjXAF82BvG
	hZPbGnQHljoDhYudPhOcLZt94MkyIWM+yd3PfXLB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114591

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pulsectl_24.11.0.bb => python3-pulsectl_24.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_24.11.0.bb => python3-pulsectl_24.12.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_24.11.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_24.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb
index bd0e0b9602..43bdbd34d9 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_24.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "0ba32745d3f198d5657af19f7ee3eb007af5a86a306ec3cd45af42e767820d0d"
+SRC_URI[sha256sum] = "288d6715232ac6f3dcdb123fbecaa2c0b9a50ea4087e6e87c3f841ab0a8a07fc"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.43.0


