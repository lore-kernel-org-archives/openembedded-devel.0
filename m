Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB5C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:46:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.116463.1698050789966974976
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116576904"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116576904"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:46:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96BD6DDC75
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:46:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE544BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:46:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19398E3698;
	Mon, 23 Oct 2023 17:46:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.23.1 -> 2.23.3
Date: Mon, 23 Oct 2023 16:46:11 +0800
Message-Id: <1698050771-25706-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--0.261600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrh+nyr56gtWosrDi0wr9oMGeI
	Nzdk9e3E4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSYl39QChgUCWgS1cjubJkaZhYU+GKfR0Z9zP7fffJlEFKV3XCGXCsPlHG+46HzrgEpiAO
	n+o7uCfAuDt1JPd3rIJ5Wj37sXVc/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105668

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Serialize signer keys on getstate for pickling
Support urllib3<2.0 versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.23.1.bb => python3-google-auth_2.23.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.23.1.bb => python3-google-auth_2.23.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.23.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.23.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb
index a3228be231..e5433b0839 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d38bdf4fa1e7c5a35e574861bce55784fd08afadb4e48f99f284f1e487ce702d"
+SRC_URI[sha256sum] = "6864247895eea5d13b9c57c9e03abb49cb94ce2dc7c58e91cba3248c7477c9e3"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


