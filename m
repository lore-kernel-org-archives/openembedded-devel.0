Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB54CCCFA0D
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 02:51:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6347.1762397469129257627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 18:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iYpmx3xk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762397469; x=1793933469;
  h=from:to:subject:date:message-id;
  bh=KmbcRyq5+Ipw/u4dN4PXCt6UaPiDY0P/Cv1LtGrNxF0=;
  b=iYpmx3xk8Y3RNglx9kkY138VB2kmL/G7LEGcz0+opg7uCbTBeW61dW8Q
   EPg5yIhqJVhqAp+jkzcZvB40hG+iiiiRTsyz22q58tfaTfc/vh+Y69oZF
   J3nBb/cbSAM6t0Tezf55zGuHNeHr+cBB+e/LqQLrtWuYqNZAzJqALcFal
   krSe2GrmO240H6GiD6WDioX2Zv5EFT114Dz51edHkuOafc+wQ2FzBPbKJ
   gSfIpcZpvNShwDRJSsZhupO2g5x8BFBIWnUB26y+Cu64Cqps40w6qo6jW
   TCxY0HvjgFqP1mFQFdzN/bgiJOskDs8IwlE0+yWg11tV7VDjWji5F+uBM
   A==;
X-CSE-ConnectionGUID: EmRhV/SpQ1O+koQjfgVw+g==
X-CSE-MsgGUID: NwhmZBj6RhOqHMA0HbxWFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218261423"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218261423"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 11:51:07 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2FB6410001EE
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Nov 2025 02:51:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E3F21C026EB
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Nov 2025 02:51:06 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id F347E14000D0
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Nov 2025 02:51:04 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] xterm: fix conflict between multilibs
Date: Thu,  6 Nov 2025 10:50:57 +0800
Message-Id: <20251106025057.2979-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 02:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121354

Don't specify the program-transform-name to prevent conflict error as following:
Error: Transaction test error:
  file /usr/bin/koi8rxterm conflicts between attempted installs of lib32-xterm-403-r0.core2_32 and xterm-403-r0.x86_64_v3
  file /usr/bin/resize.xterm conflicts between attempted installs of lib32-xterm-403-r0.core2_32 and xterm-403-r0.x86_64_v3
  file /usr/bin/uxterm conflicts between attempted installs of lib32-xterm-403-r0.core2_32 and xterm-403-r0.x86_64_v3
  file /usr/bin/xterm conflicts between attempted installs of lib32-xterm-403-r0.core2_32 and xterm-403-r0.x86_64_v3
  file /usr/share/applications/uxterm.desktop conflicts between attempted installs of lib32-xterm-403-r0.core2_32 and xterm-403-r0.x86_64_v3
  file /usr/share/applications/xterm.desktop conflicts between attempted installs of lib32-xterm-403-r0.core2_32 and xterm-403-r0.x86_64_v3

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_403.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_403.bb b/meta-oe/recipes-graphics/xorg-app/xterm_403.bb
index db59b10a15..a6f2b55336 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_403.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_403.bb
@@ -22,6 +22,7 @@ EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --disable-rpath-hack \
                  --disable-setuid \
                  --with-app-defaults=${datadir}/X11/app-defaults \
+                 --program-transform-name= \
                  "
 
 B = "${S}"
-- 
2.43.0


