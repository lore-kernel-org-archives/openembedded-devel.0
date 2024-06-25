Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1112EC3271F
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.167215.1719305816461089847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z6WJscva;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305817; x=1750841817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CkzlPJ/CioU0VbcAsiWdV1DR+6PJV+CcA4znInJallM=;
  b=Z6WJscvajsKeM9J8sGxNbj+Eql8MuaS2A1nNX6us2upkNUsQAta9X6m2
   AZANHYXQOvIZtapoX/C3l9aNB3a76FywdexyhWQ3XebOqi1pdHOrZ5eqg
   35HedswXNi344Ul9YzQFVKG/xF2ULLqESOaqyCxdqSdubG8QQEcvVXONb
   WM+j2I4CAVUJ45/oOTREzYc302UkJ8S61kf8CvJlBT6KGozej+Usv494F
   QznkKkF4NB6QRB4XW++hxAs53UYAXkq8fzA88l6L2PpysLqp1ueLUMvb8
   mgchoaa3ifmCB34TfodxHmCcZIY1XOR6Ek0w/72WonsRh+OPqtUl07/xn
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869244"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869244"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 125FCD8008
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F981D8AF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EBA71E2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 99F4D1A0002;
	Tue, 25 Jun 2024 16:56:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/57] editorconfig-core-c: upgrade 0.12.7 -> 0.12.9
Date: Tue, 25 Jun 2024 16:55:37 +0800
Message-Id: <1719305790-11484-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.004300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytaer+1iaJkEDJh
	VjTVb39YYBvXPbiTXr54nRO3ZO9FjO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfNyl1nd9CIt0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9WYbwhqF7AxPAJsdqcbUCJ6y6/DqS5DhdmmFsRdopZpxnFKdPOarjb23MvIXmmxdeJdSw
	0RuoTbcEAA/kcqFMcZtDdpEyaQeRfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- lib/ec_glob: Fix potentially uninitialized variable warning.
- Bump CMake requirement to 3.16.3
- lib/ec_glob: plug leak of nums utarray
- Clarify the steps of building from source.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...torconfig-core-c_0.12.7.bb => editorconfig-core-c_0.12.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/editorconfig/{editorconfig-core-c_0.12.7.bb => editorconfig-core-c_0.12.9.bb} (91%)

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.7.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
similarity index 91%
rename from meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.7.bb
rename to meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
index 2c594d229..b567f11f5 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.7.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38f617473e9f7373b5e79baf437accf8"
 SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "fd8cf1e94ecf4e6e4493833f96140cf9bd17578e"
+SRCREV = "e082c947e7f7b14240195d55c060a6e1eda1b0a1"
 
 inherit cmake
 
-- 
2.34.1


