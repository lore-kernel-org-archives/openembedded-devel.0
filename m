Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365BFCD3420
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17224.1777546212364452843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZAEx5/KZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546212; x=1809082212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HdlMYpLNnqXlhD2fCnTn0pc01FQCdrgH1OxZr37Ga0c=;
  b=ZAEx5/KZgRId9+18DxjvPJ2VKgnMEd69FMSERWELQ26SzA2sAcrw/6Mv
   MZkIBcxcqP9iH/yZ9yvEdGiH1lK4rchHASx20QvQY1Co85VNE8hkn4bT/
   y9kXVV7V9vj/BcSTe7ogfEhNad+XjVAjHvCQuL99T+dP6tkuAuJ1KqyRP
   0XrF8G9kGnoh4t3KC715goRud7iOgfSNB/agiavPBnaeJbTa4IruTVkze
   AN5RTGQVt88fjR8IjiUP+XocjzNXW0/B97z3SsgNs1nlCyrxxaKpXow3j
   vrchH0OkC5R61tEDZ3vAr3tqYIdpDbORhMZDfLLSBw7VTQ6l+IJnmpX6o
   A==;
X-CSE-ConnectionGUID: hG9WIfuyTzy/jB0HOheIyg==
X-CSE-MsgGUID: SgnHFFSISg6qg2msfFqwjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="227309863"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="227309863"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:11 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0050E1467
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A3601C012BE
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 138391801137;
	Thu, 30 Apr 2026 10:49:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/64] libfido2: upgrade 1.16.0 -> 1.17.0
Date: Thu, 30 Apr 2026 18:48:36 +0800
Message-ID: <20260430104924.1106-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126694

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
=============
- Added CTAP 2.3 support.
- Restrict webauthn.dll search paths; YSA-2026-01.
- Support application-managed PIN/UV Auth tokens; gh#806.
- Support 64-byte hmac-secret salts when using windows://hello.
- Fixed a U2F transaction handling bug when a timeout had been set; gh#917.
- Fixed a bug where stdin was closed on fido_nl_new failure; gh#923.
- fido2-token: new -G -t mode to to retrieve a PPUAT.
- fido2-token: new -I -t mode for deciphering encrypted fields.
- fido2-cred -M: support the -t toggle argument
- Improved documentation and examples.
- Removed tools from SDK packaging on Windows.
- New API calls

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libfido2/{libfido2_1.16.0.bb => libfido2_1.17.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libfido2/{libfido2_1.16.0.bb => libfido2_1.17.0.bb} (81%)

diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb b/meta-oe/recipes-support/libfido2/libfido2_1.17.0.bb
similarity index 81%
rename from meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
rename to meta-oe/recipes-support/libfido2/libfido2_1.17.0.bb
index 09d34603d6..1c15196792 100644
--- a/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.17.0.bb
@@ -7,10 +7,10 @@ LICENSE = "BSD-2-Clause"
 SECTION = "libs/network"
 DEPENDS = "libcbor openssl zlib udev"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20be19aaa222f71738712b26f7f8717b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81b68c65611c3a2eaac9e44814284719"
 
 SRC_URI = "https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8c2b6fb279b5b42e9ac92ade71832e485852647b53607c43baaafbbcecea04e4"
+SRC_URI[sha256sum] = "c1012c8871d71b65872fd5ff1a9d6b0838a55683a03e85ba97479ce57129c736"
 
 inherit cmake pkgconfig manpages
 
-- 
2.43.0


