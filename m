Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306C0EDE9AB
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.18340.1725959017508820608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=POyiKuah;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959017; x=1757495017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gk2Wxcm+ZSCvabravt8pJalCzGhyYQiVFNOTfnjL3ME=;
  b=POyiKuahnMIQku3M8GYFdZiBao6Irr9eqNCeiEcmipcrQNuELhn6Onnn
   0wBwtHSc3Vr0NEiEJPF4q1KbrGhGYCqJ8TuQAbcuvhJWidsvh06jKTEQS
   rYzJHxmQofTwH44l83NZ9iV1sqi4vYKUsmg0TaSTvFuGBev8TeyeYP4UT
   vMtrKhtjxwIsuMzm3QM0NlpD8s7X8+cfw2ciuACw+f9FVOE30hJKq7eN3
   MqsUucQ7AHAw9GcGFTvQ62kwiUJDJKW3yw83X7whFMJwaGh+QmYtn0zeX
   zv/CEynTd2kUvnsRA45XqUDWZ2Ip+quvLMJTqpdPU7CeVAkSUFdGRQl2N
   w==;
X-CSE-ConnectionGUID: tYbjBqcrS6Ck8uSH+qUwjw==
X-CSE-MsgGUID: TcsauZagSGGumeQCuvC20Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152689887"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152689887"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8212CE8522
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CDACDD50E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69DFF411B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A9601A000B;
	Tue, 10 Sep 2024 17:03:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/42] python3-zeroconf: upgrade 0.132.2 -> 0.134.0
Date: Tue, 10 Sep 2024 17:03:06 +0800
Message-Id: <1725958990-5719-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-2.659500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fVjNsehGf0vWPi
	LV2fz764Fzn/S92d86VQfw/ZZiLyte1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AsSh9atRkcwf0iF5TZPPO+eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcbs76plDROZkKiPFgV/8XbDHqaxY0TxaTc5zgTAS09pno1pZyODbEk4NXXnW5Zh9vwoM
	Pj+5eWD+liln8ztIxN4xyieNJW2TGJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112222

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Improve performance when IP addresses change frequently
- Improve helpfulness of ServiceInfo.request assertions
- Improve performance of ip address caching
- Enable building of arm64 macOS builds
- Add classifier for python 3.13
- Python 3.13 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.132.2.bb => python3-zeroconf_0.134.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.132.2.bb => python3-zeroconf_0.134.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.134.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.134.0.bb
index 421bd3b6c..b1b1a2e4c 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.132.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.134.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "9ad8bc6e3f168fe8c164634c762d3265c775643defff10e26273623a12d73ae1"
+SRC_URI[sha256sum] = "5be2c3a61cc81eb1bd4684bbdee19d708522d94bc8ac60dfe001a0fde4421092"
 
 DEPENDS += "python3-cython-native"
 
-- 
2.34.1


