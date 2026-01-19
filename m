Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA0FCCF2C9
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:46:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31740.1768812360028768669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jjzEqW5i;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768812360; x=1800348360;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ljb4nGuHd8NilSC8EvfzqRK8vqectPppZTCxzAg+g0k=;
  b=jjzEqW5igklbBulYaLH8mPpUV9lRpNeaPrJada97XmAY92gu06kQP8Mw
   YpyX2xtvuOYkDW6G/85zdFlRU+AmjNZC7DM+zp1nx+wEI0FZhG4pmPXhP
   rp7a+wRFAwZquUv497cQI1EBbn2nJTPyJYvOVWbu5RSVETXmMnb4MR7ts
   YVX89ML5uat+/+Rhdvhsoybb7vB468VtLscqb9Ab51+HBz8shhIAcKr7P
   /COoLpDqz5yaoWpwv3vf8RR/wNke5e2L536U5+emu1KmeAQL176OH3E+Y
   +nihYJKYgzSvColzVDS/GRYIll2r0tFGd9xSMHXQoJ3fL1ysr5iLHog8f
   w==;
X-CSE-ConnectionGUID: bn4jY/DGRlWo2IK9R42USQ==
X-CSE-MsgGUID: BKJA+nrHREKuky3w5TvsBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="205242182"
X-IronPort-AV: E=Sophos;i="6.21,237,1763391600"; 
   d="scan'208";a="205242182"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 17:45:58 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 661FC42A31E
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:45:58 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 19A05C00D51
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:45:58 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id B06E5200020B
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:45:55 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH] blueprint-compiler: upgrade 0.18.0 -> 0.19.0
Date: Mon, 19 Jan 2026 16:44:28 +0800
Message-ID: <20260119084428.16190-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123624

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...lueprint-compiler_0.18.0.bb => blueprint-compiler_0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/blueprint-compiler/{blueprint-compiler_0.18.0.bb => blueprint-compiler_0.19.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb b/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
rename to meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
index 8980d7199c..71f9c2b52d 100644
--- a/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main"
-SRCREV = "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
+SRCREV = "de8e15f7791bd6243279cef1efc27edf4cb93674"
 
 inherit meson pkgconfig
 
-- 
2.43.0


