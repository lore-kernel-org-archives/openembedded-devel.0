Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5741EC71137
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.77959.1749526439495541180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lytH9Aye;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526440; x=1781062440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J0ieF19sRuoxD9WUVRSuNdqtOqKb5+rOYYeBHDtwRLY=;
  b=lytH9Aye5qGy5FLjIInE9/ChsmNcOF6tBk3dnfJVdW8DN5yQzmhMk2+b
   XVnhOdTCwRxdxfBeg4MdNalCTrvsUH8mwncr75FmZDdDCuHoxZ1is51m2
   FvxrviCVi4C3gTVf34CcNtL3GLIqriGJ4BMRc546x7nqfWv3I6z+lTP5n
   97XAy/cQ3Oe3hDcSBLbQw2CPLdbMM2GS+w8wSs7+4igs6isKCDsPokVH5
   mS0IrKR0djjDCiUhp71sdOrw6K+oCraK/dyXPeaZ2JKKzhcbUhhU4X6Qx
   RCHBEIsxSx9XTe0wVm7tmD75lg+wkFPFl+NIYa0qR3ubRgH1qIvisI/+k
   w==;
X-CSE-ConnectionGUID: BHwkGAv8Q6Oy3Kv2H7gfsA==
X-CSE-MsgGUID: ISVSv45yTPyloiR8RIf0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="201453630"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="201453630"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29E26C68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD43ED5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5049C1A009B;
	Tue, 10 Jun 2025 11:33:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 56/64] python3-web3: upgrade 7.11.1 -> 7.12.0
Date: Tue, 10 Jun 2025 11:33:22 +0800
Message-ID: <20250610033330.924-56-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117847

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.11.1.bb => python3-web3_7.12.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.11.1.bb => python3-web3_7.12.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.11.1.bb b/meta-python/recipes-devtools/python/python3-web3_7.12.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.11.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.12.0.bb
index ed57f6d79d..06e09b9cf1 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.12.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "1b23f323cb939c3c9c16a92228d1a62f109fed026089b0d8ce5829eca26031a3"
+SRC_URI[sha256sum] = "08fbe79a2e2503c9820132ebad24ba0372831588cabac5f467999c97ace7dda3"
 
 inherit pypi setuptools3
 
-- 
2.43.0


