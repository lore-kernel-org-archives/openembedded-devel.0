Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C879C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.31368.1753869304803074049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L+SMCjk7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869305; x=1785405305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QXx28GQ3ZqS4kgktcJ6bbW5TMXqBDRYTwZSJLJ2qRgs=;
  b=L+SMCjk7UuRp/geniVPYJoUbLMvQPsUbXYvRPIIz2KwKs1W9MpzQ5MC8
   DiNLDxSqH+gXKuubKeoeui5lxeD32Ar+TdGF7bpWWuUsmp2rc1lcsd0KQ
   Gyvi67UG8UWwi6fYifSf/CJ0rVkRbqQy/G7QAcAfSmmEiKM+Gia+sgLkS
   Ak5H/JlU8PIfxNdfP0Imum+3STTLXgKpVO1Bh3Q1l7QaWruiOTPPg4cMg
   BQQ9WRFfFcPlhu7v/8VjquMVVKsDUGrmIY8I/78kxXam9pJzOnW4ioQIa
   GsQ93kBvUp9AM5PeoCSmRU5BKclfLvlIJTVMMeCwmUHIRBmmPuyu+sbqq
   g==;
X-CSE-ConnectionGUID: VJsXlaggS9ePJPvxLi+A2A==
X-CSE-MsgGUID: xfBOv9wNQ8CDY4t6vSSVTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="196380906"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="196380906"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 23144C000BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8F66FC01817
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A88FA1A0073;
	Wed, 30 Jul 2025 17:54:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/40] asyncmqtt: upgrade 10.1.0 -> 10.2.0
Date: Wed, 30 Jul 2025 17:54:18 +0800
Message-ID: <20250730095456.695-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118768

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed offline publish/pubrel packet_id management.
- Added packet_id limit functionality for testing.
- Recovered missing compile-time Role-Packet checking functionality.
- Added broker's Client Certificate subjectAltName.
- Fixed invalid remaining length parsing problem on disconnect and auth packet.
- Supported Boost.1.88.0 defaulted process v2.
- Fixed PacketIdBytes treatment in MQTT v5 publish response packets.
- Refined documents.
- Refined CI.
- Fixed warnings on release build.
- Adjusted and unified broker's read_buf_size option's default value.
- Updated docker build.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_10.1.0.bb => asyncmqtt_10.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.1.0.bb => asyncmqtt_10.2.0.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.0.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.0.bb
index fc020695e3..557c7d3d12 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.0.bb
@@ -4,8 +4,8 @@ LICENSE = "BSL-1.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https"
-SRCREV = "21046ebc4a5475c14cea446715734c88fe33d276"
+SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
+SRCREV = "9e26e92d1c3571ff2723c380c9548b3527bf37a6"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


