Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FB3C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:25:14 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.16712.1707204308984002427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V+8KQb7z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707204309; x=1738740309;
  h=from:to:cc:subject:date:message-id;
  bh=0JGWpknA6pI9cH10/URG3ahmTSrOBxfY1b7eqZ16Ed4=;
  b=V+8KQb7zbOmyK6au/aSovhjTNX02GVSWDOwTTf3BesZoohtkWca4fhYD
   pwaNOF+JecwOJUTqgZLpCcThSfcitjEk3VeZEXp1535+3BK53tuy2mxKi
   hvoMKu5qYOwyVd71mSLO2FEzCZoFaA6MRLeikNOmcjaswOaLR3VurssPV
   Qj+MmGDFHDadEcsHfmBKldtZITzfclModlql3dCkef3fhSlsJSJift+y3
   h+D4AiZQUbaOxhAs9zxCdnsc1MFYS2Z+DMWoPeFKhL8zCMxrvHQaePXif
   /tjeQ85lBpAIJ3OMQZtzzlF4WH/iUCh0xlF3/+iMiT6n62A9rCTR5KpFm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148005502"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148005502"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:25:06 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B5CA4E95D1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:25:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F0339D561F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A98F20079136
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:25:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 447481A009A;
	Tue,  6 Feb 2024 15:25:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.35.1 -> 1.35.2
Date: Tue,  6 Feb 2024 15:24:12 +0800
Message-Id: <1707204252-4579-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.533800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45tRaF9dDGxRGaDCzqDR7DPZqp573tpzEIw9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFFlaT58hYuVzPsaw1gNpLDZ6Hw
	iDaIB/IEUBZRcHawgzo+M3cg3u5gmmEtg7HAkA6ziyTq+rRv3nrgHYuNY4rRQZWnrP/PRmAux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108595

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libqmi/{libqmi_1.35.1.bb => libqmi_1.35.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.35.1.bb => libqmi_1.35.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
index 87d354602..5587333ef 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection
 
-SRCREV = "7bb160c70ecd4d8f47ae5c228a85c6a6cf4e4bdd"
+SRCREV = "72d92e75a430900c00aeb1a471965d53eb307708"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


