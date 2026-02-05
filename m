Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B776CEA7975
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14215.1770268523151503549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cShjoPlZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268524; x=1801804524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N33ttL2JALx1NXs+obzaFKF7m8sBa0V4iQ7vVMqEQCM=;
  b=cShjoPlZVhDafGzqEav8947b1v++9/4WzuVp/+rC2vM/K0fxnFTG/tdY
   5r9ihycQ+8HKL1idb22MJV1jF+Nj1R62sKfSmrJFILikws2qsI0FObvSo
   L6o4CPKMJ3aqtus+m09kJA+hNqlXd034Ns09Vyj98mpqUMTO10273CysX
   CW85KZ/Kg5TJPJgDMB6GWFeTsow8Mji+01WgL0SfNwieFFuJgb2rUsFkv
   eNV+5UOpjtGhJ37eDfaiRwuQ4BSvPCDcAcJXJqitpO9PK5EiNChBo8q7+
   vzDpHqplP2nucDHG6MSa5MlljdKpZrDHkPxZ3cM00Xn5Y3vrK3lRMlAue
   w==;
X-CSE-ConnectionGUID: uU5s+hgJSk+GnYKAzncm8w==
X-CSE-MsgGUID: 7ST3EwJtStCy/X+rOnsM7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228591668"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228591668"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:24 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 508151C000E0
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:23 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 03EE51007118
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 765A920000CA;
	Thu,  5 Feb 2026 05:15:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/24] libp11: upgrade 0.4.16 -> 0.4.17
Date: Thu,  5 Feb 2026 13:14:19 +0800
Message-ID: <20260205051435.1366-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124161

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Ed25519 and Ed448 support (PKCS#11 v3.2)
* Fixed OPENSSL_NO_EC builds
* Reverted RSA public exponent change from PR #474
* Fixed crash on module initialization failures
* Ignoring trailing newlines in pin-source files
* Initial build fixes for the upcoming OpenSSL 4.x

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libp11/{libp11_0.4.16.bb => libp11_0.4.17.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.16.bb => libp11_0.4.17.bb} (92%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.16.bb b/meta-oe/recipes-support/libp11/libp11_0.4.17.bb
similarity index 92%
rename from meta-oe/recipes-support/libp11/libp11_0.4.16.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.17.bb
index 2bd589be8a..9bd44a2d23 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.16.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.17.bb
@@ -9,9 +9,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV}"
 
-SRCREV = "b9c2de288833e38a391ee3cb106f965a40153629"
+SRCREV = "1ad1efdffc90df5dcd69822f3f593898acc1aa78"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


