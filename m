Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BF8C27C43
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.12707.1716861022996974347
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CuJjBNED;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861024; x=1748397024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=v1Yaaf0wiSfV7w+mdY9T3sIPTaQaOZHF88xzmhOj41o=;
  b=CuJjBNEDb7ozW/Bf6dOgrtfaQIwFa4gFC1XMWRFfU0ybD6UyDLOgLI+i
   dShKa8jb4s95IQtVKlVbGhK90mR1oocCgUjMkgoSMJ66Uq2STR5Ss0a4S
   vzM1tXqiLel05kYUKvgUS4ioVqeVGBc8CHEnXSHKzELPT/+on7387Mu+w
   C6tfoPz5WUym+erb49ZuM75CLmKOMjheYKTAcRaHnOlCxvGAATbcNhBbx
   QMR9ISYLIC7ntbe6DCTY2QzBTQN5kEEJLgTolHXTjNpADDPH/YSN1Qebd
   GNV3IWQs1NeT8JGbSiW3qlzXfML0WAgJHINHXMv0EWSIcg/eJs/fSeWwn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160525410"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160525410"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19F5FD4F5F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D2F3D5926
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3B3A41063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8281C1A000A;
	Tue, 28 May 2024 09:50:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/40] python3-transitions: upgrade 0.9.0 -> 0.9.1
Date: Tue, 28 May 2024 09:48:08 +0800
Message-Id: <1716860901-863-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-4.333900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytmXPeVVnrr+xsk
	AdaEfeQKhJtbBPDn7Js0VShrSxBbeFZVo+BBBYvwEhGH3CRdKUUXivwflisSrE/NXm1Lo12QJS8
	M0Gp4suLgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq7Tz3
	WZR30lVMzJyLu55Ji8eTjw/FyRX6QfE8yM4pjsD2odc419PBJCxEHRux+uk8hxKpvEGAbTDqIrz
	K2i2a44+Z2KDZAb8mGrogeWZ+DQylwyaJOqaPmCY+JD2BItEgNxMgzraTDRQGoLC8fKaWzHcI2J
	UZcMu7VnfqJyxFgjwYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix may_ always returning false for internal transitions
- Pass investigated transition to EventData context in 'may' check
- Improve the handling of diagrams when working with parallel states,
  especially when using the show_roi option
- Exception is not broad enough and does not catch asyncio.CancelledError or
  KeyboardInterrupt; use BaseException instead
- '_anchor' suffix has been removed for (py)graphviz cluster node anchors
- local testing switched from tox to nox
- Remove surrounding whitespace from docstrings
- Add on_final to Machine and NestedState constructor and final to State.
  Callbacks passed to on_final will be executed when a State with final=True is
  entered or all children of a parallel state are final.
- Process exceptions with Machine.on_exception in may_ as well
- Improved handling of removing transitions for GraphMachine and HiearachicalMachine
- Better handling of unset styling in GraphMachine

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-transitions_0.9.0.bb => python3-transitions_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.9.0.bb => python3-transitions_0.9.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.9.1.bb
index 980351bf1..5f1e3d9e2 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.1.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2f54d11bdb225779d7e729011e93a9fb717668ce3dc65f8d4f5a5d7ba2f48e10"
+SRC_URI[sha256sum] = "3542c37108e93e2ae5f215208ec5732c94a772937854a102cd7345b967fee61b"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.34.1


