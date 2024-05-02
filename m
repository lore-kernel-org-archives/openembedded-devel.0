Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771CCC25B7E
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6689.1714628980640459092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FzmOzmxg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628982; x=1746164982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SN+Hc0QKrVd5hLtU6z9DDVSi5eShCuuVYwTf4yXj6+k=;
  b=FzmOzmxgSVLFqOdo71igWnkec2tXoov3pR4Xy7eY5FuNZW30q0uBZZSv
   kMuPEk95mNkachvxZRIA1RHANEKscHBAS3l+zxfl2cSBqNxe8CRfI0YCz
   GLcubd1mcmkSVbE75sieU6TdEa75l2W/8xsxM2iknfO6eQ2UXoo6vXmdm
   ddEQxs1QF96eh9PECTMRKHmBiayU0F2iYZY362MQdwmIbbbyXZU1WgUYP
   PWO0r1l4l73G8eArszmiaVbxgJ3FoijzzXLZeB3ZCgP31bKNX9yK7CUKj
   PAGmupQ/v2IDMrpwxR69V92MW96Uy7PEr3c1fAhP+RNrx6hnfAPYK75kT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="156670728"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="156670728"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 448C0D4C2C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E476C19D2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C783F223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:30 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6AEDB1A0002;
	Thu,  2 May 2024 13:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/30] python3-web3: upgrade 6.17.0 -> 6.17.2
Date: Thu,  2 May 2024 10:48:22 -0400
Message-Id: <20240502144829.241208-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--1.457600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrf6yIJ/9AolPozDhGeQC9EqHM
	vzTTlj3I4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAHpuDbMFfJpU72XK5JBPh8eUVfbRC2X72T5Q7wro8nuPTTw6/X0m5gPoumNe2Tr4faowL
	a/g07Fe25WHvrMuGT9fmWLalo3SBIaT7FRqp0wPAcQrAfBh69vBRLFeH6OJSCTDD+DBjuEw
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110236

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Revert pin of eth-typing to utilize EthPM types.
- Add upper pin to eth-account in anticipation of breaking changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.17.0.bb => python3-web3_6.17.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.17.0.bb => python3-web3_6.17.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.17.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.17.2.bb
index f1be4dcf4..e695bc27a 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.17.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "1b535272a40da3d8d2b120856edb53b84b0c08bcc8fe1a5bbd5f816fd72f4ec6"
+SRC_URI[sha256sum] = "8ed8b7184eba5b00d0849efb95c8ec6f3220aa8886e740182bb1e4f1247cca3e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


