Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE826EA796E
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14209.1770268504335094937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WpPo/ONP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268505; x=1801804505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dCVcNKs7mUdWSdocP+0oiPwcz9XjKUyLvcGn6+FFRi0=;
  b=WpPo/ONPLt6u2eLavdJnY1xdCXdA9j6cSmUW8ZfE31qc9wW0RyuzmvPu
   1IBM9FyoEzGoVDmAqRnGs+5rj4P2obzq8oFuS37mbx/Ud9/4Ji808vztf
   OyEKp71XB75xrj+ZKyU/u0MZLomv8YdJuXzsLOzOIULBZSEkjP8XL8Bns
   kagwbA8G0eUznm0GfcHDLzXCYV+cYjNbEzIYg1MVBa1ng2KJ8idnbDuQ/
   /+1uA76fFfFdG5ftAZB1CgcraJ5udNjkR6g9CPucSLWp7MF8BdxHyUYow
   iz1ehQlhS3yTKR0g1pe4guSb8teU4wPqM4tJwbklnRaJjKBFjB3/yGWCc
   Q==;
X-CSE-ConnectionGUID: 25nPFHXMTWK6GiDeurSW5g==
X-CSE-MsgGUID: XC4KL5gWQC+Igw9cjweYAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228591615"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228591615"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 70CC12BBF
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:02 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1D6CC1C002E1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 870ED20000C1;
	Thu,  5 Feb 2026 05:14:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/24] gvfs: upgrade 1.58.0 -> 1.58.1
Date: Thu,  5 Feb 2026 13:14:12 +0800
Message-ID: <20260205051435.1366-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124154

From: Wang Mingyu <wangmy@fujitsu.com>

Major changes in 1.58.1
=======================
* cdda: Fix duration of last track for some media
* build: Fix build when google option is disabled
* Fix various memory leaks
* Some other fixes
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.0.bb => gvfs_1.58.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.0.bb => gvfs_1.58.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
index d0dbd55f1b..6dfed59d86 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "dd9be36873d0fcb309eb89a8d274770ce576287628a2cf111bd387e1c34f182f"
+SRC_URI[archive.sha256sum] = "fc537d6bbab1ffa76972df7d4a1819b0c0fe19ebd1dfe82421d1f32e14b5dc3b"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.43.0


