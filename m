Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33160C83F16
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.55567.1751879233188693965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eNkKxDdV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879234; x=1783415234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2bkLl8tTeGHSiP41hWE3ZOTRBYp5AJOfzL0i4RyyDlA=;
  b=eNkKxDdV6SKC6PAItuVMQWV3avX/cZBOdAbHLSkPf3o2876WD7Inut3Q
   rEcrjzsJOvOhse8EY1XE1X82WVSZe9tN1tR4FaD+Qu3b9pjSRGXg4Fv0I
   wOXobqNpndfeu9Avjv9U1Fwc140FjGDZPZxoCb0cOPO8+FGrSc+zVkqJw
   hhKXcE3wUO5GEUkLOv7KPL1WJw8HsnRM5h73W9JxnjKT+S2na123FyKHH
   m0QPjw8FKwG8ORhu4psidJMpzzl1+gYFJTktlvvs+VuRaEzFSOJmz9rL1
   jE0zYRZ3NbW//J1xmgGUlkRgu+ZTW0jhHNQdd2beJ714qXEUu6z90dU4+
   w==;
X-CSE-ConnectionGUID: VplTztrpRvSGCa3ag6/BQQ==
X-CSE-MsgGUID: 2U4znx5eQRCgIz8aYuryBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="204763760"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="204763760"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:12 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 798891002B88
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:11 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id ECDD8C02472
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F7A3261519
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:09 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FE5F1A0074;
	Mon,  7 Jul 2025 17:07:08 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/35] libdaq: upgrade 3.0.19 -> 3.0.20
Date: Mon,  7 Jul 2025 17:06:29 +0800
Message-ID: <20250707090656.1216-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118254

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- decode: add check for ipv4 fragmentation for decode_ip
- example: added IP configs for other systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.19.bb => libdaq_3.0.20.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.19.bb => libdaq_3.0.20.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.20.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.20.bb
index 23a439a989..e74763ecd6 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.20.bb
@@ -9,10 +9,10 @@ DEPENDS = "libdnet libpcap"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "434f205cbd45de0961cc42e541b5bf54569e912a"
+SRCREV = "ec9741c22f74b6ed8955b5f1fb4113775d4df0d4"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.0


