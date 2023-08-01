Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9B3C04FE1
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7627.1690875729426700273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126603479"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126603479"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41343DE632
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73E35D8B7E
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 062FB10232;
	Tue,  1 Aug 2023 16:42:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcompress-raw-lzma-perl: upgrade 2.204 -> 2.206
Date: Tue,  1 Aug 2023 15:41:25 +0800
Message-Id: <1690875717-21608-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--4.123300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxxCQDZz1jQ8ucD
	DzKnTzUs3g+ICbUV7gF1EdhukGbRLpZX3poC1y57QQspTR2mf9Bcsgu/IQFPzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprdqLmLizFKyOKXqmmYTGpxiem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUPd4Iw7uplyK43gFn3MOZEAQYH
	w9zhE9zDhkQa+WWGdlrhVjq9eq61W9DCmnoikHABbE7wkgamFY01eFShoIpMZX3CdJZH8x87H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104166

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add instructions to deal with build failure on Ubuntu/Debian
  https://github.com/pmqs/Compress-Raw-Lzma/issues/7
* Test::More isn't warns in Perl 5.38
* perl 5.38
* add on workflow_dispatch
* update action/checkout version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...aw-lzma-perl_2.204.bb => libcompress-raw-lzma-perl_2.206.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.204.bb => libcompress-raw-lzma-perl_2.206.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.204.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.206.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.204.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.206.bb
index c4b6a4bb79..cdabdb1390 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.204.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.206.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=b95311d4a7dbf3d0d36
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b226d0648da3e7309387cd8d9cf629353593fd08bac29533f2559659ef7aac1a"
+SRC_URI[sha256sum] = "e01a7040b84bdc67592d13eec0c788590e1f696d1d4f07c7097bd72a4f886eb4"
 
 DEPENDS += "xz"
 
-- 
2.34.1


