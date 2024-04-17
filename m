Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB6BC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2755.1713318086965173611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c7S0dU6U;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318086; x=1744854086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ptP2rMwexxuU6F6MFV6WC4gixWu6OZSbJslzCENDB+w=;
  b=c7S0dU6UyPTOQdA6Wo9ez0QmRezB6BtEZSF0U3JlItTx7Yi197EhWbQg
   Zf/h2HR/0fdk1b17KCx6HNlI0viN7Uiy1Y2nO2esvaLNvyqHaCtZc9Xjy
   J38oh0vv2wTrJiednFXqJ8iB1dkqErq4c3uiaMqaqsRTRUk0fZyfznthJ
   DZVEwSx+l3zPUUPRFu0xnTfwSHttChzKyvaQX+UatVnrT14eiJAYRVgXt
   gr/4e4k8wfhC5wlObPNDv7cDhhShQHnib5WrjfBBSecT6kwjK3dcgmzul
   aLQN5afo4GJ/NsqgBNZQ7XPOcXcUHXf8Eo/cH3sABZ9pKdvhxQlrX+k+1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="134609843"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="134609843"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9500EB325
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD2B7B88E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5364A224617
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00CCC1A0002;
	Wed, 17 Apr 2024 09:41:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/49] libcrypt-openssl-random-perl: upgrade 0.15 -> 0.16
Date: Wed, 17 Apr 2024 09:40:23 +0800
Message-Id: <1713318061-17128-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-2.033800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwOkJQR4QWbsCia
	SqRpkfBtveD4GIr37leeDyFF4ZL3f1R/KlnDpLSlA9lly13c/gEohquWh8Y7agfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmip4Yp7RFk6Se5x7uAXGEprZiQDIJsDspX/rvCkqsgk0HHWd
	s+AIXqIVslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDgNEu
	Xh3AIwJ3Jz3Liov2cxla9dwReHAsVAwCwSRho2VEbrC7UW6OPWUBuGTD15yw8PJGiZv59CmOQLN
	vWVV1Vwsbxb10OxKLYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- add github actions, travis and appveyor.
- Many patches by Takumi Akiyama.
- Fix broken github image for strawberry perl
  by stripping its PATH. their new mingw is incompatible to their
  old strawberry 5.32
- minor documentation fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...andom-perl_0.15.bb => libcrypt-openssl-random-perl_0.16.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-random-perl_0.15.bb => libcrypt-openssl-random-perl_0.16.bb} (85%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.16.bb
similarity index 85%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.16.bb
index 9bfb631d3..dc2075d13 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.16.bb
@@ -5,8 +5,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=089c18d635ae273e1727ec385e64063b"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
-SRC_URI[md5sum] = "bcde8d5a822c91376deda3c4f0c75fbe"
-SRC_URI[sha256sum] = "f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4"
+SRC_URI[sha256sum] = "fcf58cb2af4c3eda2fe1405527d9373efe9576268fce8adb34df9ce9b6b44d1e"
 
 S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
 
-- 
2.34.1


