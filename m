Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8961CD5BA7
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19304.1779190771985543953
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TqIygKOg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190772; x=1810726772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DryJaYeaQVXYzUaY+iwrpaBWScNbpS9bLrUkMq4Bb7s=;
  b=TqIygKOgxsLfQfUN+uWfLJbcCzZR96G+Gb8GSakT/wpxfP+5Imm7cvEE
   HUfGHb4qFS/wkLI1rz2vEDwdlP84WsAFl9iR+vD4yC2gwmJwkzpQVk2ba
   NYKXt5RcMyB+2Gci/Le4oDBb5F9u5mG4N3P5eHVcsNCBGaIDIhCivyHWM
   8MCpU1Se3xCVL9IktBGn3fXRQ8GCFiUDlv5qi2v8tEJvTZHMkxxSLSCuA
   aqVkvU/bSBzFPGHWC9QS7WLNRBm3Hv746vwo5Pigx+FRNox4daftLY1gN
   qh9BRY3FRIDN6eYqdEAE+j2yQHMI5YYNzCHwVA29i4vvbTk4LNEnQrKt0
   A==;
X-CSE-ConnectionGUID: ilmsb4h+TpWXTsd811XUaA==
X-CSE-MsgGUID: rfqVYJhGRoe0EhFokv2I5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995147"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995147"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:30 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4ADA31002B9C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:30 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 040D918000BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A30974066E3;
	Tue, 19 May 2026 11:39:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/38] catch2: upgrade 3.14.0 -> 3.15.0
Date: Tue, 19 May 2026 19:38:45 +0800
Message-ID: <20260519113921.655-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127064

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes
======
- Fixed ambiguous overload issue with std::optional<T> in C++26. (#3095)

Improvements
============
- Simplified CATCH_REGISTER_ENUM internals for faster compilation and retrieval.
- Successful assertion are slightly (1-2%) faster.
- Generic (new-style) matchers support constexpr matching in C++20.
- Added STATIC_REQUIRE_THAT for compile-time matcher assertions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/catch2/{catch2_3.14.0.bb => catch2_3.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.14.0.bb => catch2_3.15.0.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.14.0.bb b/meta-oe/recipes-test/catch2/catch2_3.15.0.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.14.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.15.0.bb
index 2aba52e7ae..e68fe9c885 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.14.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.15.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
-SRCREV = "b670de4fe12ac7c5e858b7de3a14fb4bd18c760e"
+SRCREV = "6ee0826dcae55ed1e06b2c5701981221e979e1e6"
 
 
 inherit cmake python3native
-- 
2.43.0


