Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8D1CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:26:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.115871.1698049588740303888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116018887"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116018887"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:26:26 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5927D29EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:26:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD368D9470
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:26:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFC3D6BA7B;
	Mon, 23 Oct 2023 17:26:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 3.0.0 -> 3.0.1
Date: Mon, 23 Oct 2023 16:26:11 +0800
Message-Id: <1698049571-24831-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-1.763500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwi+IQ+aeLlhn56j
	qg90kb/2RkDguwhhfjdTmiRbU90cZvUWMvmk6jMFA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYsrbguuTTSDukwBESQBcbfpoMLOoNHsM9rSgyqRj33XJwSC6qIZ5nkmjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcmBVSXyiKIrX17P/e7uTW/n2OKtYo5lp2uive
	zOeL3GRQIjquwpJxd4f7zcajRRgYCb9ZLTCLX+FMJSgpnVb8QIymmBfXJyepf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105647

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Fixed false positive for inherit-non-class for generic Protocols.
-Fix a crash when an enum class which is also decorated with a
 dataclasses.dataclass decorator is defined.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pylint_3.0.0.bb => python3-pylint_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.0.0.bb => python3-pylint_3.0.1.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.1.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.0.1.bb
index bd2faa5b5a..7de38b768f 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.1.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
         git://github.com/pylint-dev/pylint;branch=main;protocol=https \
         file://run-ptest \
         "
-SRCREV ?= "4a7ad5ea9f1c5a98ccf736578a00554be0da6dc7"
+SRCREV ?= "f2cded41f7f3d4b45236cbe107b366b6caf84bde"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.34.1


