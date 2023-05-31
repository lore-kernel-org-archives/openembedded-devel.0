Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F41C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8605.1685518841175940890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118834804"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118834804"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:45 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 989A3DAE0B
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D4916D5E99
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5418A68957;
	Wed, 31 May 2023 16:40:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.18.1 -> 2.19.0
Date: Wed, 31 May 2023 15:40:11 +0800
Message-Id: <1685518820-20028-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-0.707600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mregIHHX2L4YxUjspoiX02F+ik
	wR/RlN8a4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ83NHDQChAXMQNG/DyRtKSelni9RjTe/TjBpXPLpFA/JY+N/eWU8UmgXmac3+CDVQ73qd
	DhkFnf5OwvYswzRIQbvoN2IF6OCTvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102916

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Add metrics (part 1) (#1298) (246dd07)
    Add metrics (part 2) (#1303) (ebd5af7)
    Add metrics (part 3) (#1305) (c7011b6)
    Expose universe_domain for external account creds (#1296) (ee07053)
    Remove python 2.7 from setup.py and nox tests (#1301) (8437490)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.18.1.bb => python3-google-auth_2.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.18.1.bb => python3-google-auth_2.19.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.18.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.19.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.18.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.19.0.bb
index 70a5dfbb1..52d93abac 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.19.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d7a3249027e7f464fbbfd7ee8319a08ad09d2eea51578575c4bd360ffa049ccb"
+SRC_URI[sha256sum] = "f39d528077ac540793dd3c22a8706178f157642a67d874db25c640b7fead277e"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


