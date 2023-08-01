Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663E8C07E8C
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7604.1690875730283396699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126655453"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126655453"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E29B5D29E5
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0D6CD5D1E
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A15210211;
	Tue,  1 Aug 2023 16:42:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcompress-raw-bzip2-perl: upgrade 2.204 -> 2.206
Date: Tue,  1 Aug 2023 15:41:24 +0800
Message-Id: <1690875717-21608-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--1.846600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrrthpnZXZolBM+b8yxBqvAzAW
	5be84JTBcGwEYIqF3GqLpL3h2/lC7wm9i+AUPgL7QQspTR2mf9BN8rmPQRlvK2Imw7it2ivBIvN
	6DT6Y2+wpdBmkg8Rmd2xXyj6mqoLotXRdI6eLEGAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMvlrXbWjt8FBDsKXyzHgcEbVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDW7M4aUdRgJMpjgP5T7EKGB4Lto53S4XGkbFajurcAjdsbtKJXMVy0LRY1Y
	PT8+XNbJLxZjSwZKMO+7BtK+b+G/eNFjJH96T92CV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104165

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* drop rt.cpan from SUPPORT section
* Test::More::isn't warns in perl 5.38
* Add perl 5.38 & run cron for upstream repos
* add on workflow_dispatch
* fix reference to github issue
* Fix to allow building with C++17 register keyword not allowed in C++17 https://github.com/pmqs/Compress-Raw-Bzip2/issues/11
* Silence warnings on HPUX https://github.com/pmqs/Compress-Raw-Bzip2/issues/10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-bzip2-perl_2.204.bb => libcompress-raw-bzip2-perl_2.206.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.204.bb => libcompress-raw-bzip2-perl_2.206.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.204.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.206.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.204.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.206.bb
index 1dc077d67e..2bd98e73b4 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.204.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.206.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=85ab0f65a47c4c0f72d
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ee7b490e67e7e2a7a0e8c1e1aa29a9610066149f46b836921149ad1813f70c69"
+SRC_URI[sha256sum] = "212b81db1c0ae822d19928619a603bd108cb5d5c4700fc67dc7cb169e0cc6525"
 
 DEPENDS += "bzip2"
 
-- 
2.34.1


