Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9823ACD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16928.1779875314160145104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GbxdQb12;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875314; x=1811411314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jbx2wMHOU9KvjnxejodbJdch7s/Sy6NulDcWrPcCTkE=;
  b=GbxdQb12FUbSgvSSfMowXEuf/wd3L1HLXYgP772hN4UlYwRXSFsstz7x
   5oYf6yy/pd103ifasLkOS+fihi+UNvSLcFHMfRCbULSRiA19onr5EHin9
   NedYkC2e7u58beYlYDNvUBmD7E6qtRsQDE+3Q6lW2B/JGNIYEd/X0ltYK
   rJZLQRXjuTZGUzT5+1gc6Krnv1GEl8Lil7T2CwtE2W/p+88JJzIvAT+wE
   l8EMB57FBvHxxJGZnyDVAQcqobHHSEXB9D8eq/1nWh73gWIk5eJXNOvxp
   WCBjf9vRjP7LcMTI/9Tf2QsZ+wsdHKz/nfAYYsTN9r7xe/KMGmgXZh5CU
   A==;
X-CSE-ConnectionGUID: WHHhbah4SMy6aE01ciWChw==
X-CSE-MsgGUID: fDhdgKKWSvKGmyWNqp9w0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050288"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050288"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 86E3B1002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:32 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3DEF618591D0
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 478CA82A2CE;
	Wed, 27 May 2026 09:48:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/56] libfido2-initial: upgrade 1.16.0 -> 1.17.0
Date: Wed, 27 May 2026 17:47:17 +0800
Message-ID: <20260527094805.2039-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127215

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
=============
* Added CTAP 2.3 support.
* Restrict webauthn.dll search paths; YSA-2026-01.
* Support application-managed PIN/UV Auth tokens; gh#806.
* Support 64-byte hmac-secret salts when using windows://hello.
* Fixed a U2F transaction handling bug when a timeout had been set; gh#917.
* Fixed a bug where stdin was closed on fido_nl_new failure; gh#923.
* fido2-token: new -G -t mode to to retrieve a PPUAT.
* fido2-token: new -I -t mode for deciphering encrypted fields.
* fido2-cred -M: support the -t toggle argument
* Improved documentation and examples.
* Removed tools from SDK packaging on Windows.
* New API calls

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libfido2-initial_1.16.0.bb => libfido2-initial_1.17.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libfido2/{libfido2-initial_1.16.0.bb => libfido2-initial_1.17.0.bb} (90%)

diff --git a/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb b/meta-oe/recipes-support/libfido2/libfido2-initial_1.17.0.bb
similarity index 90%
rename from meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
rename to meta-oe/recipes-support/libfido2/libfido2-initial_1.17.0.bb
index 7d9838b003..cb12c4e04d 100644
--- a/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2-initial_1.17.0.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "https://developers.yubico.com/libfido2"
 LICENSE = "BSD-2-Clause"
 SECTION = "libs/network"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20be19aaa222f71738712b26f7f8717b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81b68c65611c3a2eaac9e44814284719"
 
 SRC_URI = "https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8c2b6fb279b5b42e9ac92ade71832e485852647b53607c43baaafbbcecea04e4"
+SRC_URI[sha256sum] = "c1012c8871d71b65872fd5ff1a9d6b0838a55683a03e85ba97479ce57129c736"
 
 inherit nopackages
 
-- 
2.43.0


