Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE91C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.61103.1742893325279626378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S+zukidM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893325; x=1774429325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JTYw0krb69jZ1owIHwh1c+Bz+JEKw2oI2v2EHU917+4=;
  b=S+zukidMSagV5Z15g8wyiz67TPWYVeydmAF5x2d6GtzKRlImL2n/3/5I
   lvkV3PGaDCTCNrtYRihFIZ+ypwfJgkIVbtTpHJ9EssrIYKInD5IFSrBEp
   l6wAQ6oSY58dT7jnBgNOAnIwXNtdyHlO048spOWsmcQmZtWJu4HqJLDQC
   cQ1z5m7Z1ywVGRFJZjcym3noj7denpIMaNI6YvjUNOu1kYCxx2V3lXtcQ
   iMW251itLVO3IUTsICUxLxTC6x3lxFJwibrE1iyHWM1uP9usiaj8k0S23
   3aCJdrRqRsozgpJuP6kY89jjsGVA4L66RPoVOnslUmz3LXjWTqZTpjTxK
   w==;
X-CSE-ConnectionGUID: rwSyF/IJQHiNS+gFBpJ1pw==
X-CSE-MsgGUID: PoEHYKDLS6yoU6Wo94U+9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173063488"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173063488"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56F96E8529
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:01:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 121EDCF7EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:01:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9947A1A009A;
	Tue, 25 Mar 2025 17:01:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/45] adw-gtk3: upgrade 5.6 -> 5.7
Date: Tue, 25 Mar 2025 17:01:09 +0800
Message-Id: <1742893312-3809-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116227

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.6.bb => adw-gtk3_5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.6.bb => adw-gtk3_5.7.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.6.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.7.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.6.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.7.bb
index c128e41561..7d7f8a0b6f 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.6.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.7.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "a88950d8d66308606a6cbb0cfece91376213ad2d"
+SRCREV = "88577252bb7a18f445a108d9a4d2dd046e7abb27"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.43.0


