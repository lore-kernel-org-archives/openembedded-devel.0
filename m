Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EA4C44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4911.1783503954141676684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VpCqbZCh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503958; x=1815039958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pDY9KOF96Z4eTUFRx2N9IXipUyBmSh8WGaB6+bQBIQE=;
  b=VpCqbZChd9Te/Kc1uwHvOjZoceJF1ocgcDq48LTul2bfBv6oyWKxrbxC
   EaVfN8ukNATT/b8ekFGg1Fsi1+8Hj6t5GGlhBiNZpl3gceeUVBTJ7QPAX
   WVyYMZCYXze5rv1nDUBwDLMP5eiHvZUsXO76XJliXVhB04HI3Nne1KbQy
   GPvW62mQ2QVVoknFQ7TE/WMrKBkly+6gnWg9bHjYczQjMw1I+89E7yv38
   ryQQGNF9D1GOgwpuWXh6epWMracDMqhIwVm/kDwxvAxuuRCdbrXOC6zle
   rXDdXnG2VN7KXL2I3naAUynFvF8eBZIub8uHeGJiKJcM6GBPD22q7UeWg
   A==;
X-CSE-ConnectionGUID: luWZ9xnSSWqhGxTlU/hp8Q==
X-CSE-MsgGUID: M6ssuNiyQRGasmItG80nvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="224395723"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="224395723"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:57 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C21451002812
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7EB04C060AA
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9AE291800C26;
	Wed,  8 Jul 2026 09:45:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/37] python3-responses: upgrade 0.26.1 -> 0.26.2
Date: Wed,  8 Jul 2026 17:44:36 +0800
Message-ID: <20260708094508.2060-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128097

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Default headers (such as "Content-Type", "Date" and "Server") are now stripped
  from recorded files regardless of header name case. Previously, responses recorded from
  servers that send lowercase header names (for example over HTTP/2) kept these redundant
  headers in the generated file.
* Fixed 'query_param_matcher' mutating the caller's params dict when numeric
  values are provided.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.26.1.bb => python3-responses_0.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.26.1.bb => python3-responses_0.26.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.26.1.bb b/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.26.1.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
index 45b8eadb67..2fd5c86f33 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2eb3218553cc8f79b57d257bac23af5e1bf381f5b9390b1767816f0843e01dc2"
+SRC_URI[sha256sum] = "9c9259b46a8349197edebf43cfa68a87e1a2802ef503ff8b2fecbabc0b45afd8"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0


