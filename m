Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE28FC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44783.1784715832437515677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J/9HDCXa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715832; x=1816251832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=36k9FJr22gj5bD3FmJL4nPMhZpjhRtow4I5geoK2Xfs=;
  b=J/9HDCXa13ByqrSnskjiY1iZa7Lf9pkaOb4kbKezF1O49KjuRBN3n8Wo
   MbuZvB6qIvJHcMrie8mm1mkHeePx/RmWeDRr/ayEqjQfCYtpZAtm2kmMR
   KyW5Ro5yQIurcKMw25v2Msw1oH3jToB12dRG+TDDQOHA9JrdsRNkSWF7G
   2U54gToZrNTJdiE7dC0jeEbxDwPp4pRx3O1wi8YnmeVlyeNVaED3JKkQW
   z/vQyRZV1xJoLVG6ewXh/QeNz4Ye6EsXj/8Uql2IoA4ORPkKLUnxYvDut
   j67UJ99OwpSXN5yuv+xOuZ6nFnlT5uYBGTExbMJ/ODwuoYtzyX/i+rmiR
   w==;
X-CSE-ConnectionGUID: YhUqTt8mQHS+O+JB5ltLMQ==
X-CSE-MsgGUID: mEtIsJvcRnudbz8+4YUmdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248228215"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248228215"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B7ACE1002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:50 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 6FF8BC00894
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id CE1924064B2;
	Wed, 22 Jul 2026 10:23:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/37] python3-bumble: upgrade 0.0.232 -> 0.0.233
Date: Wed, 22 Jul 2026 18:22:57 +0800
Message-ID: <20260722102320.1019-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128384

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Revert "CIG: Fix CIG parameters for unidirectional CIS"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bumble_0.0.232.bb => python3-bumble_0.0.233.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.232.bb => python3-bumble_0.0.233.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.232.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.232.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
index dd2c1516f2..d8aa40666c 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.232.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "78dc4dde9e270367605c697fa40c2e429513ee086b800789c97443a6ac7b2b79"
+SRC_URI[sha256sum] = "0883e2dc744f0b8228f5095f54bdf8df7f74e47d92bc5fd97ebfc2ee48630f54"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


