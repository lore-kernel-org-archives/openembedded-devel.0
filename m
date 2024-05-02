Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9445C25B77
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.6641.1714628972752084489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CGFECXrQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628977; x=1746164977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0SHJjjUNV8sgXdxgLX/OiiHEuMJNZoxPogOVVxntUYo=;
  b=CGFECXrQIHcAohEc07e7IZXFgpFZn+tYxF+/IAE1Tn67sA6kYiIKbvxg
   JA0t1HfCOkjHEl5FwGQ8bFsSjjaOXkffEwGU88OkyxPU4WILkRlpw6QzW
   hRmU99dOSxR8I9ZVjy7Ytna3oTmPDjCGWEKCXgCguOkPVcBW21uues9Qz
   uSPNK0zvAXQct6ow6HcujvrwC+BtDdosi+OFjp7CGRWRFMrMiIS+LZ6gq
   VAfyUZ717XbAErpEJowAbnoB6omiHsc1v7aGu52L9Huw0k7JGQN3q3yoO
   QtkTEb7ga252TYl0ETcYOWlNkEzyAnrDGIxeJnXiY+JxLs8JXIqH3cAfJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157117704"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157117704"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC8D0C2ABE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25CA5CFBBF
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B46C8223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 621B51A000C;
	Thu,  2 May 2024 13:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/30] spdlog: upgrade 1.13.0 -> 1.14.0
Date: Thu,  2 May 2024 10:48:26 -0400
Message-Id: <20240502144829.241208-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--3.288400-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrK2GKtdiFmTm/KKbZKt0GTmmK
	T/2E8HDdmzlkx0DCIOtiSPqA3YPKL2+q6t+f1BKUw2hGLzP0sw4XivwflisSrKpJJeOmt6X/AHT
	QICrB0hGEkt/L8HtAJ5lPyeZmj2J3NBtwY9jrji6OjIrMSa2sR9hQO8CvZj/XsMZG2pUzAfO0pv
	xdZww2r/+cwEGCDjTvLJE/uNR38CjkWQ892nFTzKwBF+5NRZ1arOCEGIPhtwial2k3ufmkfb6px
	bTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16ukWNC
	cn0XQOLegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLM1Z8R
	Ujs2+c8Vfls4kVRNs09KA7G0+n7/6JSCGTSUsMgI9H4XZPDWGfqj9WM5o09MzqVtx+eaRKKkEgD
	hulju0ZN708x0rYoQhyadlGFXHKsTgfCdKUS4cicSkmYsAV+kLUU1zqiphVX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110230

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Updated bundled fmt to version 10.2.1.
-Mapped Diagnostic Context (MDC) support
-MDC is a simple map of key->string values stored in thread local storage whose content will be printed by the loggers.
-spdlog::mdc::put("mdc_key_1", "mdc_value_1");
-spdlog::info("Hello, {}", "World!");  // => [2024-04-26 02:08:05.040] [info] [mdc_key_1:mdc_value_1] Hello, World!
-Add milliseconds support to stopwatch
-Add std::string_view overloads for logger accessor
-Make async_logger::flush() synchronous - wait for the flush operation to complete before returning
-Use _stat() on Windows to be more UTF8 friendly
-Add details about how compile time macros work
-Fix typos found by codespell
-Expose the flusher thread object to user in order to allow setting of thread name and thread affinity when needed
-Fix the problem of compilation failure under MINGW
-Add missing include in circular_q.h
-Don't remove previous defaullt logger from registry in set_default_logger.
-Remove the legacy AnalyzeTemporaryDtors option from .clang-tidy.
-Updated INSTALL.md has to better reflect compiler info
-Fixed README.md example

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spdlog/{spdlog_1.13.0.bb => spdlog_1.14.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.13.0.bb => spdlog_1.14.0.bb} (91%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.14.0.bb
similarity index 91%
rename from meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.14.0.bb
index c6a0881db..aa55171f3 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-SRCREV = "7c02e204c92545f869e2f04edaab1f19fe8b19fd"
+SRCREV = "238c9ffa5d1a14226eeabe10c9b63ffff3ed8b8e"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
 DEPENDS = "fmt"
-- 
2.34.1


