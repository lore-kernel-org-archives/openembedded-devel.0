Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A88EC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9405.1788345002229070640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h5CaXHqB;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345002; x=1819881002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TVtMbBvuDJnuf1zb0LGCTgRqVB2uVNQSDkubrjoTwsA=;
  b=h5CaXHqBp81b2Ckmc7dsxnwCSXjU9c9CgpPZX3UlcJeo7QEwikVMcvB+
   yWSulFFL7372tP9DiEc3RxmXYxKAMRS4yJcL1YYyxoUbGHU+/WhBzhJxc
   7x0DlaQ+8Dji67L38LNBCPuADQdaLNiNZjLGbBFib4AuIO+SRp2c4A3SE
   6LJDSU77WJnQcY1Te9/5VlMH00nujjvVjZnqTWRtpqj/w6576Xgyejp0t
   TFIpj/9Ong/3xPaZxm9eDOfJIXRUtmRiUIMrrAldgw8Y2hS1AUe2GLMfx
   av4VMujag4K5PEtrre6pl24QRmeBVRaqJDySnUbVti+laoxkDOnvwgT7W
   Q==;
X-CSE-ConnectionGUID: JXshEPJeRua4g4JKYfBrbQ==
X-CSE-MsgGUID: RC/180JbTlWzf5kcWIkl5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241060717"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241060717"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:00 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B524C551E
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 66C7610029A1
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 870632000224;
	Wed,  2 Sep 2026 10:29:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/34] python3-zeroconf: upgrade 0.150.0 -> 0.151.3
Date: Wed,  2 Sep 2026 18:28:56 +0800
Message-ID: <20260902102900.1296-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129689

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: 
 - chore: preserve the historical copyright notices in COPYING

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zeroconf_0.150.0.bb => python3-zeroconf_0.151.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.150.0.bb => python3-zeroconf_0.151.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.150.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.150.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
index 170d0b390f..beadc0b3ed 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.150.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ede793c8b5508eab1acfad7c0c4e335"
 
-SRC_URI[sha256sum] = "a5fe7feab1de6ef5e541e0a3d07e534fd91629b813fc27281593584100f63164"
+SRC_URI[sha256sum] = "ce6c548e665759b6150cef4db9ab9d7bdd89857e90c513abd6b7340bdd7dbd6a"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


