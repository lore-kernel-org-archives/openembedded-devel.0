Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC195C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:46:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.151863.1692150370346684457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107044469"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107044469"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:46:08 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4140DDDC65
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:46:06 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 77904D9484
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:46:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E1D02FC6EAD;
	Wed, 16 Aug 2023 10:46:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyflakes: upgrade 3.0.1 -> 3.1.0
Date: Wed, 16 Aug 2023 09:45:32 +0800
Message-Id: <1692150332-5710-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10-3.222500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrGEfoClqBl87fc2Xd6VJ+ylYM
	JR3dIrh2wQTsYEGvCCFaq/6AkfzLhCqQO0zIUpynoS0guoV6SZdnGixmRXLcWdGMGYFaxr1EBAV
	MudebvJjgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjEd+K6O5Nt53W9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs/elW
	sax1vFMFzMHifEsrXpb7lY9EUyCGQ6edVJ2YovDHoaX75kllJ5dMdk70EuqqWkzqXfXJ4WBy4yq
	IeWkxwHDp7T6jB4wEogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104394

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Drop support for EOL python 3.6 / 3.7
    Remove ContinueInFinally check (only relevant in python < 3.8)
    Fix forward annotations inside a nested scope
    Produce an error when a definition shadows an unused variable
    Fix accessed global annotation being redefined in a local scope
    Allow redefinition of functions across match arms
    Fix potential None for lineno during tokenization errors
    Add support for PEP 695 and python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyflakes_3.0.1.bb => python3-pyflakes_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.0.1.bb => python3-pyflakes_3.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
index 2e3a3474a0..11f11b776d 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "ec8b276a6b60bd80defed25add7e439881c19e64850afd9b346283d4165fd0fd"
+SRC_URI[sha256sum] = "a0aae034c444db0071aa077972ba4768d40c830d9539fd45bf4cd3f8f6992efc"
 
 inherit pypi setuptools3
 
-- 
2.34.1


