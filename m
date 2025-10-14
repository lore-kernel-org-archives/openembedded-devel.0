Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA75ECCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11120.1760433660398718637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DX/WLGDN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433661; x=1791969661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JEDSEj6ph2LbEe8LsrKKktAPy7BWUC+6qjjQJwA8Qt4=;
  b=DX/WLGDNZpj21lvY6yqtbiiC07oR6MRTh5sHdMzI9VIk73VDL5E4FmYY
   YbMSB/nbtXs8lnTQwh6+DzVrAvyMVmxlbeK/pI6PvFxXLnZv+uhpMiNY9
   MURctD0GCMc8x+PP4Z9/hdyLAOGKV0nMJJ7a2DbhpmBhiFIxgxQplYBHk
   w1/4tdTGRR1ZLBM3pNkGenuCwrGv/Q0PRaLZLi6+is437ssdGlQ/XCfku
   4M0jluOqbQOynQbffmZS6Rn1C+ztK7ro/5uNZtugef7JZhNgZVx/bbacz
   t6D365spUELXDGhdAEEoxFc4/YBg0Magd2vWWy2ZzyYfYSmHQzVHgfzUQ
   A==;
X-CSE-ConnectionGUID: Joc4L30vTQSQ1ZWnd3u3Dw==
X-CSE-MsgGUID: BA4NklNBQZ2ezdbviRNplA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="219477062"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="219477062"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:59 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E90281002B9A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A0AA218000C0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 29ADC101BB7B;
	Tue, 14 Oct 2025 09:20:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/44] python3-pyproject-api: upgrade 1.9.1 -> 1.10.0
Date: Tue, 14 Oct 2025 17:19:15 +0800
Message-ID: <20251014091927.493-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120589

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix CI for pytest-cov 7
- Add support for 3.14 and drop 3.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-pyproject-api_1.9.1.bb => python3-pyproject-api_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.9.1.bb => python3-pyproject-api_1.10.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.9.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.10.0.bb
index 02fbfbcef6..2cd48f926f 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "43c9918f49daab37e302038fc1aed54a8c7a91a9fa935d00b9a485f37e0f5335"
+SRC_URI[sha256sum] = "40c6f2d82eebdc4afee61c773ed208c04c19db4c4a60d97f8d7be3ebc0bbb330"
 
 PYPI_PACKAGE = "pyproject_api"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


