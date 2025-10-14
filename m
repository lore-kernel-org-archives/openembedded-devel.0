Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0CDCCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11089.1760433590654704036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G0Kk3tH7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433590; x=1791969590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEHe8Qqxk6MexwCSTz2MAQHwmFKA2WpfjZgdzBZjIVc=;
  b=G0Kk3tH7SKZL48C8dYR4AWpPsegsl2yrOJw8lOsJ26ESv1D616K+5Uh2
   vgBBQmu59iNtoEx6bcFbaMWzGgl+Hjf55Y71Gu7o7wEun1YPluwGaV0kG
   QU08yDYjqK6iSo3m8APXoWPfY9RUcsJg4FbhD2L8ruVRm9JHbYvTsemFu
   x/V8xkmV3e3xFI6OmY917gcitYLNSjss/lWQUx2YNjXsbuY8IDukbqQKS
   KJXHKKMef6TP2DqOYN9eic2kKp4DU5VAL/SJgT20ZipikBiodPY20JuEV
   SgEqHV3aH1/TjDkpKAiizquUxjjnIsRvCBCyZXawWAQ2JbrJvrzxPl1Xm
   Q==;
X-CSE-ConnectionGUID: S48gVcs2QW2EhFSZUFXflg==
X-CSE-MsgGUID: Z1IaZvQIQLyr6HUJEGR1kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275658"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275658"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2D232820710
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id DC99814003AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5F045101BB7B;
	Tue, 14 Oct 2025 09:19:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/44] gegl: upgrade 0.4.62 -> 0.4.64
Date: Tue, 14 Oct 2025 17:18:49 +0800
Message-ID: <20251014091927.493-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120564

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.62.bb => gegl_0.4.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.62.bb => gegl_0.4.64.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.62.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.62.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
index 9dd9e31131..1a31f60f94 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.62.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5887576371ebf1d9e90797d10e4b9a7f1658228d4827583e79e1db3d94505c6c"
+SRC_URI[sha256sum] = "0de1c9dd22c160d5e4bdfc388d292f03447cca6258541b9a12fed783d0cf7c60"
 
 PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "librsvg"
-- 
2.43.0


