Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5809ECCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10921.1760433594566818474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bx/qqKa9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433594; x=1791969594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KYi+Al/UfopVJCTz61LUEtf9Y48mpUPftVGuGUoPXlY=;
  b=bx/qqKa9e3sG4tGYavgpZ2rGKiJZZGINkav74h3ww2vHLoz5WwmD8vUi
   e70bhz3xt9/M34J0jTTZm2M2Oxx8zo/Xtu93c6PFwr+qjuDXBUvP7H+07
   /X63B+JCvS9yvJ03QtgrRiBE5gJArx7t5WklQlAGlooMatvvB6ieWIITN
   EAo+MRdZ+ST8nqqQ/k/wsBJoNoUfGftGoawGtRKHonByDknOxW9eu8S3v
   WoHNpu3XjMgU1hyYM3n0gdZLHGSYNPb5kuScxMtv58iXJBjJENq0cFumq
   TZcAlwkkokmg+1zroWGh07cv3rDNEto29J67nJmEfM82BQ0OqtknBzahs
   A==;
X-CSE-ConnectionGUID: fp8iFoPhR/mDd17H+fySKg==
X-CSE-MsgGUID: gwT8K1djTEmx5QMwb18qFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="204394442"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="204394442"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:53 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 265E12BAE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D637A1000104
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 65B21101BB7E;
	Tue, 14 Oct 2025 09:19:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/44] libsdl3: upgrade 3.2.22 -> 3.2.24
Date: Tue, 14 Oct 2025 17:18:54 +0800
Message-ID: <20251014091927.493-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120565

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.22.bb => libsdl3_3.2.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.22.bb => libsdl3_3.2.24.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.22.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.24.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.22.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.24.bb
index d019212a7b..f556f332f8 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.22.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.24.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "f29d00cbcee273c0a54f3f32f86bf5c595e8823a96b1d92a145aac40571ebfcc"
+SRC_URI[sha256sum] = "81cc0fc17e5bf2c1754eeca9af9c47a76789ac5efdd165b3b91cbbe4b90bfb76"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


