Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF42CCD18F
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11088.1760433589193719671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IoEhsi/c;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433589; x=1791969589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tjhanFRQhHx5m+PxdFMZ5jKFlXdnPxF4COLCUF1C5A0=;
  b=IoEhsi/cUleDLyZYdSuoPJQxBwtHjHTbVaJCjjJXPduSYIn9uOuWBFxl
   a/CyHKmvRaZLsOBXo/KLrAKDo8UPFj4KMkTmxKkdWmWb+p3mrZj23x8bd
   6NcMYCAuHYR5a80EX4n9FaBFmmRUnKm2Kf/I8nxCMh6QKcPaAM3vkI5km
   0DpoeJQrqcbYJWQlOjt1psA7elKaYq0gaoMUhD6ZO8XtG/F1BELAkJQcr
   9nog2XnuFhH3V/xKfl7xkxW4WB1d0GdCWmLw7ogPC8xhVt3EsjBlNgKzD
   3qrQ7Bn9wam9nHrpdTFdAxymXETu8uKe91taXf1LlSr4Ugp7O7lgMl5Kt
   g==;
X-CSE-ConnectionGUID: W0XWQ9wgQ0SfgDzFkPEINg==
X-CSE-MsgGUID: h/6s5zDyR1Gc/NH3vfI9sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="216453945"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="216453945"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A9DE42BBE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5FBBD1C002EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EB4F7101BB77;
	Tue, 14 Oct 2025 09:19:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/44] graphviz: upgrade 14.0.0 -> 14.0.1
Date: Tue, 14 Oct 2025 17:18:51 +0800
Message-ID: <20251014091927.493-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120562

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.0.0.bb => graphviz_14.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.0.0.bb => graphviz_14.0.1.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.1.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.0.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.0.1.bb
index c9e7618312..7114473ad0 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "2e3531733cb584668c09bebd319d42b7284278e7702581b1ffdb279f2acd2fce"
+SRC_URI[sha256sum] = "2450df5d80c68f13f26362fafa797b2fbf887ebdc6733920cc5f7df5bec0cd23"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


