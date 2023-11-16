Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B31C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:27:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2762.1700123269881883555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="127561559"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="127561559"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:27:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06598E05A6
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:27:45 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EEEDCF7E6
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:27:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 099B8867C2;
	Thu, 16 Nov 2023 17:27:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-prompt-toolkit: upgrade 3.0.39 -> 3.0.41
Date: Thu, 16 Nov 2023 16:26:34 +0800
Message-Id: <1700123194-22292-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10--0.064300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytcvdqWtCoykgvz
	nYJVXoOYfCx6K1iYRP10+GHdpFShe8u8JJAANxZNHWRJEfGP5nmd2Wz0X3OaLZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/3LhUU/qa4OGYA3qL69rXq4Gp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlytaxAFb8l5CsQaLopGAt9DzOBX
	KIg98Y1l6MJ2dbY0zU0qTpV0rpzKBfllf1feebGInUPgcpgjlG3dmT6w1QgRrCqTE6k5BEe/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106794

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix regression regarding IPython input hook (%gui) integration.
- Improved Python 3.12 support (fixes event loop 'DeprecationWarning').
- Vi key bindings: 'control-t' and 'control-d' for indent/unindent in insert
  mode.
- Insert partial suggestion when 'control+right' is pressed, similar to Fish.
- Use sphinx-nefertiti theme for the docs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.39.bb => python3-prompt-toolkit_3.0.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.39.bb => python3-prompt-toolkit_3.0.41.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.41.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.41.bb
index 05ff41e7a..aa19116e8 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.41.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "04505ade687dc26dc4284b1ad19a83be2f2afe83e7a828ace0c72f3a1df72aac"
+SRC_URI[sha256sum] = "941367d97fc815548822aa26c2a269fdc4eb21e9ec05fc5d447cf09bad5d75f0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


