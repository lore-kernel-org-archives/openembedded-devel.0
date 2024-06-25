Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D52C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.166851.1719305824894098677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M3l02S5s;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305824; x=1750841824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cosDksdkNgPLa7SnkVUapKLnR6ElQVqro7F+YhMJiMs=;
  b=M3l02S5srbFu1oTLuNgf/PIq3XeRAZWZPidZjhJ7KYZS0d3wXKpGQXFy
   teClth44KQF+oeZXQN8xLdop09D0AeLglAD6XKTnpAGJWTqDsGA1hAn7/
   a/qQ6O/N8aQ00PqyWni/K+BjPY7bPElBPt8jqUvQtFlWZzn5cWQeKLKrO
   d7W6XM/UEyn2vk2chLkoJYIvbIEbabunD0VHRfbMdozC0CL4YV5BHlWua
   BpFP1X6MOwFAEiPXL9N1AeAwmfWg/W/iPGQTxSTln0DYMJ69fBnFkkuDZ
   K7rfAQiibTIZ1hk5Q2qyt+WHEv+2EJ1Y1KHs4gqKBn0advXafVvX2U4FG
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152868251"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152868251"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2949FC9443
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76292CFAB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFF04E2B25
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C2CA1A0002;
	Tue, 25 Jun 2024 16:56:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/57] libimobiledevice-glue: upgrade 1.2.0 -> 1.3.0
Date: Tue, 25 Jun 2024 16:55:49 +0800
Message-Id: <1719305790-11484-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.492300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz+Aw16GgqpO6Dp
	INQWjbmaB35JUm0KMAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0kQ6gYwWwXJlf0o/1pwjPyzHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXufu
	Cl/ej1RC/ArbMsTNzYQoWsGdk+2SuFqfBhRd0J3pI+qK+9zN67ZNlfImVfd04Lnwi91Rt6io0s1
	6JucI+z4g4G6BfaDA8yoB4P7dCh9lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Add SHA-1, SHA-224, SHA-256, SHA-384, and SHA-512 functions to interface
* socket: Create an IPv4 compatible IPv6 socket when NULL is passed to socket_create
* socket: Haiku compilation fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...obiledevice-glue_1.2.0.bb => libimobiledevice-glue_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.2.0.bb => libimobiledevice-glue_1.3.0.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.2.0.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.0.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.2.0.bb
rename to meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.0.bb
index c9e9c90d7..8bd555d96 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-SRCREV = "fde8946a3988790fd5d3f01fc0a1fd43609ab1d1"
+SRCREV = "362f7848ac89b74d9dd113b38b51ecb601f76094"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


