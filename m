Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEB6EA7972
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:27 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14214.1770268521627421501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zw/Q+a2h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268520; x=1801804520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rfkwaSDx+QeRTuANqpBmPxv5EpRdT0VWbEvYuFmOMgk=;
  b=Zw/Q+a2hzaMZ19OqhmT8l9kBjAJFPnLSHItOW4OKzW+v4AbFWKkblvNM
   BkVqdnLeb/PteRHatbjupzBLYx5a282TzoSUNL0fn9CAOERcnNe5bT1bt
   3P+prlSUxgSaaypAT4W4dsnqC/00Gu0nIHrtA2uqEjZrntaMQRGYVR4rA
   8IKmAh6TLPCTb8ZP7sDGpQph2GushuN92looABJ9Z5GkJ86DeukJIj/8s
   LXxYDhu/QxlmWK25yOWKGZwBW2A+FZNCXRnAN2LnkrJ79WgmWDXRthBvK
   vudEjwQV1u9IF+6lJFMMlsl+EH8uwcImfVtXRZIoPPT0tEHRyizyMuve9
   g==;
X-CSE-ConnectionGUID: 1UOt22HsQLeMtGwDX9F4dQ==
X-CSE-MsgGUID: zSvlGJooQg2xxfdBvqbzHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228614861"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228614861"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:18 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id EE2244DD1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:19 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 94603926772
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 031C420000C5;
	Thu,  5 Feb 2026 05:15:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 07/24] libio-compress-lzma-perl: upgrade 2.214 -> 2.217
Date: Thu,  5 Feb 2026 13:14:17 +0800
Message-ID: <20260205051435.1366-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124159

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s-lzma-perl_2.214.bb => libio-compress-lzma-perl_2.217.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.214.bb => libio-compress-lzma-perl_2.217.bb} (76%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.214.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
similarity index 76%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.214.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
index 93ff89c18a..aab29ad57c 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.214.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=db84d74e3df088dfbcfd6b30da2749c8"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aaeabb92ee5754e1"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f4ee89f3af99e59ad0742fd7b6358f9159ef513f1f6943d7140fb1bfa550dd38"
+SRC_URI[sha256sum] = "3462ecd1e67e85d5e4fa911bc6d8e38a884ba1d6e90a03535f0d28fe2ad0aacf"
 
 S = "${UNPACKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.43.0


