Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EE4D29F90
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.40128.1730874674374261092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KDhQK0Gn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874680; x=1762410680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tYCWD/Kgk4IbyHJJQ+W/qQcWJHGo7LnuVd8je5R/Bjs=;
  b=KDhQK0Gn4TQ6e5LUmQtauc54SvgB0rCDMx6MfYsgYIFYtFMmuYaa/0iF
   U9KDx+/dMxzfp9hnZ1FIFCzNky1so/6d0vedotdqucJmNfuIcFn5piinL
   kR1xqKx6DJx7qxiWpcGDNBgUzcA+v7v3fNNE/Qc4/KaJaKJCebZZWQEXH
   FaHe3/RYqNrYNR7EYjyzCdLeiJA6e2+7eagQbrfoGAw+TntHELKC2Ofea
   FsEiSJJ7BNyV4vMLNVO+QH57SaHLmtXQSUNriJQlkY8MAUg6Q7GsM4OCF
   h5EMUXej763ZhwqAT5lfU+5L/v1wfJEOsY2OMfMIeAtfJR01FdlmLfiPn
   w==;
X-CSE-ConnectionGUID: ICOjXz76QAG5V2p7x/GJlg==
X-CSE-MsgGUID: ZpGp7pBsTlSffdesZ9aY1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167293865"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167293865"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BC672F606
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 83373D50F4
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B8C540A71
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AFCF51A000A;
	Wed,  6 Nov 2024 14:31:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/46] python3-croniter: upgrade 3.0.3 -> 5.0.1
Date: Wed,  6 Nov 2024 14:30:33 +0800
Message-Id: <1730874660-2364-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-0.800200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrYVwt5Zxwk5lUjspoiX02F1YM
	JR3dIrh2OINY3OUapTCDXfy9oLSMc6DYXYfm/1t4A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNT87o4uFUdFRdkKwXOloxsPWESVwkRlKSN0DW/le/Imy2webS3f23O4macy7VxHRuGJwv
	Ry6sG2Vl+8NTD/AKls2Za9k+/obe6oEGG3M+VOyU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113703

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Community wanted: Reintroduce 7 as DayOfWeek in deviation from standard cron
- Remove DayOfWeek alias 7 to DayOfWeek 0 to stick to standard cron
- Fix DOW ranges calculations when lastday is a Sunday
- Fix overflow on 32bits systems
- Fix python2 testing
- Modernize packaging

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_3.0.3.bb => python3-croniter_5.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_3.0.3.bb => python3-croniter_5.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_3.0.3.bb b/meta-python/recipes-devtools/python/python3-croniter_5.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-croniter_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-croniter_5.0.1.bb
index b0cda74f4..ca99bacf7 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_5.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "34117ec1741f10a7bd0ec3ad7d8f0eb8fa457a2feb9be32e6a2250e158957668"
+SRC_URI[sha256sum] = "7d9b1ef25b10eece48fdf29d8ac52f9b6252abff983ac614ade4f3276294019e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


