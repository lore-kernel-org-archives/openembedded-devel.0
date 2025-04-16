Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10F3C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.14611.1744794151874228191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ltAXHXor;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794151; x=1776330151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=avklhgSrhbYQE3FXJZGAGu9ti6BTgvY7QoVOfNgVJDg=;
  b=ltAXHXorC+huBvdJSQ7M32rIoXBpY6WNfYzbX1osjP8ueRXyfDwEIQvH
   Olj4HE8ygbky9uToqpLtIcBWTDzDc0xpgNtLjJCn/QZUpGXMSwgn6xn1T
   BHZ6sCz/q+32eBdtC6HLTMyLCmgEHjhuUoaCT8Bt8jgflX03zpDmDU796
   aw23FEVHRapGfxTnwzZlNaqok74ZWsP2GGEHu9/btUvOZtRJC90IDKqFu
   0Qf3gLqwsnmH+3nnjtqyrzRLk3lXMtJcjUxgyWplEGlR6t7cZ2ye/i8G6
   q11HCVdqAXd09hXx7S52upgC8feH4SYH1/2p/n3oamN7sB4VFNdU71t7r
   w==;
X-CSE-ConnectionGUID: zUz12DUHRWC7M9gMb2QSwA==
X-CSE-MsgGUID: 6hTRhWHXRY2vsQmDkH2WcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="185014433"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="185014433"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:29 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB9FAD4807
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5ECC1D6FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E94D41A0078;
	Wed, 16 Apr 2025 17:02:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/31] libvpx: upgrade 1.15.0 -> 1.15.1
Date: Wed, 16 Apr 2025 17:01:54 +0800
Message-Id: <1744794136-908-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116877

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.15.0.bb => libvpx_1.15.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.15.0.bb => libvpx_1.15.1.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.15.1.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.15.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.15.1.bb
index b336a70da1..54433a2b98 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.1.bb
@@ -7,8 +7,8 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "9f9b7e9ba2eb9d01640a9e69a3d655866265cf7f"
-SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
+SRCREV = "39e8b9dcd4696d9ac3ebd4722e012488382f1adb"
+SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main;tag=v${PV} \
            file://libvpx-configure-support-blank-prefix.patch \
            "
 
-- 
2.43.0


