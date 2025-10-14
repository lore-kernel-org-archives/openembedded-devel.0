Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC58CCD18F
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11095.1760433603924260229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y3s0ep0p;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433605; x=1791969605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gIuklFHM6Q9A8bEgLTihq3JfD6MqV1o/qvpKNooLy7s=;
  b=Y3s0ep0pYGvkKOlBoDU0kPhS+LtWCTpWBrrxJTxd5s1ISX1pzORgzUHC
   SFDWk58kgz57PXHoc7XWsuVCmRrJ/cAaPPUKmYKMWgi4WGiS/Phd0twxl
   fd8W+UCLPKo8Hf8JdDG9/OVZGdMBudJBH28huBBEk1oGCF9oJjzqBH7bt
   GUAcAC+Wym+nlZ1+6RjVAw2kWc7Ml7wZVqvz3GSlBiqri0oKK2hb9dkxC
   B61wFui8lCH8+LajNipwXuF+3e2PjhYuibIowqxugqqAYmHLLYKbI4HNj
   EdW3xKZV692VUpJ3rBRrAmc7R3bWBXp5bd0W4zT1HvTjtXzRFXrzEoCTE
   g==;
X-CSE-ConnectionGUID: FNy7Hq4vTLyf0yj/kd5wQg==
X-CSE-MsgGUID: goWSF9sMRA2OJkWxDL0Vjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215920945"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215920945"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:04 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E3F8342A31E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9F7F7180198E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 32A02101BB78;
	Tue, 14 Oct 2025 09:20:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/44] python3-asgiref: upgrade 3.9.2 -> 3.10.0
Date: Tue, 14 Oct 2025 17:19:00 +0800
Message-ID: <20251014091927.493-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120574

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Added AsyncSingleThreadContext context manager to ensure multiple AsyncToSync
  invocations use the same thread.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.9.2.bb => python3-asgiref_3.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.9.2.bb => python3-asgiref_3.10.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.9.2.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.10.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.9.2.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.10.0.bb
index 078f425d2b..7be6156c76 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[sha256sum] = "a0249afacb66688ef258ffe503528360443e2b9a8d8c4581b6ebefa58c841ef1"
+SRC_URI[sha256sum] = "d89f2d8cd8b56dada7d52fa7dc8075baa08fb836560710d38c292a7a3f78c04e"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.43.0


