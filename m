Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE6FCDE00E
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7238.1782378145643549391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hlZK6M6k;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378145; x=1813914145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MrGAcwF06hjIar2Qcd864XnrF+TslxXSygz+Ix9VXD8=;
  b=hlZK6M6k/eGLV5PW28Pac09WUq+wyzYEuaKBgqGHPKPWuJEwQTmaovFJ
   0TfXd4xUPEZIhQOqe0ZCnCz2vzuI6mJ8xuSko0tT2fD+N5P8cwH0e8Blk
   eRLKJoGOJXmmrZ/Yb+9U5+8HN/EW+FuC8ol7dEaiUtTH8NnU34Mp/upo/
   vpXOsyhUeWrrsqC67bC3XGuVkaPjzNftC5DeErbKjzN84faOldOsR2qsj
   62hw8a6Lbn6g0gmPE6oNr3D7KzmfpseRwbkAiZLOHqn6mC4vKLa9pkjqw
   mxOArNky1P9iLxNXzuyVtMr/huYwpY4kU24l2W5Hveb2ow9ZD5DzPsqcB
   g==;
X-CSE-ConnectionGUID: w5VEkso9TgOiL1pHJ/X8qg==
X-CSE-MsgGUID: bI6ChWUYTj6d78xrgnNsGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="224184848"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="224184848"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E49CA820C30
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9D639C06D6B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A3B171017329;
	Thu, 25 Jun 2026 09:02:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/47] python3-pytest-unordered: upgrade 0.7.0 -> 0.8.0
Date: Thu, 25 Jun 2026 17:01:13 +0800
Message-ID: <20260625090127.1563-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127765

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add Pytest 9 support
- Add Python 3.14 support
- Keep latest Pytest tests on supported Python versions
- Refactor CI to use the tox test matrix
- Replace pre-commit workflow with prek and mise
- Add Context7 project metadata
- Update linting tools
- Update GitHub Actions versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-unordered_0.7.0.bb => python3-pytest-unordered_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-unordered_0.7.0.bb => python3-pytest-unordered_0.8.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-unordered_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.8.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pytest-unordered_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-unordered_0.8.0.bb
index 36b8a5dcd0..293d193f7c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-unordered_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/utapyngo/pytest-unordered"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcd3af2d38a4d4dfd5138c6f163dbe2e"
 
-SRC_URI[sha256sum] = "0f953a438db00a9f6f99a0f4727f2d75e72dd93319b3d548a97ec9db4903a44f"
+SRC_URI[sha256sum] = "3c369ed86919d3eb35e11fd27bb679c1e3506ead9327e25aa8a07307256be65a"
 
 inherit pypi setuptools3
 
-- 
2.43.0


