Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02358ED7B9A
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15848.1776163159987250872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H3cvmIDg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163161; x=1807699161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=egfanh1UEXWLEWyX1+vAllSzREwrrXbwaJ9WoCSeiR0=;
  b=H3cvmIDg+E5eI9QemY+8kPYdwohdqSNRushIS0o9JLmIxYS2PpU014ws
   LpE5STvJ4gkRUjJMBrEslgrJKB8LdSSJ291Tin4QQ87IWh36g2jmR4zbD
   I9wYis33wQAykKzV4dCKfU1vw3+YrhxE9fL4w3IkDKGKrtK4Z3KPIoZCw
   tSm4BidryE/dQGsVRBEfICEEP0PTbmb5qRy50pE+gV5BUYPJXkGsEHNuX
   rybc22sZaOIh9zoKUaj58UaxesPMurJvv66cgHX10ldKfjKovLoVXFDER
   wKT6aEpKsrr3cS+uJz4ZtmUerEvuGnfhUzRcZoLdrNSfM7Lasex+4gNcZ
   Q==;
X-CSE-ConnectionGUID: Q7hQ8lBBQPe1/wEuUBeSfA==
X-CSE-MsgGUID: qgBy9ttGRn63h+sENcEqFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236851607"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236851607"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3A45F1C1C71D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:18 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E86318D65F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6FF5414000EC;
	Tue, 14 Apr 2026 10:39:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/32] babl: upgrade 0.1.124 -> 0.1.126
Date: Tue, 14 Apr 2026 18:38:16 +0800
Message-ID: <20260414103845.1728-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126307

From: Wang Mingyu <wangmy@fujitsu.com>

It is now possible to build with MSVC.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.124.bb => babl_0.1.126.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.124.bb => babl_0.1.126.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.124.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.126.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.124.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.126.bb
index b1e9d96b79..10e2c482a5 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.124.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.126.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "1b0d544ab6f409f2b1b5f677226272d1e8c6d373f2f453ee870bfc7e5dd4f1b1"
+SRC_URI[sha256sum] = "3f090f4b2a61fecf7c8dc60a5804bbc77cefd8d778af2ded059f0e367a52930e"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


