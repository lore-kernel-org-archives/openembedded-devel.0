Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC843C25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.12692.1716860977605935354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D4FTbLNy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860977; x=1748396977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r52SARJadnFdVKHG6eQNMaVIkgd5f0SVKMrb00qQe1A=;
  b=D4FTbLNysn+DQN8wgCAdoy8GGzx9G7W7Xvp8I3iqIqvAXq+pLB1mRHv+
   JaxDp95ZVuMzozgX3KMQHCcqnnUT2XCyMipCWrjJidznZhng3EAqce1Ag
   fhyySVOM/zcrLxih8nceNePtzkSJOqiWG2DejP/YuDJ5R69KSMNunYgyP
   GNdHj/c7TULNrlCXmztVV3JChF5Kxsz94YfpQL/nt6WfVbALSQvWUB+gw
   eiCUtzZjOKwlBP5og8q5E0ZkzqviGdWcS7DDNQO8ubWHTZasoepJzugEH
   UL5QgTu63fsGcVRF2voeapblrQ/7HxEUjVi+4zMKp4FmV0WhwISJWzu6q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160605056"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160605056"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62854CC142
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 530A7D73C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA8602007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 890DF1A000A;
	Tue, 28 May 2024 09:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/40] python3-gspread: upgrade 6.1.0 -> 6.1.2
Date: Tue, 28 May 2024 09:47:58 +0800
Message-Id: <1716860901-863-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--0.459300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyMJxigKCCiS9SH
	nJDq2yhM3WhgsWJsCXANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4t9S7jPDkiDhOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt0lAUPM8lU/D4MH7KqRmGrX358w7bI7nsRV6nCrLTckVa/AO0F+ZaLvK10
	K4m0aLK0F15UFbjaTrxyc/H8SBNb931BW5U/vRCHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110551

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- add note about runnings tests to contrib guide
- Some updates on get_notes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.1.0.bb => python3-gspread_6.1.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.1.0.bb => python3-gspread_6.1.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.0.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.0.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.2.bb
index 482155856..0aae1d0c9 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.0.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "576b72b628b251d2ee41e02b982d3c714d511d2a5aa3a88e587ed9efc4d6e752"
+SRC_URI[sha256sum] = "b147688b8c7a18c9835d5f998997ec17c97c0470babcab17f65ac2b3a32402b7"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.34.1


