Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6E7C54E41
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9261.1708419296047521362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DIE6wcwx;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419295; x=1739955295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/i/xNrXSfIS4WLdaTUROmds47zc4Y+Y2HIOekQpCVlA=;
  b=DIE6wcwxfTuJv7dMtpSguVtfIIK9s5NIIrwuSfdQHaYSY05uTQeNqhEX
   +YV/9P9WFHyy8aEibokzkY8IISzNnG1TIRDVcfIKUAy4F22UotmXkL+G1
   kL3kEuvHc6BI3sV0aBLpyL79v6cxz4raUHY3EhxaAtmYMipB3/R7aXdEg
   CirT4G2Xb6A2tI1cRP8BXln9V3rE5zaB4JNFL5wB6juqiFTXup0HeCGlo
   su4maHznnBWQZKGDbKIPpAtCpesPDeDVukvGtjlIzIgzPp5Kjzwh6dM/E
   ygMNCJVriveJfMTqb8oZgnBJgoLYUYDb+kad2QR5JhtXC928usArC/k4R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="128668197"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="128668197"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CBDCD1F474D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1ECEBD5611
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 981106B8C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 462451A006B;
	Tue, 20 Feb 2024 16:54:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/26] webkitgtk3: upgrade 2.42.4 -> 2.42.5
Date: Tue, 20 Feb 2024 16:54:19 +0800
Message-Id: <1708419281-26047-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--1.073800-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRYofMCoTWMTw7s
	N7bSy8cpPVLKIEs0GLW4TDy5Lbm+tzwdmyX2g5Xw4wdobZiVzDiyiNuZzgQ4vFVbktUlX+yj245
	rwxPuiMfgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3Tnj4Ju5UjuFVssrod
	Cze/6mo4rjf4uAgPXmJKAmgnmhVrvIY6JevWs4vnzmmMD/HXF+VeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXVhIc4ZC2qXhpoRrKrhslgZhWX+PQSWYLkh+V9GObwCaDVicOhw/PqeTHI
	yPMkPaJRZ7huILb6L+7hipQZA8DrH7GTP/tEyhFjgo81taOvxFPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix webkit_web_context_allow_tls_certificate_for_host to handle IPv6 URIs produced by SoupURI.
- Ignore stops with offset zero before last one when rendering gradients with cairo.
- Write bwrapinfo.json to disk for xdg-desktop-portal.
- Fix gamepads detection by correctly handling focused window in GTK4.
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkitgtk/{webkitgtk3_2.42.4.bb => webkitgtk3_2.42.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.4.bb => webkitgtk3_2.42.5.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
index 3c6b7db81..d12ae2819 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "52288b30bda22373442cecb86f9c9a569ad8d4769a1f97b352290ed92a67ed86"
+SRC_URI[sha256sum] = "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


