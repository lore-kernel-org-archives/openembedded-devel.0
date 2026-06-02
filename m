Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0E7CD6E69
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21497.1780394924088331630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QwX3nL8Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394924; x=1811930924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xXbg5RS7q9/RGfHbSd2nk+s5nx7ChFCpqOUaW/y8zE0=;
  b=QwX3nL8Q+CgQVrflq6Ou6xap03JJehTh7tM71dKh1805BMfa0g9auaor
   1FKe4bp7ZtjNt8B9EX+WrfCe38hHwd5auepba/G+qR+vJwLful9m9J7ea
   7uJ7bejfTuiMQPcqejgNwRybU27DYvB03tVnJMAnng3DlkrUkMn2Q+mqr
   uyl5lQubEEBot0qaNoYMHt5jdHLJ9EtlWlWdzPy6uk59dPfJ0SqwITpmC
   2mUyUCskijtbog4nNj2yr0EnE3lXt9lriXklf+k6NvYJxjKlLTvwuOYZQ
   AhfbKG9tH5gwnW1J9ATmRJP60pAv5n1oJlGKyteIcjKXRQMExSAZ17Qcr
   A==;
X-CSE-ConnectionGUID: v1etYUoGRnSojTjvpwIVyw==
X-CSE-MsgGUID: G/JvwS/FR3+AGyf38gY8Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230084936"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230084936"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:43 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A305E42A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 54CD21C1C263
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 74127180051C;
	Tue,  2 Jun 2026 10:08:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/38] python3-pyproject-api: upgrade 1.10.0 -> 1.10.1
Date: Tue,  2 Jun 2026 18:07:39 +0800
Message-ID: <20260602100755.2117-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127345

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- chore(tox): migrate tox.ini to tox.toml
- Migrate type checking from mypy to ty
- Move from extras to dependency-groups
- Align dependency versions across projects
- Add permissions to workflows
- Move SECURITY.md to .github/SECURITY.md
- Switch FUNDING.yml to github: gaborbernat
- Standardize .github files to .yaml suffix
- ci(workflows): add zizmor security auditing
- chore: improve pyproject-api maintenance path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pyproject-api_1.10.0.bb => python3-pyproject-api_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.10.0.bb => python3-pyproject-api_1.10.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.0.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.10.1.bb
index 2cd48f926f..ba9a04064a 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "40c6f2d82eebdc4afee61c773ed208c04c19db4c4a60d97f8d7be3ebc0bbb330"
+SRC_URI[sha256sum] = "c2b2726bd7aa9217b6c50b621fef5b2ae5def4d55b779c9e0694c15e0a8517ba"
 
 PYPI_PACKAGE = "pyproject_api"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


