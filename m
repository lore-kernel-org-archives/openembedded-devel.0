Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF1CD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16793.1779875339738071041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ABQ/c2yo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875339; x=1811411339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bqf054JNo3SY6V0fj+5bF/daZN03gaOAyHNrpMfpTKc=;
  b=ABQ/c2yoKhofbkhhNxX2mdRhFVOXGZ3QK6aueO82XN7SEEuuK60UbYD1
   YjCvDgcNxytBzqygHvQxiklfia0Ch/ohooQK8nWgTiHOPAeeJW5mveZJq
   3WNhQO9hwf4ReS5SbWk1PMKvPPK6PFBXIHSP0nuHhSmkNWf9ApFQVmUA9
   VqwJnZ9WhD78c+we2ptLPRQCksR5eyoSTN8Np5/oFb6uNL/0ozjgJyOzd
   JhcXG3wJM7CVs+8t2sX8vf9Wpq0Z9iXQhU0mU+AF9jGZO5bOEc5qV/L5r
   BmJHVSyksPoyNBaJX/qaxsQKUgJmCtj9xvfjO8wILOvKCvBssLUQcyO3S
   Q==;
X-CSE-ConnectionGUID: eQj9O+vARM+tkWZr4vIoRA==
X-CSE-MsgGUID: JE3vZHgoR6mjhiFODc5RAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="230008210"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="230008210"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:58 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3827A42A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:58 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E0B9BC09B6A
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 081FA82A2C9;
	Wed, 27 May 2026 09:48:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/56] python3-engineio: upgrade 4.13.1 -> 4.13.2
Date: Wed, 27 May 2026 17:47:33 +0800
Message-ID: <20260527094805.2039-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127231

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Prevent unnecessary resource allocations
- Add zizmor to CI builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.13.1.bb => python3-engineio_4.13.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.13.1.bb => python3-engineio_4.13.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.13.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.13.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.13.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.13.2.bb
index f8bb87dfde..06518229a8 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.13.2.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "0a853fcef52f5b345425d8c2b921ac85023a04dfcf75d7b74696c61e940fd066"
+SRC_URI[sha256sum] = "a7732e99cfb7db6ed1aee31f18d7f73bbae086a92f31dee019bc646155d9684e"
-- 
2.43.0


