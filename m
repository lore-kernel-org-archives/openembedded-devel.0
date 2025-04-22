Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7DEC369DE
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.35398.1745311773126484848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rej/+KZk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311778; x=1776847778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lcsPvC71uvJbnamaiQL8f0os+B0tjX/Cow0MY4aldY8=;
  b=Rej/+KZkmnwbfDgqt86QwJfUY3TVoDXB+Ysmnn9i+JeEc4ujeNauchjS
   1JhStWdzGLXXhwl+M3NBM2HdoaaN+Avz9mmxa2P/3H2C9nZt/hrm2mr30
   bw6XVgUEUNImt1YC6tQl/L5ZOvQw7YoRwSKgyoWbYH/iP934enkd1zQll
   yb7JIBWmwJWrWnJ4Tb3RGGzqGBIMWMQJnPf09NWQfIoqoOkBMG0ogkyW/
   1Q1SR7plfy76xLlW4AvI+s4sPaLINDjnyWl0cziTBkAca7CYwRTsuZcAP
   uvs0xOO/wgVeVjLqpWDvRieZCd4diUNbUE2wxCkLcrh38/cpVPWYtpgSj
   w==;
X-CSE-ConnectionGUID: DWD7YGKaT5eipjfEFkkEWQ==
X-CSE-MsgGUID: N7H3t5MiSO2HcumNlPr9OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176196169"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="176196169"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE8C6D24B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BF2FD3F34
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B57F1A009B;
	Tue, 22 Apr 2025 16:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/30] python3-webargs: upgrade 8.6.0 -> 8.7.0
Date: Tue, 22 Apr 2025 16:49:18 +0800
Message-Id: <1745311761-1912-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117037

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Test against Python 3.13
- Drop support for Python 3.8, which is EOL
- Support marshmallow 4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-webargs_8.6.0.bb => python3-webargs_8.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-webargs_8.6.0.bb => python3-webargs_8.7.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.6.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.7.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-webargs_8.6.0.bb
rename to meta-python/recipes-devtools/python/python3-webargs_8.7.0.bb
index d898539abf..88cbd922e8 100644
--- a/meta-python/recipes-devtools/python/python3-webargs_8.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=27586b20700d7544c06933afe56f7df4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "b8d098ab92bd74c659eca705afa31d681475f218cb15c1e57271fa2103c0547a"
+SRC_URI[sha256sum] = "0c617dec19ed4f1ff6b247cd73855e949d87052d71900938b71f0cafd92f191b"
 
 RDEPENDS:${PN} += "\
     python3-marshmallow \
-- 
2.43.0


