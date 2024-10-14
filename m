Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B238CFC504
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:55:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.50481.1728896135600351285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DkUMIogK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896136; x=1760432136;
  h=from:to:cc:subject:date:message-id;
  bh=maPu2+PXQtfSPqpCpZmpBFBT0rNWBtuFDnCUiYxX/8A=;
  b=DkUMIogK/Gi2Ud9/GCuKiZaOKoWGTfJNUYrxd9xnPFR0CnezoUcDaDUq
   3I6MbYECtsBHJ0TfgNuE8HKJ1Dw5qlxypQqlQHcLiS5EFCEsulQwvD2UP
   exLZrj7Z1iyZYvD6s4davyk6MfvFLmQp3O+60kZ3EZ5sICyKNQmn+J7SA
   /+xlenHItZUUJ7MOJRqCpO0BC9MGltXBr6E7NuFYNRo6oVPDG7wvXUQnc
   buqUTkHuTaCN6fU8FO/e4mp7Ci2JKiYTHfN9e4eeV5WY4t9tDglLHHScr
   y73oCcvLI+cxVoIUM5T5/g1gysw54yaRFw/QM31vVi/QpAzBj5YxqAbHK
   g==;
X-CSE-ConnectionGUID: IhAzSB1HTmyUY76Lwiq29Q==
X-CSE-MsgGUID: F2P44ElBSXC6pjOOeKLnSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176669395"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176669395"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3234FCD6DF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 708F6D5028
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC60A200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A2DE1A000A;
	Mon, 14 Oct 2024 16:55:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/54] adw-gtk3: upgrade 5.4 -> 5.5
Date: Mon, 14 Oct 2024 16:54:22 +0800
Message-Id: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.351700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yeKLvlSV0+r2prmCp+RjmiiU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNaDCzqDR7DPb1q+x7zkhJWuTDRyP4fmgwo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKnia0u1SCudO0IImMxeHaiIEKQwp4ZTCqDu1
	xmmsjmSTdWbudrtVEcRxg93VXOIFtSlV4qIYdYn+HO5MLJmme4053yJFkakMj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112851

From: Wang Mingyu <wangmy@fujitsu.com>

bugfix:
- Since 5.4 black selection in gtk4 apps (with no libadwaita)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.4.bb => adw-gtk3_5.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.4.bb => adw-gtk3_5.5.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.4.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.5.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.4.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.5.bb
index 3a0ca620b..2f1e80abe 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.4.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.5.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "91aac01e4f4bfbbe233cf7f4bb7a8e4cff73bc5f"
+SRCREV = "385a900628644dc81fa4942ac848a765229be93a"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


