Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07851CAC5BD
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8321.1758704443465243685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CthjpshV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704444; x=1790240444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N2WYqJZCFsXe6WP5pgyujufY28cGAViRlF7BPxhyYRE=;
  b=CthjpshV6PaWnN+bCyDiVafdXLAD+qzvqRyV/JDPSJEd6MiF7AJCub6o
   DoUtci0veebOcwgtO/QHArplJWDZ16XSNjE6ckLUQx7US1DvfNfze+0Xs
   vIP778dGv79+egSiWK9JZ3U8gRiAu8F2Pz1b52iGqIencNDBd0r3JUjly
   fPfRAiuMO5tY2+HziiQeovq+rd7VYbMIidQ2Na/5BcXqpX+zrn1QzmIm5
   hsisbzKQ1URI9fN6b/hcMX7hQjsoJxzvfqiUOpQucrkj8hUGFSV7meyPE
   E9z7roxUVU68mMn00jXol2nzmPKOptsg3If9xqxGW5NLJHmio8qffU5qc
   Q==;
X-CSE-ConnectionGUID: YU2hE06vT92ImlCrp3Y+jQ==
X-CSE-MsgGUID: XKI4WyBGT+yba4WNSwly4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213764718"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213764718"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:42 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A46661C1C717
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5E4AE8DB0F8
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id B78A120010A2;
	Wed, 24 Sep 2025 09:00:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9F561A0073;
	Wed, 24 Sep 2025 17:00:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 13/29] nautilus: upgrade 48.3 -> 49.0
Date: Wed, 24 Sep 2025 17:00:13 +0800
Message-ID: <20250924090029.1786-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119776

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_48.3.bb => nautilus_49.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_48.3.bb => nautilus_49.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_48.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.0.bb
index 790fb71a63..945e96d568 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.0.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "21a2aea005160db083c7a1d4d2c0989b845cc722c04ef9ebb60125a7ec5b393d"
+SRC_URI[archive.sha256sum] = "b3129270434fc7c533f97ed7f8c442704f00a02d27a290802d8d16ab42a16bf8"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


