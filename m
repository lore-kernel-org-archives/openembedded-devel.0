Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195B9CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:07:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79.1778645272151165598
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mLrUDzoQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645272; x=1810181272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pUGLzccKJ4BXoaCT4vy6fMlWH4RCzcdlE8WN4UDFueQ=;
  b=mLrUDzoQODYeKnKcL62WZsOxzECZntfr3XjDQQ6aCj5GqA7vGP9bf3la
   DEUmeJqQRBb7Km9hojCPfYz9I615PDKbGgBgZeFHk4h53RWG8K+FOH27b
   KMsnLHxmSMQQgvDSdFKSkF08EOfGO/Vtp60VqHKHmQWVFEAYV6gk9Q9Fh
   EkpQkyxfNBvXJ59Lp+e5+vYXxqwQyLgL6faACa2h7TCsnuuarfZmxiMHn
   AcVUi7GDzTSTFrM0pmI/pXo1unnZxLlB4XlAy1XeoS4afrI21l+Nbrmrg
   SxkTejZLbEdQsgAYd4DSwr/MprRilvlAfN22Ilr1QP+bB2rIIR2IhB+T1
   A==;
X-CSE-ConnectionGUID: SuWmwDRGT3usqXgteGFsPA==
X-CSE-MsgGUID: m1QO0a/UQP2v8Xbv++NXPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240256604"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240256604"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:51 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 907F11002BA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4B3F9C041D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E3E9D140008F;
	Wed, 13 May 2026 04:07:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/56] htop: upgrade 3.5.0 -> 3.5.1
Date: Wed, 13 May 2026 12:05:07 +0800
Message-ID: <20260513040555.377-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126892

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Consolidate ClockMeter code into DateTimeMeter code
* Darwin: Fix unsigned underflow in memory meter on ARM64 (Apple Silicon 16K pages showing ~64TB used)
* Linux/PCP: Replace M_SHARE (SHR) with M_PRIV (PRIV) in default Main screen columns
* PCP: Fix dynamic screen column (instance) sorting (incorrect cast and field offsets)
* PCP: Fix units used when printing M_PRIV memory column values
* PCP: Add Darwin swap metric values and a fallback on Linux for SwapMeter
* Fix null pointer dereference in actionBacktrace() (GCC LTO -O2 -flto, Ubuntu 24.04)
* Make search function activate following on find consistently
* Make a panel click abort the search function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/htop/{htop_3.5.0.bb => htop_3.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/htop/{htop_3.5.0.bb => htop_3.5.1.bb} (96%)

diff --git a/meta-oe/recipes-support/htop/htop_3.5.0.bb b/meta-oe/recipes-support/htop/htop_3.5.1.bb
similarity index 96%
rename from meta-oe/recipes-support/htop/htop_3.5.0.bb
rename to meta-oe/recipes-support/htop/htop_3.5.1.bb
index 961a87097b..3043f9348e 100644
--- a/meta-oe/recipes-support/htop/htop_3.5.0.bb
+++ b/meta-oe/recipes-support/htop/htop_3.5.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses libnl"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https;tag=${PV} \
            file://0001-configure.ac-Remove-usr-include-libnl3.patch \
 "
-SRCREV = "a21f043b253a6dfa89df1ff4130fe7d2e505000f"
+SRCREV = "82841011ac3e2ec6ee4d3dbdf80f8d26797abbc6"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


