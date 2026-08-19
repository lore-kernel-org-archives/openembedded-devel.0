Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6487C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3343.1787132201099261204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YddxgKlF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132205; x=1818668205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wcjtz83kHsDZqte87hP6FiP4GU5k4d9nORF0y9NUfqA=;
  b=YddxgKlFbrqxO35yBOp7CEm0C6EUoalKoANzb3wwAJnAtmKL5xDXVnlX
   /HhBuQ0piTykf+U5iZer/RCKBYyl74Q0B9yM1HWkCKflM1jrUR9gYLpJD
   zlLbc4GhGdrwxSfTjAeiTzP3ebCiwfFjSLxXGI96cvHzqUztUUgqHpyPU
   dWrsv43IWzDIfgs05LZt3FLJdMfL1P1hQr1xp2RAtSwMm4fnO2djCoHjg
   at+l850UMyERA1+jNqVhszzgEc2LIDoIz2ku2hq8IUWZySLnQ2o+gZE/u
   e3yFHGIKbKV9pMly1AmdMkVfVIlvIC5k5o6JNSEvtZ7hBJmG2odqEJXeA
   w==;
X-CSE-ConnectionGUID: OEQynnniSLKhBsRQ3iec0A==
X-CSE-MsgGUID: OdLCjgizTm6nwZa3kw9Mwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507904"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507904"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:45 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 236461C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:41 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D2D26181ED58
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E4D1D1801C0A;
	Wed, 19 Aug 2026 09:36:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/70] python3-pyais: upgrade 3.1.0 -> 3.2.1
Date: Wed, 19 Aug 2026 17:34:50 +0800
Message-ID: <20260819093514.1101-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129316

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* added support for an additional AIS Application Specific Message (Message Type 8)
  * US environmental reports (DAC = 367 FID = 33)
* significantly improved decoding performance
  * optimized AIS payload decoding using a base64-backed bit unpacker
  * reduced NMEA parsing overhead through caching and parser optimizations
  * improved enum lookup performance
* added support for additional AIS Application Specific Messages (Message Type 8)
  * environmental reports (DAC = 1 FID = 26)
  * area notices (DAC = 1 FID = 22/23)
  * route information (DAC = 1 FID = 27/28)
  * VTS and synthetic target reports
* added new enums for SOLAS equipment status and vessel ice class
* improved support for decoding application-specific AIS payloads

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_3.1.0.bb => python3-pyais_3.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_3.1.0.bb => python3-pyais_3.2.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
index a5c5dc1fd5..2343d82dcb 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "293bc44c1e8740dd60f489205cc9edd72fd672f9"
+SRCREV = "e69a48b31f04ff1bb8c3abb24a311b558a329944"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


