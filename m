Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2FDCDE00C
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7004.1782378113498773788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q6O+Ksb5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378120; x=1813914120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CaNJbvTISGw7XTcmZ4NPGyV5fH3xZAKdlb/gu5dZtTs=;
  b=q6O+Ksb5s4Texfs/jO5SVGVwMH6h1CDeJR0o+Xuo8XVnFhQ3GzTCjJx2
   EQcR33oKllWaR7XD0l2pTitmL1XV7jC0p86l6xl4bafeY/ErZlMIAxFLB
   rMNfIikSmSWenUXZ4qnUnbguBSqJQrh46unht6UaR85v34tFCoel0TCLz
   kolTNM/FZUfifJFZXny7FeM+hshEymG5+Z0+h372Jpe3BAYbk/5lsLtqN
   krsEwSkeuc2ufQ9I5BVgEUrdnodo3rHhrbbzwn50VyyjJmJV0QH/I3Zrn
   KdaN3goeiHKR+k3JcJIevoDWQlfyMoDB39r97aT4VR6ytBXWQZs7iW4Xy
   A==;
X-CSE-ConnectionGUID: UDGsxbKvT8iOVUxrfCR5KQ==
X-CSE-MsgGUID: 6lBfXuFBRPebiR47Ukklxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="243444589"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="243444589"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2E956406EC7
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D7D20103D5BE
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F0E2B1017325;
	Thu, 25 Jun 2026 09:01:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/47] python3-cmake: upgrade 4.3.2 -> 4.3.4
Date: Thu, 25 Jun 2026 17:00:57 +0800
Message-ID: <20260625090127.1563-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127749

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.3.2.bb => python3-cmake_4.3.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.3.2.bb => python3-cmake_4.3.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.3.2.bb b/meta-python/recipes-devtools/python/python3-cmake_4.3.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.3.4.bb
index cfb1d3a2a8..60c3c82cd9 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.3.4.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "5f47f5f00910c474662d09a0516413c6e9750bde73cdc52dea3988102a274e06"
+SRC_URI[sha256sum] = "c97e84a62cf71aaa4f012da5aea411b432b1361d78e6421f987679869aa0fa7a"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


