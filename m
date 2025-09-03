Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7B0CA1016
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7931.1756890211166542498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gkb3Auxq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890212; x=1788426212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bITxBGpVAY5TemwuoCi3XdBWZ0xrN3mW3SSKGQmZV2c=;
  b=gkb3AuxqeJAi3FIREP6HBnLZXU8sDxg1yfA64sIr95I13qxfOrt4X7Jl
   Gzuwoj0wIo9UrfqW6V3m/0DW8IAcq8BNY7SjNYw3YqueBOXWMFHoE9Px4
   nHhglJpwJJYuonMdKAeV8F5cr+FyDxkP+eLPBfNtQCUCTs8Uf65HgSWIZ
   kqMGNaD4qagZ8DoeuNp2/tedkONAOCi1sm33k0G6aolG52UCq4ZCSR6UG
   iwSRebk2CA0hYdoCU8jlBHZoAfqVPMS1IUo14wAj4MPfh6sate3+mbPcH
   DzFSu3QMQ+v4sBZ0dImr0ywUgR7tu5PzBycLp96zwFOcstjZDmtEQpKUH
   Q==;
X-CSE-ConnectionGUID: h2HImu3GSN+xnaZdsXkU1Q==
X-CSE-MsgGUID: EjtHFWZrSXiwEzm9ujlLUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211487554"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211487554"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:30 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 72A801565
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 294B91C1FB82
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 02F1B1000083
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B4B831A007E;
	Wed,  3 Sep 2025 17:03:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/56] evtest: upgrade 1.35 -> 1.36
Date: Wed,  3 Sep 2025 17:02:27 +0800
Message-ID: <20250903090317.2002-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119207

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
refreshed for 1.36

Changelog:
===============
- Add KEY_ROTATE_LOCK_TOGGLE, KEY_REFRESH_RATE_TOGGLE
- Add performance key
- Add ifdef
- Use bytes instead of bits for size of ioctl input
- CI: add workflow rules
- evtest 1.36
- Add SW_MACHINE_COVER
- add KEY_MACRO 1-30 and other keys

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch | 7 +++----
 .../recipes-test/evtest/{evtest_1.35.bb => evtest_1.36.bb} | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-test/evtest/{evtest_1.35.bb => evtest_1.36.bb} (89%)

diff --git a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index 595b0296ea..55162207f8 100644
--- a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -1,4 +1,4 @@
-From 490f5b6cd788692d989f07180a5714c76872911e Mon Sep 17 00:00:00 2001
+From 55c872430c9444d7edaf50db0faa9bbc31dd085f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Nov 2019 11:58:58 -0800
 Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
@@ -10,13 +10,12 @@ input.h [1]
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/libevdev/evtest/merge_requests/6]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  evtest.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/evtest.c b/evtest.c
-index ba7a161..8fc2e5a 100644
+index d3d3d8f..3045cce 100644
 --- a/evtest.c
 +++ b/evtest.c
 @@ -63,6 +63,11 @@
@@ -30,4 +29,4 @@ index ba7a161..8fc2e5a 100644
 +
  #define BITS_PER_LONG (sizeof(long) * 8)
  #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
- #define OFF(x)  ((x)%BITS_PER_LONG)
+ #define NBYTES(x) (NBITS(x) * sizeof(long))
diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes-test/evtest/evtest_1.36.bb
similarity index 89%
rename from meta-oe/recipes-test/evtest/evtest_1.35.bb
rename to meta-oe/recipes-test/evtest/evtest_1.36.bb
index 9c42efcdab..20a39a5976 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.36.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "da347a8f88d2e5729dd12d61ee9743f902065b55"
+SRCREV = "96e6cb5ae90726883be095a3e467e847c06225f7"
 SRC_URI = "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=https;branch=master \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            "
-- 
2.43.0


