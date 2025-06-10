Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB013C7114A
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.77955.1749526431400049978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HV5a70xJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526434; x=1781062434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5yM32t7kUklXTxoTHyWllU20WZrjKl/EGJsdZjCfxM0=;
  b=HV5a70xJkAy/gmKjcZB36iv6A7XSaqJ+2QuXaIVz0cCElOJ5EN0ylxqb
   iBK6ohxSgEcbDj9gQEDor3W0C88HLTsceMu1qas+p3gOUMysCeXDSztJJ
   6hT48gddqa6T/TGqoFhitEqgy2Ldijjl226vcgZBzrP/cUmpbz3JGq/c9
   9c2KbCOLrwfzaYRZt6wq59SbH/U1EkxIVkgSWbCR16UuBY7ygyCR0ov0g
   +E7LkK1sjh23ACF93qXVQ+rxtXgPmr3yoEUOopJEAlt0Vxzv4DGreIju0
   MQhLgGaUkPXO1ZZqg0YL/RKGbDvQpiTTKx0i83w3LTLS4wBGRFfnFHfQb
   g==;
X-CSE-ConnectionGUID: 2pxCCObTTbKcBi2X/bRE+Q==
X-CSE-MsgGUID: Abr0HQllT7WiIe1U7mAmtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181121892"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181121892"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4436CD5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E2D1DD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66FAD1A0071;
	Tue, 10 Jun 2025 11:33:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/64] hidapi: upgrade 0.14.0 -> 0.15.0
Date: Tue, 10 Jun 2025 11:32:36 +0800
Message-ID: <20250610033330.924-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117837

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hidapi/{hidapi_0.14.0.bb => hidapi_0.15.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hidapi/{hidapi_0.14.0.bb => hidapi_0.15.0.bb} (90%)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
similarity index 90%
rename from meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
rename to meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
index c7a487ba5c..12823575f9 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
@@ -11,5 +11,5 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-SRCREV = "d3013f0af3f4029d82872c1a9487ea461a56dee4"
+SRCREV = "d6b2a974608dec3b76fb1e36c189f22b9cf3650c"
 S = "${WORKDIR}/git"
-- 
2.43.0


