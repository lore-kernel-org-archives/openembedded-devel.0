Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD497CDD571
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11278.1726716756978988954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uCpCq3i8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716758; x=1758252758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oYExxCKFzWZQoBAuaWTAoVi6BSmEMdTz7r/QhCjRBVc=;
  b=uCpCq3i8hYpb0ss7QvQfa+6gS/I0Ju7+Hc64BLxa9QBMFDxK9hWEQLe4
   Iqfk7OgIgiV3upOFA/y/x/N8j1H5Nq+q20m3Ghgy2NyB8wC6xMH2M8gQV
   5JNHnT+AsgpVEtJW28pXBIKHmNYsSkw4QsiN2Jd6hnQ8gyZAd5bMObeH9
   ixfdUp1HIFqdhBVH0LEQoGXEHGFjpJIu/W2723SsVQV0hHopNDFos+B3p
   KOL/4U3mebP3DCS8wF5+2fN4wMPzkr1jL7cOpsr2bfLnGDLdHuZVUcn2F
   wPhQJeKpQGZ+O3Ea6ozPZMGwbHtJySNyrrUxKu6i6GYtKjDWdtjMkmAK1
   Q==;
X-CSE-ConnectionGUID: 12+cPAOLTn2v/kAhFIxpJg==
X-CSE-MsgGUID: LO9A+wgJTR6ttirWSDtNvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="161515748"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="161515748"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CDD91CA1EC
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16D5ED7746
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2A4F21FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4EEA41A000A;
	Thu, 19 Sep 2024 11:32:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/28] python3-nmap: upgrade 1.6.0 -> 1.9.1
Date: Thu, 19 Sep 2024 11:31:57 +0800
Message-Id: <1726716733-14548-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwP/hxxPCwzUoPEQdG7H66TyHEqm8QYBtMOeTj
	F9Y1ff4arL123i1Pw5R7DxFYYALgVohb3olHs/vpEnOiohOlzTax1qBy2unNKc+ql9gSZEVmmo7
	PFSa55oifDbmWOVNUWgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112374

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-nmap_1.6.0.bb => python3-nmap_1.9.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb => python3-nmap_1.9.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
index 2293e3ddf..25e382088 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[sha256sum] = "892b5091cde429fabfb8ba63382b2db8fd795193ba147558d0a7d5534c956255"
+SRC_URI[sha256sum] = "8465cfb013f5cdfa8a1050c40cdae600b581ee32f1864ec404927aee49b4262c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


