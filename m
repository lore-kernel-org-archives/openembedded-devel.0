Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3F0C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9394.1788344986592877400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RkPTqiRR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344990; x=1819880990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fiwMkbS9rzFKQjBXTmM9bB95eVgR0FrB6U1t/Ozx9xM=;
  b=RkPTqiRRBqy2zGtkrrEhvso3gpzaCo2LuyuUqhRyZrsnXhuzO7WmSAnR
   aMYe/LEGpibcw0+QmXUvGjeLjtZzddBoqHOQcS2JaAtXYHuzJ0hcsi/Hd
   L8AbT3X/SUOsReXxEqJ+7cEDkZaGzSMIuDbqlSN3aae3hTwEpT1QoouB0
   o9FI1mBso8ccLY6g9FumEJ1nMJU3qM2TQSnENzTKKHSgGucKDgDLzb9p8
   vC3rdLZWFix9dMgx/QQAgrbTOBRWwV8A8EW+cNGu7I63jE8/y2EF/4nuB
   FFqMw5drO/LfsDoRF0eh/rGXyMN0faZZ4/EXrHH05Gaj1JkVs9Yt3r2aC
   Q==;
X-CSE-ConnectionGUID: /pY4DNiPTm+bzSGDlOB2wQ==
X-CSE-MsgGUID: tboDcjQ3SBOCPlrPOH+mWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545566"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545566"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D145610000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 833CF10029A1
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A0E912000224;
	Wed,  2 Sep 2026 10:29:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/34] python3-pylint: upgrade 4.0.7 -> 4.0.8
Date: Wed,  2 Sep 2026 18:28:49 +0800
Message-ID: <20260902102900.1296-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129682

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pylint_4.0.7.bb => python3-pylint_4.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_4.0.7.bb => python3-pylint_4.0.8.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.0.7.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_4.0.7.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb
index e1d6d938ac..90ee93e4f9 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "c6768d3f1a45fbfad6a4ff9e167ca4f71dd5c991"
+SRCREV = "ecb84baf74ae152a511e5fdada5000c85250a48f"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-- 
2.43.0


