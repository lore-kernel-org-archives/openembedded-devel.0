Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D46CA1015
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8052.1756890209000338735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L5fpX2rV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890213; x=1788426213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=prb58DW8+Ctio3TPM4OqeJuc/nqChjSjSR2BPFvDtZs=;
  b=L5fpX2rVc2h+Evzoky+tuSR08h2atFhs7HVPeCvoJ7a8N/vIaiNihpRo
   p0xH44QXc+jZF0kToQzTOlTOuSakE+P4Iw46vFmKCleX0TIXTBVyzXYxM
   xe1gQDfc3JYWia97sI5QbwNKGtlfhF8UCySDGHdU+HyYEuDmHZf0wgT8v
   DqzUhNxpCo8BJpwiW3Vaa8ilGXrDdEj/KKAO9J2D8JNGNpMz2+1F6aHG1
   P0sZpuYm8fwVa6aJhWafrEajGuj+qlDBHTP88hZVutihG99CqDCOX2YEx
   mRwUdyhWokDvimuP9Wrn6UZxa8uaKsKrXFwfC01DF9MZYC73Kpin0INFV
   w==;
X-CSE-ConnectionGUID: 62QkzaDjRAeypO7sWTKMkw==
X-CSE-MsgGUID: vJD0Wpo8TMqQVUWh4r9zKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549642"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549642"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 87BCF1565
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:31 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 35B761800D7E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 241362000750
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2119D1A0078;
	Wed,  3 Sep 2025 17:03:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 15/56] libspelling: upgrade 0.4.8 -> 0.4.9
Date: Wed,  3 Sep 2025 17:02:36 +0800
Message-ID: <20250903090317.2002-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119211

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspelling/{libspelling_0.4.8.bb => libspelling_0.4.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.8.bb => libspelling_0.4.9.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.8.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.9.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.8.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.9.bb
index 9c59e211f8..a378cc87e3 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.8.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.9.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION = 'docs'
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[sysprof] = "-Dsysprof=true,-Dsysprof=false,sysprof"
 
-SRC_URI[archive.sha256sum] = "277646285818da7b295ef007b2c5ebd815d0930b3ad097505b3ced96965af517"
+SRC_URI[archive.sha256sum] = "d093fd35ae0f1c98fb58876505287fc0a885e47da9d2411d6d7cd595f34d4ebf"
-- 
2.43.0


