Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613A7EFD22E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42050.1772012299201559288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PzHTq6PB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012306; x=1803548306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y/Dhq9xlrL3+hI0LihapZ6GP/oIGo8GDpgp2cucszbw=;
  b=PzHTq6PBN/ecucHVzQ3KnA23TISBT6RMtKdpqQNOy9XcIidWYIr2HoLP
   sXQ2JSBuQC4Ydg5D0yP6cKz53+Zn2lnK3022xdQFY+MSGDf7YReoPB/fC
   2o5ZVci3RQGU7oe1ep/FrPG/8R4fGEvfGGg9Ywk+XClOOEEvKq2+pVLL1
   w3XB/X86aX3JZyiVgQtoaUf/2tpL4cGVbD68hdeGt2m+AtUZBBb+cFC0L
   8C8wXd8QC9uTcHaGxUxd96s8fDeVVJSsQ+LSHfXcymXgdKkXrtKonR7Lu
   oJm01U7oLJ5Q7eHqeBKWJ3IUPoEBJwIYse1v8M5Mn6YGtZT3z5sGCPRi+
   g==;
X-CSE-ConnectionGUID: 3ZZSdSgPS+SqMZzcb73/pw==
X-CSE-MsgGUID: v+Rn539DSDOxrtJOHwssUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230948690"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230948690"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 5170C1C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:26 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 02E80100414A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 283D3101BB6B;
	Wed, 25 Feb 2026 09:38:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 25/33] nautilus: upgrade 49.3 -> 49.4
Date: Wed, 25 Feb 2026 17:37:19 +0800
Message-ID: <20260225093727.1284-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124637

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_49.3.bb => nautilus_49.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.3.bb => nautilus_49.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
index b6c13dedb0..9befe945df 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "aa6bf376f08992362805eae01890b1bf5ad148f356aa7ccfe1f664eda88d413e"
+SRC_URI[archive.sha256sum] = "1476d9459a63c85f0ebc18f237b32d12b008ad786002376424919725f50e76a8"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


