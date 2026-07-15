Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71A8C44510
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3440.1784111996481292023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s59O03zp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111997; x=1815647997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lKfm/+uavsOo8kJ8YzeUnr9+mFS0dIzoxJr1WjQarMM=;
  b=s59O03zp70zeUBpiO6Sqezb2gKPPhMX4UAeWj/YbKK6LAMXGqzZAOMZG
   rusNcvFpUZCS0yTVfsrGBsPbhcEc+m2KED2GLIwyqbagoy9stg0d0xeTp
   LgboXwBfQDfm3SdOBkmQMAEL+37gRhf/6S64/jRr9Y3vHh1LlNM5ppJPr
   I/VioR8DCFJioCpm8SR3FWnUV4H642PA38iRrZ1yCueqOvjr2f+HkM86c
   jmPR0EuKHEEYRNKHAVVvZ4xTZSKgFxljrF4S/hXr5PauGjgMkfrq+B0c6
   zvionnOPDpbUYdGLn6tHqTxhAcWgz/GcUta0ltAHt9QehSinJ3HYEuFKU
   w==;
X-CSE-ConnectionGUID: Kg294wsZSVycyqmECrxWWA==
X-CSE-MsgGUID: kpTMsn55QAuVAJFvLqV4Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247518893"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247518893"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:55 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CB454100014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 79387C0934A
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 80E0F180113F;
	Wed, 15 Jul 2026 10:39:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/44] python3-bitarray: upgrade 3.8.2 -> 3.9.0
Date: Wed, 15 Jul 2026 18:38:42 +0800
Message-ID: <20260715103914.2120-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128185

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * add '.rotate()' method, rotate bitarray in-place by 'k' positions
  * expose the 'decodeiterator' class, and add '.skipbits()' method
    as well as '.index' data descriptor, see #252
  * fix 'random_p()' silently producing all-zero bitarrays for small 'n'
    when 'p=float("nan")'
  * improve integer argument handling in 'util.random_k()',
    'util.gen_primes()', 'util.pprint()' and 'util.int2ba()'
  * add 'python_requires >= 3.7' to package metadata
  * improve testing - use more of 'unittest''s functionality
  * add [Rule 90 example](../examples/rule90.py)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.8.2.bb => python3-bitarray_3.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.8.2.bb => python3-bitarray_3.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.8.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.8.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.9.0.bb
index 0c34eeff8d..3e236c8c45 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.9.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "2675a0c17c0b2d12d0fbcf3b27eb833f96936a588da47ac445c0743c5aa69e6b"
+SRC_URI[sha256sum] = "af5f91e61d868c8f457f66cd726ef31d69264f71edbaccd70fdbb13548c1d652"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


