Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF18ED7BAA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15973.1776163195249895472
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CHz8gsVD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163194; x=1807699194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xAwV5omuRjKKTZ3F676dpqua4a3F4MT5eHRKPfmGTU8=;
  b=CHz8gsVDuRJqjEOthMGVuFOFKzAfB6NXDpxPS0D4RUZIardFedOjl5Jb
   jiOEIPEf4xnOkCCFChOQY46PWfYIae4iYvVTYgfCMbgVgsl8a9Abvhdfz
   uEgaGkhPVAxpa63+hWfomnIAv2zfn8Lit2r4nZyZJ8TEFaB5bDP/PAKIY
   n58EVJ30nqm855alm2OMH6k4VG6fzt82RL/z5h01TeybXdFhrk0PIug/U
   YJCduT4LjZmugLc3qaUOp1HU3nh9Sk6ry3wnmo0mwYfMsM3G1yA4fHDJY
   MeWi6cS5fBnOfp7x4YbTNKAbWJ9Xjep56wbZmjA+51K2XfFj6RooB9EiW
   g==;
X-CSE-ConnectionGUID: np1kV7S/QVap4DPkS/rZhg==
X-CSE-MsgGUID: PT6xDzanQP6RMEI1L82kFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236908237"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236908237"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B584C1000341
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:53 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5CE9B1807172
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C0BA314000EC;
	Tue, 14 Apr 2026 10:39:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 09/32] libgedit-gfls: upgrade 0.4.0 -> 0.4.1
Date: Tue, 14 Apr 2026 18:38:22 +0800
Message-ID: <20260414103845.1728-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126313

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a unit test on big-endian architectures.
- Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gedit/{libgedit-gfls_0.4.0.bb => libgedit-gfls_0.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gfls_0.4.0.bb => libgedit-gfls_0.4.1.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.0.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.1.bb
index 05c30a1e35..87006cc564 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 gtk+3"
 inherit gobject-introspection features_check gtk-doc gnomebase
 
 SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "b292896adfb1c371aa8db0819f4754ff3bf4a848"
+SRCREV = "ce4b836dfda4ea3f594b9ded7b60c5cb51ccbc87"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.43.0


