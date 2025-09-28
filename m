Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F7CCAC5BD
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 02:05:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.25004.1759025103952550138
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 19:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iVaRFMkI;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759025104; x=1790561104;
  h=from:to:subject:date:message-id;
  bh=i0sMfUQv+6vnWnZPbxHbGE+xFJaUtL+/FcRKty2iOno=;
  b=iVaRFMkIWM8aJv5Gkm56Kd+XZuIoSRxolWpLEr1l+CyFN0xPCdJRekb7
   AqOV52dLRUSvij/NqYASCNH4abzw+GY0i8XkX7bn6sF9sdUaQyjsh9KM1
   uw6GfiHeZHlpXSUnoDPI727YlJdqa5wH1i0vYXP8A6V8fVsdaX/Vc1rIj
   mgkg6DHZWg6nhD6f7AVckCtDlH9BvrEMsW+n6caWKbMCCMYnPFJAA3nif
   I4o0al3ur7NP563IlTNZOwgZQ9Cv2XNL9SM3P4WXhUODgUAMb3N9m3TO+
   s5aprWlBv23XxaNdksDW76G/vKTVGsZFdzjj8AA/YpBvY8xXyT2M6jE9+
   A==;
X-CSE-ConnectionGUID: nODoAdjDTHqnB9o+i8ezqQ==
X-CSE-MsgGUID: ZMOLQ8tnSh27x/pzID3MNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="193066333"
X-IronPort-AV: E=Sophos;i="6.18,298,1751209200"; 
   d="scan'208";a="193066333"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 11:05:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 16EEA488
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 02:05:02 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C39D418009E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 02:05:01 +0000 (UTC)
Received: from zhengrq-VirtualBox.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id E476E404301
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 02:04:59 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][oe][meta-oe][walnascar][PATCH] freeradius: Fix the multilib config
Date: Sun, 28 Sep 2025 10:04:42 +0800
Message-Id: <20250928020442.2361-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 02:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119997

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


