Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17912C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:17:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10294.1785820656799255767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A7i6UJkJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820657; x=1817356657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIc0+Dr6RgnDc2As2oKQrkTmsrjQ/Be/OCpz5KXH/+k=;
  b=A7i6UJkJcHLKahcygWWf0CZ2IW/EBduAm9i8jgQMi7PXx5R5NQfH0bJ2
   7Kgmf2rh5myfh3v8NXdZ2iozBJKeDTordWvCAEUT5YRZOi2xlJ566XN0C
   tZ+ZqRcom8IaRsFHsWm/6pR83rJ2ojS8oEwjJgmF1TgbK9/SC72R20Zvu
   /Q3pfr5u+soH2J0eCLZN68Jiy6jpVSVquA5vi7/2yI36fhZmNCYBUm27D
   l3txrmDWNo3qcLp7Qs8pr4SOqrYH+x5e0+ILM01dUQRcizH+YoOFv8Joa
   eCTV9UQJj7EjONMAoFB3MapBRwvlS+jlIpG6SLox6TALrNfFjQMybDkD6
   g==;
X-CSE-ConnectionGUID: IUAtpR2vSE24gRR2kdAdlg==
X-CSE-MsgGUID: h4wVN98gTeeSi9XRz+KiNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="237066233"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="237066233"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:17:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F26111C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:34 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A5CC018009DD
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BCD401800592;
	Tue,  4 Aug 2026 05:17:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 02/28] libtalloc: upgrade 2.4.4 -> 2.5.0
Date: Tue,  4 Aug 2026 13:17:00 +0800
Message-ID: <20260804051726.1489-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtalloc/{libtalloc_2.4.4.bb => libtalloc_2.5.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.4.4.bb => libtalloc_2.5.0.bb} (96%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.5.0.bb
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.5.0.bb
index 3c694ea7e7..83435b12aa 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.5.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "55e47994018c13743485544e7206780ffbb3c8495e704a99636503e6e77abf59"
+SRC_URI[sha256sum] = "912afa237510ae542a7733998eb18a12bcda35ab6729c8e2ddb43e8d0ebab007"
 
 inherit waf-samba pkgconfig ptest
 
-- 
2.43.0


