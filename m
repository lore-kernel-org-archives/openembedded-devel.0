Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A733C04FF6
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2754.1713318085926072046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=POvu5pbM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318088; x=1744854088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cRZcWBZkh3R0Dx2E4OObZbsD9bOFue71CD74s+1JMOo=;
  b=POvu5pbMVshAmsN6YcpI2DWKZpie4H9LOiORrMHeXYDSPwZDFhq5icML
   mRQlOZiKTLPHyRufljfC8yAjN4MkAbUd/+QR00Se8vdDzlddgwPrL1HxZ
   fiM+UjiM37LnycrQPXdvAZVRyNakYzwnbin9rORxVZeszLY3iE5WrQEr3
   VMr+4kRjTdkPx9gG29NCt6NoHa6M7U18Fx1HawUwOYGEt7M1rhfnlVJSc
   39O3c25kMJfIneO/ivRHmyorKgDkoRLtkgi3mjrKNaDUankRnOdcIigZ/
   jo/vt4WeSm4rLajOCvfkAvBZXYwVhgEclGKZSvMA29Ch6asV6mcHtZfVu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143393381"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143393381"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF7C7E0AA2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA81ED5B33
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69856200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 13B171A0002;
	Wed, 17 Apr 2024 09:41:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/49] opensc: upgrade 0.25.0 -> 0.25.1
Date: Wed, 17 Apr 2024 09:40:26 +0800
Message-Id: <1713318061-17128-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--2.973400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFolk7
	bKtaEQ1aOizVMXf88Oo1aRRWbFH55R2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFrsq/7BhdGyDwbwIBMSBLpk50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKG+sn+g5kvITwfYQGf00//eyWHSEPPS1fy2Tb5In/EW3NcW
	XWEyLsqStgkdNMoT0/k22KsXV0GdNGxMEP+3oJCKuNVjOGR8yxLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109999

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add missing file to dist tarball to build documentation
* Fix RSA decryption with PKCS#1 v1.5 padding
* Fix crash when app is not set

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opensc/{opensc_0.25.0.bb => opensc_0.25.1.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.25.0.bb => opensc_0.25.1.bb} (91%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.0.bb b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
similarity index 91%
rename from meta-oe/recipes-support/opensc/opensc_0.25.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.25.1.bb
index 02c9c7e80..19fb78092 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -12,9 +12,8 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 
 #v0.21.0
-SRCREV = "67986eda93a3a359a897f0b0be97f4315dde8d42"
-SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
-          "
+SRCREV = "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
+SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https"
 DEPENDS = "virtual/libiconv openssl"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


