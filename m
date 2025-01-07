Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A91DE7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.16416.1736240519323788235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FMIXhtZO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240519; x=1767776519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0DCJjyOa6xMKMeF1A1h8E9DH3TwiQRB29xwHN312pN0=;
  b=FMIXhtZO1xg1TWvCTJScrXE7m8m2ow2u8mxjvjmK7KgWk+aYPHaqOVZP
   m+r61+b08v2cto0Gju+yxtB6AVivB4zlMeKrKtcshjbLLUBJYYf4vrRiO
   MQqQXFJtdnjgnS7p+JLTPXJn1z8FGzbjm4YViMfczQnbVgCazCFr3hXmv
   Wi7ty6CgWAXp3uLEl4oSDSPS4nbS6SOINNrPt3qo6dPn/lawnEeV0RWNX
   3AMllqGlJfqMsOCeac7om5NsgRtJyuPrbN/oS/QbuwRC3CEMvqx/wGN1m
   sRZX7oEK2DkgPjJE19z0/X0GDE5cCT+COG7gysVE8wCu/WK8qWxtM8G7+
   Q==;
X-CSE-ConnectionGUID: ZXSaanBeQ8mpF+BFdzecJg==
X-CSE-MsgGUID: DoQsDhg1QL+6tclj73XjAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="164688791"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="164688791"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49734D4F5F
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E45ACF7DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD55B200930C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 68FC41A0071;
	Tue,  7 Jan 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/18] python3-pyusb: upgrade 1.2.1 -> 1.3.0
Date: Tue,  7 Jan 2025 17:01:41 +0800
Message-Id: <1736240504-5315-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--6.357600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrN5dqZcIK7Vh4s/vUphzuijq0
	1dabe8liBL6h+t+VCWJBPHspXpA2wZRIfjKGY4uapzmJJw2f0KEwJwB9TKmJWG6GkFW87eM7tY4
	N1nU8OYQMI2dvwKu82jqwdfUsZgWBWoBAdcjjQZrRCUFHAmq1I5mYsOd3akjfJJvy/zCC/vICen
	D53cL1IuArY2JkKW9pIgh5J3RnkhWhhjsqgSuNbxF4zyLyne+AH1HHB9zmY2abKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWM80yxUZ7Lx6dPDzySQuEJuMbQROIbMCAi1xi7bDbJ5NySpVMyuo3q
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114689

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- meta: bump the minimum required Python version to 3.9
- core: reset cached endpoints on alternate setting changes
- core: only search for endpoints on the correct alternate settings
- tree: guard finalizers against aborted initialization
- version: handle when patch component is missing
- core: fix bMaxPower conversion for SuperSpeed devices
- openusb: fix missing commas in __all__ list
- libusb1: fix trailing comma in LIBUSB_TRANSFER_TYPE_CONTROL
- legacy: Fix DeviceHandle finalizer checking for the wrong attribute
- libloader: search in default homebrew prefix on apple silicon

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyusb_1.2.1.bb => python3-pyusb_1.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.2.1.bb => python3-pyusb_1.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.3.0.bb
index 2282e0300b..4f1c53df55 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.3.0.bb
@@ -9,7 +9,7 @@ RDEPENDS:${PN} += " \
 	python3-logging \
 "
 
-SRC_URI[sha256sum] = "a4cc7404a203144754164b8b40994e2849fde1cfff06b08492f12fff9d9de7b9"
+SRC_URI[sha256sum] = "7e6de8ef79e164ced020d8131cd17d45a3cdeefb7afdaf41d7a2cbf2378828c3"
 
 inherit pypi setuptools3
 
-- 
2.43.0


