Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B834FC71148
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.78436.1749526427996707314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h7CWvxqi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526435; x=1781062435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xwvquLbNCxTKO3rsRkjskIJtf/W3LIO3+g5ok1UxgU4=;
  b=h7CWvxqiUDVmXOPTF+WCojJ91q5167ElW7fWdKoAo1WoxX/r2fKl9HM0
   IDd8+2DmKI+1B3YWkG5BItPpxAOSE21FVPJLjnmvVN7EfpgxyZkEIZIbt
   iVRjbLvRToxUYIGZbz/yTefaw+qeCjdh/JM2Xjh66+gOyCU2ASS/BaC77
   gCe/725E0gCmMeZ1i3IXV2MYs1GeqSwl6MwDMn6zOJ9ahDkMr9HZn/HQE
   YbzesAO10mfx1KjTcAhtHfNhf9HVIh7Zt0aJF6auD5dBmvUNGCTIIEKDc
   PYKAzYyNt6fzoCXAFhnbyRxFrfM8Eu8d1C+DRGTMoW57xT+/JqZN0PKgc
   A==;
X-CSE-ConnectionGUID: DFgSSkctTG26/BpOnEkuKA==
X-CSE-MsgGUID: LLNomcw7S5KIpnfsWtzFLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680487"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680487"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F983D6883
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DB688D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6195B1A0071;
	Tue, 10 Jun 2025 11:33:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/64] python3-pyais: upgrade 2.9.2 -> 2.9.4
Date: Tue, 10 Jun 2025 11:33:14 +0800
Message-ID: <20250610033330.924-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117839

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* better error handling of invalid fragment counts
* add support for variant of message type 8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.9.2.bb => python3-pyais_2.9.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.9.2.bb => python3-pyais_2.9.4.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
index a1ae92985a..a661606b80 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
 PV .= "+git"
-SRCREV = "9ce53ae21f19e8dc6e7b841dd0ccc246898730ea"
+SRCREV = "e7780f743b03c5e6ecc651fdeb209fa94e0e0250"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


