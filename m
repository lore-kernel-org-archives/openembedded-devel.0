Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD09C55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10160.1785820709371168120
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VPYBvtZH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820709; x=1817356709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ErexE1l+CL6WkfFyNfboQ2ZL/kxHUlRESCGOnWnps6k=;
  b=VPYBvtZH3U24pu4strZGq9S8AQ/rVkhHi6C3EBimX6lBmRsZIr36NDNf
   NDe3Y1Nj2EUCMAD7YcNjlQNnCuRMs07astPY7u5GZp/Ri03BJ/H0muumi
   /fkI//X7xWxHx9wHwqPak6RfTkZTbslHAspBZx2Ki2ScYGbgBs+9BBNF/
   C71B3+Hy9M21Y23nPkK+Dbm1210p3sRqNZquhL6CHyKUj5+yXcPM9jhDk
   eH+in32iHmq5qMTpmlSrZuUFSb6k5e/XW/SMo7s+BU+5bLKU5N+B6TqDx
   ImI8wR6m2Ic5EIGqNmmEj+ITXkLLacOXpZpR7048z01gUO7kuSsviVg7C
   g==;
X-CSE-ConnectionGUID: BF3mGIjvRbCDJkTXQZKIug==
X-CSE-MsgGUID: preYwsvfQkCzMJ7Loj9hYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="228505281"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="228505281"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:27 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A38B4C006D8
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:27 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5AFDE18000EA
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5FB221800131;
	Tue,  4 Aug 2026 05:18:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/28] python3-filelock: upgrade 3.32.0 -> 3.32.2
Date: Tue,  4 Aug 2026 13:17:13 +0800
Message-ID: <20260804051726.1489-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128720

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.32.0.bb => python3-filelock_3.32.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.32.0.bb => python3-filelock_3.32.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.32.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.32.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.32.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.32.2.bb
index fc59eaedc4..103957dc42 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.32.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "7be2ad23a14607ccc71808e68fe30848aeace7058ace17852f68e2a68e310402"
+SRC_URI[sha256sum] = "c33351e1f49cae33414acbc6d56784e6ecee82514ec90795da1161fc4836b5b8"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


