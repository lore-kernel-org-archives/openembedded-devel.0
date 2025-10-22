Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B652FCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4764.1761099772549638121
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pk+5ehhq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099773; x=1792635773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GmH+DM2z3/4kb4kBrYCicGw9t8VeaE6IiE/4llZS2b0=;
  b=Pk+5ehhq9NU8koYJjbmVmCbJ8pdfgbuStWZjwS2gq6sB4sugyRh+VcmS
   IiaL3zDzTvMXHgvwSpoc1QmQIjT0fH5YtgeYFaiKh1CjXGJOL4YWOqf15
   vIydjh1Jjl9FLKFRFffPhHClKClZzTcrbx5L92srzm2g8RSRXMpLhb6sd
   aWExB1Jt1QaPCAbt63uSS5VP88SaspM08G+7zbZmhIumm8Y5mJ33l/ns7
   n86BAJcTN/WTxYrPxaNYo/h3TpkrWjP+f38bxj4wvAV8wrMHXzynCq8ir
   m2eGLERH9PkUn+21elXjLK951kA8dSjomfQvuDD72Z3ElL+Z6ZArzDPQm
   w==;
X-CSE-ConnectionGUID: gtqIP8Y3QSmQOX49GY2ehQ==
X-CSE-MsgGUID: fvYt9ntHTMmL7b+ATXBURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="220331881"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="220331881"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:51 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B9D8FC0034E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 71049C02F21
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B3E4282C0DC;
	Wed, 22 Oct 2025 02:22:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 09/29] nautilus: upgrade 49.0 -> 49.1
Date: Wed, 22 Oct 2025 10:22:05 +0800
Message-ID: <20251022022227.226-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120856

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_49.0.bb => nautilus_49.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.0.bb => nautilus_49.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
index 945e96d568..b71182e3bf 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "b3129270434fc7c533f97ed7f8c442704f00a02d27a290802d8d16ab42a16bf8"
+SRC_URI[archive.sha256sum] = "add2a0e410fd22da2851ddd0c5b3d22c9e9d8c33111511f336961e3b461b535e"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


