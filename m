Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB425C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:01:33 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.16475.1707202885918522944
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=enP2t/eV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707202886; x=1738738886;
  h=from:to:cc:subject:date:message-id;
  bh=6ZJUrzCy/FIgSiAd1GaXLjKQwyiuifNXW5M2TTJMTms=;
  b=enP2t/eVokHXV+LNN1R+UlYONAtDS3kiwg8ZYm8ah99wHKAQS79aCONz
   Zoj696Cuw8IhjC5yn+Q1AwwjP548kx04cfVc6Tkeb/dxsRerlpw92EICF
   U/CmJVsvZbdlr5B70s+XNlVnR76x6vSy2M+vi5/yGum7Szd+6NMrqU1zU
   6IE//R5+PLH5H+YYL4cdzKLD2F7BfEecXAD1/EpOBNpkoJZNKYGwVEsEb
   p17d/S5AAU4sci2WXU2AMWyT+ZOT89xheRP+H7FMBsRKEaUfvB6vW7mef
   5P+e210cTBlI4xce9cByB9DLs2XutiMLWVjPE+Mi8bXsoLfY7h7rs+k+n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136537332"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136537332"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:01:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A1E210FBFF
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:01:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE1F4BF3C9
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:01:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D6DB200983FE
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:01:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 134F91A009A;
	Tue,  6 Feb 2024 15:01:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cmark: upgrade 0.30.3 -> 0.31.0
Date: Tue,  6 Feb 2024 15:00:23 +0800
Message-Id: <1707202823-4154-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.004
X-TMASE-Result: 10--1.001700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDmlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah/tAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzXbYmZ4PnFRAXQe
	5XxDnrHMXnOirTlpZ4m8tGCLBRLSvTYdUe/JkCw+6D2KFmjLy+4yx8ixVnbEaZygkJ844CUa19O
	GyDmhIsiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108587

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/commonmark/cmark/releases/tag/0.31.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cmark/{cmark_0.30.3.bb => cmark_0.31.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.30.3.bb => cmark_0.31.0.bb} (89%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.30.3.bb b/meta-oe/recipes-support/cmark/cmark_0.31.0.bb
similarity index 89%
rename from meta-oe/recipes-support/cmark/cmark_0.30.3.bb
rename to meta-oe/recipes-support/cmark/cmark_0.31.0.bb
index 6697dfe07..ce8b4cd49 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.30.3.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.31.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https"
-SRCREV = "5ba25ff40eba44c811f79ab6a792baf945b8307c"
+SRCREV = "8fbf029685482827828b5858444157052f1b0a5f"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.34.1


