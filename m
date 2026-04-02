Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C671112276
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7242.1775096160569544124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e3VK2i5z;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096160; x=1806632160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B4KRhDcpbXCY/n/JdHGk6VKWI9lkM9A78icg5MtK2T4=;
  b=e3VK2i5zMHV3wHw3wwFIKIeyZnIK6ItrI2VuOLejoar4GyglrpL+JoNk
   w+58gDcq3sDosx5EDfYP9xzg5pTevhkJ+3bXNztr+BUJg8N18X+i09bnu
   qG5C1BSrqBOZsPPGOlOxlfNvhbJjQf0NeS292IxV/fSu5v4AwIZlmj1iw
   Cju+ghnpAB5NQwOZfd+wmKp4XovxqvnTbWDqgKkjdphsryohLjt6+2vH2
   FJ42gXidVF6PMOM20PII+OKv4C8OawJqrQ7WUdYOeZ6+1W6n5HIneZEo3
   4TQOy8MEr3nEmCx/N2VZh4NyZFzev739jRmEfPOf40lt6yj0JtV70bR0m
   A==;
X-CSE-ConnectionGUID: t7IemQiUSfOi+AbvIaJTjA==
X-CSE-MsgGUID: 4u16yLLOQ8KV/oT7h+iXIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214501931"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214501931"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:59 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 209F41002BBA
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:59 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D149418578C2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6A11E1003740;
	Thu,  2 Apr 2026 02:15:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/39] python3-sentry-sdk: upgrade 2.55.0 -> 2.56.0
Date: Thu,  2 Apr 2026 10:13:48 +0800
Message-ID: <20260402021355.1324-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125948

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- (asgi) Add option to disable suppressing chained exceptions
- (logging) Separate ignore lists for events/breadcrumbs and sentry logs
- Set exception info on streaming span when applicable
- Patch AsyncStream.close() and AsyncMessageStream.close() to finish spans
- Patch Stream.close() and MessageStream.close() to finish spans
- (starlette) Catch Jinja2Templates ImportError
- Add note on AI PRs to CONTRIBUTING.md
- Pin GitHub Actions to full-length commit SHAs
- Add -latest alias for each integration test suite
- Use date-based branch names for toxgen PRs
- Update test matrix with new releases (03/19)
- Add client report tests for span streaming

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.55.0.bb => python3-sentry-sdk_2.56.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.55.0.bb => python3-sentry-sdk_2.56.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.55.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.56.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.55.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.56.0.bb
index ac57d3b0ac..4833feac20 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.55.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.56.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "3774c4d8820720ca4101548131b9c162f4c9426eb7f4d24aca453012a7470f69"
+SRC_URI[sha256sum] = "fdab72030b69625665b2eeb9738bdde748ad254e8073085a0ce95382678e8168"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


