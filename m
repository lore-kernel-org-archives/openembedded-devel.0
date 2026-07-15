Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11C8C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3438.1784111994956034428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sYKLT9ic;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112003; x=1815648003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZG6ljxjBhGQ5GCa+t61oWGaX6dDFi6KhsBVyVKMzqQ=;
  b=sYKLT9icrB9GSsD31/Kj97E9LYu7813gpbM57hTVxOFmhxp74nYk6Uvl
   s8d6VPgHpRiuVl79jaD/TMStLcTjCsVapzsg/cJ5lIpVatiU+mVriulod
   MIRAnC9BWdlPMg03duIBQboLU/sDBKjSrapRbXSh29vKp9acv0UxwqHkA
   dtATpQ4OF7a1rkF+nwVvWWoGA2QVu8Y5VKOPMz6A8Q56+n94xW/23TC+5
   DbZDw9zT4s9U55EE4mgbwguKYcbRBYkUqIrqD6D31bTbeNpWTANnhzo5t
   5yNt/tsoOu06nopllRcL1lzwRa5zQ8v7Y/DCYZVACbmrdcPtA5a34AC8r
   w==;
X-CSE-ConnectionGUID: kD4CKW0EQ4uekEPlezEq1g==
X-CSE-MsgGUID: Whe47Hz/QDKiPPfVFGUHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218903"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218903"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8FD65C00571
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:02 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 44B161410C8D
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5E7AF180113F;
	Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/44] python3-coverage: upgrade 7.15.0 -> 7.15.1
Date: Wed, 15 Jul 2026 18:38:47 +0800
Message-ID: <20260715103914.2120-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128190

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.15.0.bb => python3-coverage_7.15.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.15.0.bb => python3-coverage_7.15.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.15.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.15.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.15.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.15.1.bb
index bbc677ed52..47c70b8050 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "9ac3fe7a1435986463eaa8ee253ae2f2a268709ba4ae5c7dd1f52a05391ad78f"
+SRC_URI[sha256sum] = "165e9949eaf222ef1f018635d0d7f368a23bfe0212af558534c40d8c04686d67"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


