Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA0CC54E77
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8164.1710827214322571858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CyiY1E0o;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827213; x=1742363213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vY8DYzo6w4lTs6EdOqGLJOhMIUJxKmh7sLxul3kgCdg=;
  b=CyiY1E0oikr29imA5xuyi9hUnAgATgM2wzobqKWv8jBmD7lRqfPojTPE
   JVqmARXCXz7mNUldfzK8jZklsE7TOg61OT9iJOkqOi2+mETdr9LBwp+D2
   mXFXqrpae51dJAPeDNAsutxNPHPWMXN6COC9GbKhVdAx5EZYMjEjZQZDu
   OAUvVXlh/CPARg+Yr9YEyWK3fGJB53TQ4pfKCnf4EwcuqDqEpyReeZDoD
   uEy2lgD3BWEGYjkXp+sxpt9hDvbjrrIE9q+K2QTHLlDOVJKloichKtd43
   gma73E8vXuK1ad52FGGYWh9Y74NC7Sq2/CSQ6VmrwFTES7xAwjYqkiuOM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="141150245"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="141150245"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:51 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3DC4C32E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CF8BD6152
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 944302A0269
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3E9A91A006B;
	Tue, 19 Mar 2024 13:46:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/50] python3-requests-oauthlib: upgrade 1.3.1 -> 1.4.0
Date: Tue, 19 Mar 2024 13:45:30 +0800
Message-Id: <1710827139-30056-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.038400-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrEDnDEqNPdupAbza1VIHIZbWO
	DdZ1PDmEekMCFQtUEenCJ7iwgFBURKGqVUNB4lsfEhGH3CRdKUUrYYq12IWZOTVrjeSxUraF7W9
	iCA7HUAvgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBQszAE1FBI4JU71j
	EDRsth4t3e7qNkH0wvWPNFLWn8bbyPgB71m0A+sDRrTKsM4HU3Ve6n9HjQGujx32eVvAjg3V8CJ
	Hu/JpPvsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109458

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-OAuth2Session now correctly uses the self.verify value if verify is not overridden in fetch_token and refresh_token.
-OAuth2Session constructor now uses its client.scope when a client is provided and scope is not overridden.
-Add refresh_token_request and access_token_request compliance hooks
-Add PKCE support and Auth0 example
-Add support for Python 3.8-3.12
-Remove support of Python 2.x, <3.7
-Migrated to Github Action
-Updated dependencies
-Cleanup some docs and examples

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sts-oauthlib_1.3.1.bb => python3-requests-oauthlib_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-oauthlib_1.3.1.bb => python3-requests-oauthlib_1.4.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.4.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-oauthlib_1.4.0.bb
index 8c2f891c1..76b14585b 100644
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.4.0.bb
@@ -1,7 +1,7 @@
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
 
-SRC_URI[sha256sum] = "75beac4a47881eeb94d5ea5d6ad31ef88856affe2332b9aafb52c6452ccf0d7a"
+SRC_URI[sha256sum] = "acee623221e4a39abcbb919312c8ff04bd44e7e417087fb4bd5e2a2f53d5e79a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


