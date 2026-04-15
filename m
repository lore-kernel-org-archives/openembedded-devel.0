Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA648FA0C43
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13246.1776237553199427418
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bttwmAGa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776237553; x=1807773553;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=olz7AIiKSQYtvnXesid+trgGKL/cDe4Kr5EMY/ALbyQ=;
  b=bttwmAGavAkwfSRBBQeGSXJqf/NlZ0uGiotiZpeK4FAZ1Xij96WjSedT
   ryd74IGLEL/djldBM9InWztgzNhrFRrBYPDdjuxdJrO0uZ8zYngn0K7kD
   Zq46zo/QDLxZlRSkVK5tcoKolVxrfsnAtwDNTe38GzbtmxnjqY15I7ofO
   JQO/NjQ3MgT2lyGx8CbmPfaXFyswlSfzaPiBv1tdfpFEBkwmA5qzuBWNS
   /504mMOZbH2vU587cv7lVpj136Jvar69hKX9NATlcDxa6TXgp2XW+B0Ag
   KIlLqgVH1MAhvZ8ZKJc/ypDSIvEwysLFesavnIDB8wa/nD8U3Fkjuy9Cu
   g==;
X-CSE-ConnectionGUID: br9d+BOqRwOwRi7EgijLfg==
X-CSE-MsgGUID: v13n1Vy8SGyfrYLnWajx6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="225701270"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="225701270"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:19:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AD4361000374
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:11 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5FE6A1804151
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2ADD01800107
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] xdg-user-dirs: upgrade 0.19 -> 0.20
Date: Wed, 15 Apr 2026 15:18:59 +0800
Message-ID: <20260415071900.6767-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
References: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126349

Build system change from autotools to meson.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{xdg-user-dirs_0.19.bb => xdg-user-dirs_0.20.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/xdg-user-dirs/{xdg-user-dirs_0.19.bb => xdg-user-dirs_0.20.bb} (73%)

diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.20.bb
similarity index 73%
rename from meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
rename to meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.20.bb
index 2550d4cd59..3d122981ca 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.20.bb
@@ -3,11 +3,11 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e92deb929c10d4b29329397af8a2585101247f7e6177ac6f1d28e82130ed8c19"
+SRC_URI[sha256sum] = "b8e34286278f4fef3e1bfe9685c395ccc0eb50c14d3a2fb4953dd00fbfd3af39"
 
-inherit autotools gettext pkgconfig
+inherit meson gettext pkgconfig
 
-EXTRA_OECONF = "--disable-documentation"
+EXTRA_OEMESON = "-Ddocs=false"
 
 CONFFILES:${PN} += " \
     ${sysconfdir}/xdg/user-dirs.conf \
-- 
2.43.0


