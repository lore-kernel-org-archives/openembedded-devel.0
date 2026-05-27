Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03204CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16800.1779875362281806675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fwdUA0vv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875377; x=1811411377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XQNUq424J6N+YIZSX8wZhDc2d+UbPUwTPgJBTb5SCNE=;
  b=fwdUA0vvnpM8QLCHhuEb5VUDQcjkm4B2WKbB1uTDg6z1KBrH11fIj3AO
   SNWrvSkVoHzgjh790W0hHBgwNHiKKpENHsHv2qI5OUp7F6KzNn7VHgC/F
   TSuSg1xFXU8TCHB1gN4CXCKoQzSN4S+hS4Qornng1N5m14XxkKgLkAoVf
   ZxnZVKUg3wYCQcK5Zh2yrpPucFVEXPSorhEh5IJtMEki4siACfvaZsl0X
   0Tq5zqJuERKdVCok4eLkv0R7qMz1RnsynQXapplO6W6TKx1pgNoagmZbF
   FLN9AFDM7HgcwbbsJB+hYYBbJn2JNSrBxvimh/hSSW4sRZ8280A6zORpK
   w==;
X-CSE-ConnectionGUID: IsxIARFeSOGckNekmIaWfw==
X-CSE-MsgGUID: icwlVys/Qa+vB88q5wJhEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264253"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264253"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:36 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D44BE42A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:36 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8D27DC006D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A7C8182A2CC;
	Wed, 27 May 2026 09:49:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/56] python3-vector: upgrade 1.8.0 -> 1.8.1
Date: Wed, 27 May 2026 17:47:57 +0800
Message-ID: <20260527094805.2039-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127255

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix: get rid of cupy<14 quick fix
- fix: _wrap_results skips momentum equivalents
- ci: bump setup-uv to maintained tag scheme
- ci: enable numba testing in 3.14t

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-vector_1.8.0.bb => python3-vector_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-vector_1.8.0.bb => python3-vector_1.8.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.8.0.bb b/meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
index 67312c4423..b04184cc88 100644
--- a/meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9f683a957276148387db50971a7b3ef"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-SRC_URI[sha256sum] = "58f95e9e24463851ca34176a20df2fd2e80b41d78615e5b1f7ae4bf313424ca6"
+SRC_URI[sha256sum] = "1b7658a4fbc7b593342506a1b84eff3459745b09c98c3be83ed58df31fd29b43"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


