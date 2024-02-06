Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133ADC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:23:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.16704.1707204231030887208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qBWETZw4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707204231; x=1738740231;
  h=from:to:cc:subject:date:message-id;
  bh=p/Oklta9gNnYFHEEoy1lywnshMewALEEspa8zFGVWXk=;
  b=qBWETZw4IaytcQY1O2n2ZS3+0SO3GvxuMLgKttAfam0LPPHQwRnAW8ZA
   BkJiaK8r+ucqp4mUb9Kdq+MlbgVN7kGwdNMHQR/fNCDPuQVs49v7WjZiy
   4uPho/GnQL9ZNX0XQl8lMXQxMai2id+tn/98pZQbGqykdl+vXLskdZNxP
   DSDbGFQ2DQNia6Cw7j/CBtXRysiNjHyAeCng7Qr7pwAjR66tyLbxniWZt
   uiP6k37zbDKX18tRKDHUE4wMv/HnJkhDQOHQxbEFMFkFKO2WvLuwEl4O0
   yVE/qQ0I/786aew/4C78co4ANh5GnLYW1kazIqjvoKOHKzaR91l2KdbBQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148005392"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148005392"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:23:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1174C181FEC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:23:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C978D561F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:23:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3F1220079136
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:23:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 599E21A009A;
	Tue,  6 Feb 2024 15:23:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.2.0 -> 0.2.1
Date: Tue,  6 Feb 2024 15:19:24 +0800
Message-Id: <1707203964-4520-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.240100-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrJ4cwIYL6KueVDBAppAT/pXw6
	H06bMgiv/H1y8MLYi5YqCja1t++meWJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5fZPFUbFYJwQwxXcerFDp6+/CYwUsia6HQ0D4MTphfBE50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIbAO8MB9XnJoL6RDNKdkc/MHcMPtM51tYKZzdOQej+exYlH
	4U2xJL/EaJy74OVVEKodZn/asdjTxn5GUzzXZLa7MHbFIpZEjNLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108594

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 - Do not dedupe sig and sig-of-checksum when loading
 - Fix the installed tests
 - Show the sig-of-checksum results clearer on the CLI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.2.0.bb => libjcat_0.2.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.2.0.bb => libjcat_0.2.1.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.0.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.2.0.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
index 83fb234fb..2d95e1444 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.0.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "60bb85d53d5da74903ab1e227fbecfa3a3be1b05"
+SRCREV = "869e7cf4511b81897512a3f0adb627218e618112"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.34.1


