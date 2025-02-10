Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED41AC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46471.1739178128513535060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=STD2Lqge;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178128; x=1770714128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A6XC5CgQRtGMYdpzrn53RqRO2XMe4ITmbio3gIOd/1c=;
  b=STD2LqgeGCEh5QhjS15Yru09KwS1B141LNu2I/cwXBbq9wFyk+9u8OGL
   kueVm0xQXyTDPMP8c/MK5NKJ7OVEpJVeuvMZNklKBsm1KKlGF+c0YBjO6
   WLyZ1qn81x13cuFXX1uSoZ6oOFLuDSKLhGBo3XR6H7DBoi90z5Y+Ijib1
   gkotmn1ife88mGqDJmhN7tlRGtzB8ibLwzqELGDZ1uzo6HXRLbID+AA6E
   B7hjyvKoYk2bfSF3oqt8i4JcSa8RTBk9Ik8MPBFqjx0rSC6MW/II5im/3
   UGS2CHLiqVwMU6jk7wbAHWFVf88VwS/RLkJDUQ+0+IVolt9jkMqDLKO57
   A==;
X-CSE-ConnectionGUID: h2OL/z3oQsGF+5GBcbw1cw==
X-CSE-MsgGUID: NMNhSRT+T5mGnEatgq2GPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712451"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712451"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41CF7D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A417156DD
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0BB31A006C;
	Mon, 10 Feb 2025 17:02:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/66] python3-mlcommons-loadgen: upgrade 5.0.5 -> 5.0.14
Date: Mon, 10 Feb 2025 17:01:18 +0800
Message-Id: <1739178095-26432-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115377

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ons-loadgen_5.0.5.bb => python3-mlcommons-loadgen_5.0.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.0.5.bb => python3-mlcommons-loadgen_5.0.14.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.5.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.14.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.5.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.14.bb
index 8e1f9dcd3d..7331612032 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.5.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.14.bb
@@ -17,7 +17,7 @@ inherit setuptools3 pypi
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "f6920307bc5f52fabee578be995c19443de33a4485907e34e1273b642c644ad7"
+SRC_URI[sha256sum] = "95594ac6cf78254bc80806873ad5e3b9d8662953b5f38c7209631a00a1ea8d85"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


