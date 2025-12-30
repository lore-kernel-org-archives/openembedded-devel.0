Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A04E94113
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 06:10:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59625.1767075039729605133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 22:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=msqcTlYy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767075040; x=1798611040;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ful30s7bitGivEmigawByHe1/tyZj3avmZ5MNEBDB8E=;
  b=msqcTlYy0p+9sUmYO1GUwTfsp+Hce7fQlHPFFccq15SU1N7qBEOBrzve
   X6te1c6irxFEyeMlmnfwMFlnmhjuuTL9WNjUACscwc7I7DCg1jlI3Yg/p
   nuErqjBWczxArrFVI4CZU4kqfv2G5nDUwQ9wNL4/BnogDa/IrludhIOAk
   +RgqMZjYzcMcQ8cCIwu5qupHBrEmv0D1fPyJj9tJptr5TMloVxgoQpzEL
   Gqm2HTpjJqcVafH8B1DfqHybElIQCXcTHuBD4H/ezFHGQtmGTm9Dx6y5T
   ybjhaerX/oAxhcmANO93ngYGzPut11cPX5n2XjXS3X1E+fcrvJ26YAV/7
   w==;
X-CSE-ConnectionGUID: vxNKgAhYReuoJODbEmTaDQ==
X-CSE-MsgGUID: dpkpLAinTc2GILYC/3EMhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="212887324"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="212887324"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:10:38 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F417A82040B
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AD2891800257
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6F03E829EE7
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 1/3] networkmanager: upgrade 1.52.0 -> 1.52.2
Date: Tue, 30 Dec 2025 14:10:27 +0800
Message-ID: <20251230061030.4804-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123001

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{networkmanager_1.52.0.bb => networkmanager_1.52.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.52.0.bb => networkmanager_1.52.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
index 5ff452bcf7..cafc6ce3f2 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
@@ -38,14 +38,14 @@ DEPENDS:append:class-target = " bash-completion"
 inherit meson gettext update-rc.d systemd gobject-introspection update-alternatives upstream-version-is-even pkgconfig
 
 SRC_URI = " \
-    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=main;tag=${PV} \
+    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=nm-1-52;tag=${PV} \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRCREV = "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
+SRCREV = "57a409441bef013f636ac8e72836c19ecb27c1b9"
 
 
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
-- 
2.43.0


