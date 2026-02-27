Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BBAFD7F84
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92470.1772187323491339922
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gu6cRjg+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187327; x=1803723327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xviz+oFAHUyWVWpz/EI2n97l4nunIJt4xRaIFF0u0CQ=;
  b=Gu6cRjg++tpnrcqJY3XWvVKReHnrhiTZPTr12jft3rnYADg3YsGjIyFQ
   RF+Vv7X0ZXpdNdNQKp+BaJZyZhiUM1TZAUxU5MUzPBt5HHBkWZm9haric
   YGo5KtOzZCkugZ78NZAV2D+wpw21h07EVDhzSSwW2qTWnbXi5eGEg8xu1
   ganJ4+NnL01yBN9SZ8/XGXwqN+oRq1NNcYO+GTDH4lJ5s/4bzJJGgwdh/
   gOEbfeXPMgH0lEnIvSd57iZsp/UEwjM/HxxL3S+X3hqXCMMy/6hVFmcM3
   6+qd8f/wqVofXpVHx8x2A/FZRFhpdwg7nFs1YE1YJciQtQO+gbh2yOZ5g
   g==;
X-CSE-ConnectionGUID: aOcRuC6UTuqxpIdH4/ZrBg==
X-CSE-MsgGUID: k6Er1KvPQiWqqG+aBrP8IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740634"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740634"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 6AF998203D5
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1FBB2180ABD1
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 38C9518005D0;
	Fri, 27 Feb 2026 10:15:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 41/52] stunnel: upgrade 5.76 -> 5.77
Date: Fri, 27 Feb 2026 18:13:16 +0800
Message-ID: <20260227101327.1432-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124741

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Security bugfixes
  - OpenSSL DLLs updated to version 3.5.5.
* Bugfixes
  - Avoid attempting to fetch OCSP stapling for PSK-only
    configuration sections.
* Features
  - Merged applicable patches from Fedora and Debian:
    - Use SOURCE_DATE_EPOCH for reproducible builds.
    - Skip the OpenSSL version check when AUTOPKGTEST_TMP is set.
    - Enable PrivateTmp in the stunnel.service template.
    - Clarify the manual page for the "curves" option.
  - Log client IP addresses on TLS errors.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/{stunnel_5.76.bb => stunnel_5.77.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.76.bb => stunnel_5.77.bb} (92%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.76.bb b/meta-networking/recipes-support/stunnel/stunnel_5.77.bb
similarity index 92%
rename from meta-networking/recipes-support/stunnel/stunnel_5.76.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.77.bb
index dcd3d8cdf1..954fa896ba 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.76.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.77.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "cda37eb4d0fb1e129718ed27ad77b5735e899394ce040bb2be28bbb937fd79e1"
+SRC_URI[sha256sum] = "ec026f4fae4e0d25b940cc7a9451d925e359e7fd59e9edad20baea66ce45f263"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


