Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B28C05051
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7632.1690875733988055746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114849234"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114849234"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 973E9E8520
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D16FFD3F1A
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5281729F748;
	Tue,  1 Aug 2023 16:42:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-compress-lzma-perl: upgrade 2.204 -> 2.206
Date: Tue,  1 Aug 2023 15:41:27 +0800
Message-Id: <1690875717-21608-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.907400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrthpnZXZolDozDhGeQC9EtIV
	GjrP5zXhsT0Q+IxCRFcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2dTe
	gpK7QnXFvQZuQp/ypDCiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEeRiI2Z/esOJkVXbdmYYQprkvdlt6C6fp2t8nRjbaSrH5wXg0sL+JFXd2YQvBCsX/y/5k
	XY+k3Bc1a4gsLiYrdrfToAKeusERvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104168

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* drop rt.cpan from SUPPORT section
* add perl 5.38
* add on workflow_dispatch
* Add some OO examples

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ess-lzma-perl_2.204.bb => libio-compress-lzma-perl_2.206.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.204.bb => libio-compress-lzma-perl_2.206.bb} (88%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.204.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.206.bb
similarity index 88%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.204.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.206.bb
index 13c17b9bba..1959df5e04 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.204.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.206.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=b95311d4a7dbf3d0d36
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1e7a4c4f4e665434df59246b19d168b08af2f1aeebaa08937bd69ad3e5e319c8"
+SRC_URI[sha256sum] = "6c600f9bbb1a2d834b1decd0bd5863dcea52e0ac17de101b5085e0e3cb27285c"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.34.1


