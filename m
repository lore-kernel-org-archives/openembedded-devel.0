Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C3FC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:04:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.24242.1704179040662787255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="123830569"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="123830569"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:03:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4403ED7AE3
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:03:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8601ACA27D
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:03:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CE6B6B4DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:03:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D2F81A0070;
	Tue,  2 Jan 2024 15:03:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] imapfilter: upgrade 2.8.1 -> 2.8.2
Date: Tue,  2 Jan 2024 15:03:46 +0800
Message-Id: <1704179026-7898-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-0.874000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz+Aw16GgqpOwkx
	Gyoehq7BhhbadzHkVbt3aWU5jdY62O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfh38bnPLEpPHdCok3ibXlQU50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJsRtOIOL7R2B/eZmUyXat7KpTETe+ZwSoKOOiA3SCjuXoVr
	D2h7UnfNAIjuYx5ibqJP55ZcnEFD92bMl5tkGOzMCzOrnQsSWFLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107995

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add IMAP support for UTF-8 (RFC 6855) when "charset" is set to "UTF-8"
- Don't use FETCH FAST macro use for better compatibility
- Bug fix; recovery mechanism error on Lua 5.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../imapfilter/{imapfilter_2.8.1.bb => imapfilter_2.8.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.1.bb => imapfilter_2.8.2.bb} (91%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
similarity index 91%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
index 878d28f13..422d96359 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
 
 # v2.7.6
-SRCREV = "e6372b88e09a4d1c573b57270de6b40846825a8b"
+SRCREV = "9e6661278572009a92a8e125c9b339232a9735a1"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
            file://ldflags.patch \
 "
-- 
2.34.1


