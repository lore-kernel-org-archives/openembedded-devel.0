Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF4DC87FCC
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4281.1753153983351867204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mX/HBB35;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153987; x=1784689987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vuOrDlfzBbqjP+xKILVvlgAY9SnQI7SkPIZsMO9spcs=;
  b=mX/HBB35nHQasPkyuHLyQLH3bIXAyeVJlqo6Pang7VvI4NuOw5f2jWAm
   vu2uoZgRF2aayZgxuk5Yx8bALiz7nZkWablOs2a8Ci1tcxahjGjxug6Rc
   6LWNR63fQmNlKVInBdaQ+WxDEP0QqwlYwstsxkxeH1Z/qkY9tSLBdaQSz
   nrApHzx+SkzXmUBYPf0ECXQwRyHBOa0qJnVLhfCsL7Qbm7LaRikVqmXCB
   OHBkG3tRPeYkaTi9ji/tzGcR6OXpQpRXTFPMiyE+W6znOONY4dg6vhg7W
   hHflAKQ70BeF7DtFI+fgws4v36h1iWFx8g4TfHTHJr134op8ZtOklrTUE
   A==;
X-CSE-ConnectionGUID: TlcIJNKKRWS1gmViP5uHSA==
X-CSE-MsgGUID: uv6vcOd5R1+IHbq7aGevng==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="194957506"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="194957506"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E473F1C00085
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 57BDC180033F
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:06 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D24B1A0078;
	Tue, 22 Jul 2025 11:13:03 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 12/21] python3-inline-snapshot: upgrade 0.23.2 -> 0.24.0
Date: Tue, 22 Jul 2025 11:12:20 +0800
Message-ID: <20250722031245.884-12-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118673

Changelog:
==========
- Add/fix reproducible standard repr for functions
- added llms.txt to make the documentation for llms more accessible.
- Improved the explanation of what it means when snapshots are disabled in CI runs (#226).
- Added extra information to the reported failure when snapshots are fixed or created (#240).
- fixed the representation of empty strings in sub-snapshots from triple-quotes to single-quotes assert ""==snapshot({5: ""})[5] (#258).
- fix: changed format-command default to "" (#256).

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ine-snapshot_0.23.2.bb => python3-inline-snapshot_0.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.23.2.bb => python3-inline-snapshot_0.24.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.24.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.24.0.bb
index 247ceed88d..f32eb2e212 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.24.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "440060e090db0da98bd1dea5d9c346291a0c7388213ff9437411ed59885a956d"
+SRC_URI[sha256sum] = "6aa304f2904103a449f3213e059728da5f1c34757f943efca837b4669f290843"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


