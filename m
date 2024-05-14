Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A888C25B7C
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10755.1715677840109396209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DybnB8Wg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677845; x=1747213845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iSaUJfAe0cJyyUVmftwj4FEQdRrFPrK0r1xpeNAiPyM=;
  b=DybnB8WgAM6Te9yCr943IZwxAqFyU2P/qj6rJLd8D+kz01bHmI21SY9P
   tguqwlBWaAPIUbSiI95EIcod2hq4xxEiNyN0KiikartM9wr0atyAcfDjL
   aBX28DoFZrAXlRtYIf8K+/G5mnqZG8edjnVFNJ31mopJvUj9wIiRZk7uO
   Gq7YAfFt5cO3h+RawYd3YKAmz+/7jboxZWbyHYpI9yLmP/BHwZUlIawJ5
   hqHDCqpyd7kKUjH+mRmifWJHbqf7pJjG0my5yGQJY+x3UBP0V0qcTrU5y
   v8/Z6FX0EafIZ15kMbqW+cBCoBZER2gUIsCP3JE6/HYzV2JW2budbdV74
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146707038"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146707038"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37FF9E8521
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F6C9D5936
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A7F320076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB0561A000B;
	Tue, 14 May 2024 17:10:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 44/44] uriparser: upgrade 0.9.7 -> 0.9.8
Date: Tue, 14 May 2024 17:10:17 +0800
Message-Id: <1715677817-2223-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--7.795300-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrDjwwT0r6EXR8zo0Mk5TAzjv/
	rCb7VagZlX6mgyQkDsfXi72MrDF+Okqkgzox/CQa3IFFT9wqfr2E7VJ7hrAQ1tzF9+c9xkab4ZI
	7+/B3o+EwH5gPcpNPxpPbLdxJyuSx7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3iuFf+VRAZx7D7L2q5dH9XYAN+CmNIOQU3rixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrVdFm9LE80Tog51EKMfmhHXTtLo1400U7gsvCMTie+gEMXmF
	1ihAnr0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110388

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Protect against integer overflow in ComposeQueryEngine
* Protect against integer overflow in ComposeQueryMallocExMm
* Require CMake >=3.5.0
* CMake option URIPARSER_SHARED_LIBS=(ON|OFF) to control, whether to produce a
  shared or static library for uriparser and that alone, falls back to standard
  BUILD_SHARED_LIBS if available, else defaults to "ON"
* Document that scheme-based normalization a la section 6.2.3 of RFC 3986 is a
  responsibility of the application using uriparser
* Document supported code points for functions uriEscape(Ex)W
* Update Clang from 15 to 18
* Adapt to breaking changes in Clang packaging
* Get sanitizer CFLAGS and LDFLAGS back in sync
* Pin GitHub Actions to specific commits for security

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb} (84%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
similarity index 84%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
index 421263e62..3d76190d3 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "11553b2abd2b5728a6c88e35ab08e807d0a0f23c44920df937778ce8cc4d40ff"
+SRC_URI[sha256sum] = "4cd0e4f93b477272fabceeb0202f269169fe6ec3044e10fac6acbcdf354bb080"
 
 inherit cmake github-releases
 
-- 
2.34.1


