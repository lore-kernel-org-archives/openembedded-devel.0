Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BBBCD13DD
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 15:46:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.7632.1725119169641979638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 08:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DExBFlBI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47VFk80W003536;
	Sat, 31 Aug 2024 10:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725119168;
	bh=8TlBT3es3E5URmyDlJQOIszf6Zv/pejSZpdD6c7BIRg=;
	h=From:To:Subject:Date;
	b=DExBFlBIGzLwxIOEoXc2WrRcq1/oR8RRqezlOyG9dyPTbY2cFOHxXDBiQ6v38VYu2
	 Pukp7XRXQxkgWQxZ9+heIm6fcX5S9J6hP5r6UAgFOtsDc/tBd5JX6Ikxa0oUatb2GI
	 JVXqtr6AAAmxmeI/jnEdT3MaBy/NN9pCoI5I+fWM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47VFk8gF003838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 31 Aug 2024 10:46:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 31
 Aug 2024 10:46:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 31 Aug 2024 10:46:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47VFk8DQ099431;
	Sat, 31 Aug 2024 10:46:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1skQIi-00030T-8p; Sat, 31 Aug 2024 10:46:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mpv: Fix typo in x11 option
Date: Sat, 31 Aug 2024 10:46:08 -0500
Message-ID: <20240831154608.11517-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 15:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112061

Fixing the spelling of disabled for the x11 option.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
index e9384e88d..80e0f7ca7 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
 
-PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=diabled,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
 PACKAGECONFIG[xv] = "-Dxv=enabled,-Dxv=disabled,libxv"
 PACKAGECONFIG[opengl] = "-Dgl=enabled,-Dgl=disabled,virtual/libgl"
 PACKAGECONFIG[egl] = "-Degl=enabled,-Degl-disabled,virtual/egl"
-- 
2.17.1


