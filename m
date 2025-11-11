Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83991CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12605.1762847742201354430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HZvSVNdf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847742; x=1794383742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8TD3HdGoSuobx4KiAnxs0kWr0Q8CSoVWss+zUHPZog0=;
  b=HZvSVNdfw1agcyqG6TRKdq3yTSio65A1zrXXTwvd7Lgh/2uyIasaKJiV
   sXB17iWYP5CeuX41By8dqr9qyan+oJuRgnl6BoBzUKI+YKMvqOtjdahh0
   vpK6dFxtmd3adbN5HwZ9wDeskIhSpGlI1OrwZRcNAX6PjY6ik7WnRX782
   FWKoZuzXX/ud5kxKvLHxmkHb0LPYAlOAGQtf6gzn/40Io68PEWDIVbely
   miTx5kM9fEaZJXUcKKakJi7R/J5U77xSezK0BmYEzOD6TlTwH5NXnN7hv
   x0Oze58KQqVDj8SL6J6zmhXwVO6kw5XltkfqQBbb/KM1dYrzsu9I8qJq3
   g==;
X-CSE-ConnectionGUID: Mxrv9xnoR0KU7hRQYr/g3w==
X-CSE-MsgGUID: abR69QTNTHK/UqSRZ2GcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218201523"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218201523"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:41 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A4AA010029A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:40 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6576818000F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id EA1531800D78;
	Tue, 11 Nov 2025 07:55:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/23] python3-astroid: upgrade 4.0.1 -> 4.0.2
Date: Tue, 11 Nov 2025 15:55:03 +0800
Message-ID: <20251111075517.1650-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121488

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Handle FunctionDef blockstart_tolineno edge cases correctly.
* Add "HTTPMethod" enum support to brain module for Python 3.11+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_4.0.1.bb => python3-astroid_4.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.1.bb => python3-astroid_4.0.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.0.1.bb b/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
index be69adeee5..034d9c405e 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "0d778ec0def05b935e198412e62f9bcca8b3b5c39fdbe50b0ba074005e477aab"
+SRC_URI[sha256sum] = "ac8fb7ca1c08eb9afec91ccc23edbd8ac73bb22cbdd7da1d488d9fb8d6579070"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


