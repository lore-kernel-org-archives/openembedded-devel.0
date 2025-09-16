Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33515CAC5BC
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15425.1758015728763491680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DlyJW3Ed;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015732; x=1789551732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m7JctH4mfx15wyyfsAAbmnjhPe80giEqf7E7OGGCVT4=;
  b=DlyJW3Ed6kWnk0vGOBL39YL2KxFwlJZo3xu51GjS4v6wBAm4wLpAWTct
   Q7ZpoiEWwIIzUwkCNTI+OHt/2XLskIONFqgTgCD1uL4rHjuE/isX7b6Rg
   KUUS35fTU0qjhyContyzNYix3NiTXE9bkJaMrotCH+bXkVllpZNxRTy3F
   1Hpmzs8EIll7IdzlO6kcxKdefcIemIpspDD/OpOHIQOwbVwZcvGIRKm0G
   x7k1AL9HLFWaJhFXp91trzYwDxfDG2t6aKWa53GhT4KLpU9UDnQbIxuv0
   2NBK85+m/nJxvRrXLNHqNcgQ4RNeeONXMSoDfz0wlIJkAqMQ0wM0vWELf
   g==;
X-CSE-ConnectionGUID: SMkG5Iw4RMentj7QDrRWiA==
X-CSE-MsgGUID: EVf+NZKiQc2qTkJPumuPOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213534107"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213534107"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5C244820704
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:12 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1802D8D6FA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:12 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 7A2FD18013E3;
	Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 17FC31A0073;
	Tue, 16 Sep 2025 17:42:07 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/42] python3-typer: upgrade 0.17.3 -> 0.17.4
Date: Tue, 16 Sep 2025 17:41:45 +0800
Message-ID: <20250916094152.1479-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119455

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.17.3.bb => python3-typer_0.17.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.17.3.bb => python3-typer_0.17.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.17.3.bb b/meta-python/recipes-devtools/python/python3-typer_0.17.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.17.4.bb
index c92ec75669..f3a995cfa9 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.17.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "0c600503d472bcf98d29914d4dcd67f80c24cc245395e2e00ba3603c9332e8ba"
+SRC_URI[sha256sum] = "b77dc07d849312fd2bb5e7f20a7af8985c7ec360c45b051ed5412f64d8dc1580"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


