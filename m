Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39680C88CBB
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3825.1686620451197422221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108391016"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108391016"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25963C53C0
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F55BD4BF5
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAD8820074732;
	Tue, 13 Jun 2023 10:40:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libtracefs: upgrade 1.6.4 -> 1.7.0
Date: Tue, 13 Jun 2023 09:39:56 +0800
Message-Id: <1686620422-29962-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--1.686200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrG24YVeuZGmOMJxigKCCiS93j
	jLnWeB3h4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKrMZ+BqQt2NrBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDLa6EEJyC/HtnF03j9r9uDD2qjKAYV8LUaEw/pD35FZyJSr4ZD/PIl07rencS+jsJjX7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUNhtOpd5esPQcrr7UvnD9iN7FF
	nfnFLOBj3Fw6XNpivnoFC6dksiHpbttAPS/+4ejg5MgAzqEVdlUPbtNN2w85bRfWBrTJ9Ht7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103234

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 - Fixes to the tests.
 - Added meson build support (but it is not the default).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtracefs/{libtracefs_1.6.4.bb => libtracefs_1.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.6.4.bb => libtracefs_1.7.0.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
index 73620f37a..77556d912 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "af49d832f46631597e0aabb2302bd0f56a9cad29"
+SRCREV = "aebab37379d0fbadc702d64aca0fe5cf18676404"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "
-- 
2.34.1


