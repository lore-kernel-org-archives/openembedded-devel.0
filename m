Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82442CD5845
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3098.1767781786624793076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S2HCNJBB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781787; x=1799317787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vZKdueqAYIXN2q+m1Ejpxj04Sg1BYrSmZ1dVPqpTN0Y=;
  b=S2HCNJBB7TW3PbvR1jSsDLRhOJeHLqN2dsof1uXujz5GUKsD/va73lYe
   r2a2+RRkZrHsB1PQSXdLCc93PkyKfidxzrwb8EMscHfvrwt/wMe7OBGFH
   LrIAPkdLDAFnqX7JHqeJlnmclyKlZsOkEAWM/ZEo9JSUefd/9ieDNnv2P
   1USjshVofdD0ffAZCZotp9x3w8NcKTqBtVKbpXA5bi4PbouOpcGWquHI4
   Ow5nf2De4JmCerOi2qwnDq2Oguviqj8XkJcRnTBsthrRUPigGg/Wmc0Ja
   1uxMfNh2ToX/opuvhkOwXGWE/yW9jppfbbH9yKeNgmvymGNQBt4GeZhOg
   w==;
X-CSE-ConnectionGUID: 6DltGhX1Sm6iU0h7fWWMqA==
X-CSE-MsgGUID: lIUBvPrmTOSvYZr11n10ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225092720"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225092720"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1AF1D1000359
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:45 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C8D70C026E8
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0E835821736;
	Wed,  7 Jan 2026 10:29:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/24] python3-types-psutil: upgrade 7.1.1.20251122 -> 7.2.1.20251231
Date: Wed,  7 Jan 2026 18:28:52 +0800
Message-ID: <20260107102855.228-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123219

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.1.3.20251130.bb => python3-types-psutil_7.2.1.20251231.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.1.3.20251130.bb => python3-types-psutil_7.2.1.20251231.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.1.3.20251130.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20251231.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.1.3.20251130.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20251231.bb
index e22eb3ecd1..90325c4db1 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.1.3.20251130.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20251231.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7f42e7a7845a93397e430b48a8074a35410d7a436695fd3375ec9b687d8d95f8"
+SRC_URI[sha256sum] = "dbf9df530b1130e131e4211ed8cea62c08007bfa69faf2883d296bd241d30e4a"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


