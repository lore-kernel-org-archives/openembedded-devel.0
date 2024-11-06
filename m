Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B99D29FA0
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.40131.1730874676482827245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TghFKD7t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874676; x=1762410676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ev+c+R7Vv8QkOQ4wZAlyET32+Nicvf0DK/VcAdgJtO4=;
  b=TghFKD7tTX3D2TfQu0XdemvWMX5fq+CxQgzsDaKA3Fllv5u89cNT9Y2+
   uiLStKcDZf6uSo9VqlYSMrtQb4CCnJ1z7/fCqfQQ8PvP53V47v/42cfmU
   NfrhfumAQbtX1glzwb+xG7nb4ICOnaHJR2cJbVG8uqADY3gtC4OUfAgUF
   SXxlIl1Bz94XeJeMbu+NW7BDg6wyEcHY2u2NXcqyInl460Dmi+1mJwYYi
   k+lsy6GOGaABbJTdPWPGFeTdY+P50X1uqhepPIMNP1lX2rrIuovzF7W+a
   7Zpj2jj3Y/1rcBMxodig/5VMTDyoaLpdGW0vWz5uUHY6V8eL+lCT9WjME
   A==;
X-CSE-ConnectionGUID: tbCEK+3nRXih9gX67q0fCQ==
X-CSE-MsgGUID: yy3ZjkzoTEGT2+VnekEwug==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179498398"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179498398"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:13 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E7B77C6846
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FA53D50E8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B18546B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5F2A61A000A;
	Wed,  6 Nov 2024 14:31:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/46] libzip: upgrade 1.11.1 -> 1.11.2
Date: Wed,  6 Nov 2024 14:30:25 +0800
Message-Id: <1730874660-2364-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.040500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8c0o6rNiKBipsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SMrukuzGQbhavSPt3T9EHSPwYR+Omf4QrUk9Zxwb/Vg4UKE
	vxWo4gHULDpY/sCaJBIL18udogWgC2ZDEgyw8j2/qJo2hkibQWS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113697

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix performance regression in `zip_stat` introduced in 1.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.11.1.bb => libzip_1.11.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.11.1.bb => libzip_1.11.2.bb} (91%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.11.1.bb b/meta-oe/recipes-extended/libzip/libzip_1.11.2.bb
similarity index 91%
rename from meta-oe/recipes-extended/libzip/libzip_1.11.1.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.11.2.bb
index b1a0dd66c..527be364c 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.11.1.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.11.2.bb
@@ -21,6 +21,6 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "721e0e4e851073b508c243fd75eda04e4c5006158a900441de10ce274cc3b633"
+SRC_URI[sha256sum] = "5d471308cef4c4752bbcf973d9cd37ba4cb53739116c30349d4764ba1410dfc1"
 
 BBCLASSEXTEND += "native"
-- 
2.34.1


