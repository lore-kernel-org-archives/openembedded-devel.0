Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F3C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.16489.1747731316435812152
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MQKGrH0A;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731323; x=1779267323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0mVEX9fhS4tA2WMNqeMwUuut2fu4zrvKfK5X1VyxGG4=;
  b=MQKGrH0ArsUnO5Va5nrytKw5coHR0Gm5rRZzMSZtinEX+8YZ9UPs9lkE
   OUG325P3xW1mj7vGes0UuB2SKbDvDAJbk7G92PCfTTua6uI4cv3JZSCK6
   kycSQiIG+X82GjzAOyLVz1Y0sj2j2xX4dBvlAooRYd6UXQ8j8dqK9U+ah
   09+ONNlETbgpBhtf8FYRSnI2hvCgunA/EbSVMAxOV7IZCs3LljhHfin7w
   BEqKwGLLY++qwgb/u5vbfEej3owRCnGZutmSrnHeC70g3NEuzxbNafJDd
   osi6Vl8CGKfHRsjQ8U23CgoFMEFMB5tAUy0mzRPsvgJWXnTH7+pXdMJTK
   w==;
X-CSE-ConnectionGUID: qOWYXkvZSCqe1BCkorakcA==
X-CSE-MsgGUID: OhYWTJQ+QAC2poQA5qNu5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200077179"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200077179"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B45ED8FD0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 250E8D72B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD38D1A009A;
	Tue, 20 May 2025 16:55:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 26/27] twm: upgrade 1.0.12 -> 1.0.13.1
Date: Tue, 20 May 2025 16:54:58 +0800
Message-Id: <1747731299-20448-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117507

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{twm_1.0.12.bb => twm_1.0.13.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.12.bb => twm_1.0.13.1.bb} (84%)

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.12.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.13.1.bb
similarity index 84%
rename from meta-oe/recipes-graphics/xorg-app/twm_1.0.12.bb
rename to meta-oe/recipes-graphics/xorg-app/twm_1.0.13.1.bb
index 91b1abc211..ff0238a430 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.12.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.13.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4150c9ec595520167ab8c4efcb5cf82641a4c4db78ce0a1cb4834e6aeb7c87fb"
+SRC_URI[sha256sum] = "e16bdbc82ac57c096d606a90e63c42c73a4a8a6a8a04d97b7dad199f919c8471"
 
 FILES:${PN} += "${datadir}/X11/twm/system.twmrc"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
2.43.0


