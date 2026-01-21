Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AABC44507
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9488.1768994977949875903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t5LJfJJQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994978; x=1800530978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NOF/vZ0+/13ieVXdaJ2dA9aNjdpB5sTk+KI+uoqOna4=;
  b=t5LJfJJQe29RyHv/JjmK5hNckIc/vSXqZ5C8mU72QRRDACwRbdT2Kxnr
   d6AM8mDvo5mrXtgRwEu9o6+H8Dr8D7UAcglP7pl6b97Awd5biwtYFYHzd
   q5wQDkZqBE992bhRMTivw+dE0s+wcsh5ixcPAq4VfrClxQGHgHTHZcrIv
   mTyT0kmMMBeRNXY93YK+XiDNAdmz6IFpnOOfkbKGtOUyWGfCGU+YTkydt
   zX96J1h1n2lH+570rCCdsp/zvxVMzvmpsbxils25kH/ZZzu71oxu2UTtv
   ZBYOFdMNdWP77llUNzQyRV71bSiL45CO94T5Pn+Vfrih0JpjqgAe6CDCk
   g==;
X-CSE-ConnectionGUID: ljis/PR/QxW9zpXhpY/+pQ==
X-CSE-MsgGUID: KPYCc7TfRZ68AAo5Io2LRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="205395063"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="205395063"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:36 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3E93F4DE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:36 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EDD691802ADF
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4CBF81404866;
	Wed, 21 Jan 2026 11:29:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/30] msgraph: upgrade 0.3.3 -> 0.3.4
Date: Wed, 21 Jan 2026 19:28:54 +0800
Message-ID: <20260121112921.857-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123694

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../msgraph/{msgraph_0.3.3.bb => msgraph_0.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/msgraph/{msgraph_0.3.3.bb => msgraph_0.3.4.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb b/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.4.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
rename to meta-gnome/recipes-gnome/msgraph/msgraph_0.3.4.bb
index fe4faff356..1c2c3b9c41 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 inherit gnomebase gobject-introspection gi-docgen features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "37d7e12f2a990490aea21184f0b27e0b915ebb4e5096f4d6632c62051c054012"
+SRC_URI[archive.sha256sum] = "0731ece6b02b32eeffbbbd98efdc77bc03ddd20651eeae3a4343f0879b04d6c7"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.43.0


