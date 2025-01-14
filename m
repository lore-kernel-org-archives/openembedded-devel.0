Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37177C02188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.40589.1736843356665693668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qwNs1qGo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843358; x=1768379358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=P3duosyBMhAFHHvwW9bUtPaE8fhtClTr0zghsmQEIeo=;
  b=qwNs1qGocyDx5n2APhb+tSsVEzgkuOjkdfskye/RYxU4ZnU3gRfFMFms
   hZSetjdFE9e2dlKLeewT3bm3gb0mJRLIdlsSBupJRMz7dQUCDiYjtpSB1
   GMWuKEUo7at9royPmErwsvns1ZK6xeBgkNWlK4dkBIUFMGxreEIIdUp7M
   TTIm2XznD/bOsdor2UtCt6cLo14xv2hBwF84d4peCivtPxbeqhuN8MwBH
   GoQ/8Bdqve92xJ0JcbYf+J26rxek1WJbwTLuGNs2yIjDBeAlSdO9iouEE
   2KjaLOQL0uaLvvp4kd34Lr4IBh4C8hQZIzbttAV4GYDbdgaPWvDbRMgyS
   w==;
X-CSE-ConnectionGUID: c9uY5pbyQIWVtsLrNNjOaA==
X-CSE-MsgGUID: k3aF7Su1SZqsyfVyKXCs4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165944750"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165944750"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF15BD5015
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84957CFA5A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19C4F6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB7C21A000B;
	Tue, 14 Jan 2025 16:29:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/30] python3-wrapt: upgrade 1.17.0 -> 1.17.1
Date: Tue, 14 Jan 2025 16:28:44 +0800
Message-Id: <1736843329-4131-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.062200-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoghqh+u1IaR7ngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXY/NDD1Ui1zf4/5KqENyvo+Ab59BnFuDcVYjup02wGG6tdfkkutISwlHCGqu8v+mrl2v
	fjg6SLIzgmSaeRnQdx5TPUMRgWMGNiW2eA9nSDIFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114870

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Due to GitHub actions changes, binary wheels were missing for macOS Intel.
- Not implemented error for __reduce__() on ObjectProxy was incorrectly
  displaying the error as being on __reduce_ex__().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wrapt_1.17.0.bb => python3-wrapt_1.17.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.17.0.bb => python3-wrapt_1.17.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.17.1.bb
index fae45fb705..b40c792535 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.1.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06
 
 inherit setuptools3 ptest-python-pytest
 
-SRCREV = "e663d4910a81d666786ac773ad7c16199b01d31b"
-SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=develop \
+SRCREV = "c41e6eadb39f45ce96f488cecb250e417926b49d"
+SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=master \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


