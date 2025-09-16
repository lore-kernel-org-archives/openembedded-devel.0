Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8247CAC5AE
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15418.1758015722613435364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dtlwo20H;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015726; x=1789551726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N8Eq2WN/CKq/elqdIcNiY2XSeij39D5nTuSyTT+aWcQ=;
  b=dtlwo20HjM1mWM+T1l4DdesW+2qV/sBx6jK5flw3gr16FP0OERypi/W9
   CYLiP+hIsc2JHmD29GRAhnszUhT2OSrR1QdmH5trSt/DvFrx71SdKjhzO
   /EhjpdJxeoO1rOGYa/1Of3bwTdWMxMBcr+Da8OwykNg7zA5zV4jPOTMrL
   qK7b7UPeayl9mhhwSWmvhtWmSilDPDEdlsA53vA/K8lcR3uX4w9oDnsBi
   sKe3FZrzg8FFO1txHNoEB41bXHcXN0PmUyePYUNAPtLQ+5KZBBeKM2lUl
   RwEmIj29om+DEUj4KgHEao/hGnnd9mIYjjWjYR8jFPFlOAIvcS9gV8aZn
   w==;
X-CSE-ConnectionGUID: bwVeJdjPQXi5J+J1bAl7Vw==
X-CSE-MsgGUID: Fu05Q5b1SXWIocnieN5wEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212969207"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212969207"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2B637C000AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D92E38D9B8B
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 7B13620012FF;
	Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E421A1A0090;
	Tue, 16 Sep 2025 17:41:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 09/42] libpanel: upgrade 1.10.1 -> 1.10.2
Date: Tue, 16 Sep 2025 17:41:19 +0800
Message-ID: <20250916094152.1479-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119432

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpanel/{libpanel_1.10.1.bb => libpanel_1.10.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libpanel/{libpanel_1.10.1.bb => libpanel_1.10.2.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.1.bb b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.2.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libpanel/libpanel_1.10.1.bb
rename to meta-gnome/recipes-gnome/libpanel/libpanel_1.10.2.bb
index 5cb9819e2e..680ccf362b 100644
--- a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.2.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
     libadwaita \
 "
 
-SRC_URI[archive.sha256sum] = "936bbe96dfb383556482120fddd4533a52d2f49303328cb694861606492445eb"
+SRC_URI[archive.sha256sum] = "cc12e8e10f1e4977bd12ad3ffaedcd52ac176348b4af6fe5da686b96325bfe01"
 
 PACKAGECONFIG ?= ""
 #EXTRA_OEMESON += "-Ddocs=disabled"
-- 
2.43.0


