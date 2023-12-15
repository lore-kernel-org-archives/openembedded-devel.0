Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89191C4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 05:58:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.53892.1702619918893866853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 21:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="142997558"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="142997558"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 14:58:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 03550D63C5
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:58:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44CBAD976C
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:58:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CDEE217375;
	Fri, 15 Dec 2023 14:58:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] webkitgtk3: upgrade 2.42.2 -> 2.42.3
Date: Fri, 15 Dec 2023 13:57:25 +0800
Message-Id: <1702619845-4275-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.005
X-TMASE-Result: 10--1.942500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysYdZqQlzVQvNIM
	jnC6Q5hdAYADDtHOWhIcG6dIciYEQllYr92xiiHVYeSLiGsUzvm87rU89eLPKft9kl8N0IhcBOC
	yMglQlkgAjPE9XBt9MfL3NxFKQpq17VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMomUVI5FRUThelF4c8rT0fKwqACWCM+FiltDQPgxOmF8Ew8Jhc8Z4lieBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrfSAWnw/V+E7ltPdDfxT3AdOg4ARfT7OZuESqktsHxEUlwVm
	E4CSNv4pAJulTwiv+1lFaxsy6Nr1oaQJNkLYAyKY6uxAEo2Ybx0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107491

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 - Fix flickering while playing videos with DMA-BUF sink.
 - Fix color picker being triggered in the inspector when typing "tan".
 - Do not special case the "sans" font family name.
 - Fix build failure with libxml2 version 2.12.0 due to an API change.
 - Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkitgtk/{webkitgtk3_2.42.2.bb => webkitgtk3_2.42.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.2.bb => webkitgtk3_2.42.3.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
index ac75afb90..6149a7ac4 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
+SRC_URI[sha256sum] = "0a1a4630045628b3a6fe95da72dc47852cff20d66be1ac6fd0d669c88c13d8e2"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


