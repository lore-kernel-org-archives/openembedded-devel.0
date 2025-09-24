Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A406CCAC5BE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8317.1758704441632466881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZZFrNRl7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704445; x=1790240445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=htz/ZOBU0qB/yDk3kfGtRwPAveEXanyLGUYvMqvziro=;
  b=ZZFrNRl7/M61x7365giA5M2OqSFHQAmusWxfEdQOULw31+qc2PklFO1c
   NDg5whVVjzPm+FSekwenHDkwHuDAaZh0Kz82E5YMf7720yFXrh81mlC9H
   ew+p48uld1CrsxotdO4H9lPurTgB5gE8LZjCu66tzHML4AEvUlWjczYgU
   m9Ju1PjYZdnywTEeic/UDPilrZwYhdLCw6HMhy+wBqO6LTTv5S/WCR8Gq
   ZSgjUwaNmjBhNnhOAhkwBiwYafOnHj1KA4MBn5a7NwLFnqq8n9b8//Yma
   MmAIqBfk+xKVddfYZ12SxzOdgve4iJAmMR/gqHxko1MPvUhvQo4nPjklK
   w==;
X-CSE-ConnectionGUID: UQdZEMrWTzW8nLi2XrKllA==
X-CSE-MsgGUID: XSeOrgRCQEG9UEFh4FudMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="201172422"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="201172422"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:44 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 36122C00416
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:44 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E71D018029CF
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 4DB0120010A4;
	Wed, 24 Sep 2025 09:00:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DBC91A007E;
	Wed, 24 Sep 2025 17:00:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/29] python3-grpcio-channelz: upgrade 1.74.0 -> 1.75.0
Date: Wed, 24 Sep 2025 17:00:20 +0800
Message-ID: <20250924090029.1786-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119781

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.74.0.bb => python3-grpcio-channelz_1.75.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.74.0.bb => python3-grpcio-channelz_1.75.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.74.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.74.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.0.bb
index 97b645d985..8296a0af1a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.74.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "6b80079b6d6e3484eaf89f4e547438e8fcb8658f244027dafb67803bbbd07d4b"
+SRC_URI[sha256sum] = "d521973a343806a8384bf87ceae93cf2e9f10f8fab02c12be7a2e3d5d0e4e68f"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


