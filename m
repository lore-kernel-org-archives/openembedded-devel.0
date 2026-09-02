Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ADEC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:12 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9749.1788345005384427034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QBZ5T6ZW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345009; x=1819881009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oH5F8EnoASAhRp9nqACNHz+lVG4a9spe/Gsal1XK1KI=;
  b=QBZ5T6ZWs7zKE+pMJuUIidSnLsbqBlA9p6ui6EVVhxLIy/kcih4bSrI4
   RbKamUSfCUgmhKUBC1dWlK79xXEJXh3cuOGoPmoaU3Rx8j5kavujN1m2M
   niQx/Qt9KzkUxHSdpE8/3FRqbd+m6TM1oxiZLJbzMDyiZwcgwxKRHqB7y
   L/VP6HUqqr+Wmxt08vrp2sBPXSkLUFfbZiyTOqeCZ4DSLLlS6ugWQELRk
   JTm7rKxLZIiXLKvhjksHoTS5hRXBpkq0U0X68pDX7XEb3CJnhboX973yq
   T0MG2pNZQPbYY1/Z2Nsm3y3GHk7QVA3R6AWDNor21yYzG3IaysXNmw12X
   w==;
X-CSE-ConnectionGUID: 9f9eDkm8TV6obtVc/e7b0A==
X-CSE-MsgGUID: V+Wg7GDAR4+rZT73Kyanlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="231299247"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="231299247"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:08 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D733A10000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:03 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7CF311C00174
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9C7352000224;
	Wed,  2 Sep 2026 10:30:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/34] uftrace: upgrade 0.19 -> 0.20
Date: Wed,  2 Sep 2026 18:28:58 +0800
Message-ID: <20260902102900.1296-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129691

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.19.bb => uftrace_0.20.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.19.bb => uftrace_0.20.bb} (96%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.19.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb
similarity index 96%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.19.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb
index cfef1851a5..28c2186418 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.19.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " argp-standalone"
 
-SRCREV = "de15d0cf2730eedae1685d214f54b352530d1aa4"
+SRCREV = "842ed731248a9daded38774d8fb26c7b09474461"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https;tag=v${PV} \
            file://0001-include-libgen.h-for-basename.patch \
            "
-- 
2.43.0


