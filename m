Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47FBC61CE5
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.6712.1747817995798020955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U2TquG53;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id;
  bh=dzylCN4O/LfdX0PKYZen9CjgcAqu6n7cJHWm2oUFacU=;
  b=U2TquG53UfQNYfkJsNgV1QckOd9l6zjEeemLZXNMCQjCl1g3lklQToCj
   Cp6Q/P2RzHJOnNKL0aYfhqx2v57f6haIPcXAilPUwkdxc2HXx6Ak3QYxP
   egNFICf92MyR7HJyeiiH9sontm8+Hra3zsH3HBjXKwqC/Zxs6mCGNiKzY
   DoW38a5QIWrKFDzd1pqpHNQzBgez0iozdi74N/Ncp5bOVISfg402BdLAR
   EXQQEpKPYP2Z0foBKy/LRsVubTG9to1VOlVH0Rc5kn0fWdY27Uetjnx/A
   aCwsapFlYd05REfG2VT3aIiyLyrn/ksPmI8zEXqR3mxlq1X4pIINq+/1o
   g==;
X-CSE-ConnectionGUID: wvV6J6IUQSu0BDcxvvGzog==
X-CSE-MsgGUID: 5a42eYdzTlGzfIh1lc4lEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179669859"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179669859"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66418D5051
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19B51D96C6
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C6351A0078;
	Wed, 21 May 2025 16:59:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 01/43] python3-aiodns: upgrade 3.2.0 -> 3.4.0
Date: Wed, 21 May 2025 16:58:50 +0800
Message-Id: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117528

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Update CI
- Drop Python 3.8
- Run tests on push
- Fix test coverage
- Use c-ares event thread when available
- Fix release workflow for breaking changes in upload/download artifact
- Added fallback to sock_state_cb if event_thread creation fails
- Implemented strict typing
- Updated dependencies
- Added support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiodns_3.2.0.bb => python3-aiodns_3.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.2.0.bb => python3-aiodns_3.4.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.2.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.4.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_3.4.0.bb
index bf3f1312d2..fc0f2dd7a5 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.4.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a565d8b5d06b9620968a135a2657b093"
 
-SRC_URI[sha256sum] = "62869b23409349c21b072883ec8998316b234c9a9e36675756e8e317e8768f72"
+SRC_URI[sha256sum] = "24b0ae58410530367f21234d0c848e4de52c1f16fbddc111726a4ab536ec1b2f"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.43.0


