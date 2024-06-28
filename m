Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2788DC41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 03:19:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.9062.1719544779159106939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 20:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cO3HDamE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719544779; x=1751080779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Us786XWWlM9aAI9GsaYLzZ+dqznavliaPsgukm+neX4=;
  b=cO3HDamEZPuTFmsDXTXAhsGpp4RdCFAkKVhocwmwGR1h1nzNTniZFw53
   VdAoZYyDu4yh7QI4Gfnkf5TMAA2GMgv9brNhbn56OyW4UqB5M+ralvrxi
   FPnVEy1bf4NQQikIdX2mbUE32Wz6sb7vCDVRoSoKaYLyWZorIEFlpXSLB
   6dH0I3NWSubQg7NV3WqRkhU9k+kp+XCyyiSNppj+Cf9OEQxf4h3RdxU1N
   IjAQrPM9jCYnkhZRMoDlKT8VkDKGuFPLuUxtQfW+t07eY25rimEbXa6QJ
   AkzhUy+jNcVQcHAakSOwY360qjD2KWRq98gXzOn7PgqnyfANvSPze1xMF
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="167078167"
X-IronPort-AV: E=Sophos;i="6.09,167,1716217200"; 
   d="scan'208";a="167078167"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 12:19:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77583C9443
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AD1D3D5612
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 470452007CDE9
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA9A41A0002;
	Fri, 28 Jun 2024 11:19:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 2/4] linux-atm: fix build failure with gcc-14
Date: Fri, 28 Jun 2024 11:19:25 +0800
Message-Id: <1719544767-17994-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
References: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28486.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28486.004
X-TMASE-Result: 10-3.032500-10.000000
X-TMASE-MatchedRID: 3+BcJt5VCDhaQiLka9EcSk7nLUqYrlslFIuBIWrdOeOU8ftiyKjZrUFv
	XwCiRuxTAUaDnPkDTLjy0UPlcFCEcZGaKgWIisUSngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AEnRE+fI6etkpbAbj7lHZzMjIh1JwbCyDi6DG25pc3TFjpOenuIGFwl0WPUCiuwHjqW4e
	FZB1wH1WsNdtw+gHMYZ0VOnm2eYHiUxlrUDRRv4ku/kTKv9giuqwOHO1Fdn0Kb4tj0DvxRUIs9r
	o6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 03:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111135

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 86b9112ba..c434027eb 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -29,6 +29,8 @@ file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"
 
 inherit autotools pkgconfig
 
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 EXTRA_OEMAKE += "ROOTPREFIX=${root_prefix}"
 
 FILES:${PN} += "${nonarch_base_libdir}/firmware"
-- 
2.34.1


