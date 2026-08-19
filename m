Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1526FC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3330.1787132187341698754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e5QS/BEx;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132193; x=1818668193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K21d7YWeWo3MG6j4IWMe0dL7/XlNoY0+Kpjvm80RNhs=;
  b=e5QS/BExjwD2b9xMoHmlaFoDC4mfw9fBVS+8bm63v6E2dRH9XNYehpmM
   N7HHPfgvPSMvZSQzZ9PeQZcn6wAqRH0APWogEuPieHXSSmXVJoiCbXrsk
   34O6lyFDQiI7RaeLSe6umgZvu6M8PxW3L++mHwnLxyDEtmeHghuCFn+kF
   8simyz3cU3F7GoKFCXQJPesHFdfLW4zB0I9+5AItnlXhFAfxOvKZ9RHw/
   yEnTb0rhyLR/cpnpPUHQbSXycE5LQozBExGcZHpS7CwNPBbnsPHHDgjZP
   YiINe0aGjn6FM/ePcxX3zoP354Wm/hcum5wXeEK8rj+4K2rVVPAepJRZf
   A==;
X-CSE-ConnectionGUID: BysAWG+GReG7lICER7NYGQ==
X-CSE-MsgGUID: pBoTtnwXT6y3lCoK+kOJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759463"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759463"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4535B406EF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:29 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E57BB1C00101
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E3C1F1801C0A;
	Wed, 19 Aug 2026 09:36:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/70] python3-jdatetime: upgrade 6.0.1 -> 6.1.0
Date: Wed, 19 Aug 2026 17:34:43 +0800
Message-ID: <20260819093514.1101-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129309

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix: define datetime resolution attribute
- Adapt to Ruff v0.16 defaults
- fix: preserve instance locale in datetime.astimezone()
- fix(datetime.dst): pass Gregorian to tzinfo.dst()
- typing: use int for fold
- Fix %I/%-I strftime directives to use the 12-hour clock
- Fix Windows Persian locale test
- Add pyright type checking to CI workflow
- Fix Windows test failure for %-I strftime
- migrate tests to pytest
- Add date.strptime and match stdlib subclass behavior

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jdatetime_6.0.1.bb => python3-jdatetime_6.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_6.0.1.bb => python3-jdatetime_6.1.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_6.0.1.bb b/meta-python/recipes-devtools/python/python3-jdatetime_6.1.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-jdatetime_6.0.1.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_6.1.0.bb
index 396793ac3a..5a7fcd7931 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_6.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
 # The PyPI package omits some files for testing like tests/__init__.py
 # so use the GitHub source instead.
-SRCREV = "8a5acc4aa0cef2f39a0ad089b7ca7e4b89626994"
+SRCREV = "480b637d024555e1523b4652bd2b6c5b5fac33d4"
 SRC_URI = " \
     git://github.com/slashmili/jdatetime;branch=main;protocol=https;tag=v${PV} \
     file://run-ptest \
-- 
2.43.0


