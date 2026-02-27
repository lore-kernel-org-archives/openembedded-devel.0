Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD41FD5338
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:13:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92724.1772187222069460780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ssWJ99RM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187220; x=1803723220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NPO+75ad0WFvUUfOYzAcA08SpKSwwhvqgOwX0szlQ6E=;
  b=ssWJ99RM+KB8niSf7vV43XC2QZBX1ZaAG93gifkw6NXJuYkSBiJbvWBB
   fKKo57tMifo8I1Y/LX4yCz/LUE6huC1jU8Gu+YdJWOHhAZKmKcHjwhiMA
   Ywo0z67Tn4yIEHZdh+PXkse/xRkuo+R9bgPT8Hidn6lBwbIUwavZiopL5
   PqjkvTIIojbwxwfgIGVW4EpGgz2CM4dGe1jH3BoUqLIwaeT9yhKCOZmPO
   e8FT+u3Gxoafbe6D3QkRKiT+ftTtEMqUbBZmTH6PEEY7+NL5JWMCIbEFZ
   XE7KcyP64fZpxW5biI5cglUi7jXr3Z7g5qL1jZxYPjJaJSiFD2iF58fGB
   Q==;
X-CSE-ConnectionGUID: W4lfBzY1Q0eHiYihM1TABQ==
X-CSE-MsgGUID: I6NWYdXOT2uJqSbmAPx2Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231299897"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231299897"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3DF9D1568
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:40 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E7D781009E0A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 12EE8180059F;
	Fri, 27 Feb 2026 10:13:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 03/52] python3-coverage: upgrade 7.13.2 -> 7.13.4
Date: Fri, 27 Feb 2026 18:12:38 +0800
Message-ID: <20260227101327.1432-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124703

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.13.2.bb => python3-coverage_7.13.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.13.2.bb => python3-coverage_7.13.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.13.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.13.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.13.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.13.4.bb
index 23d49524cc..b02f38e568 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.13.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "044c6951ec37146b72a50cc81ef02217d27d4c3640efd2640311393cbbf143d3"
+SRC_URI[sha256sum] = "e5c8f6ed1e61a8b2dcdf31eb0b9bbf0130750ca79c1c49eb898e2ad86f5ccc91"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


