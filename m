Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34676EFD228
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42041.1772012284268859672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kG41RvdI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012288; x=1803548288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FARKRQfBMC8yD1VI4/Vgx+SnDjq0XhcOwIItGEzuCv4=;
  b=kG41RvdIxW6O3qHSGFSqbKg3UKeITdDB9G4vlQtUdsDljIY7xNsV0+x/
   tL4iV6NmR2zkA9KkmTPxiihTT05X98kWaMy0VrikwqHvVnQDza7tS5O1E
   5KybKzfsJ2n2jGli0su90QOdix7jZzMt3UM7iTTBlY9ZbbGoaSwfq7Ifz
   /9UrGBSpKMBme3jFE3p4Pf6MDomz6zLgwJb/LFKB5Bm3IjgIvZeeUQauu
   2RIa8MldSG2ME25oqUb9OZrb/eKXzyeihWR5Z9lqv4Dfjtmn9fS7671t/
   tksqfhJpXdum5UwXjyUbqMYgjJXScPMow91i3XjrWb9FjWDCRYlTc1HnV
   Q==;
X-CSE-ConnectionGUID: 5/fPsAJfQeenrjls47peJQ==
X-CSE-MsgGUID: UF/C17G5QqqXivwUmy6atw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="235192635"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="235192635"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 1FF701C000A8
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C96E110003A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F2616101BB42;
	Wed, 25 Feb 2026 09:38:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 17/33] libpanel: upgrade 1.10.3 -> 1.10.4
Date: Wed, 25 Feb 2026 17:37:11 +0800
Message-ID: <20260225093727.1284-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124629

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpanel/{libpanel_1.10.3.bb => libpanel_1.10.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libpanel/{libpanel_1.10.3.bb => libpanel_1.10.4.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.3.bb b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libpanel/libpanel_1.10.3.bb
rename to meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb
index 3fc58a9593..68cff85f9e 100644
--- a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.3.bb
+++ b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
     libadwaita \
 "
 
-SRC_URI[archive.sha256sum] = "42a01baf8b94440f194ea8342b244bd6992dfb024ca3160c9477ff498ec3a2b6"
+SRC_URI[archive.sha256sum] = "593888a7691f0af8aaa6e193c9e14afa86a810c0c2f27515c6d813f18733b1cd"
 
 PACKAGECONFIG ?= ""
 #EXTRA_OEMESON += "-Ddocs=disabled"
-- 
2.43.0


