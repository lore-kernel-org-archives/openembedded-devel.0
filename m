Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B510C4451C
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9495.1768995196021823973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W0FYFNzC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995195; x=1800531195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VjPnqn/d4IZxg/8SzMp8Ue4nEQ5hweu9/b2o2swacWw=;
  b=W0FYFNzCwNXPPOHD5dtxasD279WIlCPktGbJ1lZV8fPxWnMG6Q4Qg8AF
   XAaAJ7uoENlpC0n0WaVX2VF7EH0B2jfj0h3X+5XZ6QYtAHLhBgLPLzqO+
   E78eyVHPNLdpmYpGd0+0mPKgDRBFgQ+xqcpsc3ZOdOopoidM7jBfufPZ7
   c2elczzUSBBuqyi0QgMNitPAw3IT2NoL+fI7Jj9px2xNnB29XrbqvOs3/
   QvaoIF57ckC4Jx3kLB+AiKGqP1cluBVBcvZAWYldY8Bv4D3BjFuXFsXX/
   v1joQ/0xtthT+3I4tE6FZRihZpST0fSccOxmOMpabW64csaZ1S1f7COzs
   Q==;
X-CSE-ConnectionGUID: 4XdC+wGIRaCRqECiQvQV9Q==
X-CSE-MsgGUID: LudCnMm5RwymBexVI9zWJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="225969533"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="225969533"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:33:13 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 952931000352
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:14 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 40BBD1C04B04
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A65EA140486C;
	Wed, 21 Jan 2026 11:33:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 28/30] gnome-text-editor: upgrade 48.3 -> 49.1
Date: Wed, 21 Jan 2026 19:29:19 +0800
Message-ID: <20260121112921.857-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123719

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-text-editor_48.3.bb => gnome-text-editor_49.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_48.3.bb => gnome-text-editor_49.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.3.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_49.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.3.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_49.1.bb
index d1ad219f10..a8dd3d5cab 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_49.1.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "3f9e9722394edb4d2145c06d69210b3d3fca5cd2b90d632643be750843d556ba"
+SRC_URI[archive.sha256sum] = "f0448f247bb5979a50c60222c44c4511880ad474e25495765e5ed2246e54dbb1"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \
-- 
2.43.0


