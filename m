Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D73CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12747.1762847728533028339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ar0HbuNp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847731; x=1794383731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OrOjqSeKVT3R46ZDjvCgPkpoD7432BqwnA6d6CdEAB4=;
  b=Ar0HbuNpz14PkptfNwviCExUDhfgZm+ZnroPyE+by0i7yC7T3GnT6iW4
   9U0tgMr/WFfYnWXHR/R5vT3/BZw+eX5v4QDUIw63uucsZ7kOCcWNEvPDU
   8md4j0Y+HYvyc0GhwmJWEJF31ueSUpWyjPg+iFf+KKemynLNZAl7Wu0Ma
   qEXebOchzYJ3tFYOX1NbKsn4x/ca9sZLQW7EPN8jTqGRVgHCKyhnIlr+a
   +BRXQF3QBfg4Yb82LL5kGKgjQmKytl+2nAEFOwXDDly6prFEH4/xbzOJZ
   q6X77dGtobD98EGkk0qkuUgnqm/mbh2ajMf/BbLH2GfmK+jFtsBJXqZ3Z
   w==;
X-CSE-ConnectionGUID: N+rpm6p6Tzyib4lfVxGspg==
X-CSE-MsgGUID: w7vmY1LNQTSYGdJsl+wwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="207370131"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="207370131"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 85542C000AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:31 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 405C2C011A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A2C811800D78;
	Tue, 11 Nov 2025 07:55:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/23] fsverity-utils: upgrade 1.6 -> 1.7
Date: Tue, 11 Nov 2025 15:54:58 +0800
Message-ID: <20251111075517.1650-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121483

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  * Allowed fsverity-utils to build when PKCS#11 support is not available in
  OpenSSL.  In that case, 'fsverity sign' just won't support that feature.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{fsverity-utils_1.6.bb => fsverity-utils_1.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/fsverity-utils/{fsverity-utils_1.6.bb => fsverity-utils_1.7.bb} (95%)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.7.bb
similarity index 95%
rename from meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
rename to meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.7.bb
index 840c04e52e..2f82518e11 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.7.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
-SRCREV = "2543e6e5037c0b1b448282c2793f8a6ce8b12d71"
+SRCREV = "96d12bd0d34a034d6e0b85512422f0d6df3c7c4a"
 SRC_URI = "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git;branch=master"
 
 
-- 
2.43.0


