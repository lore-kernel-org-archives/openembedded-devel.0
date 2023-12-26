Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250F6C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:00:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.76536.1703574010943943375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="133011958"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="133011958"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:00:08 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 203FFC148F
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:00:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50CCDD9474
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:00:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA16122D901
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:00:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E6A01A0072;
	Tue, 26 Dec 2023 15:00:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231210.0 -> 6.0.20231224.0
Date: Tue, 26 Dec 2023 14:59:55 +0800
Message-Id: <1703573995-12702-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SM8MflipG3+pSTc6vc/KYkhLO+OsRkuPy0nGoQsCohYvPWH
	n/tk+a1e4YqA1Ky64Vw2LNFCE0vPNcHml47VndyfHIUC4ZqmfoS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107788

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20231210.0.bb => ctags_6.0.20231224.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20231210.0.bb => ctags_6.0.20231224.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231210.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231224.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20231210.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20231224.0.bb
index 308be374d..9c4e819c2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231210.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231224.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e9afc805622ef89efa6df9b3ae8fd2871536fd1c"
+SRCREV = "bea6f5bc96d9a5d11da36d23ee50d952d8bf3a8d"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


