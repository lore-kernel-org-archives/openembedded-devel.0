Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78055C3065A
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.167218.1719305823018702830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t0IrasN3;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305823; x=1750841823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XL9DSVEK+GY4KFV31Lpv4K0wCCpvTdhKHIspjdz6+jE=;
  b=t0IrasN3CnOxcjb5zPLd7JbVqpP9xf8iOYnUgJi8krJRmXAbZKWbFid5
   sGuldSxll3ljzjbBk0zjGfQdnZecEdlfdogiNA1azDxti4w79duCALXV4
   5MBADZveVA7BENJT90zactBOSoPl18Kx2rAjf1DLswxhhNM1TEQ9jWqB8
   YEoHdIWrl9OyU9rsTpTcqqUEX9PDUNAQIYmzboAjuB5l/oEDoitjD0WYk
   He7RQ1Esev7iyOll99LFdj3g9IUZbqAg84apy2BEbV7BSvQyJy2i0aM23
   LisAegSqYqGD2XAyemfHBa8FxuiMgbgRNWT79sJV91o1PUg7EFYcjCt8V
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913859"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913859"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56810C9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A07C6D50B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F4CE2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1A331A0002;
	Tue, 25 Jun 2024 16:56:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/57] libdaq: upgrade 3.0.14 -> 3.0.15
Date: Tue, 25 Jun 2024 16:55:46 +0800
Message-Id: <1719305790-11484-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.508200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNaDCzqDR7DPaR1LeQ+VpnJZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S4r3mhM+034AbAKcpFUkpKSmkQZWy+eSyYx4NKxK4TNQAVf
	5ZRKqNGTpmoKlFiDHwYsNfVdVt9xdO/ZwIZKQsDkOAMCFtAQtiS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 api: Add DIOCTL_GET_CPU_PROFILE_DATA ioctl to get cpu profile data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.14.bb => libdaq_3.0.15.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.14.bb => libdaq_3.0.15.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.14.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.15.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.14.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.15.bb
index 74964e074..9fe1b3823 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.14.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.15.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
            file://0001-example-Use-lm-for-the-fst-module.patch"
-SRCREV = "4e68d7ba6940df9a1503599d7b177029112d6b6a"
+SRCREV = "1b20345a3a714d2d0ffb71578ff75bcb207ae92d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


