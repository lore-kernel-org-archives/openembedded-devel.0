Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC9BCAC5A8
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15423.1758015724862104256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fWbue+rj;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015725; x=1789551725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MXkQ8izNCEQPZV7sk/5XRslSHMx/EFJksF22d7a3khk=;
  b=fWbue+rjskBtxNThqxzCKShxgP3eslHt4UtLXgRU0bgy4keWHSDjYxd0
   euJVhdUSvFJ9VK8kIhYgS+JA/mDgKAdtiMat1HIclS7hdFB6/kZLgufsI
   39EZiNidXYuDoRJELzdCj4DF6YiceeoS/LsyesrcbZsWJJv9Ons4+QN2U
   URDs6TBhM3D6tPibYI8oXcoqyACZD/iafZAJgUEE5v2yyVa6/Q+Nme4cZ
   VynWJOUGckdTTkJNWUheUku1CHTfF+jH1lZmAAainq5rhr3VBue9nyZlY
   AGff7ARUkZAd2Gsa7qRueP3LbQ5k22DTn5NLUkUGkCKPivA/hwy0VFeZa
   g==;
X-CSE-ConnectionGUID: fFxqP3qkRPW5lyvWzNBk5Q==
X-CSE-MsgGUID: eRPa9CikRceOr59gey6J3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200384932"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200384932"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:03 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 238571446
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D2258180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 2A2A54029A0;
	Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 38CDE1A008D;
	Tue, 16 Sep 2025 17:41:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/42] gvfs: upgrade 1.57.2 -> 1.58.0
Date: Tue, 16 Sep 2025 17:41:17 +0800
Message-ID: <20250916094152.1479-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119430

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.57.2.bb => gvfs_1.58.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.57.2.bb => gvfs_1.58.0.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.57.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.57.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
index 72afefb275..d0dbd55f1b 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.57.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "f16bef8eca1fd6c117e85db011d21e915669790d55867349c5f1b291299e9585"
+SRC_URI[archive.sha256sum] = "dd9be36873d0fcb309eb89a8d274770ce576287628a2cf111bd387e1c34f182f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.43.0


