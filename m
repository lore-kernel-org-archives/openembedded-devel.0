Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8C9C83F18
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.56129.1751879228940391649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gaz+ws5h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879230; x=1783415230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GHr5FHmiQOyvQH8+4Cgb7BdgErLCDn5EKHT/QeYzLcI=;
  b=Gaz+ws5hkZ55+mPJhhUg2Bva3SYK0qatQEyaubLl90f3f73MmyOzTrFY
   qHua8fZOvB4foOWJkvInrj3n+lJP8ll4iROZGvYuttXvYq6fwCUaD76iC
   AdlO4/PQHGsVYUK+xsjoRc6k6hequ103Rn5nwQFmm34fk1pGxUBJ7P83t
   RHwigneVMHS9abX+534yi4N7nIAOejpEU0QemyQKAISBPPL6kJ8vBs59f
   +3nFVcifFwkrANgbVUnTI+mHJdY2CwVkrecBMS5hMpuRWEwLt06jPxKJM
   ac5qKkYO73rpOCThdJ6Vq1uvUgkOxdQMOtiVCh1IdFC1CQc/xkdHDudoR
   A==;
X-CSE-ConnectionGUID: fH8hZek4RDOB2x0inizuEA==
X-CSE-MsgGUID: tfZ1r2c0TMCzXklayPFbng==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205437827"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205437827"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D33FE1C1C700
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:09 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 54D738D65F0
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ADF10261519
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:07 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E67D51A000B;
	Mon,  7 Jul 2025 17:07:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/35] ghex: upgrade 46.2 -> 46.3
Date: Mon,  7 Jul 2025 17:06:26 +0800
Message-ID: <20250707090656.1216-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118251

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- appwin: Put each window in its own group
- widget: improve pointer accuracy on recent versions of GTK
- Fix erroneous error message when writing empty files
- ci: Do not explicitly define tarball-artifact-path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/ghex/{ghex_46.2.bb => ghex_46.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/ghex/{ghex_46.2.bb => ghex_46.3.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb b/meta-gnome/recipes-gnome/ghex/ghex_46.3.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
rename to meta-gnome/recipes-gnome/ghex/ghex_46.3.bb
index f29ddbb6fd..0185090beb 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.3.bb
@@ -16,7 +16,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-introspection vala gi-docgen
 
-SRC_URI[archive.sha256sum] = "a8f276a36397a70d20b862ff7c664243d9cf2891deb9be06d745a4f1ac661f31"
+SRC_URI[archive.sha256sum] = "ea16595dfba0a97b55dd106305d56ba2baee95de0b13b75e75966cc31f9b3ec9"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.43.0


