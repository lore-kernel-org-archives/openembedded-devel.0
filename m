Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B071C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8715.1724833535769596083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LfbX8NgP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833536; x=1756369536;
  h=from:to:cc:subject:date:message-id;
  bh=Bd1VQg//6IKa2Qp97UNGvwrqkCuVyT/QI+6wu/Jn8ls=;
  b=LfbX8NgPR417Insh3pnhz4RSIvMECIaksmS3QeXwPTjIRCO2nL6guOJ9
   M4siCmqltMGG4h8NwirxptlTnndqP11ldkd5/9K31eXqRNMKg6OaXWVwY
   KmiteBM1z3eoulARnCUEpknP5LsWnEyzgxbNLNbDFfejcYUSRzoD40dji
   7pa2/GXsG/+ZTepgNgDONnYJNUSuzRo2357egMORUNau/zzCaErML/qRD
   OPnM2YemTe04Mo5AdP2AXGzyLXrKds+HaQ/VZIXJRKQvJHuU+dusW8khZ
   ftaa83U8lqtUv1+askRS06vMJHrVp+s8Xrxb63t76+QhTf8VH+AI4hC4r
   w==;
X-CSE-ConnectionGUID: nM/O0lWNR1ef+EAkQ+NFEg==
X-CSE-MsgGUID: reA80gcgRoGPnihv2VOyWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="151342497"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="151342497"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5554AC68E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F808D50FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 14EBD20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8AF971A0002;
	Wed, 28 Aug 2024 16:25:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/46] colord-gtk: upgrade 0.3.0 -> 0.3.1
Date: Wed, 28 Aug 2024 16:24:40 +0800
Message-Id: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--4.887500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/ySrLqyE6Ur/jB4Ntzrj5dXSdR6+/ciGZAdVz
	2RzqmR3B4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054/67wpKrIJNBPUB
	7phxYIL36k4TRrVNn9e9DF8xdzpL9r78SC5iivxwURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrayLMAO7PjWohrBw5/cxlQPL2AoGRchL+8Z9J+CFpRLMCx3dLpu1K2TU87Rm1KafG2Ovm
	HU/5GzKCsJ+Z+OvjJCpzvEhbXSvOx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111979

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
 - Fix the callback signature to fix a crash

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../colord-gtk/{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/colord-gtk/{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb} (89%)

diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.1.bb
similarity index 89%
rename from meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.0.bb
rename to meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.1.bb
index 0e86d781c..1c6d34e46 100644
--- a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.0.bb
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.1.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "http://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b9466656d66d9a6ffbc2dd04fa91c8f6af516bf9efaacb69744eec0f56f3c1d0"
+SRC_URI[sha256sum] = "c176b889b75630a17f4e3d7ef24c09a3e12368e633496087459c8b53ac3a122d"
 
 PACKAGECONFIG ??= "gtk3 gtk4"
 PACKAGECONFIG[gtk3] = "-Dgtk3=true, -Dgtk3=false, gtk+3"
-- 
2.34.1


