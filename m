Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDD9CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:47 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17213.1777546181570716244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nNdJpUNF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546181; x=1809082181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FKHpRRqHdQL449v29J8JjBaID3NbhwBwgzdUUgMmYmo=;
  b=nNdJpUNFtqG7CorwcKksjJt+L2vK/AU4eDQYoUbLtV1gqmYkbtF6cAi0
   CZb4MRKClGgJARUP+d7Rd70yj3AbrieaaJe2SycbvlIKz1Mo79UDi+IDl
   d1jXVr7+sA4Z3yQGahaKv1Bd6WMH2a5SYJpY/RVxwY9X3oNczAuGkdlGT
   Ao0QalHfN6+tV96oBhFv76k0NWctF8HC9fxF0Txil24uqQzCO+oafPiUY
   JIC/LU+8vVicpDwVqR0G89C2K9ZX9R6yXTsx6vqtq5mlqr5/0pf1gADqU
   UuXCt1mPxIklvBrwtyNOudW0yirdWkc8UtSEaVPPZaEt/dpDBjink7Eyn
   A==;
X-CSE-ConnectionGUID: XEscBj0/QfeUqT1nZ80xPQ==
X-CSE-MsgGUID: 9PWejTxtQVihbwoqCu5OgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238077178"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238077178"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:40 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E84451C000C3
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:39 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 94714100086D
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 063091801137;
	Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/64] fluentbit: upgrade 5.0.2 -> 5.0.3
Date: Thu, 30 Apr 2026 18:48:26 +0800
Message-ID: <20260430104924.1106-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126677

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
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
 .../fluentbit/{fluentbit_5.0.2.bb => fluentbit_5.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.2.bb => fluentbit_5.0.3.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.3.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.2.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.3.bb
index 3f3299459c..4153cba106 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.2.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.3.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "66ffbe43bd0b393ec418e6f5851a23461fa478d4"
+SRCREV = "63ed88ee65a1164b5be52b5ddab0344271a2825c"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.43.0


