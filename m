Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7BEC71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.77951.1749526426054611411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yfho+Qqh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526427; x=1781062427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oeIdYov3Z9yYf29aGkrAqbTixFSGKwAbozJ37inZlMY=;
  b=Yfho+QqhZrZEzDu2rTYS3MzeAOg5eqo06X/zyHyUdgxQuGxauKNZ7o6o
   qiaZXJGlA+TyVhrnQKuO47xKVpsfxohLSiW2pHcjrXJIgmjOFu8BRoIZL
   5Wd8+XrSr+RkD1upgnUuHTUuZZVcwvZAYpHlFZUvPsA5t2Bow4OxWh9g0
   I28Pj1/rJlYVTduMTWFinStanEHo80UUE0k5lPRrWNLZ33eYC7g6QrCgL
   JexKmrc9tFng+O8Xkd/fYTnfpCpR7KDZp+v+r1EKukM0uNtw5ZyB7+2uG
   GOPSyppNoe7d0qOqPQJH3JwMh9Snu4X6IcNYRJ7bejOXuUifzA39iaYU3
   A==;
X-CSE-ConnectionGUID: QJuquajGRPSL70PkQ8R4xg==
X-CSE-MsgGUID: +kMtba0kQ1ish3GupnJ6HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202261474"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202261474"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C91ABD6FBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A692D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:39 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E720C1A0071;
	Tue, 10 Jun 2025 11:33:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/64] libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
Date: Tue, 10 Jun 2025 11:32:40 +0800
Message-ID: <20250610033330.924-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117815

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- socket: [macOS] Fix build on older macOS
- socket: [Windows] Prevent crash by properly initializing memory buffers
- Switch to better initializer strategy
- Fix compilation on MSVC
- Add extern "C" guards to public headers
- socket: Improve error message output/verbose logging
- socket: [Windows] Make sure errno is set in error conditions
- socket: Allow setting debug level via environment variable
- socket: [Windows] Use WSAAddressToStringA (ANSI version)
- socket: [Windows] Use inet_ntop instead of WSAAddressToStringA for >= Vista

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...obiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.1.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.1.bb
rename to meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
index 2f58738c30..977f34b574 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.1.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-SRCREV = "a4ec1cf9cc7084cbe5571e31640ef773701e5f51"
+SRCREV = "aef2bf0f5bfe961ad83d224166462d87b1df2b00"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


