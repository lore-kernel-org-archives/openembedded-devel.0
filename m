Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71394C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3310.1787132167231615366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QoDQLDpK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132167; x=1818668167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QBPUDY6tIZvu8YRp3lTGD9JwC5uZIHIT1R+MiTALmAo=;
  b=QoDQLDpKcz0HE4SdwBp2EwuBQIIgFDGCc3TYPVqf/fhBkcT8K5iJWWZM
   JOvZk8C4lYwCyU2ZiuQ2vaQZi2IsUGUxn45noUO7yOySNcWE4SzzCbe35
   xwovaFN/U60ye4sFSNEy+zY2UUTw595pCt2cOo6WOZdui7nrcBTNytFE2
   2HrPuLqG3QXw10bVSxvo7sebeoSBpBHEfidehJF2i7Q/rUueFCaGUplGW
   uIr3RMlESEf0tga8M8r0JOBaS0c2jIld3c6TKEpcgUiZl6LduMzvxStF6
   L5MAblqHh41//mH2YcEaYmVdX7B1BDy5dEjWKz2lJOpSMSu9Q//kODv5O
   A==;
X-CSE-ConnectionGUID: C1nagNXgQha9Yr/Wda9nsg==
X-CSE-MsgGUID: Q/18xlzTS66qed9zMiIGHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="238053912"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="238053912"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A96B0C020F2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 65511148CE5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6D4D61801C20;
	Wed, 19 Aug 2026 09:36:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/70] python3-discovery: upgrade 1.5.1 -> 1.5.2
Date: Wed, 19 Aug 2026 17:34:30 +0800
Message-ID: <20260819093514.1101-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129296

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 discover Python 3.6 and 3.7 interpreters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-discovery_1.5.1.bb => python3-discovery_1.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.5.1.bb => python3-discovery_1.5.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.5.1.bb b/meta-python/recipes-devtools/python/python3-discovery_1.5.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.5.2.bb
index 12f2153f80..00e1f1a16a 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "e2ea8b884cd1701f386eda8cf327b87743f1dc21b7f784470799537d95635384"
+SRC_URI[sha256sum] = "45fd4f20a4e3f9b7bf2e0817870bc8e3b320a19658da177af800768c82dbf354"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


