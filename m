Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B01EFD22A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42042.1772012286494091791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UbCYAMmQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012285; x=1803548285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lJ5SzuOv8wfHNC8DluLg3TtbKmZresMlD7G/xXSSqeo=;
  b=UbCYAMmQrAZLf09VOyZTtU/r6VDyTPH05++/XM+oQAWnssLr05ejO7d+
   gy3tPnF1gSjdqzxD2STgUVTcUFwk+VTIQ3auuL/BvPl9cRVJSTlpbGd94
   T6Z7Ebb98M9NQpyW2giY5jBs6SSk5XCBv3WKzJ46FWBIBRe/ys7PvI0b0
   3FhG/s1C3pN7BBfDWrpir4NKVY3sPsVrsaG8iBFMjolNmHJBW4pwRXIfJ
   t7ZnuoKAmuEerbx8SLUSpajqVKNJ98Li7yVAeql97V17atsiCpqjdbsFn
   SINEJYx8wY7uFN7zI9Pfqqw4ex+1wYY0wivIxTJ9qUhzfWBJiK39s/6o5
   Q==;
X-CSE-ConnectionGUID: 7+3zg4JvTA+u1Ig1UGVnZQ==
X-CSE-MsgGUID: Wiq3WjMESmCXaf1SHUPSHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230948647"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230948647"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id EC701100036D
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8DDDE1800097
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AA0E7101BB76;
	Wed, 25 Feb 2026 09:38:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/33] libgpiod: upgrade 2.2.2 -> 2.2.3
Date: Wed, 25 Feb 2026 17:37:09 +0800
Message-ID: <20260225093727.1284-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124627

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes:
- don't try to export the same chip object twice in gpio-manager on duplicate
  uevents
- use the "add"/"remove" uevents when watching for GPIO chips in the system as
  the "bind"/"unbind" pair is only emitted by linux for controllers which don't
  have a firmware node attached
- don't allow clearing hogs on active devices in tests
- don't install uneeded files
- fix a pkgconfig check in configure
- fix a return type check in test harness

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.3.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
index 09b0928dfa..a23d65bcaa 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d"
+SRC_URI[sha256sum] = "70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-- 
2.43.0


