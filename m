Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCB8EDE99B
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.18593.1725959007929730214
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BBpbQ455;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959009; x=1757495009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=omVG63wxxkJRiJuUHIQ2y3k2/iPxIkDnnK99ub0I2KY=;
  b=BBpbQ455UpTTlGfInjfHoq/dxqFp3Z6/s/7A0wvhvvaCRrLELfDMx8yz
   KX7WpmRmoV0JQEYauQfkCCOKJ+dFmvP8RZY06sDCUqvlUmvlGocPZiV/m
   bna5XQWcxI2jkj0wJk0u8EvKdC1KqcoS9nhCKVvVKYDnK9hQFllXPhWKs
   p/QwDRhKWTJYKECQelglQiRUxDXwa6EFRmA9E0zR1ANi+2p8aDrtTmZfh
   +TPoN6tuVu9aMHns5wzaHQlgUiV0RkE6xjCfKidH8aQy6D+1Z+kkeI3Zp
   AbsymdBZWjKXgHoxh2lAkuXMQAqmQJ3PmInsuEr9o7/BG/+MtPaZ5mtBq
   A==;
X-CSE-ConnectionGUID: DWOsVoxRREGKB7NfNBBY8Q==
X-CSE-MsgGUID: Xd6tl6BESC+Q1mRKJLLGFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152237301"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152237301"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52C9FD2ABF
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 899DCD8B7D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A249200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEEE21A000B;
	Tue, 10 Sep 2024 17:03:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/42] libspiro: upgrade 20221101 -> 20240903
Date: Tue, 10 Sep 2024 17:02:43 +0800
Message-Id: <1725958990-5719-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.693200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLP85tlrdTfE3uDhljfG03rOwpfLMeBwRv4qCLIu0mtIHXHQq6zBeSUJ+m
	KA5rZIpiESVL06fzYO9wU8VHXGipCHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4CsH
	Rvk3/Ws8pLBpKipOJBJ1vBP/taVRKBTa/KvNZRHrquR/2V3i+cKPL5iPvMJv0ioZzy6VsFu74rt
	ZkBgtQ1PlKoieG6aF+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112200

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fontforge/{libspiro_20221101.bb => libspiro_20240903.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fontforge/{libspiro_20221101.bb => libspiro_20240903.bb} (87%)

diff --git a/meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb b/meta-oe/recipes-graphics/fontforge/libspiro_20240903.bb
similarity index 87%
rename from meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
rename to meta-oe/recipes-graphics/fontforge/libspiro_20240903.bb
index c65a2d8ed..7e07906e1 100644
--- a/meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
+++ b/meta-oe/recipes-graphics/fontforge/libspiro_20240903.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://github.com/fontforge/libspiro/releases/download/${PV}/libspiro-dist-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5984fb5af3e4e1f927f3a74850b705a711fb86284802a5e6170b09786440e8be"
+SRC_URI[sha256sum] = "1412a21b943c6e1db834ee2d74145aad20b3f62b12152d475613b8241d9cde10"
 
 UPSTREAM_CHECK_URI = "https://github.com/fontforge/libspiro/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+)"
-- 
2.34.1


