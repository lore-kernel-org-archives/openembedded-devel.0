Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A895C27C7B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2490.1718161123300457061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QgarvI/J;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161127; x=1749697127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7gYGvEL5aZoJI+1ju4U2+vLgdn39J/hzAiP4RLjAgIE=;
  b=QgarvI/JjsxacxcFg1OIQ03l7gqnEt5Sv0s2zWmVob52tDax2Igmcwda
   dBBwYOR0p3lp7jdbV6uuRwZ+typ+15flokjJtTuXZDvkgb39X6E4GpNlp
   Q3BFQ5Hr4CNZUj08YGvOLLJF7b8zuP7Ew3xPkVPFIUPZ+EnBa8cJ2u6MQ
   F93Bw2mABbw09HiGzk3rKoqmkPwkV0y81MVzz0aiARAQq18lHJAcR6+sA
   jJbHxV0C77TZ7ReEbl6K3i9NfxCCyac2BLFo0jHmFXpKgC7f5oKGhN1nt
   InrAoXxMhj9poikkTxH/GyLAi7r742Qvk4kaBJHMxNSc4Ts3/FLJb+ntb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162860628"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162860628"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:45 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74ACDD801B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB8DED8B01
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 555CF20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DAF1C1A0002;
	Wed, 12 Jun 2024 10:58:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/43] python3-pyalsaaudio: upgrade 0.10.0 -> 0.11.0
Date: Wed, 12 Jun 2024 10:57:55 +0800
Message-Id: <1718161096-29710-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--0.036500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjIgofMgahPrQLt
	Av8b4f0o2z2iDs3Z4F4xBm2TrrWsvN85aEfhtr82b/oIJuUAIuEXlq2gUZb6eJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qex9GgLAHOBFiJ0RPnyOnrZLdX1YgKcikC++NqrCobFLPQqfXi1EfyyqLhN1TZsdfwfxUQ
	n/6MgjoqCqn4uvGpTtDbWh+fI6dtp9DTS8ma2LF//WLJhwHiApLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110858

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fixed Mixer.getvolume() returning outdated value
- Fixed PCM crashing with some sample formats due to buffer size miscalculation
- Fixed PCM.read() ignoring overruns (regression in 0.10.0)
- Reverted to PCM.write() not throwing an exception on playback buffer underrun;
  instead, return -EPIPE like PCM.read() does on overrun
- Added PCM.avail() and PCM.polldescriptors_revents() functions
- Added nominal_bits and physical_bits entries to PCM.info()'s return value
- Added Python type hint file, and adjusted documentation accordingly
 -Improvements to the examples, in particular isine.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pyalsaaudio_0.10.0.bb => python3-pyalsaaudio_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyalsaaudio_0.10.0.bb => python3-pyalsaaudio_0.11.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.11.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pyalsaaudio_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pyalsaaudio_0.11.0.bb
index 8b22faad3..8917c8860 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab"
+SRC_URI[sha256sum] = "a78a9dca33524b2c9064b34e21f5ab874272313cf324a9a77592f396a5e0fddc"
 
 DEPENDS += "alsa-lib"
 
-- 
2.34.1


