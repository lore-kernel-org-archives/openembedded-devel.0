Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514F9CAC59A
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.15432.1758015742867420103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yd4d+4cW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015743; x=1789551743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HunbEnnsWkGD8NsOiAICEf2Gw0ieiNmp0zYEZdRdjl4=;
  b=Yd4d+4cWmuijP6vHhMIForggeRLh+TY/Hy0R0pqDIi0jO/qYuXz49doR
   v455SOh1TVxdG3X0v3WXg/Tupz8GpuD1Ut2lX38Zg8ybwUFtYUYOhgMjK
   pXrkhH21RbCpNKLHBWUc4t1eoNpRubhgxHkK6R9UNAzrujgslnEEHSsLj
   W1rR+YJ29fFbB/MZBwtIa+GjOyFLZ3neuvQnxyKhQG//YUPSQZLskZf7a
   9o/96Xv4TfHUMz2Odc3me34X3i25VryHcjTjIxxMTB7DFiw6UeWyodtVe
   nw3QIKqFJRk/Jp4duQ7VncpWcoPkuF0Gklf5wUerOkZGGdiy/8PGlNwOV
   g==;
X-CSE-ConnectionGUID: gyO+zAX2TMaJCOFT3wgYVQ==
X-CSE-MsgGUID: 5BsIIpmaSaORUcm/FD67fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191918871"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191918871"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:21 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6FCDA1000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 28247180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:21 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 6D5A31003119;
	Tue, 16 Sep 2025 09:42:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 04ED51A008B;
	Tue, 16 Sep 2025 17:42:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 40/42] tecla: upgrade 48.0.2 -> 49.0
Date: Tue, 16 Sep 2025 17:41:50 +0800
Message-ID: <20250916094152.1479-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119463

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/tecla/{tecla_48.0.2.bb => tecla_49.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_48.0.2.bb => tecla_49.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_48.0.2.bb b/meta-gnome/recipes-gnome/tecla/tecla_49.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/tecla/tecla_48.0.2.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_49.0.bb
index 427fe00fac..27b035dd83 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_48.0.2.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_49.0.bb
@@ -14,5 +14,5 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 inherit gnomebase pkgconfig  features_check
 
 SRC_URI = "https://download.gnome.org/sources/tecla/${@oe.utils.trim_version('${PV}', 1)}/tecla-${PV}.tar.xz"
-SRC_URI[sha256sum] = "783d3464d2a2cf7eb1507649dbd9ff09ce24852c2a6c9a0d365db84063d3d401"
+SRC_URI[sha256sum] = "2ca424e402baf60cd6b13777703b701ebb1faf8f3d0f2f971144d823f651249f"
 
-- 
2.43.0


