Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69E2D3B7FD
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4144.1765274219200015701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t7qzsYXU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274219; x=1796810219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JNjM9Zjga6DoFDkxFffkTRW1C0TJNc5ZJi6wz+q4Ja0=;
  b=t7qzsYXUBKZx6YB0H0zghnwdUU0fAOLc+KtZoqCegEq3G7Ul9ouHSrnJ
   2wNK3CWh88BrlFDvRlMyTYPkHZxyjqGxtuvGDerkDhhnUcKj1kTdUI8n0
   PgmF6uYUDIAdGKlFUkq6mzY4Zzn7UQgPJD2s3tJI0rAvkGwQQwCL4L88+
   m7V210kb5TMWx4pvTdaI4D4qlP11qn1X8ILyLwWoJOcltjrWr8vbf9wo0
   Wbfkv8x/mK4eeDOWVH3ywnrMQWTK3tfFV5AWRxSCicN7vJtYKYj9tlRgB
   giZQh4WCFtCC1R7F8lHTdVqbJQFioGKpoMHob26wvWBPbEx14qozzcS4+
   Q==;
X-CSE-ConnectionGUID: bnrRISraQrWkYc6rlPq/DQ==
X-CSE-MsgGUID: uNYumCcJTy+x0Yuj/+kcKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="225876930"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="225876930"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:58 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9F8DB1C1C736
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:57 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 560FF8D204C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id BF58920002AF;
	Tue,  9 Dec 2025 09:56:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/38] python3-pymongo: upgrade 4.15.4 -> 4.15.5
Date: Tue,  9 Dec 2025 17:55:42 +0800
Message-ID: <20251209095552.690-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122432

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.15.4.bb => python3-pymongo_4.15.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.15.4.bb => python3-pymongo_4.15.5.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.15.4.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.15.4.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
index b066d730f7..916fd0f1d9 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.15.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6ba7cdf46f03f406f77969a8081cfb659af16c0eee26b79a0a14e25f6c00827b"
+SRC_URI[sha256sum] = "3a8d6bf2610abe0c97c567cf98bf5bba3e90ccc93cc03c9dde75fa11e4267b42"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


