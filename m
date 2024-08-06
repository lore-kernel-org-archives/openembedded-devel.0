Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74370C52D74
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:46:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2881.1722934014816930232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tWmBs5DT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934014; x=1754470014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LvgHDq1fDUewFPStjqmPE7cGdt3v2p8xF3mhFY5eNRc=;
  b=tWmBs5DTHYCBjiOSjM/Ps7harg3r/KlACl46Upc73x3Hh70M6ypR/B2E
   yWCCTNftVbGHH9a8EOIbTfn/UADC31VS3K0snSOwhXUHgtYM2EYZUbAPq
   dZIxVGTCPmJsTKcxNOILHc3EHWFu10ppdPoxUqnsnTvsA4Q+/ofwgAljP
   EUvW8It7izwX3jgQOc1gvlsxmDltNkN34HGRc2H+/4eVhaT6ZR82oCUlp
   dcYxwWvtcRQV31s+41fqlYakgpNs8I5gZyHIcDsVvOGatx6Gl82PWYhtP
   BR+hXoyVkmplnVtifT7Jzya2xxiTdyTHrZeA+evMTuBQaVP8hODANhWjx
   g==;
X-CSE-ConnectionGUID: Upl3nAwrTlK1PGE8p8ODyQ==
X-CSE-MsgGUID: uvInDb9OTcK5zrex0JSvMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="170035560"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="170035560"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57228D4240
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A1FC5D752B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 462E820050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E859E1A0002;
	Tue,  6 Aug 2024 16:46:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/60] cryptsetup: upgrade 2.7.3 -> 2.7.4
Date: Tue,  6 Aug 2024 16:45:38 +0800
Message-Id: <1722933994-32549-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.360500-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorUK0
	74AiC6FvaEQS/oGcScDmn3xyPJAJorz5DD0+tkb1ngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXkCpaWVyNnaMQFWZUg1GrUBNRh8JQ3Mpco9AKEQgwOox/2mjWdjtqUm0dW2SvsUFAGQw
	kyU+qRZJ2yJICN4Uty3LmFGn03Kb2AcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111522

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.7.3.bb => cryptsetup_2.7.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.3.bb => cryptsetup_2.7.4.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
index 7c83fec43..a57d79d6f 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b772ae4f6df0cee7200b28cea960e4daaff2a203d2fd502beab3c1317b07a456"
+SRC_URI[sha256sum] = "dce29903a58f7b774fe61191e7e6de955de0f40d9e27b0028ffcf3438c0e9480"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


