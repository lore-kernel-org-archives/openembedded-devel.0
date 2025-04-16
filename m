Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAFFC369C4
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14609.1744794150722222430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fbngT7NP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794150; x=1776330150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jpmCkjRxAIF4w9+ttURNl0vP5DKUKVY1Ko8vJvKMBVU=;
  b=fbngT7NPs6FY6ZgjcLzJkI3um1GxlsVvUeoEkxzyuj+32A+liU/Z3XxD
   0MFEGtnVzkCP7WvpRbqwDOg9H+FLL4TfoM+H4xZcEXz6QtKUoSNFmaubp
   lwSqqr3qBZZhBtQhTEZ+ESYP+GFoYPNkhzLzOefkm5t093l/rYzTIRZgo
   dDJ0uCoG+dyFiRwznIMcZ1iXW0J6xMczhfCMszuWcNu8sLLVPJvVPtBxs
   eq4ka3i0AT8/VTMyttfxGVZ8DKodzHLOobxyNw2ev7p7gJKj4AsuNWkkl
   2I9X6bAN5aPmrDA4iYq1C7mVw4KmLd1lGVxVvvcWBG5Cp1qlj+iWjlzf6
   w==;
X-CSE-ConnectionGUID: AEZStdwGQT2YATEGJBnAmw==
X-CSE-MsgGUID: GhtB0EzITu+7wHfg2tjySg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175523868"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175523868"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64542E8520
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D63DD50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8FC61A0078;
	Wed, 16 Apr 2025 17:02:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/31] evolution-data-server: upgrade 3.56.0 -> 3.56.1
Date: Wed, 16 Apr 2025 17:01:49 +0800
Message-Id: <1744794136-908-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116872

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 512ba7f9c5..d737de054a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "7ae5482aa4ee2894467716c5be982500e1d511dddf4ab29b68fdb107d7f8a8ff"
-PV = "3.56.0"
+SRC_URI[archive.sha256sum] = "646cc0037da3f9f295794c637d95394ad76f8c9bee2268be2c4183e27720c137"
+PV = "3.56.1"
-- 
2.43.0


