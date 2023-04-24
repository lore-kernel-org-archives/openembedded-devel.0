Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EF1C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:25:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.43136.1682306698583203416
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cjwYiMzZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306696; i=@fujitsu.com;
	bh=ZHSTv7U2/Mb1EN4vrBoXHvjFoO3CA9dl759iHfQyYvE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cjwYiMzZoLHsGsRM/2O5wAiicEDguvW37x8zLgZWg2rcfecWx0KfxT6SMCfFTielG
	 ZYxRJ/pJC8l6oQyXbQx1noXVVo8ZyHISAG01hWrL7+1A8uaxse6K5p3optZ4X5BDcB
	 /sJPB19K4lQk/ZynlMoYHi8IuQsxUeVcU36Ev8VkLVMr8iO3aOLHnG0L5il3SnSiY7
	 1tDC2QOlhAHzkehuoXkAI+y9Z72qoml7PYhuI9tDSSHz56PmnZH4c1Ly/m0yKmR+3J
	 9OoPxpICulS6s3fR82Oe+YtinJJYisNt/rgmjrkopmn2d5+9gKszIYao5f6KmBMf1U
	 NFe8FqYr7l6jA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWbf9m2u
  KwZy9xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8azex9ZCu7zVnzf9ZatgXEzTxcjF4eQwENG
  iSmXdzJ1MXICOVeZJP5Ot4FI7GWUuNN/lx0kwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgLuEvcPLgSLswioSjxuWwJm8wo4SSyb1QpWIyGgIDHl4XuwOKeAs8Sx3lvMEIudJJ5fuM
  YGUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/AyLS
  K0bQ4tagstUjXUi+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1
  ZBMjMHRTihWjdjDO3vVX7xCjJAeTkijvkg0uKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeIs+u
  aYICRalpqdWpGXmAOMIJi3BwaMkwrvsC1Cat7ggMbc4Mx0idYpRUUqcV+IrUEIAJJFRmgfXBo
  vdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeSU/AE3hycwrgZv+CmgxE9DiXdwuIItLEhF
  SUg1MLhpmVscWet/6u2rBhwXvryWeX/vWUo/BquiLWfLUBe2cxdaMAvuutSyrLLHbktb21fJY
  2Tu+tMb/X9LLGtQK1SxFqv0q3v+YmtjzLmPTHHPPrv8LWYq2MFVLWT969ufd/CW/rZoOPP7Av
  ERMuDF/9Zn0CdL/fumIzF9cI7v1qrvngYZNayODTUO0Ij7P87WaIt8pnNlm/TEhhkF6dRWfau
  L12AM14iHfRGbyKBxLXLZV6ajtq+VGV8P/Hk26t+1OqmBfuJiFzmrjipTbfh25+1pS2k5xr/p
  0Je1k+po1e7Z0rNTdtOng96Wl75TlZ+39dSjx/949xreqtnx5OEX44t036a1fhdIOP/cq3edr
  qsRSnJFoqMVcVJwIAEvIGghYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1682306695!66538!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27096 invoked from network); 24 Apr 2023 03:24:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:24:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8F43B154
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:24:55 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8303A142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:24:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:24:53 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-icu: upgrade 2.10.2 -> 2.11
Date: Mon, 24 Apr 2023 11:24:33 +0800
Message-ID: <1682306676-11881-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
References: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102165

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 - fixed bug PluralFormat.format accepting python strings, which are immutable
 - fixed bug with UWordBreak wrapping wrong enum (UBreakIteratorType)
 - added wrappers for UBreakIteratorType, ULine|SentenceBreakTag
 - added wrappers for DateTimePatternGenerator::set|getDateTimeFormat()
 - added wrappers for Precision::incrementExact()
 - Locale objects can now be sorted (Fredrik Roubert)
 - added wrapper for Calendar::inTemporalLeapYear()
 - added wrappers for Calendar::get|getTemporalMonthCode()
 - changed all Calendar setters to return self instead of None, setter chaining

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-icu_2.10.2.bb => python3-icu_2.11.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.10.2.bb => python3-icu_2.11.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.10.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.11.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-icu_2.10.2.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.11.bb
index cbcc2f87b..c66455c7e 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "0c3309eea7fab6857507ace62403515b60fe096cbfb4f90d14f55ff75c5441c1"
+SRC_URI[sha256sum] = "3ab531264cfe9132b3d2ac5d708da9a4649d25f6e6813730ac88cf040a08a844"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.34.1


