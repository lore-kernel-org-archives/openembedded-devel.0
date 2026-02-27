Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B7FFD7F71
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92448.1772187280844897169
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FMtZNMXg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187281; x=1803723281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YRouI5nd9PTggKSTrYQxpn+fV12D4spSRqG8FXp2/v8=;
  b=FMtZNMXgWq1y1yWlRqK4wDMBcG0jAizzX+5+4wMlfTnao09QI2Ot3g8j
   V/Or37F+y0rkpcWGL1byhmN3sk6GAqB/koNZf/wYNeT++K9SUL7HucA3F
   CI3cgkOJPdPFNAgSBqfSfK1sX1j/ffFUdnxy8y+bdTtsSooSPHUZuYJnh
   AEiCILNJjRTRXCWHQxhGjgp3t+RzMrD391t+TOyo3ZloS9FLA9U0LCjjM
   LUq2+HnvZp0uDv0KBucBzsnZIWSrpdnUS9r174wVJM8xg+Yve9ZeO09aW
   yZUL7GGjzCONRiRt3FHAe4XfneMxT5aP5Al7UwwrN23Q1+AVE27iCP1M6
   Q==;
X-CSE-ConnectionGUID: BMmNUEKpTBKRgSsmaTuUWg==
X-CSE-MsgGUID: rmbu+R8JTNK+Q7ZVWkWKZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740555"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740555"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 5F7201002B98
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1734CC06D46
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2FA24180059F;
	Fri, 27 Feb 2026 10:14:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/52] python3-psycopg: upgrade 3.3.2 -> 3.3.3
Date: Fri, 27 Feb 2026 18:12:58 +0800
Message-ID: <20260227101327.1432-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124723

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Retain Error.pgconn when raising a single exception for multiple connection attempt errors
- Return a proper error when server sends ErrorResponse for a Sync after a Parse

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.3.2.bb => python3-psycopg_3.3.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.2.bb => python3-psycopg_3.3.3.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.2.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.3.2.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
index 5ca565504a..d6df529686 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.2.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "707a67975ee214d200511177a6a80e56e654754c9afca06a7194ea6bbfde9ca7"
+SRC_URI[sha256sum] = "5e9a47458b3c1583326513b2556a2a9473a1001a56c9efe9e587245b43148dd9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


