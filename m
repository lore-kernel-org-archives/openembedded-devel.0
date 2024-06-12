Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29935C2BA12
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:59:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2496.1718161139774119930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RGNm0Ucz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161140; x=1749697140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/IRvtlas8R3sVruMVJCQmOp6rI8wi2hoVPOMXK2fZHU=;
  b=RGNm0UczLJpBFdbwSrUSqusL2bcSL2o+pzIYg0hHEtJs3mGDC2r415FX
   M5c0gtwLyNi4ZL12f8KhayRQFp8ZBXL1TZcJtq5nOZcCla08dgAVCXv0l
   VZihhaluioT2kd015ZVTYowYXTMnaSLTIisIPuoC8JPFzJKL7yYX1b8U1
   f8CQK1RbE9b96eRXHxLIR0JH71Wzmd9kvbToD3sZ9xzN8bAYSFyIi9SGH
   1zoOqKxR7VjiZC/0XLhyWsoQYUjYUsDJea24HZlHIBRoWjPBv+46biKu1
   uKjy0BXC03qelTJID+k+vc1TH6vu0W2xUdJn2ih602VIF8P/FotHwjug8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="164690231"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="164690231"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BF7ED9231
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87C89D52A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 21D7B401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B377C1A0002;
	Wed, 12 Jun 2024 10:58:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/43] tslib: upgrade 1.22 -> 1.23
Date: Wed, 12 Jun 2024 10:58:15 +0800
Message-Id: <1718161096-29710-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--1.945600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrKQNhMboqZloc5SGKNk1CG3ig
	8HCMVVLucz6eRGVI+DPGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat0540uNdcZDLqeUiMD
	6wB/IizJTiBqR6dxgDst+4gG6hwJMkfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAvmjdluc4wQ0hsTIvlcLvk/iOAlFXDW/Xw4IaQLCdCXrjZHHUf4wspswVIqjltfqHKvCb
	2RDerFYZGUFsVB1SaAlWkvBCT+1c/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110879

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* new filter module: 'module crop'
* some build and security fixes
* improved release procedure

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/tslib/{tslib_1.22.bb => tslib_1.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tslib/{tslib_1.22.bb => tslib_1.23.bb} (97%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb b/meta-oe/recipes-graphics/tslib/tslib_1.23.bb
similarity index 97%
rename from meta-oe/recipes-graphics/tslib/tslib_1.22.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.23.bb
index cc7e44eff..299aa2a27 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.23.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
            file://ts.conf \
            file://tslib.sh \
            "
-SRC_URI[sha256sum] = "aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a"
+SRC_URI[sha256sum] = "9b489a54d48006201f2fe955a88c3f857535ac93b6cf8e5a16c7b166c8991dac"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
-- 
2.34.1


