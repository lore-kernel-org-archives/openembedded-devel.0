Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA80C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:49:46 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.3068.1700124579063203025
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139342595"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139342595"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:49:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98748D7AD8
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:49:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CB27CBF4CD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E674C2005932A;
	Thu, 16 Nov 2023 17:49:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] webkitgtk3: upgrade 2.42.1 -> 2.42.2
Date: Thu, 16 Nov 2023 16:48:51 +0800
Message-Id: <1700124531-22887-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--3.819000-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mr/1vXbkGjWeX7fZJfDdCIXHuZ
	uFCBxKGkLhGamK2ohIAHMSexFgmXDtaOwi6sNJ03Zj7E6vHnuNYqnkb4tCjVzqG9MDPi2X0Svqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPioIsi7Sa0gS6QizeDUeN7lXO
	evQHJyh60LqSIpXnv3gj7Flj7SXGutYv/FAmebjp4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1l1pw2HyeObveINsduWqIo93fiDUjrQ3AMXZpw1ZNJhZOidz+OSJOhTUUF46c0PWu6I6/
	2+pxLcd62A4l1dB4bdSA7SBv7HY4qgQYbcz5U7JTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump Safari version in user agent header.
- Fix CSP regression that broke Unity WebGL applications.
- Fix the build with GBM disabled.
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkitgtk/{webkitgtk3_2.42.1.bb => webkitgtk3_2.42.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.1.bb => webkitgtk3_2.42.2.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
index 9aabfb123..ac75afb90 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "6f41fac9989d3ee51c08c48de1d439cdeddecbc757e34b6180987d99b16d2499"
+SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


