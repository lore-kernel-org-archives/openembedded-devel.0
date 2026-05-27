Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66378CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16960.1779875363919899971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VKpEOzy5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875364; x=1811411364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cznyUGm6KTpTpdY7kq8cLQk46GG2XL+J+VIhi0FTwUo=;
  b=VKpEOzy5BuPj5GkWu6Bz6S6Y8iLWNpA0+c3/3YixQyihuuFmmJQ9KWZt
   un0OelFH9xFSQCdo8O1tUMJ75tw26KbI3uDFoRaEhybmxELqQr6K3IYP6
   //mHDPKykCkNjrkk6eUTb3D+67MGtcfb2YnYZh8LMzwmIu0VwtvAXp3xz
   Yyw6zAlirdIzOaFiXuzvb6urzv2JPAo80+Gg1ShEOEVmjLPFnNSj0hKfK
   KRikyrwVowv15u2PJJDARvpR98SL8yziQqK4osVWxB3cGimSsxGryk0lB
   HP6u3HO6o9WwoYM8lJyrCUnlgQ94+LGsyIKF+ZZt9I5cStzZnzc3O6VvI
   g==;
X-CSE-ConnectionGUID: WOfBjm5zTXe6uWr46G3QDA==
X-CSE-MsgGUID: mOF9Dm3bSaq88oZzGl13TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="220931933"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="220931933"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:24 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0F0B78203D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:24 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BA13C8D65CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BB90982A2CE;
	Wed, 27 May 2026 09:49:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/56] python3-setuptools-git-versioning: upgrade 3.0.1 -> 3.1.0
Date: Wed, 27 May 2026 17:47:49 +0800
Message-ID: <20260527094805.2039-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127247

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added a dynamic-metadata provider compatible with scikit-build-core.
- Add support for git archive builds via a tracked .git_archival.txt file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ning_3.0.1.bb => python3-setuptools-git-versioning_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-git-versioning_3.0.1.bb => python3-setuptools-git-versioning_3.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.0.1.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
index 561f1d06c6..433525d041 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://setuptools-git-versioning.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92e79e3a844e66731724600f3ac9c0d8"
 
-SRC_URI[sha256sum] = "c8a599bacf163b5d215552b5701faf5480ffc4d65426a5711a010b802e1590eb"
+SRC_URI[sha256sum] = "612dfcf184addac9e1c2216f4f229724b2390e5bf613fb925ae80b84f2529172"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


