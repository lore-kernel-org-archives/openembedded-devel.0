Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FE9C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:25:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6448.1704720298412846356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="145455138"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145455138"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:24:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DF22CD2A02
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:24:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6CC5D9CDF
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:24:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C54B202CFE8F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:24:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF4431A0072;
	Mon,  8 Jan 2024 21:24:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.14 -> 0.2.0
Date: Mon,  8 Jan 2024 21:23:13 +0800
Message-Id: <1704720193-30029-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.243500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqydzjX37VUcWqSL
	KJxuiASS4SHO15Vxb9bf1u+0fjCBG8cTVl1qn8Gil368qSp6b55UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi74MThWsvfJhoMLOoNHsM9oGzTdEevOMzG1Mjd1CixqfX7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUcmr/NQDCau03Yj6PcQlbzSuT2
	i8GPOs3X/Sy888tiZzcDasSu/wJdk0oukGmPHztVEz4N+kkCculbw89JuxcDypSk37wUuOL7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108137

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
- Add support for verifying firmware transparency checkpoints
- Add various bitcounting functions for future use
- Allow creating and validating SHA512 checksums
- Allow verifying the checksum of a payload
- Sprinkle __attribute__((nonnull)) to give a little more compile-time safety

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.14.bb => libjcat_0.2.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.14.bb => libjcat_0.2.0.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.14.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.0.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.14.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.2.0.bb
index 782833b22..83fb234fb 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.14.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "d9cf9ebc4237252a82f88d9e99bea0c4b398c08a"
+SRCREV = "60bb85d53d5da74903ab1e227fbecfa3a3be1b05"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.34.1


