Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828B1C87FCC
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4287.1753153990949255309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NDGXFif0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153991; x=1784689991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oMuPc/mG83XDE6QmkV60mwz1f0H08gSIexiMJjY7/a0=;
  b=NDGXFif0jzjNGOpfdW2Yh5r/HUOdIIJ3KXE9wgRzFiqpjjVzjy8RtWy+
   T4zivx2l+NGMq1t3bidS2c21PDJq30wWy1w1N11q+tNGPKwFYedLWTm7D
   9QpzsdCbFuLjfTjq4p/S+VCizfwoimRLrhfV5dbwiZtnkncFQNryySeub
   wCIWEtg/Veb2IaeAcjWPeFLRr08sSGP5LgZnJZ4ypJBwPe03SdFI11QM5
   8sId+Cm8aHUL3Wx4s/f3uIi+HMJtNTlZ6lQ2+fiWKHyO5J/PBHgflgBTa
   xhKyw7G769D3xJlNA3ojbGXl/hBQIxm5f0BXThyFPmpUFuT7MCKAlVMGO
   w==;
X-CSE-ConnectionGUID: xfII0GNiRw6MMEzLz3yz3g==
X-CSE-MsgGUID: BM7Sv80aQDi5ERZNndeR+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="207510939"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="207510939"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 85D0EC0034C
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 02D28C0074B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 119F11A0073;
	Tue, 22 Jul 2025 11:13:06 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-gnome] [PATCH 18/21] zenity: upgrade 4.0.3 -> 4.1.99
Date: Tue, 22 Jul 2025 11:12:26 +0800
Message-ID: <20250722031245.884-18-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118681

Changelog:
==========
- Update Brazilian Portuguese translation
- feat(progress): support markup on label update STDIN
- progress: Properly setup custom ok/cancel labels
- test: Add test for custom ok/cancel buttons
- color: Properly support custom ok/cancel labels

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_4.0.3.bb => zenity_4.1.99.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_4.0.3.bb => zenity_4.1.99.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_4.0.3.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.1.99.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/zenity/zenity_4.0.3.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_4.1.99.bb
index 058ae7bb6c..350c66b626 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_4.0.3.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.1.99.bb
@@ -18,7 +18,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 GTKIC_VERSION = "4"
 
-SRC_URI[archive.sha256sum] = "b429d97b87bd9ce7fb72ac0b78df534725d8ad39817ddca6a4ca2ee5381b08de"
+SRC_URI[archive.sha256sum] = "6fe2aa313c71e91ffa55b11dbec7904f31a40303e0a3f6016820ff6dee329ee2"
 
 PACKAGECONFIG ?= "webkitgtk"
 PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
-- 
2.43.0


