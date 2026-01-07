Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB9FCD5834
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3064.1767781769889864260
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DfdyKfrE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781770; x=1799317770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r1/fsVZNvk4CCb0ewv2w7WQWoJ7TNhsNcz9p3yFXHa8=;
  b=DfdyKfrEpo8D3coRQpzeOgj0XPF1AR59XkFVAEygAK3bnkN6ZmUZRxjH
   Szak+bcdOr/vqNwEMdPnY/VgE6RFO8A9kxYEtX9eu2TnP0mRRax/MDlbC
   fVWHuiSRw0u672aYWEsIZzhqmr5/brOC5QSxfDGgb+SMhAZAt4F5gFpWb
   jP4XCX2CcaePx/Biqdhd/dqAy4vjOYeqpp75cQyGqQFYRg9y5UWXvRdAt
   uZ8NdyYmfgy/j/L7aAUsnJ5QwLtIECp/PWuGZp803TJcPd1OdG4Ret586
   tJcuhbhdUjP8iTy8SZvHvWXvYQZv6qT+sTybbxk6DHh6V8ib3z4PHClUf
   g==;
X-CSE-ConnectionGUID: b7HZ9RR1SvmY5Jp9CtdNIQ==
X-CSE-MsgGUID: /Mf9hsbhSAK4cknR/6ok5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225092708"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225092708"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:29 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3951542A309
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:28 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DF7B01005971
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 25BC382173A;
	Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/24] python3-astroid: upgrade 4.0.2 -> 4.0.3
Date: Wed,  7 Jan 2026 18:28:44 +0800
Message-ID: <20260107102855.228-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123211

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Fix inference of "IfExp" (ternary expression) nodes to avoid prematurely narrowing
  results in the face of inference ambiguity.
* Fix base class inference for dataclasses using the PEP 695 typing syntax.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_4.0.2.bb => python3-astroid_4.0.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.2.bb => python3-astroid_4.0.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
index 034d9c405e..efa59fc198 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "ac8fb7ca1c08eb9afec91ccc23edbd8ac73bb22cbdd7da1d488d9fb8d6579070"
+SRC_URI[sha256sum] = "08d1de40d251cc3dc4a7a12726721d475ac189e4e583d596ece7422bc176bda3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


