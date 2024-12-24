Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932ABE77190
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.30501.1735032437818616454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pp8bXclt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032438; x=1766568438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7UWtt30f8JW8qiq+ls5pUC9Q8ZVcP7Lt9TIojE/bqPo=;
  b=Pp8bXcltAwA/IDOlVxNpCpnaNAGng7vqxgrMC35IW8Wz2gMZyaq1ud82
   WcCrgFzMsR+1tkN3481cc4srgzyfdFtGr/nDIvt3zwQs/3+YH6knB1S6z
   8JcgYf+Pz0uk3dL6bbpXPTojxOkwF1MJZ3U0mUYFHh9pICoIBVbeT8zdu
   RgD3IDsxy3YpqW/lK4pbmeF909EoqjJ/BaDiaKwdjbHr7R2p+L+ZENmnO
   e9dCf7hVSJhYav0ZOODgE+TOH9/DVMOKCIwdqrpom+hQoZ6uZtmxOusor
   R7oKfZRRUizZx7Iai1hMFOSwmH65IH9++wdRsUnB5VB9nH7p18/uNcYYb
   A==;
X-CSE-ConnectionGUID: ihkVthLMR26fG2Tsov74dQ==
X-CSE-MsgGUID: TdjapdcQSAOaJEp0jCJ0pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="185003187"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="185003187"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C58B6D8E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90E22D96A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 215E56B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BDB361A006C;
	Tue, 24 Dec 2024 17:27:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/67] libsdl2-image: upgrade 2.8.2 -> 2.8.3
Date: Tue, 24 Dec 2024 17:25:57 +0800
Message-Id: <1735032421-13513-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-3.261400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwirnOiVqoPSPizy
	bVqWyY2NFgiA/wrkCMIF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN3/KVtfZiSDpokgbSk/zIsGHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDW7M4
	aUdRgJMn/Z2aH6xccunuOfu6b0cSw4c8OqQsYp3sdU9/nQzbQQUN+6taUvm3SwS5wRGHdZB0TAD
	cnkdLAAO/wnEt91yq2AcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114476

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed handling of grayscale images with alpha

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-image_2.8.2.bb => libsdl2-image_2.8.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.8.2.bb => libsdl2-image_2.8.3.bb} (91%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.2.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.3.bb
similarity index 91%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.2.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.3.bb
index 267311853a..33a42d9728 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.2.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2f6d9e01c97958aa851954ed5acf82ee"
 DEPENDS = "tiff zlib libpng jpeg libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc"
+SRC_URI[sha256sum] = "4b000f2c238ce380807ee0cb68a0ef005871691ece8646dbf4f425a582b1bb22"
 
 S = "${WORKDIR}/SDL2_image-${PV}"
 
-- 
2.43.0


