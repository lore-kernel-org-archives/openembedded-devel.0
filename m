Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB6BC44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3449.1784112024848809544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RXgt3TRg;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112028; x=1815648028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3tYWhm/qC/WAvIXTH/xcFudKGmbyMW/+UHDKGCuCeRU=;
  b=RXgt3TRgefR2hPHWs4GKDqutJs9DkkqWfKZcOu2UxQRvW/j/cHZuLOqs
   QOq2ztFtSJveeKLynyXHOD7h1b1rFnB1F7bOgY9dnPh2VYJXUfVugyH5l
   SwCRPgG7yq+bCxaj9teNco3oQUR8nlD69kfUNMf4uvTR02kUD/TETWI3j
   sfjvyJ5z0jxjnTnS3Gkm13GgKh0IFGkPGIaxTyrmLN0B9yMLoUcKMTFxK
   2DzhUI3U3L1x0lU7Vv26DLGYQcmhqOUxddM2naAniaMeZDaz+W5g2yKxC
   anPE6Gk4RtA/Uuywpz9X3mqB9xsbZ45G3JqwrEA6EWft9lA7l3ch5joZR
   A==;
X-CSE-ConnectionGUID: eHrBSfwLTcumhQe9Ej7n3Q==
X-CSE-MsgGUID: ZfLBuYxDQ9qyPw5Y9XgG+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218948"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218948"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EE73F406EF8
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:27 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9F2C0C0209B
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AF4641802733;
	Wed, 15 Jul 2026 10:40:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/44] python3-xxhash: upgrade 3.8.0 -> 3.8.1
Date: Wed, 15 Jul 2026 18:39:03 +0800
Message-ID: <20260715103914.2120-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128206

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Register the "benchmark" pytest mark to avoid PytestUnknownMarkWarning
- Update C extension docstrings and remove stale comments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_3.8.0.bb => python3-xxhash_3.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.8.0.bb => python3-xxhash_3.8.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.8.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.8.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.8.1.bb
index d33da2a57a..4416949f2f 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=82f3295151c5e61043a4a201c031a5ee"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "d72b2204f37840b0f16f34192c09b994b97bd25823d723d47a1eddfacf06eb43"
+SRC_URI[sha256sum] = "b0de4bf3aa66363552d52c6a89003c479911f12098cd48a53d44a0f7a25f7c46"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


