Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4294CFC536
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.50486.1728896160581594984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NFh7deTY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896166; x=1760432166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZUZc7RuBzE/igz293OeVEQNfjB3n5A9MWZKNmBhwRDo=;
  b=NFh7deTYPB+OHh5qTFcjLar9cnW4DvU+JAQxarNtU4+7YsBO1Osv9mfI
   yHB77yN6aqkigNzghqzeT/8mi2Bf8KAEhLb1MXCNa3nV/5JMh+dC4/Pei
   effaL+r7Dj4AVTwbwvH3UsWOwp22kWiffqzN7mPUMdbRY4gTjNdAG9Zlv
   ddaVXcK2rT60PA8ggRNsjRfcQZXrNjH2U2laVUvmSNeUu4aho4Mt9jyGk
   tBSb5cEsqKbM+0CdRiTb7YLAfWXxmdFCf2jREXH5cGmHKqF2SWH0NtOqt
   Uxt/y8/ajy6wADORhf6PwWcrVF6wj++PR2n9Ylkk+PryA6lYL/ZI7M3mp
   g==;
X-CSE-ConnectionGUID: U8QAc+lsTDGpyaS0ZL7lwg==
X-CSE-MsgGUID: Qf8PMBySQbWAP+xW3VV2/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="178861010"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="178861010"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 156C6D800A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F0E1D7749
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB5426BA73
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A3251A000A;
	Mon, 14 Oct 2024 16:56:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/54] python3-drgn: upgrade 0.0.27 -> 0.0.29
Date: Mon, 14 Oct 2024 16:54:45 +0800
Message-Id: <1728896115-2944-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.244600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorSqU
	3RD+dVC4hjf50HClX+Dmn3xyPJAJopGZilTi8ctSOwpfLMeBwRuC7C2rJeUToT+nYpRHtFlTo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJVBj4hliOeSjzN1/Fz25+aD0lgQ/xwlw+Yza
	ojWYFaB2EWjk2A1aDsjf6Ma/ZShalb1sKbX++JqTB50oBmYESMEmnDgnwTX7z+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112870

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drgn/{python3-drgn_0.0.27.bb => python3-drgn_0.0.29.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.0.27.bb => python3-drgn_0.0.29.bb} (97%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.29.bb
similarity index 97%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.0.29.bb
index 10d7c6ffd..91f026277 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.29.bb
@@ -6,7 +6,7 @@ LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main"
-SRCREV = "a8dfc9e31f551d4b3c3d4307fa19ab6b3bfafb1c"
+SRCREV = "86b29d041c965030c24e9ab0a6907ff22c2a75fa"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


