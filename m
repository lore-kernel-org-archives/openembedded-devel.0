Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D078CFC51A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.50492.1728896165629661112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DbR945vK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896166; x=1760432166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jkwQdVum8BKJuyJtuPYi+3X/o9bHezPXzr1yFEAuCgY=;
  b=DbR945vKJin2BEE6tBOcmIwFyQ28huQOIrN3imXSAZh2Y+w4gTcqp0uq
   vlsG9QX+BQeerEyadvcmXwcEc4jLhk28X3prjUdQqePhpdqh21RX+k5uk
   Vb9cwixzPMdUeEicrqBedGpWXnoHMTqpCwQOmlX3jmNuFbUNe5MDRM5zq
   4romI+hVXQR2P46imG+uYUIFr/XfIcs4GWuLPZMcG5ph2GTmTQmraQjLp
   gDjxMg3Jwp91TcemVqbFq0ci5sd+5JNe8IfYAkAfO3tGbF/+1j0dfv9bX
   kpxyuPrhPkkHuszJXYWHoJogzZdbx6juGKISWjXmzWtiIf5H26zsWhb68
   w==;
X-CSE-ConnectionGUID: 7sSNTxOhRCqoMGBint/9KA==
X-CSE-MsgGUID: 0nnBEVvBTHOBqRTopFBs9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176692995"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176692995"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:04 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 73F0CC68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B4590159BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 382E66BA73
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA1061A000A;
	Mon, 14 Oct 2024 16:55:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/54] python3-cytoolz: upgrade 0.12.3 -> 1.0.0
Date: Mon, 14 Oct 2024 16:54:42 +0800
Message-Id: <1728896115-2944-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.105600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mra9qiaDSLgo2r1gUu9f1F/zSs
	oNI/FWew4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzxlaAqi8GaUklok
	qmiWZiuDmwTSd9rTYnaqVatZ68hAwZNn9uNUcH/VV/2v1oI4hZQ/fl99s4zwXQ25FIdR+cm88Gu
	n8czkCuiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112872

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Test fixes for Python 3.13
- Drop Python 3.7
- Bump cibuildwheel in CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cytoolz_0.12.3.bb => python3-cytoolz_1.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_0.12.3.bb => python3-cytoolz_1.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb b/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
index f9c9704d7..15fb1733a 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "4503dc59f4ced53a54643272c61dc305d1dbbfbd7d6bdf296948de9f34c3a282"
+SRC_URI[sha256sum] = "eb453b30182152f9917a5189b7d99046b6ce90cdf8aeb0feff4b2683e600defd"
 
 inherit pypi setuptools3
 
-- 
2.34.1


