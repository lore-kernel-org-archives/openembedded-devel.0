Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1724EC88CB4
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.3847.1686620442071140221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="121527727"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="121527727"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EC3AC680E
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BCB6ED5E8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B8F620074732;
	Tue, 13 Jun 2023 10:40:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.13 -> 0.1.14
Date: Tue, 13 Jun 2023 09:39:54 +0800
Message-Id: <1686620422-29962-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--0.278900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/ySrLqyE6Ur/jmLueCjm/53RRiRl337i3b2Ma
	pnFC68Xm4k835hqf2Qd4nRO3ZO9FjO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5Wabnk+PPhXCmbN5Wt9sDpb4FOsggOlchyMdvTnqYKYXTRn0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtgqU7CMyqZ6QLY0QgdFsNxNhLWKcrOGWeqWnynHrC82zwsBFc6XlioNmVq
	yCSFegg5pqpX6nA3ZZ4IqYLkyCgjcJCEUFVtaTeHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103222

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
 - Fix header includes
 - Fix prefix of LIBJCAT_CHECK_VERSION
 - Use project_source_root to fix building as a subproject

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.13.bb => libjcat_0.1.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.13.bb => libjcat_0.1.14.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.13.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.14.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.13.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.14.bb
index 2f8cf1b22..782833b22 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.13.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.14.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "f089d7ff9081bb6f211cdd712cddd159f8f63199"
+SRCREV = "d9cf9ebc4237252a82f88d9e99bea0c4b398c08a"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.34.1


