Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244DFC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:28:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.6506.1704720479348580455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="147085530"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085530"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:27:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD57BD4F51
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:27:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C7272FC0C
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:27:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A1C4202D4AB4
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:27:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42E7C1A0072;
	Mon,  8 Jan 2024 21:27:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] chrony: upgrade 4.4 -> 4.5
Date: Mon,  8 Jan 2024 21:27:39 +0800
Message-Id: <1704720459-30197-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--3.333500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzSTvrGJYX0qJ5n
	VKTiuHcXjs+GIL5CCDBR4Xyks9lwTfc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1F4BmkmVfdy38plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZ0xGoeaQeUHUKmRfC4txWC8OwQuGl8zBrizoS5u0apQhyZ57ZA+Pf66xUDs5It4kcknH
	S7Uwiga5JfdZYIZAAewAhKVcvJhVNctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108141

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
* Add support for AES-GCM-SIV in GnuTLS
* Add support for corrections from PTP transparent clocks
* Add support for systemd socket activation
* Fix presend in interleaved mode
* Fix reloading of modified sources from sourcedir

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/chrony/{chrony_4.4.bb => chrony_4.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.4.bb => chrony_4.5.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.4.bb b/meta-networking/recipes-support/chrony/chrony_4.5.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.4.bb
rename to meta-networking/recipes-support/chrony/chrony_4.5.bb
index d4e03bc18..ed26e5987 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.5.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088"
+SRC_URI[sha256sum] = "19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422"
 
 DEPENDS = "pps-tools"
 
-- 
2.34.1


