Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB39C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 03:57:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.52544.1702612618053391664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 19:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143471809"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143471809"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:56:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECA74CA244
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:56:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A771D8B0C
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:56:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65D8DE51B9;
	Fri, 15 Dec 2023 12:56:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ifenslave: upgrade 2.13 -> 2.14
Date: Fri, 15 Dec 2023 11:56:42 +0800
Message-Id: <1702612602-3416-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.004
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZqp573tpzEIwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFAkF7sl0Gw6j7/o7mGdQZK2lSZ
	gJGGcuzDfS6Fy0piFB2SIdIdRy4N+cC+H0jYCh4GqypoR8ZpdEUKG0Lq9olftVHsjdX2appux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 03:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107485

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ifenslave/{ifenslave_2.13.bb => ifenslave_2.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ifenslave/{ifenslave_2.13.bb => ifenslave_2.14.bb} (93%)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
similarity index 93%
rename from meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
rename to meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
index 663685a3a..02a5520a9 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
 inherit manpages
 MAN_PKG = "${PN}"
 
-SRCREV = "1bdfb472f2f8212056ed418d48387e8b36e61b34"
+SRCREV = "62e60904afbe58fda0c7104fdad1c4f618266ba6"
 SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


