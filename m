Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DFAC27C52
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10787.1715677833427102751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pp4Ez7mj;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677833; x=1747213833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5rSWmdUOd7H9KmWh4ExZgnaAg+FvaJMWviE1kT7qAJA=;
  b=Pp4Ez7mjsV/rwJ+BTGHrAj7bmv7tESQYQzSh816WwQMf2lTBsbBqaS2k
   cZeeSmJ6sbz3bQbg/mjIxi4Cvt6Ue3SmIHPxCBpg+hdQZ8ypKLKqGqjph
   Jb3h77ukRHdb+oGwgvNp0RTBhJptf+qkm0LKvnavY6APXE4rsU9Kd3T/m
   nKPxAJu/RZtjD9XqbJdDD6w+0ulmHRxJ8PNvOXNaKTybcvJ8iC1h58YL1
   kxupi2Psc467ySs/VchRCYWnKefmSL7TlccR5kod5Cs8u9IMAlRuz0bwd
   ShBX/4asO5gKSmJZ1dVsKJhvFab0tnYfkTTBTgyhp8t3rmJ8QPvQiAQ6O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137527392"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137527392"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CF51FC68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 16091D5936
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CDFC6BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A56D1A000B;
	Tue, 14 May 2024 17:10:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/44] opencl-headers: upgrade 2023.12.14 -> 2024.05.08
Date: Tue, 14 May 2024 17:09:44 +0800
Message-Id: <1715677817-2223-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.584000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRuu2GmdldmiUG90ib0DF+deREf
	fVh/puQ7egKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAkrZFL6OGTCZYI0+lIuTOnw3FJF/JZUGcevjOMkDFYFlh9YBYlw6kTObrFVR0jfv3ZGuG
	N0DfFfLxYENTIaf+BdYmVT38f1TMvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110357

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Synchronize with OpenCL v3.0.16 specification release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...pencl-headers_2023.12.14.bb => opencl-headers_2024.05.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2023.12.14.bb => opencl-headers_2024.05.08.bb} (91%)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2023.12.14.bb b/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-headers_2023.12.14.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
index 8b1c79566..01e83c812 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2023.12.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-SRCREV = "2368105c0531069fe927989505de7d125ec58c55"
+SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.34.1


