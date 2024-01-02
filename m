Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD397C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:09:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.24273.1704179355531420853
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145060531"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145060531"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:09:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76A87DCC15
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:09:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D610F6879
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:09:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 07E466BC58
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:09:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4AB51A0070;
	Tue,  2 Jan 2024 15:09:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-gspread: upgrade 5.12.3 -> 5.12.4
Date: Tue,  2 Jan 2024 15:09:00 +0800
Message-Id: <1704179340-8177-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-3.818700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeUtorPLNYrwZHeA
	HGnweZvi+IlrWmaCmZI6uZyF2AGJsB1YpEPWJiyzP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZL0NewWLx5GnnjHWcaOXzC0FQq8NPzsS1ftnb3Km+NZzlJOh
	yJxDNfvVVC2juQPBO6JFX75naIt+G33iZ7P3mLlIW74Fj81yvRLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108002

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Bump actions/setup-python from 4 to 5
-Fixed default value of merge_type parameter in merge_cells function docstring.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_5.12.3.bb => python3-gspread_5.12.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_5.12.3.bb => python3-gspread_5.12.4.bb} (76%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.4.bb
similarity index 76%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.4.bb
index 932cf22b1..920ff4d69 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "298ebab76e6ed6a998eabc81545ec58f5610f44e2ddb4858b539a0634093f8ce"
+SRC_URI[sha256sum] = "3fcef90183f15d3c9233b4caa021a83682f2b2ee678340c42d7ca7d8be98c6d1"
 
 S = "${WORKDIR}/gspread-${PV}"
 
-- 
2.34.1


