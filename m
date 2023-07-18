Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAE0C05052
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.731.1689654366710310708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124958047"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124958047"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 65691CA1E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 999DC28014
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 227F220077821;
	Tue, 18 Jul 2023 13:26:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.8 -> 2.9
Date: Tue, 18 Jul 2023 12:25:10 +0800
Message-Id: <1689654348-30702-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-6.054600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrWvaFnGMIvOrG6iWKMNj1gGf0
	psGams1slxPsRwiY5LwqY0HaSNiHax2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW4Em8Adulyv5aHvyg1ZsxTfcu2IYLQNwP9vTnqYKYXTRn0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtpejO6WeHCJhrvFg2kB6HnSQvX6xL5v1MQie7HvQec2DLHnYP9mpGwfSVk
	/SbX0x/Nt5IThGZl5lhWeMopeOf1WstWqQ4lv4tftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103900

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- build: Exit before AC_OUTPUT on error
- ci: Manually prepare spec file for Packit
- Update translation files
- tests: fix locale tests on musl
- Translated using Weblate (Korean)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.8.bb => libbytesize_2.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.8.bb => libbytesize_2.9.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.9.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.9.bb
index 0afe8a6c0c..dfc7b42dca 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.9.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "12b8e6bff611eecb0343ee8a765151e7d9d3547b"
+SRCREV = "2fa27aa3acccc70b9f6c3bf2e569e3d33a381e83"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
-- 
2.34.1


