Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19808CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 01:29:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.1116.1758763751328547572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 18:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mv6ivxUa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758763751; x=1790299751;
  h=from:to:subject:date:message-id;
  bh=i0sMfUQv+6vnWnZPbxHbGE+xFJaUtL+/FcRKty2iOno=;
  b=Mv6ivxUayivoDQTfdo5yXW2ZcNmyOKtfB07/F5gFGvL6gF/zA0XZEqj5
   rQl2zJwGqXOb7c5w4FKaKQJDP/JVOm3kwQfb/SOO5xANJk8o3O3MdkVmX
   qY6lA9M3b303EldqybAj8+1BStEv1j3KHoQXYD1y6+82qcoBlaW09xIBk
   aR4TQcVGCqQuJAb3Ce5hiEmgKovUrLpK6e9++AjiSdozm3FTTYpAmFWlw
   w716WTMBk09WIM5RspJA6bHkOnuA0bYI44Hn5Y+pcUhdJpwSOSLkt8jc1
   aJlBskSeKPcwH7wWZSQUm1XU4YExnYDlPAyXP+edq7oHBsGaEjxitQtZ7
   g==;
X-CSE-ConnectionGUID: Twk6Ey4bRdeRZNkRApPymA==
X-CSE-MsgGUID: FdRKjjDxTWm/ejr26MgcXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="202340819"
X-IronPort-AV: E=Sophos;i="6.18,291,1751209200"; 
   d="scan'208";a="202340819"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 10:29:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 938E61002B98
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:29:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 505A78DB0ED
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:29:09 +0000 (UTC)
Received: from zhengrq-VirtualBox.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 8BC33100008B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:29:07 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][oe][meta-oe][PATCH] freeradius: Fix the multilib config
Date: Thu, 25 Sep 2025 09:28:56 +0800
Message-Id: <20250925012856.27256-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119847

When enabling multilib with lib32, the radiusd will use etc file for lib32 as default

  #systemctl status radiusd
  ......
   /usr/sbin/radiusd -d /etc/lib32-raddb

It should be lib64 as default.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.2.7.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
index 181d9e5d18..ef98d7285d 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
@@ -210,12 +210,12 @@ pkg_postinst:${PN} () {
         # for radiusd.service with multilib
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
             install -d ${sysconfdir}/sysconfig
-            echo "MLPREFIX=${MLPREFIX}" > ${sysconfdir}/sysconfig/radiusd
+            echo "MLPREFIX=" > ${sysconfdir}/sysconfig/radiusd
         fi
     else
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
             install -d $D${sysconfdir}/sysconfig
-            echo "MLPREFIX=${MLPREFIX}" > $D${sysconfdir}/sysconfig/radiusd
+            echo "MLPREFIX=" > $D${sysconfdir}/sysconfig/radiusd
         fi
     fi
 }
-- 
2.43.0


