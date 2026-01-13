Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFDED29DF0
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:17:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55107.1768295866826748626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q5ARnwR4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768295866; x=1799831866;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VaNekutnINPL6DGdWOSeP1xbd7zSfMjMn0n5DAdffac=;
  b=q5ARnwR4mCEaMC4jf8YZIIfYpZWKJmOcRnPfqCzWUWGMz5PyzDgrD32H
   DaYQ7O/2wfHOvMoBXNIBUROeiwo/dOBibdY0lTApoyRdKRV+i2LoXSqVD
   fFNmemsn7PUUBsFTQJ0+08QV4aef0fnS5MIzgj/E9WBk3J7O7/Dxt3Tso
   4qNRRzUhZyeRX/TTxVy9ExMFUkinaOHNIRy+FozMPccxyoE75UYnFlA6A
   HOfCIe++T+59FtMInT03fsOAVvhwrXB28l9rkByOv+m5dSt2HOncJc7nN
   qk9njA0MceALXLhdilMvqelnakzeuQiVyeux+waefsngpOR2dHKKYPc9i
   g==;
X-CSE-ConnectionGUID: hwpN8VJPQ9iUdcxmAn9RxQ==
X-CSE-MsgGUID: giviJKWxSZGzJfuYbtIXlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="226259921"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="226259921"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:17:45 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2C59B2B87
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:17:45 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E229E1802AEC
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:17:44 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8DCD8826FFB
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:17:42 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2] xdg-user-dirs: upgrade 0.18 -> 0.19
Date: Tue, 13 Jan 2026 17:17:38 +0800
Message-ID: <20260113091738.8594-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Features: * Add a systemd service to run xdg-user-dirs-update * Add initial Meson buildsystem support
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123403

Bugfixes:
 * Fix autopoint invocation

Miscellaneous:
 * Updated translations
 * Update automake boilerplate
 * Update information in README

2. Add pkgconfig to solvo following configure error:
  ../sources/xdg-user-dirs-0.19/configure: line 9319: syntax error near unexpected token `systemd,'
  ../sources/xdg-user-dirs-0.19/configure: line 9319: `PKG_CHECK_EXISTS(systemd,'

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


