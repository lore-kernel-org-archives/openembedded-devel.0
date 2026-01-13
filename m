Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E93FD29DEF
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:12:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55029.1768295520913793698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=INXBvypp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768295521; x=1799831521;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=whr6+CbrJMI3Y5CaOZIG70pIwqfZKlazIyX+sVmLXV8=;
  b=INXBvyppfMiLYFizt/fBzrgEP+UGXhYdvx4wW5HS4I2oPzIG1HxgssJp
   XL+drdI+o4+OIsq4dk9RaMH0jr+Lpo29fI8LbOJqgF024mQR0UyieV9EE
   WKUaQHRAx+RXVc7kFNq29IqX6vODDxATuSyTkqJls/EUYDzgx3iMVBjeQ
   rnTrpFtmGL0MYJtzpXJ/aLcTsVPGfupA8K3ejy+kW96dbLwNRNZu5QxKw
   BQE15dR4t5bZvow4gVtk6nTnvvXfh2qJal3zL5/I4Qm83MC+ajG/LQGEQ
   44pn0UzujO0ALz1rZeNOxfjSQfMJqxP/Nuy1j0V3sjVCo+i9BkMw8BYKS
   Q==;
X-CSE-ConnectionGUID: EaZWDYM+RMa1aRyASXK+zA==
X-CSE-MsgGUID: eZtJM5PpR86EO6U/0AyP0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213054196"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213054196"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:11:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 273C9C006EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:11:59 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D0D238D65C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:11:58 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A785310003A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:11:56 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] xdg-user-dirs: upgrade 0.18 -> 0.19
Date: Tue, 13 Jan 2026 17:11:45 +0800
Message-ID: <20260113091145.8577-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Released: 2025-09-20
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123402

Features:
 * Add a systemd service to run xdg-user-dirs-update
 * Add initial Meson buildsystem support

Bugfixes:
 * Fix autopoint invocation

Miscellaneous:
 * Updated translations
 * Update automake boilerplate
 * Update information in README

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{xdg-user-dirs_0.18.bb => xdg-user-dirs_0.19.bb}      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/xdg-user-dirs/{xdg-user-dirs_0.18.bb => xdg-user-dirs_0.19.bb} (68%)

diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
similarity index 68%
rename from meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
rename to meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
index 84fc9e2f18..6b24076d79 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "xdg-user-dirs is a tool to help manage user directories like the
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ec6f06d7495cdba37a732039f9b5e1578bcb296576fde0da40edb2f52220df3c"
+SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "e92deb929c10d4b29329397af8a2585101247f7e6177ac6f1d28e82130ed8c19"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 EXTRA_OECONF = "--disable-documentation"
 
@@ -13,3 +13,5 @@ CONFFILES:${PN} += " \
     ${sysconfdir}/xdg/user-dirs.conf \
     ${sysconfdir}/xdg/user-dirs.defaults \
 "
+
+FILES:${PN} += "${systemd_unitdir}/user/xdg-user-dirs.service"
-- 
2.43.0


