Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02E3105A566
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18769.1773312822692552568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h+gf18Jl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312821; x=1804848821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TgIzdMTYCWZT+tCHU4OZvhRcB0k/nGtJyPdlkAuDkm0=;
  b=h+gf18JlGLaLnZROUWQZ1e2/mhOH9PNf64Yr+qXDbIzbevEB1XUUGAfd
   XISDpu80lXXd4gl/bCtlRA4YrpBDRaWev0+/KvnUymvi+49+3VnHXTNMP
   28gXSrrKsrvYVPf7dyBuKJGd7rvWSrpV7WG8X3FEH3S5gYoDuj2YhFeAy
   7wn0MZDPH4JCH7ZBx+4eqQWwJiE5ervnOTd94MadEGB3RGqWllNezNWQ4
   bmVsqGjAPPmwJFTjXm9tK4MpQ0j5u5UUosVTfzjvBMhQNOdn2LLrYj9f1
   ixG4/mawkRJCtWO7DJAmHUzda8/7u38znKbBw785CgX6e7MHujspCbJwF
   g==;
X-CSE-ConnectionGUID: 5AtQumC5Se6kcNgE5AyB+A==
X-CSE-MsgGUID: VTcKBp3AT36+ymG3orVOyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233021534"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233021534"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2C94A8241E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:41 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D2FAD86125C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E02BE18005BE;
	Thu, 12 Mar 2026 10:53:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/64] python3-filelock: upgrade 3.24.3 -> 3.25.0
Date: Thu, 12 Mar 2026 18:51:51 +0800
Message-ID: <20260312105220.1856-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125135

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Suppress ValueError in _try_break_stale_lock for corrupted lock files
- Fix ValueError in _acquire_transaction_lock when blocking=False with timeout
- Add permissions to check workflow
- Move SECURITY.md to .github/SECURITY.md
- Standardize .github files to .yaml suffix
- feat(async): add AsyncReadWriteLock

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.24.3.bb => python3-filelock_3.25.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.24.3.bb => python3-filelock_3.25.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.24.3.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.24.3.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.25.0.bb
index 8458ad42f6..91faecc92b 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "011a5644dc937c22699943ebbfc46e969cdde3e171470a6e40b9533e5a72affa"
+SRC_URI[sha256sum] = "8f00faf3abf9dc730a1ffe9c354ae5c04e079ab7d3a683b7c32da5dd05f26af3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


