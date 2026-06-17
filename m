Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C08CD98F3
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11086.1781686709975685806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YsfD2quc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686710; x=1813222710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bmombr8vzmkYoIpUaSvXWd2Hcojj8hb8k3LGf0KGh7E=;
  b=YsfD2qucBKxPaFwF7Re3Va0q71UOsd7ziLQV+EUQhwsYxR2gA9Z52zI/
   BJ2JVsx6BaDUycO1d8RghSzn0InoCZPR+UG4rLzpHhblsawZKT+QcwrHc
   fQoCBTRgR0WNt4gzvrzYDczzLNGeOeWqgsOcWYv1HSps/eh0fslk8PRxq
   RduP6oASPdznSKv9cNqnNgjLyJ5QpbVnjoKNl+pzWylGSu0rI3Tpr4+eR
   UPMnm9UfYPbc6tRPOkmMUszCvFKPrrxLRpy7R1U7kaIcfmLulWiaaIYmd
   kcRpQOF075FB8dFqwPX4dGr0mz4qB9R0UmFOzVaLv8YNTf4Xj9jo4Nqdw
   g==;
X-CSE-ConnectionGUID: /PpWzAGjTCaPAI3JNWGfJQ==
X-CSE-MsgGUID: egfk5qVSQauqNd6W66dHOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="244423934"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="244423934"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:28 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B42661002B93
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6EF021400612
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9820D10017D2;
	Wed, 17 Jun 2026 08:58:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/17] python3-cyclonedx-python-lib: upgrade 11.8.0 -> 11.10.0
Date: Wed, 17 Jun 2026 16:57:58 +0800
Message-ID: <20260617085807.542-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127646

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on-lib_11.8.0.bb => python3-cyclonedx-python-lib_11.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cyclonedx-python-lib_11.8.0.bb => python3-cyclonedx-python-lib_11.10.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.8.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.10.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.8.0.bb
rename to meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.10.0.bb
index 1947b4b2f4..78922540e0 100644
--- a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/CycloneDX/cyclonedx-python-lib/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a8935b06dfe53d80efd47b5f6a202eb678cea00f2930e94e3710f2c1510166c9"
+SRC_URI[sha256sum] = "d03d6ea271e26feaf123b8b1b34468a305f33a338c5763f56e397a8408f9b290"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


