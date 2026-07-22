Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0DDC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44782.1784715830978946318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LJTQji3S;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715831; x=1816251831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7OZq69TgghkDagyrR8n2mBo7eF4rZs9CxK+tHGEdp6M=;
  b=LJTQji3SqnWKuo1CIcvnYWpxgNC+5Ly914WIbMenIfkQnmdM9GOYvu/s
   qFyrLFyI0x5a/XjkmxD1XtKIzdilKr2DaxSgr4yV4bsEogHlo3nAJxHrv
   +ZTKQO0H+DGfaj8/mQyUdozMsNprFhJou1vixFgTEbdlgYgZpjiQQamd7
   NleAK4QCrUSPBcQiM0nAxFi1whrnwBpV76xM62oiTAqE6h7hUOnnSeCWH
   /LapZVmOxUsTSgKcPw1QcMJsVnN7t9sotxMFXqO4tRlHlo2X3J/SAcWy9
   u2azZZeU7oQtxG+OHGy0hi9nA3j+1vo4NArV42apt42fpH2ZKVSveavW/
   g==;
X-CSE-ConnectionGUID: IBsLQcrnRSSXvkZjkxG+ow==
X-CSE-MsgGUID: 00wUN4BhQ+2phUejAn23eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="251743043"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="251743043"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 690B11002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 203DBC00894
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 3DCDB405E39;
	Wed, 22 Jul 2026 10:23:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/37] python3-bitarray: upgrade 3.9.0 -> 3.9.1
Date: Wed, 22 Jul 2026 18:22:56 +0800
Message-ID: <20260722102320.1019-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128383

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* improving free-threading readiness, see also #251:
    - initialize tables at module import, not lazily
    - remove caching imported Python objects (which are already caches)
    - added 75 critical sections in Python-facing operations
    - updated Trove Classifier to ;Free Threading :: 2 - Beta;
* clip arguments in ;.bytereverse(); instead of raising ;IndexError;
* remove ;ssize_richcompare(); in favor of ;Py_RETURN_RICHCOMPARE; macro
* add tests for frozenbitarrays created by methods when ;self; is a
  frozenbitarray, e.g. slicing a frozenbitarray

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.9.0.bb => python3-bitarray_3.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.9.0.bb => python3-bitarray_3.9.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.9.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.9.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.9.1.bb
index 3e236c8c45..a5528dda20 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "af5f91e61d868c8f457f66cd726ef31d69264f71edbaccd70fdbb13548c1d652"
+SRC_URI[sha256sum] = "796f2b4f0e4d84df50bd23ddfacb37d74eec2b2366813cb8f18bdae6b25e3d36"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


