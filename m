Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F866CAC5A2
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15429.1758015739814763187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mbAPQp58;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015743; x=1789551743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CRlJQ/IiZO+PwFvyA/xHifkAPADrvLuuKyk8G0WaW7g=;
  b=mbAPQp58ioh7ZaZBoHUN2iwfSinUGUGahLn8x/D1gziTZx5nIhhfH+QD
   CHHQyOftLnl3BkzgriJ05NagvaqQA5FtZvDkd/xleSKgh0Nzvz31jmx68
   qurSJA6sBQ+zyNN+BmUmpj6jFz8YmF6iF2qM8U/EKVccHQeXbJt9xxCrX
   MbTOe/rjX4HdKqec8JjBJWh14plbk1opeHcTCJl6BEibvkNhQSyFij2w4
   OnC3H/H1zIq62EpCP3ndaTOhyC0c9W9HnSGLgoIy8Xh0YYKynoeYQsG+N
   A3Oc4XuS1dhubLRSlkdPuDKUz3YAC8SzOf5E+sL6xbyWG1L0X+o/xrFbJ
   Q==;
X-CSE-ConnectionGUID: LIoGcLwuRqqx6mrdoG40Hw==
X-CSE-MsgGUID: x4Y96p0qQjmESGSYYbQc3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200384978"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200384978"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4855E1000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F2EBC1800EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:22 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 422991003113;
	Tue, 16 Sep 2025 09:42:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D570A1A0086;
	Tue, 16 Sep 2025 17:42:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/42] xterm: upgrade 401 -> 402
Date: Tue, 16 Sep 2025 17:41:52 +0800
Message-ID: <20250916094152.1479-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119464

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_401.bb => xterm_402.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_401.bb => xterm_402.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_401.bb b/meta-oe/recipes-graphics/xorg-app/xterm_402.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_401.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_402.bb
index 3543eff33c..65e1295575 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_401.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_402.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=170620b648626a9705
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a"
+SRC_URI[sha256sum] = "5260c5793cd564c69e53ef6f528c00af066ae67b42d02137fb7ef8fafe70bb7a"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


