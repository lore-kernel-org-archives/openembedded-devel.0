Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93F4EDE99C
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18597.1725959013737955438
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BR88JIYD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959018; x=1757495018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Y5HCn6iEAen4JJlU+auIGp+tSgza5eh8194B5Tumpn8=;
  b=BR88JIYDdInO1PD0oJXpZxSa0FFESBV0UlHA+vBfwyCB65gw/JcoMaSt
   nR8MXNZj1SAAUEEvcmwiP5gHNiVba08B2E/r1R1UonPLzh34lOl/txRSd
   L+tsAKBEPYn02oPPfYgA+qIu2bNjZ/bu9hlWDjkEDWiKqXqcenmw07mev
   pTRGgnYE/bR++s+apFwruYGqKsvh7gkgv6uFnvrq1/ylT4/5nNGx5G6B0
   XXZUfJVGqDfyB0Bpz5uPCDqLltLLDghxAz92zl+YU+YRQN8nthM0OvM4v
   Rzi2tnqYDlyuq7b3Ak4pFEByI0zIolYSlaY81ixOrKa4uzxWkNG6XCM68
   Q==;
X-CSE-ConnectionGUID: t8nahVG4SxiKEoYveDgv0w==
X-CSE-MsgGUID: RxZsqJi9R06qucgyO91wZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173214193"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173214193"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DCC04E4FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B24E5CFBC8
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 392A3411B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF6D51A000B;
	Tue, 10 Sep 2024 17:03:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/42] valijson: upgrade 1.0.2 -> 1.0.3
Date: Tue, 10 Sep 2024 17:03:08 +0800
Message-Id: <1725958990-5719-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-5.485600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO/4e
	8umIMMid1NlYV/Vgof0+5N/NdXRtWazyVfyvsHkPA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRloMLOoNHsM9n0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt5GqQzaOIrTxh+tFxwftEUBvGlVaqid2m2HkV5y2MwfnLQSwVbpf34Mwds
	UdMbY8JdNzLQ+qBKEiHWtM7tJBRgXBYSnpyVDAsftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112223

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix typos in RapidJsonAdapter, only failing when certain features are used
- Added explicit default move constructors/operators
- Various cosmetic fixes
- Implemented functioning move constructors/operators
- Compatibility with boost-1.85.0
- Ability to customize regular expression engine

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_1.0.2.bb => valijson_1.0.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.2.bb => valijson_1.0.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.2.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.2.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.3.bb
index f531218ae..82201211b 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.2.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https"
-SRCREV = "0b4771e273a065d437814baf426bcfcafec0f434"
+SRCREV = "fc9ddf14db683c9443c48ae3a6bf83e0ce3ad37c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


