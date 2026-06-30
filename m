Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98651C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16842.1782811339351326578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XWudjjxn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811339; x=1814347339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x83unApD0raOvMTeD4ztfns25fk0N8RxH6+XJSvA7Vs=;
  b=XWudjjxn8gkZoiZiBe47CpRi4TaXvxUl401HjLHVODPiT3mMsfudXvrs
   6ubmGUpgAZJr4ZKCg2CJQaWoh0+GL+gYK+C38gt0hQch3sXOSIrrmxfUx
   +94iKDDdbYEDCoNvrxdTr0drJ4lekw9LLp9ca/56AsiphfnzIF/SoXTsF
   2tqIk7OCyEUsBO404h+1TgIFkczVvqSpnDjnIX56tA/omSqIKW771FYHg
   iiYlolzl/LT8fX+q7NXSPlFj3OkgzMc63XyVCNrfvv/kfLqVzeUvvd85y
   47fJSPNcpVT2QAFdgRIaHiAkZGT2HHOHTpwbI7qqkmjIERVuQBfR9kswx
   Q==;
X-CSE-ConnectionGUID: SMuexjU4QlahuVa7UdCS7Q==
X-CSE-MsgGUID: GONGRPUXRmCC5tkvu6fhVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245262283"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245262283"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:17 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8DBB11C000A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:17 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D4C31C00147
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6EE8582DDC6;
	Tue, 30 Jun 2026 09:22:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/37] gvfs: upgrade 1.60.0 -> 1.60.1
Date: Tue, 30 Jun 2026 17:21:33 +0800
Message-ID: <20260630092206.322-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127947

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* smb: Fix authentication fallback broken with Samba 4.24
* dav: Fix redirect handling to prevent HTTPS downgrade and credential leakage
* Some other fixes
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.60.0.bb => gvfs_1.60.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.0.bb => gvfs_1.60.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
index 2fda7cff75..7dca3cd3b9 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "648273f069e92c7e3c013b92148e82c901f08044e2b3b14c6cfbd52269f6b646"
+SRC_URI[archive.sha256sum] = "90eaba333ab7d31a7fdeade45954a513c3661ccebbd9a138aab3fb481dfb9e40"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.43.0


