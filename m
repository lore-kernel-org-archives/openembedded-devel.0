Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BD7CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:48 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10914.1760433578841300708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ErOD29SL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433579; x=1791969579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qPDAPjG7F/jKl3AdWb7FACxS7TG2TkzXBFfPFGergM=;
  b=ErOD29SLnoMs/x7NuULm7UQijpwEqWMxOVa0LPa1KcPj6shORIGN7FOm
   C5++Co8Uqgm6g7jL45VUodahcv5swr5pv96VyvAH3TXAqek94qHyhhWqP
   etIJeXPBt0OG3CTh6AiZxqLZXsqqiXGUOa3MEyuXDTMcCwe6JwS/H1U7e
   KoC7seACnNxGh3vRD+3ucgUUR4qiJhTJJ0Rga8Mo6BgFDBvFYNi6vrgxw
   ajJwiw5BZZ6vZVK6jTtCU2WZKqQ6rILXpZce7GP/m2GnRz/EsfkHSvbj7
   sdYU+nj+mIM4VKgBKSMKoyTAK4FRNS6+pUOu8U15/UVKF6GEtQj+5qGIJ
   w==;
X-CSE-ConnectionGUID: +13V4yVGQJSZ8rf+q7YPQg==
X-CSE-MsgGUID: 5IEHX5qaTOWVokHJRCdvbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275647"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275647"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:37 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EA0FE1C1C701
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:36 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A497614003AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 22D63101BB76;
	Tue, 14 Oct 2025 09:19:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/44] babl: upgrade 0.1.114 -> 0.1.116
Date: Tue, 14 Oct 2025 17:18:45 +0800
Message-ID: <20251014091927.493-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120558

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.114.bb => babl_0.1.116.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.114.bb => babl_0.1.116.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.114.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.116.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.114.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.116.bb
index 172517517e..a0c5576e03 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.114.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.116.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "bcbb7786c1e447703db3bc7fa34d62d0d2d117b22f04d8834c7b2d5ded456487"
+SRC_URI[sha256sum] = "50fae069867c7ade1259888ff1e3db85fec86d708252e5385b5a4f39a78ec483"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


