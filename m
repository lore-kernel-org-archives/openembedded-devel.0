Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B158C3DA5E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.33835.1721034183324665813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dQt/JL6W;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034183; x=1752570183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z0m1cMmb7dAMMIOQfFVSONtQ9u1f4ONVLCfdV7J6cpk=;
  b=dQt/JL6WOyFSOpJeVT3KgQryr1sqpNYCcOJLiDFfXLdm4NiLDBxfm2w9
   sjrdIhN2ctUkNC81Ce9d6GzV8ZvicEhIZcjDDMluzI7nTYKbNhGsiBFJi
   DvKGhDcLcYcN/kfMX1sv+LtL6UsqZuIIyxAWLSGgGT95q93vyZXsrcTvX
   XYEpTbZaau8jV4OWKyVtsOPcqaed5iP+Mi95dIY4rkj4OHKgPv49G5UEs
   CkEkQUq3QF8WykPCHOJIeY4ua0F3Y/iclZbT+YSB30pecanGBAMG7PVL/
   7O4cPNhMzH6ZiaQl2CfSDGibc5EQeEaLkHdN9ann900mtzkWG1WZpbswE
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145800159"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145800159"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E345BD800D
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A348BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C47956BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 74D151A000A;
	Mon, 15 Jul 2024 17:02:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 32/38] sngrep: upgrade 1.8.1 -> 1.8.2
Date: Mon, 15 Jul 2024 17:02:25 +0800
Message-Id: <1721034151-540-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--1.445600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyumQTCqZT6QS13D
	BH9waf7YLF1aIujbJLWysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl7SwC3zqzycUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFPuXF8r2qgBkp3NKF7OBc0SYQ+
	BzhDScOWMG3HaJ9UdrwQdPLA/B0rrohsiIT3y/1c5J0754wPcP7rFndf88hbuG81yuFaMq9ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111353

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 capture: fix possible buffer overflow while processing RTP payload

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/sngrep/{sngrep_1.8.1.bb => sngrep_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.1.bb => sngrep_1.8.2.bb} (95%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
similarity index 95%
rename from meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
index 50248078a..518ca9e27 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
@@ -16,7 +16,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
-SRCREV = "373abb90804ba71f980c7120e62f90d3a5c81213"
+SRCREV = "dad1033640f249fa4994f976cf6ee96826c15702"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


