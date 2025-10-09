Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06DACCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.5576.1759990115740328310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nzU0v24U;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990116; x=1791526116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u/E07rzua3uo/3xdrMYSa8VlnnZraaxWtSqMsEGxqR8=;
  b=nzU0v24Uv07iKMJ1vqk85cTvpoeBRk7Vvhg4uccM/Tlu9PeNWgCBu1Ig
   DoZqD/XwZfQzbjUVvPfjBwKVSaYMlPN1it0M8wbK/9DPnqrxK6D287PMe
   WntDoUQoM6M8Rm2JcGGO+i4t4OsmLGvjbNvN4N7TMAFqWJeLhQItOyZSj
   vGEMl18ZUTj5EOPkEdPD+RIP5LDuaDjZe+tT1TvcLMOjYKFbbzpOGABIZ
   IDI16MWiNL2PKfZif/1fLUGhb6/hkA1aaUTb7N8wodlBr7ZfxkrA1xbLs
   125ue0G03MqoLeCMFCkY3h9GC3ULOl2lCwpR9XZwqPy8z2qKtsTE7oLf1
   Q==;
X-CSE-ConnectionGUID: zjiAs+6kSgCujwtjLCImHw==
X-CSE-MsgGUID: fsJQ54LeT3aEdrlMBOnruA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="203965772"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="203965772"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 433641C1C738
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0272618000FD
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id AF3FC1001CE2;
	Thu,  9 Oct 2025 06:08:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/22] python3-cantools: upgrade 40.6.0 -> 40.7.0
Date: Thu,  9 Oct 2025 14:07:57 +0800
Message-ID: <20251009060809.445-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120407

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.6.0.bb => python3-cantools_40.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.6.0.bb => python3-cantools_40.7.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.6.0.bb b/meta-python/recipes-devtools/python/python3-cantools_40.7.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.6.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.7.0.bb
index e2d8b3ca2a..df6bbb45ff 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "adfd80f9d1704be0dfae3fde0000f748635888bcb76c1a12b8b6420f34d95834"
+SRC_URI[sha256sum] = "5779113b068ab043140ea9441ad77d44ad4d382eed88de16678fb320e32146ec"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


