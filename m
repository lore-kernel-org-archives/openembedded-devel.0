Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DA3C54788
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.37320.1708333363057937849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d6dl1LHh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333362; x=1739869362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5WEmxej2hilU6z1d/Ywj77ZmmK9q2qNgJnZIm7lhTec=;
  b=d6dl1LHhS0LJcllSj3q8fnfKgRSfS2gqT2SRRXA83eHdzbqjORQM29qM
   OZAWZiJvnkdJQZVfteuP9wAsFJp2Z1DtP10mKCIfSDCE1xxsSWzHGyQN+
   emoiptfq2AFYt1hGN0e/zC8Map6cOm88Ea+UCFrk96F9xaBfnJg169xiP
   Y34qp1vl6bjM8P8KhHrx2dL91MVzYU7bDst+aB0+bfgX0DoUcmHnE+PN4
   SmM5K1ZBlEAE46IrWCdFyzPlmnzV229F14VKdc2+6vLPlglceCQjVF3KB
   MvGkWO1Xb4sg3NC1Vm7PgZ1NulGNY+F/HTBdNQ+KDgNJa70ttYn5sX0M5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="150047600"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="150047600"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 61ED6153E16
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A2DAFCFA5A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B82720099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE71E1A006B;
	Mon, 19 Feb 2024 17:02:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/23] gnome-bluetooth: upgrade 42.7 -> 42.8
Date: Mon, 19 Feb 2024 17:02:08 +0800
Message-Id: <1708333346-17704-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-0.801100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrG24YVeuZGmPIgofMgahPrduo
	mcR7kg444CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat05499zZd3pUn7Kfer
	fcA33REWvNoc2prMd+lVQfkIWez0brWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNViXW+mYY/X1KxsWUmajcgFmSq4T+WbAr6amd6zMx7HoFeV4UGNg6aFAwmm6upyD1XpLl
	2nSGXnmK5Js7jy6Ib0kf1hyfTe+IAQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108851

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-This update fixes problems with some devices not disappearing from the list
 of quick settings in GNOME Shell.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.7.bb => gnome-bluetooth_42.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.7.bb => gnome-bluetooth_42.8.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.7.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.7.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
index ba5e55826..6d4d84e1e 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.7.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "94df1729dbec3bb105e588eaf5312bbbaa05c49ea733202a10dc3f7532bdf869"
+SRC_URI[archive.sha256sum] = "76c241e8ca2c9b1035364535ca26084f89fc5c0e1829510f8909583115fcc2db"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.34.1


