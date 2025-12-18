Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A2FD6ACE9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:26:44 +0000 (UTC)
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39780.1766057202537117735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 03:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EZS5nsni;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3213; q=dns/txt;
  s=iport01; t=1766057202; x=1767266802;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jzdCDvyuCwa5hptDS9lncifAf5rz+D6PPMOotu6olPc=;
  b=EZS5nsnicS8HfU1m9vVlR4MpTziSPuW+0NCG836hRGclcOWy6gzgdiEA
   DafTtkF8TjfgokbEkAeZNLDfj2LFVuvA7VmxmxwvxEPu4jdHZ94S8ZWzF
   ZIuUDKAmVGNksiuPjsGyNJLLVlYE941zC+dIAwmGpuzUx3HcovlzklJjr
   nmXroUM790vyEA2ZWAcP0RM55f52ZjrD0XhDhkiyscLsUu1oKcV6N/Aja
   eIK+ukxnofym6CpQHVAvamx6lqh3cMnoQeGH8tmao2hfV2Ub2TySfAkI0
   qvCWuh78ll/dFOsrv4pOVVqOC4uVf4WGLUf98voa/kMtHKr0yRcj8m8mM
   A==;
X-CSE-ConnectionGUID: kVdeBUl/SkmXV7BTBBMKIQ==
X-CSE-MsgGUID: NnDIXeynTQCsvxRzalRd9A==
X-IPAS-Result: =?us-ascii?q?A0B0BACy40Np/9VK/pBaglmCR39fQkmUJ44IkjaBfw8BA?=
 =?us-ascii?q?QEPRA0EAQGRcgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2HEwEYAV1RCzwIgwIBgjoDNgMRsAGCLIEBgygBMQMCCQJDT9hFD?=
 =?us-ascii?q?YJbgUuFO4J5hR5xhHgnGxuBcoR9gQWBGkIBiCUEgiKBDoF1hCqCIwNKkHlIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFmAzUMCyoVbjIdgSM+F3OEXR5oDwaBEYNPiRIPiWxrA?=
 =?us-ascii?q?wsYDUgRLDcUGwY+bgeUKU6DbCCBOpQbkiigIHEKKIN0jB6PPoV8GjOqa5kGj?=
 =?us-ascii?q?gmECZJHhGiBaDyBRwsHcBWDIglJGQ+OOINpgX+DFMNvOzUCCTECBwsBAQMJk?=
 =?us-ascii?q?2cBAQ?=
IronPort-Data: A9a23:MSbxJq2hKTKH2oKLB/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2YFz
 DYcCjyDOvvcamajethzbdyz9ksGsJLTzINjGQo/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX4gmQtYjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGD386MKcl/qFMAmR+y
 6MyFBonSzOivrfjqF67YrEEasULJcTxeYdasXZ6wHSAV7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NU+ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZi+W8YYWFJ4LiqcN9uEC0h
 1LL7mLFOzoBKsyl2zOByH79r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:XHPSvqBKjiCHZeDlHem555DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEGmnhrGSpwEJ3EbFh4tg6Z
 s=
X-Talos-CUID: =?us-ascii?q?9a23=3AzmEo6WncsmGjN4+HRHkgD1h7hVDXOX7jwHr6Hkv?=
 =?us-ascii?q?/MmVseIPKY2O60oZHsvM7zg=3D=3D?=
X-Talos-MUID: 9a23:bIXk+gRcjtlIRkLeRXTKgh1DBMp55ZiXI1sTga8Uss2+OX1ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,158,1763424000"; 
   d="scan'208";a="35997856"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Dec 2025 11:26:40 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id F3F9318000ADD
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 11:26:39 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5608ECC12B5; Thu, 18 Dec 2025 16:56:38 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] [scarthgap] [PATCH] redis: Refine CVE-2022-0543 status description
Date: Thu, 18 Dec 2025 16:56:19 +0530
Message-Id: <20251218112619.2378263-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 11:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122759

From: Deepak Rathore <deeratho@cisco.com>

Refine the CVE_STATUS description for CVE-2022-0543 to provide
a more precise explanation of this Debian-specific vulnerability.

The vulnerability originates from Debian's packaging methodology,
which loads system-wide Lua libraries (lua-cjson, lua-cmsgpack),
enabling Lua sandbox escape. Upstream Redis builds, including
those built by Yocto/OpenEmbedded, utilize embedded Lua from the
deps/ directory and are therefore not affected by this issue.

It is also fixed in Debian with this commit:
https://salsa.debian.org/lamby/pkg-redis/-/commit/c7fd665150dc4769402cae97d1152b3c6e4366f0

References:
- https://www.ubercomp.com/posts/2022-01-20_redis_on_debian_rce
- https://nvd.nist.gov/vuln/detail/CVE-2022-0543

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7675392aa7c1bf27b8993d08936bc4bc84d1508d)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index d23d3c07c6..82e029fd82 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -67,4 +67,9 @@ INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
-CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged versions"
+# The vulnerability originates from Debian's packaging methodology,
+# which loads system-wide Lua libraries (lua-cjson, lua-cmsgpack),
+# enabling Lua sandbox escape. Upstream Redis builds, including
+# those built by Yocto/OpenEmbedded, utilize embedded Lua from the
+# deps/ directory and are therefore not affected by this issue.
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: Debian-specific packaging issue caused by loading system-wide Lua libraries; upstream builds use embedded Lua and are not affected"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index efbe86b358..98af45cb88 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -70,5 +70,10 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
-CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged versions"
+# The vulnerability originates from Debian's packaging methodology,
+# which loads system-wide Lua libraries (lua-cjson, lua-cmsgpack),
+# enabling Lua sandbox escape. Upstream Redis builds, including
+# those built by Yocto/OpenEmbedded, utilize embedded Lua from the
+# deps/ directory and are therefore not affected by this issue.
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: Debian-specific packaging issue caused by loading system-wide Lua libraries; upstream builds use embedded Lua and are not affected"
 CVE_STATUS[CVE-2025-27151] = "fixed-version: the used version(7.2.12) contains the fix"
-- 
2.35.6


