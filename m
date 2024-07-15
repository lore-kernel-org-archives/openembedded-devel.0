Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6740AC52D6F
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.33826.1721034177807152453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xa2sHhVU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034179; x=1752570179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=l/kgBHhKq9lCpfxMCH3ZOnqzmQNvFro88XASPJE+rDA=;
  b=Xa2sHhVUuhmfP2pu0vnx0lG33soyr+KAAPHyD3Nqf9SetQsieiHTp7g0
   IM27cIG4qhTFRr81WR10522B1bKqTL6PnzleIC5TnBummBhHiMdlqYOtK
   NopgkXQOwuUSM00aa3RLEg4reTp9Bn5bZXMjj2P/MB6PnkdvgRXI+vQrq
   5gLVxA0MHRD8clEsB5FTW2HPqAPWXdyJ99IvCnmDCV+L1/55AK3hAdr19
   BdDVyXKTiFO6Zg/fEpei08v2dtSZKnzWoo2khdoVr0nNBvGuoM0qVuvP3
   5ujCS6JIbAKRk6gt5QSJhmIt1qc3XFLuBWkE6JomRlcKCZiWKOgtPxhnZ
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="168833503"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="168833503"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62C50D29EA
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B962CD88C5
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B1476BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB9DA1A000C;
	Mon, 15 Jul 2024 17:02:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/38] hwdata: upgrade 0.383 -> 0.384
Date: Mon, 15 Jul 2024 17:01:58 +0800
Message-Id: <1721034151-540-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10-0.353800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkwcMedHxxRAtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJon585nKQczq746cXaPycFZvzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLzflyoTkWhRYAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzoAS+Kpn0GY7Ss7
	9ztzp1TNB2Tbq61mThAKtw/87XSIQhRQTDkQ/VwrX6O9njy80D9QgELhXTT/jlNeg4i96my8HdL
	YpOjbUDiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111329

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Update pci and vendor ids
- Replace 'DO NOT USE' with more descriptive 'Invalid Vendor Codename' in pnp vendor names

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.383.bb => hwdata_0.384.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.383.bb => hwdata_0.384.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.383.bb b/meta-oe/recipes-support/hwdata/hwdata_0.384.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.383.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.384.bb
index cfa6ae0e4..16d2bd090 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.383.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.384.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "229069b51b488bc776602d82315188cd1fbf4887"
+SRCREV = "30da6d148d996a5fbc43a9e27f5b325558b600bd"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


