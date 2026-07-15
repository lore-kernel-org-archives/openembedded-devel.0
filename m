Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C536C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3431.1784112035952588858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j7m9iqrC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112036; x=1815648036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qDHVQPxHal2O2dOvQDPdUcUFH9GXHdScgg0jNVKW+5s=;
  b=j7m9iqrCtNRXL5GUFSYLj1t0wXZRpjNOTUn6kqh0QfI95v6jGKYdkVzU
   7tG1MkKMUAASma0jr6QRHIhV1hW5dyKNwUdRyHTw8KZbiNgSrgwNtHyJA
   nMni9/ll7kVrWao2QCDTr5c1ipJp+D69UivMLny5f3I99S9mMF2OQQh0e
   XK58SpQM0H7DTgKy7uQvYzJOpDLxqMvYy8s+wtuXyqbUh6YSMmdu07TjR
   BRprG8hKafTg4kb/JtuIkrGKgiWf+TIcXZvx0gpzRGjpeFigP0RId/Gih
   1zzmJJ/QtgSJdPiSTd7GKzsTsThCz3SMObnKfIZiWdlau8j/8MYWYJAyB
   w==;
X-CSE-ConnectionGUID: AJyKM1XZQaS1KE519rhVeQ==
X-CSE-MsgGUID: +2kTFsAwScqMihNDP/sYPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247518954"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247518954"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 537D45521
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:34 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F1C5F1C00152
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0169B1800B81;
	Wed, 15 Jul 2026 10:40:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/44] xlsatoms: upgrade 1.1.4 -> 1.1.5
Date: Wed, 15 Jul 2026 18:39:07 +0800
Message-ID: <20260715103914.2120-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128210

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2009

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xlsatoms_1.1.4.bb => xlsatoms_1.1.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsatoms_1.1.4.bb => xlsatoms_1.1.5.bb} (67%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.4.bb b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.5.bb
similarity index 67%
rename from meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.5.bb
index ad06612d5e..353ce1b42b 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.5.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xlsatoms/"
 DESCRIPTION = "Xlsatoms lists the interned atoms defined on an X11 server"
 SECTION = "x11/app"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b5c50f6b3acc044e9a0cca8b74c8eb93"
 
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "f4bfa15f56c066d326a5d5b292646708f25b9247506840b9047cd2687dcc71b7"
+SRC_URI[sha256sum] = "9ac9400328fbeffe15c9d94a90dedb90d09dcaa9d51482efabc55b33a736e317"
-- 
2.43.0


