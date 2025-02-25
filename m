Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82B1C19F32
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2199.1740525896246915191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZKmEIbFm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525901; x=1772061901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FkGyYLqKVJ89luXicLCuQsXGqzvPHEpfYwAK3gmncHE=;
  b=ZKmEIbFmLcPJEl18sptteDl8qMVHW3GlRzMphIOH9IJII8OgYVXy+qY5
   By0UJpPPH34Q7kdO91E+C+cMgo4/ruwJvYyQZbX9un+3fDxkWVSQ8SsGn
   u3QEElGodaWebhRjcvQZytbGzcrKKthuAJ+iE69GMtYKpniStZWAOS76H
   C5fFr5arb5bv3NTNLHhMZWdQN3SJA59tZmm/N+IyRqTqBO8GHUT4Ezedp
   R3jGTyAxtIfEqt5tM+A26u+ARszJLw5WEmEBrDzMhrnCCVlcwohx/3Az2
   e1o0zfY/dBFf14LuNnpf0DCb2VSGeyQTB7LC04ePJ8zUHmIPhUiLzu4RF
   w==;
X-CSE-ConnectionGUID: pMVPWztxSQ6r1nvESZK6Iw==
X-CSE-MsgGUID: t5fA6K/cSU2UUVxYPGN/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191127605"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191127605"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5696CDBB87
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 195D9D4C03
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1EFA1A0073;
	Wed, 26 Feb 2025 07:24:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/51] python3-evdev: upgrade 1.9.0 -> 1.9.1
Date: Wed, 26 Feb 2025 07:24:19 +0800
Message-Id: <1740525881-21103-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115625

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix fox missing UI_FF constants in generated ecodes.py.
- More type annotations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-evdev_1.9.0.bb => python3-evdev_1.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.9.0.bb => python3-evdev_1.9.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-evdev_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
index 82849e0006..c48bc39c1f 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI[sha256sum] = "38218bc95507cad756bc621a5fe7a77a41eb8d9c1213855de8e4ba0aba28e79f"
+SRC_URI[sha256sum] = "dc640a064cb1c9fe1f8b970dc2039945a2a275d7b7ee62284bf427238abe45ee"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


