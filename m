Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E0DCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:16:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.203.1778645793530701258
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PHrhcip8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645794; x=1810181794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=apbzW5L7xCW8HKi2VF/wZBTBQKb4DKLPfAhIvAuUgro=;
  b=PHrhcip83tnDx4JT0uvjDwcXo2taFnwJBANBaxsYphfaLqSIC1+WtY9I
   3dn+f5fFEfOcCq02ig0nGLLSJuQwnEpeYhvb8wQcrdtJq7Ww5ZJoxK/9Z
   nuXQqb039L9Vo9dHK+inkfuMGwNKL1wf0G8c+GTb6GJq7ZZvjj1dJS4xi
   K/N8fbDehJ0iyt1uwoMizCeZpSwX4ZFk/2x65jvRyUUNlbV/efMuI5wSx
   Bd4f/f6pusvJLDmmlASvEiI+d4EpTfhF4rXbxDhPIgufK27tNQus9F6Ia
   TWKb1Mv7sviSvYIA+hDjJ/LNvzD9jB7RcduHV0sT3YVb1h1IVwLVQDL5r
   g==;
X-CSE-ConnectionGUID: s7Lu0iMUTCmHrppy4YSr4A==
X-CSE-MsgGUID: +K3f+ynwRwK2YtNmr49FLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240207978"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240207978"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:16:32 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 007A4407540
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:32 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A676EC021AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2A552101905E;
	Wed, 13 May 2026 04:16:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/56] python3-pymisp: upgrade 2.5.33.2 -> 2.5.34.1
Date: Wed, 13 May 2026 12:16:05 +0800
Message-ID: <20260513041626.412-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126922

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.33.2.bb => python3-pymisp_2.5.34.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.33.2.bb => python3-pymisp_2.5.34.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.33.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.34.1.bb
index 59fa072eb4..cb7e129f28 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "ed45ae12bb58082c5dd7e8bd35bee3a3b7eee54196d3451fa4bb7051535dbd2e"
+SRC_URI[sha256sum] = "dc7d44213064b5fc920dfeb8feae21165eb6543288e3809f2a5c6dd86ec37fa5"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


