Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0F2C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:38:19 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.41849.1718570294954360372
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AvGKoxnL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240616203812251ea5005c058cd605-umgnhl@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240616203812251ea5005c058cd605
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:38:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=41GkM8Eha9vqYM2FmOmrM3di9IqedUk5P9swJtq+Ty8=;
 b=AvGKoxnLEKF3/C4brUN1XFMjqK/fYCu4jYwYNi+4tXwtODZlXB/7t9K0iGc2bc0YOcQQKo
 ECnJBIOftrF5wcMjRhDkxXdTKM5TlqtLlguFwEdcQAjJFABKKdL47J9DYuUkBDIy263dj8/G
 5sW2jP1gRMv0YhyiKvJJI8ppQqRnQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 2/6] uriparser: upgrade 0.9.7 -> 0.9.8
Date: Sun, 16 Jun 2024 22:36:47 +0200
Message-Id: <20240616203651.856968-3-peter.marko@siemens.com>
In-Reply-To: <20240616203651.856968-1-peter.marko@siemens.com>
References: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Protect against integer overflow in ComposeQueryEngine
* Protect against integer overflow in ComposeQueryMallocExMm
* Require CMake >=3.5.0
* CMake option URIPARSER_SHARED_LIBS=(ON|OFF) to control, whether to produce a
  shared or static library for uriparser and that alone, falls back to standard
  BUILD_SHARED_LIBS if available, else defaults to "ON"
* Document that scheme-based normalization a la section 6.2.3 of RFC 3986 is a
  responsibility of the application using uriparser
* Document supported code points for functions uriEscape(Ex)W
* Update Clang from 15 to 18
* Adapt to breaking changes in Clang packaging
* Get sanitizer CFLAGS and LDFLAGS back in sync
* Pin GitHub Actions to specific commits for security

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb} (84%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
similarity index 84%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
index 421263e62b..3d76190d39 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "11553b2abd2b5728a6c88e35ab08e807d0a0f23c44920df937778ce8cc4d40ff"
+SRC_URI[sha256sum] = "4cd0e4f93b477272fabceeb0202f269169fe6ec3044e10fac6acbcdf354bb080"
 
 inherit cmake github-releases
 
-- 
2.30.2


