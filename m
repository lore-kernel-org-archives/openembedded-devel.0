Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F51CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:08:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85.1778645313860306422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZwgeMj++;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645313; x=1810181313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bFYTT5QGoJsu2XBsloZgg6a4eVBLEdFNwvoomcQCqGg=;
  b=ZwgeMj++RC+/4psRIyHH06sjDyE+IIZ+faS58SVYj4khh/uA7wzvNhOL
   Iky13zBf0hDVpNnWkdWilmE8AdpxOze1kU8nGjiFddfXbLaQtL0pVeJ77
   7zioUKqNAJAQrvmlLOApFiHWXj82bqOahJqoVw79tVzJGFmlWRzstd2aZ
   XAwb4640LhhhJyGRyg9wosdHF4z4ReoOlc4RZyPRYswkInFbo0/oUVk8/
   dgB10AX6SDKqmurnXB6lCat+5Avg5GGmwe+gTgKpXIM0xQruPSvvoCt1y
   CHYkjGbTp7r3vptC8d4zK8OdiZCSwd/tn6Bi16y+n0q7lVFPJ3n56IdmY
   g==;
X-CSE-ConnectionGUID: H+SHh5bWQpyx8KqqM4L4Pg==
X-CSE-MsgGUID: +IUgRFGPRFS7uiW/qrvq9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="219131065"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="219131065"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:08:32 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1D6E71000376
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C48F31009E12
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 47A0C1400251;
	Wed, 13 May 2026 04:06:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/56] fluentbit: upgrade 5.0.3 -> 5.0.5
Date: Wed, 13 May 2026 12:05:05 +0800
Message-ID: <20260513040555.377-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126897

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- tests: integration: introduce in-tree integration test suite
- parser: Address wrong assignments of timezone at midnight
- release: update to 5.0.3
- workflows: Unify steps of downloading built macOS packages
- record accessor: fix CFL root-key matching and container translation
- env: add new extended format to handle environment variables
- out_s3: fix retry_limit semantics and multipart upload memory leaks
- lib: cmetrics: upgrade to v2.1.2
- in_tail: harden db offset restore across restart
- oauth2: restore legacy context creation behavior
- network: Handle baraketed ipv6 addresses
- in_opentelemetry: fix tag routing issue
- http_server: add settings for ingress queue
- out_syslog: address invalid configurations on in syslog
- input_thread: replace raw read() with pipe abstraction to fix crash
- workflows: Windows docker insufficient disk space fix
- http_client: enhance parser in timeouts and protocol parsing
- in_ebpf: add tcp trace

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_5.0.3.bb => fluentbit_5.0.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.3.bb => fluentbit_5.0.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.3.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.3.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.5.bb
index 4153cba106..d9df95e45d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.3.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.5.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "63ed88ee65a1164b5be52b5ddab0344271a2825c"
+SRCREV = "05121015a78b81ab59ceaf86e9fb935b71f48ec5"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.43.0


