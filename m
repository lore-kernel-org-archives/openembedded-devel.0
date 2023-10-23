Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D763CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:54:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.116529.1698051236892147046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124890480"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124890480"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:53:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 423B3D4F5A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:53:52 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8402EF80F
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:53:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7187D879A4;
	Mon, 23 Oct 2023 17:53:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-prompt-toolkit: upgrade 3.0.36 -> 3.0.39
Date: Mon, 23 Oct 2023 16:52:56 +0800
Message-Id: <1698051176-26057-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--2.380500-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrG24YVeuZGmNs1Ir4NZzFmpgU
	Ly4zAbFBYzwjGJVXgdm+eRbfBzB8rfTPTYKNobBkzLo88rvlvYFiMNd0z/HZU/t9kl8N0Ihc+03
	a+MQ8RE3FqtGXs1u0iHx4LalWvXBv+/CYwUsia6Ec9jA4mLo8uRp4E3RX2KC8rvcsxx7tGYkv+q
	EP3Q3Lyqn2EI/gLM/FDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZcFfXzPlfY7e9nOd
	eq786q7dyXQ0POagPEGFBbDeVn4hfKZUMHzJkSUngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w4cI3OFo75h93hs0mYLJwc5ygskPhgzAjp9uz2JhVGdRSz3xjV0zR4kZ71dn8IzRwPeZOI
	Ob1FZV9602YSGBOJmz2IR8o/eOhaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105677

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fixes:
- Fix 'RuntimeError' when '__breakpointhook__' is called from another thread.
- Fix memory leak in filters usage.
- Ensure that key bindings are handled in the right context (when using
  contextvars).
- Fix regression in filters. (Use of 'WeakValueDictionary' caused filters to
  not be cached).
- Fix 'currentThread()' deprecation warning.
- Fix memory leak in filters.
- Make VERSION tuple numeric.

New features:
- Accept 'in_thread' keyword in 'prompt_toolkit.shortcuts.prompt()'.
- Support the 'NO_COLOR' environment variable.
- Use 24-bit true color now by default on Windows 10/11.
- Add '.run()' method in 'TelnetServer'. (To be used instead of
  '.start()/.stop()'.

Breaking changes:
- Subclasses of 'Filter' have to call 'super()' in their '__init__'.
- Drop support for Python 3.6:
  * This includes code cleanup for Python 3.6 compatibility.
  * Use 'get_running_loop()' instead of 'get_event_loop()'.
  * Use 'asyncio.run()' instead of 'asyncio.run_until_complete()'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.36.bb => python3-prompt-toolkit_3.0.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.36.bb => python3-prompt-toolkit_3.0.39.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.36.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.36.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb
index a5299318b3..05ff41e7a9 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.36.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "3e163f254bef5a03b146397d7c1963bd3e2812f0964bb9a24e6ec761fd28db63"
+SRC_URI[sha256sum] = "04505ade687dc26dc4284b1ad19a83be2f2afe83e7a828ace0c72f3a1df72aac"
 
 inherit pypi setuptools3
 
-- 
2.34.1


