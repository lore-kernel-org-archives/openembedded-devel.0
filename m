Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33885D0C82C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56076.1768299889346645221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CVSStcTG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299892; x=1799835892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SNbVLUL1W47iNFGmOfzCJA1tjdS6prZ288xkIqrae1k=;
  b=CVSStcTGFNV61KNeNvovWM/T6d5+3HmCdBKsQZ+8q18anZEEnWJxFq/w
   kXx8vr4bTbELIz+ltJL3KSarWg6nfFr5i9juqAfyxM5FiYBsd6KwMSBmO
   ymPoillFZXje2yWd7hgaUzpL584mwfWhhVf2QotJZRYv7hArCMG7JsLOr
   t7Y/DYNfyaXNz+tBoQ7tVTS65HNXSk+iDi4NiOrjiRXdbwhmXSdmuVW1H
   FfmXGiHPFWyaeO1VvwY7yr5SViZtdgoyBNTXD5vYiGqbQwNqA1zkfacm1
   R0fGcikeP668cmDR8XYiBwb5K1+nq2cwt9PwwKoKpLAUiLMEbwyN9AuYh
   w==;
X-CSE-ConnectionGUID: 4hnP1M1NRryAwr5nIEL68w==
X-CSE-MsgGUID: wDprfpxWTk2YG/f29txMrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213060170"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213060170"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:52 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2463A42A302
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:52 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C9BF6C00D58
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1C8701019045;
	Tue, 13 Jan 2026 10:24:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/22] python3-virtualenv: upgrade 20.35.4 -> 20.36.1
Date: Tue, 13 Jan 2026 18:23:33 +0800
Message-ID: <20260113102334.605-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123427

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- fix: resolve TOCTOU vulnerabilities in app_data and lock directory creation
- fix: Prevent NameError when accessing _DISTUTILS_PATCH during file overwrite
- Upgrade pip and fix 3.15 picking old wheel
- fix: wrong path on migrated venv
- test_too_many_open_files: assert on errno.EMFILE instead of strerror
- fix: update filelock dependency version to 3.20.1 to fix CVE CVE-2025-68146
- fix: resolve EncodingWarning in tox upgrade environment
- Fix Interpreter discovery bug wrt. Microsoft Store shortcut using Latin-1
- Add support for PEP 440 version specifiers in the --python flag.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.35.4.bb => python3-virtualenv_20.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.35.4.bb => python3-virtualenv_20.36.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.36.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.36.1.bb
index 0c50a35be9..d5fad314fd 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.36.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "643d3914d73d3eeb0c552cbb12d7e82adf0e504dbf86a3182f8771a153a1971c"
+SRC_URI[sha256sum] = "8befb5c81842c641f8ee658481e42641c68b5eab3521d8e092d18320902466ba"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


