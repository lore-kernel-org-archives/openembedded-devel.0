Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FF6CD98F6
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11260.1781686697557978934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nZfTNXbT;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686697; x=1813222697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0W1m6zlXJb9vQs4ZAZ475HtStMxxUPEolF8BA4ye3yU=;
  b=nZfTNXbT1WH20EqJYGnu3CGbWj+7QnhWBO0cJOxtcjLZ74kgyJ8jLK4R
   tQjzuDhXdPF+lyLiZKj5EA4L/zWN69VIqjX+jYaMMybpfLNHg8yhlpjfb
   2xErEd2yU4veRGhcUoBqb/r1AUn4UU+yE0s69z+VVpeatqcFdAszN+8mx
   BtPQmI61MV8srKgMUhpCLA+B/DIcaHNwXQsLcWaJcXBMGzgMu6fHkjZl+
   Jr/wN3EURe6inaPz7mGPPSrqzudGMboNTXu+enTxu7ozXxxq5jiA8tNtX
   6VqcuSuFqtXH4EN0TXsWsBvlXkaiUq1SEtRqBcKgK10QVzfk5EWvHi0yU
   w==;
X-CSE-ConnectionGUID: 8qpzZoh3RX6Me5M0/s05Ng==
X-CSE-MsgGUID: BHMUuewgSvq9lxZ7FA9y0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="223301114"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="223301114"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:15 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 834121C1C70F
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3C12E8D65F3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5F10E1000A45;
	Wed, 17 Jun 2026 08:58:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/17] glaze: upgrade 7.7.1 -> 7.8.1
Date: Wed, 17 Jun 2026 16:57:51 +0800
Message-ID: <20260617085807.542-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127638

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements ============
- Add glz::reflect_array to serialize structs as arrays without enumerating
  members
- Centralize Asio backend selection into a glaze::asio target, and export it to
  find_package consumers so the standalone/Boost Asio macro pair is configured
  consistently
- Support custom_read/custom_write types as tagged variant alternatives
- Support custom_read/custom_write types as tagged variant alternatives in YAML
- Add a CI workflow for MSVC /O2 builds

Fixes ======
- Fix streaming buffer refill when skipping unknown keys
- RFC 6455: reject oversized WebSocket control frames
- RFC 9112: fix Host authority in HTTP and WebSocket clients
- Cast to unsigned char before cctype calls in parsers (avoids UB on negative
  char values)
- RFC 6455: fix WebSocket close frame validation
- Fix WebSocket client handling of data received together with the handshake
  response
- Guard std::numeric_limits<T>::min/max against Windows min/max macros
- Fix TOML/YAML block layout for transparent write wrappers
- Resolve custom variant specialization ambiguity for
  YAML/BEVE/CBOR/MessagePack/TOML
- Guard std::min & std::max calls from minwindef.h defines
- Fixed CMake version to match v7.8.1 tag (v7.8.0 was missing CMake and
  version.hpp bump)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.7.1.bb => glaze_7.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.7.1.bb => glaze_7.8.1.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.7.1.bb b/meta-oe/recipes-support/glaze/glaze_7.8.1.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.7.1.bb
rename to meta-oe/recipes-support/glaze/glaze_7.8.1.bb
index 8b10e8d344..d1ed7d7605 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.7.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "ae87b187e2264ad452777bca68e35595406e9dca"
+SRCREV = "9618ef8ef503c72b10e7b2769839784f09d24d2c"
 
 inherit cmake
 
-- 
2.43.0


