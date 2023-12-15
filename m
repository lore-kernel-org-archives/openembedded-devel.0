Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE632C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:19:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.46006.1702599541815681147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="145021570"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="145021570"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:18:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3550C3F93
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:18:56 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B92AD2BC0
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:18:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 197692FC6B7C;
	Fri, 15 Dec 2023 09:18:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 3.0.2 -> 3.0.3
Date: Fri, 15 Dec 2023 08:18:33 +0800
Message-Id: <1702599513-1613-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--5.453400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj+Aw16GgqpO+Zk
	XqvcLVUN/fPselhSQhhTjL3vFHa57BZ+poqi+vhtHBs3ihvoMIgAc38TO70Scbz5EmPj9eVqvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcUJ52LFhfM6ukSs
	GwTF3lGzhvgt8hlMsuLWHV5Rz6nrytYv/FAmebjp4CIKY/Hg3AaZGo0EeYG96m4/3ODjvukSq2r
	l3dzGQ1eqPDNxZp5CwZXBcU9+xKbh3YRTEp02PkKPdCfDsXX/nku/wEiARb6g==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107471

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed false positive for unnecessary-lambda when the call has keyword
 arguments but not the lambda.
-Fixed incorrect suggestion for shallow copy in unnecessary-comprehension
-Fix false positives for undefined-variable and unused-argument for
 classes and functions using Python 3.12 generic type syntax.
-Fixed pointless-string-statement false positive for docstrings
 on Python 3.12 type aliases.
-Fix false positive for invalid-exception-operation when concatenating tuples
 of exception types.
-Fix a bug where pylint was unable to walk recursively through a directory if
 the directory has an __init__.py file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pylint_3.0.2.bb => python3-pylint_3.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.0.2.bb => python3-pylint_3.0.3.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
index 8af74b7cb..09ab1f26f 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.0.x;protocol=https \
            file://run-ptest \
            "
-SRCREV = "efee9618894795cc8847727108522aa79431ee25"
+SRCREV = "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.34.1


