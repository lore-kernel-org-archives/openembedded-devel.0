Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86B4C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:18:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.937.1705972704058738568
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="148605811"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="148605811"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:18:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 88A80D9DA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:18:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C03CCD67AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:18:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B2502007CAA7
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:18:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DBDD81A006A;
	Tue, 23 Jan 2024 09:18:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lshw: upgrade 02.19.2 -> 02.20
Date: Tue, 23 Jan 2024 09:17:39 +0800
Message-Id: <1705972659-25050-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-4.907800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTSz0JdEAJbTQTQIjfeO4M2lF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74AQhNjZQYyI3I7fAojFMQGqtHH
	S16iwXoPAEcxX+jXaCUVRqSsAR4H/OwTo9ZXISSyeAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNaIBjL0CQ2REXqh7dWlIpOMpDfk4XHDlCNnF27LOhxW3rfqyT3tDoLnN2BRcQgaacMsko
	vzXRFfuwL6fHti7FjHCZHGo8pkSWI4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108393

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 get rid of some snprintf warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/lshw/{lshw_02.19.2.bb => lshw_02.20.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/lshw/{lshw_02.19.2.bb => lshw_02.20.bb} (95%)

diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
similarity index 95%
rename from meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
rename to meta-oe/recipes-devtools/lshw/lshw_02.20.bb
index f5eda17f4..70ae38caa 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 
 PV .= "+git${SRCPV}"
-SRCREV = "b4e067307906ec6f277cce5c8a882f5edd03cbbc"
+SRCREV = "4c6497c8b0a67cd9fa9693e9101a7cafd3297e81"
 SRC_URI = " \
     git://github.com/lyonel/lshw.git;protocol=https;branch=master \
     file://0001-disable-docbook2man.patch \
-- 
2.34.1


