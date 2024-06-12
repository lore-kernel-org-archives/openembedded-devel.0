Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1493DC27C79
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2493.1718161130528599590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RVSkt5+U;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161135; x=1749697135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qhPxTMicf8vNjuC23WT0zSLRMW7HxP9VTomGl2Kn9kc=;
  b=RVSkt5+Usy79fEJuNcJVFMKys5l4g3mValIqSAseb27lSU12fFcy8onz
   y5UjtKcxxT0hzlrHa8P4rTkVjyexX0pKcHF+eRMrHyKYYVDIh1dHA5kxT
   KBbi2NVXlw1JaK24+jwVGLhRPGEGc6PRormVtgw9mtaiggE8LTR1uqojt
   7fKLN/qGpTen96F2CY736onpLMXqA3vhn4zAO0as9XMShl/zcRALHwTGt
   MnE32AijqT4dg52ZVZU1cBBRubE+RTRIX1ueUqJ+02/n/iD5subuEz2cu
   unO9HfiNA1tun9Ft4y21LUwQ8GYktAr541eNz8+H5xR5HzD1nkw+dUm68
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141617836"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141617836"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 984AADB3BF
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7984D3F0E
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C3D8E290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF37D1A0002;
	Wed, 12 Jun 2024 10:58:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/43] remmina: upgrade 1.4.34 -> 1.4.35
Date: Wed, 12 Jun 2024 10:58:11 +0800
Message-Id: <1718161096-29710-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--2.469000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRKQwoh2tHYiTLk
	8G2qhCWTiLgNYoWtEg634XYEvNxOgAMWCgdCzp+aWOE/a/LT3OjKrKWVfpQki+EDha0Az3zpg0b
	mm56LQ6RfrgqNHWErOg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxSsGH
	K/YO0c/+LzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUSXEIh/J23/YG2l6Q13QoHH1TI
	rFvFJJsP5Pn3le3ZpGpRrb1t0L5Lye1xApByFqazYlRgWLoKl0hlpLV0gi/m4rV53bgEKh97H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix build for openssl-1.1
* Allow running an SSH command when connecting via ssh tunnel
* Check if WINPR_ASSERT is defined
* [REM-3047] fix issue compiling with gcc-14
* Fix crash caused by enabling disablepasswordstoring
* Revert setting loadbalanceinfo to the old method used before FreeRDP3
* updated call to set FreeRDP_LoadBalanceInfo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.34.bb => remmina_1.4.35.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.34.bb => remmina_1.4.35.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb b/meta-oe/recipes-support/remmina/remmina_1.4.35.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.34.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.35.bb
index 921d34d9f..0cad52df3 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.35.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "75a0bdb795d99e052690178ae0d81ebdbd2cbdd3"
+SRCREV = "2a455eadd6462457d08c2d066c5c245e0dee3bf9"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


