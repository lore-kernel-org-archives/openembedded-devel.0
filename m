Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A817EC3DA41
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2316.1687157423206339313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="100071945"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="100071945"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AD9F4C68ED
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:18 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F34D7D3F34
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2693D2FC8442;
	Mon, 19 Jun 2023 15:50:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-click-repl: upgrade 0.2.0 -> 0.3.0
Date: Mon, 19 Jun 2023 14:48:10 +0800
Message-Id: <1687157308-17342-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-1.010700-10.000000
X-TMASE-MatchedRID: nukkkIOYUHG7qz8f6326on1zro62qhdCVr5aZRoV9oQaHE9HUMbAkJ7V
	Ny7+UW/988cLohcr5LCGQkOjOS6LV3I0shGAc7Fe8IK7yRWPRNFf3ennYqHe2NVtkV1dqmwpoHy
	0bASrKBqBFdTLd/2OxJf2ahEXzBb37VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMog1RxwBNHJ3UBhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtlu/VKvCjKPU1BYqV/s88VTJIyMwDEtXtn8jQvVFCVJmLI4Klu0Ke//QfPF3TfJkBGYHb
	z2EpXCKHhUdBemi2wEwFwLV6K89E0mw48P9E/mjyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103361

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Add "Copyright (c) 2016-2026 Asif Saif Uddin & contributors." to
license file.

Changelog:
===========
  Drop Python 2 support, remove six.
  Uses PromptSession() class from prompt_toolkit instead of prompt() function (#63).
  Added filter for hidden commands and options (#86).
  Added click's autocompletion support (#88).
  Added tab-completion for Path and BOOL type arguments (#95).
  Added 'expand environmental variables in path' feature (#96).
  Delegate command dispatching to the actual group command.
  Updated completer class and tests based on new fix#92 (#102).
  Python 3.11 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-click-repl_0.2.0.bb => python3-click-repl_0.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-click-repl_0.2.0.bb => python3-click-repl_0.3.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
rename to meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
index c8798c5e3..33e42cb3b 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "REPL plugin for Click"
 HOMEPAGE = "https://github.com/untitaker/click-repl"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=580facc4832cac548fad94845542da44"
 
-SRC_URI[sha256sum] = "cd12f68d745bf6151210790540b4cb064c7b13e571bc64b6957d98d120dacfd8"
+SRC_URI[sha256sum] = "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69ced26a9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


