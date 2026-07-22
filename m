Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47178C4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44620.1784715855733718879
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VabaQpKT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715858; x=1816251858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMkpnl68x4eg7AX69X6Bzx6WAc6drZgSFSnuT21fgIQ=;
  b=VabaQpKT41+ak5bOIN62aqKYM68+Z8WytlyCIy+b//gzfPGKcnlkzShh
   wvNngGGY2dzC+jOC84Ji6LcLNB3cVH0Jrw25+s0gd0TmdSJYNLuQf/TzB
   mr6j2k0q1pUNYt5wuofikF7/SEJbqE7ArfJiw1ljfGJ7WdQfKfJC72WNM
   pL0S4tnBgFQgmwQOVRGfSKYAgcnGARTk9VsXx+a29QDCXj01FmSQk0svi
   qMBZOXzVuDsO4FvHwJjH44c08zzkGxZH9nWEOrlCqcKtsZb8tIDUWwJEz
   NStcyfmrxsX9Obue5NLOjhYCJ0xq74+AcNs0QurVE3nssaYuFHleKVnUT
   w==;
X-CSE-ConnectionGUID: 3YYYW5v/SjqbGN87eo2ebA==
X-CSE-MsgGUID: P0cQbcudQ4On5MYC57U8ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="225933595"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="225933595"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:16 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 11D7D1002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:14 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BE742C06D6C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DD6B94041C4;
	Wed, 22 Jul 2026 10:24:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/37] python3-faker: upgrade 40.28.1 -> 40.31.0
Date: Wed, 22 Jul 2026 18:23:02 +0800
Message-ID: <20260722102320.1019-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix: correct BBAN length so pt_BR iban() generates valid Brazilian IBANs
- Fix: generate valid Belgian bank codes in nl_BE iban()
- Fix: generate valid Spanish CCC control digits in es_ES iban()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.28.1.bb => python3-faker_40.31.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.28.1.bb => python3-faker_40.31.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.28.1.bb b/meta-python/recipes-devtools/python/python3-faker_40.31.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.28.1.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.31.0.bb
index e32ae395a8..c3e5449a46 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.31.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "2a63fb51abab8790636d4030a094cf942404cbccc9c288d1cad70e2e3e9ecd58"
+SRC_URI[sha256sum] = "af163a937aec99dca5abaeb94dd5008c51c26c6e9af1a26c8db4b3c4e7ca4403"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


