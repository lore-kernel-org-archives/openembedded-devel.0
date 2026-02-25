Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47575EFD22A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:21 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42050.1772012299201559288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CsPVymxU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012298; x=1803548298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vOhSg44pEARwAonAJ8RZQxDeUJjHGfCJTzs8559wWx8=;
  b=CsPVymxUvKKcQc8I8YAJq7sJqTzLdrN9PPrQD9oUU7fa+p3n9Qk4+mtS
   GHrZAKGdyXeUFyaIZ7BIduYT4Li37saLpPwpW4qYqqQ/pqpC4WPbU8Ytt
   PQQ+LVAcCgiWlPrfSn11E8JkV5K6BFmZhQrpQSuOGsYmnx2Y4AucwDSm+
   KC8en7enZgnFPdKrpTz6Y0mpWZwFCMVmYZCrcJ7Ctj5Zzn0+6YYyZkHAD
   gMzOLmpOm2InJkBazoS12CrBhfOogoYeymY60OGTAofV5n3IkFuqb0Jaa
   Y9ZkShcN/qVRnuS0tq3kUxt0mXzOQSdYnjDTXoF441zxUpgbZQn9x9WRo
   Q==;
X-CSE-ConnectionGUID: RUn1uKIrSm+E4mUTvsTylw==
X-CSE-MsgGUID: GbRhEEjhQ/+TS2/GUaiOoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230948674"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230948674"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id ABB431C000A8
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 602B71004146
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 87DC2101BB70;
	Wed, 25 Feb 2026 09:38:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/33] minizip: upgrade 1.3.1 -> 1.3.2
Date: Wed, 25 Feb 2026 17:37:15 +0800
Message-ID: <20260225093727.1284-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124633

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: "Version 1.1, February 14h, 2010" removed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../minizip/{minizip_1.3.1.bb => minizip_1.3.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/minizip/{minizip_1.3.1.bb => minizip_1.3.2.bb} (77%)

diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
similarity index 77%
rename from meta-oe/recipes-core/minizip/minizip_1.3.1.bb
rename to meta-oe/recipes-core/minizip/minizip_1.3.2.bb
index 51a74d039b..49e4a4b561 100644
--- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
+++ b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
@@ -4,7 +4,7 @@ library which is used by many different programs."
 HOMEPAGE = "http://www.winimage.com/zLibDll/minizip.html"
 SECTION = "libs"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=8eaa8535a3a1a2296b303f40f75385e7"
+LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=b7d2930a7332b2bc68fc1a7fdc5ba775"
 
 GITHUB_BASE_URI ?= "https://github.com/madler/zlib/releases/"
 
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz"
 
 S = "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
 
-SRC_URI[sha256sum] = "38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32"
+SRC_URI[sha256sum] = "d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3"
 
 PACKAGECONFIG ??= "demos"
 PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
-- 
2.43.0


