Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F053C0218C
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.32645.1737360863254015612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LI7qPQ7f;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xp991DOdCZbzZoOdKxXGZmS/lQK8fnPUCcz+dVtFBMc=;
  b=LI7qPQ7f7dsbrlOzDgBJYl5ZckKpm5+LfWG7VtxHdT2cdrjl+KjEWwwP
   vOGTK806rSHoQehpdLKqrt+YQAbbQWQgHyOvRjKbK/VzOfhY65r9A4CJ5
   TtPycsGmcXygf5ikMfg9QK0vsLF+DUACAW2KmZ6CMk2fPPultXuW/CbZd
   s9MUwgOv2j155Oy0d5tdXxU/3GTEAMc5sBUcQjNuvYgj45KZnTIYiQCrL
   S8KDFtn+VUDJe5AOC1hES6V22H15ONRD5hCmStFk0vGzjENjLtBB81+UA
   4C1inT9tPKO+EOPOGVYj/wA1o7ZT4sVKv6BlwX+Whe4OlWxShk5voeYv0
   Q==;
X-CSE-ConnectionGUID: 7EPQh+T5T7mf22kN80JefA==
X-CSE-MsgGUID: 8+fDrRwjRmWTbYWEg+cuYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="166002986"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="166002986"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:22 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B1A196742
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BC29D5077
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD51B20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71B8F1A0071;
	Mon, 20 Jan 2025 16:14:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/32] python3-virtualenv: upgrade 20.28.1 -> 20.29.1
Date: Mon, 20 Jan 2025 16:14:03 +0800
Message-Id: <1737360846-4824-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-0.202700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrlKvhkP88iXRx+cvftRH+OnkK
	0FnHivpUQTqtS0iG4vsNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5sjC
	G6uK6ZkDrLHDDNt7n5KHMDdd8slSKfaCE85oMk4ydDHnu703AKzWQskELIzXlyr1rdzjiRsGzM7
	yIOdu6yu90gmeyQ3bmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Simplify Solution to --python command-line flag precedence
- Change PyInfo cache versioning mechanism

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.28.1.bb => python3-virtualenv_20.29.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.28.1.bb => python3-virtualenv_20.29.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.28.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.29.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.28.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.29.1.bb
index c163e0b45c..dc42b4c79f 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.29.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "5d34ab240fdb5d21549b76f9e8ff3af28252f5499fb6d6f031adac4e5a8c5329"
+SRC_URI[sha256sum] = "b8b8970138d32fb606192cb97f6cd4bb644fa486be9308fb9b63f81091b5dc35"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


