Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3EFC021A6
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.46466.1739178122227882996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q8EJvAda;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178122; x=1770714122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=glmMgErxQoBh5xJ8/mx2AJVM5TXTfcKq4bgDcV6Lp84=;
  b=Q8EJvAda0SIz4l7C//Dp5Fa/dnZ1cEeSngnqIOEJE+shKENrS6S0Add2
   GTWo0njkePOagFPBi5ScQy+b1pq+8+TVRTGIJof6n0Zfi6u2FOITRy+f7
   7l7Wv+zg9elZeo8ZIHlpIWK5e0VLFpaLiJLtOdUFxgTlQqee+T+LIGn3Y
   3Ppg0Sjql8hm33c3MOXhnNi+ci6v4BubaDnJ5yL9pXng3hXrVxOCxnFJ3
   G8JEsw4CukrgBq3YOZl8XS6j4GT7BsdLgLqa3zV/0cHmsgX37pPm/67io
   fjfU5iZk8X8JAn00IdL/mjork4XuTMB2zsO4jBznckFZZ+OtluBdgNGyw
   g==;
X-CSE-ConnectionGUID: onWKOX5uQn6aCdimUCUFGw==
X-CSE-MsgGUID: KUV8uUYfT4iEccJ0qlceFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346356"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346356"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C66BC2267
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9E07BF499
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7EBEF1A000B;
	Mon, 10 Feb 2025 17:01:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/66] python3-evdev: upgrade 1.7.1 -> 1.8.0
Date: Mon, 10 Feb 2025 17:01:03 +0800
Message-Id: <1739178095-26432-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115365

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
============
- ecodes mappings that point to more than one value are now tuples
- Generate ecodes.py at build time
- Small character device verification cleanup
- Pylint fixes
- Generate typing stubs for evdev.ecodes
- Bump required python version to 3.8
- Use relative imports and sort imports
- Add pylint -E and pytest to ci
- Fix swapped delay and repeat
- Drop from __future__ import print_function
- Fix example
- Binary wheels
- Documentation fix
- OS package badges from repology.org

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-evdev_1.7.1.bb => python3-evdev_1.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.7.1.bb => python3-evdev_1.8.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.8.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.8.0.bb
index f098ce4ab3..1a382f49dd 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.8.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python evdev lib"
 HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ff275b442f45fc06287544cf713016f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI[sha256sum] = "0c72c370bda29d857e188d931019c32651a9c1ea977c08c8d939b1ced1637fde"
+SRC_URI[sha256sum] = "45598eee1ae3876a3122ca1dc0ec8049c01931672d12478b5c610afc24e47d75"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


