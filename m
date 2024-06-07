Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD00EC41513
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 05:06:37 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.34676.1717736795942003390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 22:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cv+EOA6i;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717736796; x=1749272796;
  h=from:to:cc:subject:date:message-id;
  bh=6n4vp+pYDCIc5k37fsXrt6AVGQFieiugT7PFss8yrV0=;
  b=cv+EOA6iAknEzzSP7C+9iEeJ9G9nvXxgntOlas5R+7hI4fmMz5IObmZT
   haapixjEG2CTLHAhXuRKDUWYImQq6mI0TZjRBvSq86/XzYfLMQRynayZT
   X2QmCIEMAamTEgr+zfoDopDRoPpFkkQ8UGhyXCowGt1RNpktMmK8coQVk
   GbdvHb/UbLCOgKchp0tyYoF6uM4EdMhSTgH+D9CTCHxc/1QUnMsE55Dwh
   dRFNcPJrqDDUQcEbVRsKs1CTULVXes7r6Crpt8DL/8ZQzm8rCR8pOLYFt
   6ShzPtrCxaXI1jazmetT8MjccZbXZTGub6jBaQfeyg8fECxH4lvhnTgV5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="149660951"
X-IronPort-AV: E=Sophos;i="6.08,220,1712588400"; 
   d="scan'208";a="149660951"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:06:33 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 19FACD6EEF
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jun 2024 14:06:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 53BD8D3F0C
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jun 2024 14:06:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CEB8F347AA
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jun 2024 14:06:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 581001A000A;
	Fri,  7 Jun 2024 13:06:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] libimobiledevice-glue: upgrade 1.0.0 -> 1.2.0
Date: Fri,  7 Jun 2024 13:06:19 +0800
Message-Id: <1717736780-20965-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28436.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28436.005
X-TMASE-Result: 10--2.329300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrJ4cwIYL6Kufj+yfWw+4UlBwz
	72zDzvkONscteyNb+fi61NiYskObR/XNEkgZOg/OfOaYwP8dcX4E9jhJ6ArePH0EjOOM/PN6gvO
	xzjFAiwHUIKC2z1kBET6P3kAlvbW7HMPTw7mbdNED2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whjnijZjTXdvV2gws6g0ewz2fS0Ip2eEHnyFh/DzryTTlvc8O
	Jc7+0VJjoczmuoPCq1EZXE0PeW7fHK2uZbiolaf0nGcVHM5MoLA0nbv8xOBJzM+caLSjWrYftKk
	UUwoHg/Wk7D3LPmdzPJnz0HvUKDPfIwoheZzkC0dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 05:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110759

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* socket: Use poll() - when available - instead of select()
* socket: Allow NULL as address for socket_create() and socket_connect()
* win32: Remove windows.h from public headers
* Add version function to interface
* Add helper code to deal with NSKeyedArchiver plist data
* opack: Fixed 32bit buffer overflow
* opack: Fix parsing of 32 and 64 bit packed values
* socket: Make sure errno is always set on error, and always return a meaningful error code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...obiledevice-glue_git.bb => libimobiledevice-glue_1.2.0.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_git.bb => libimobiledevice-glue_1.2.0.bb} (86%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.2.0.bb
similarity index 86%
rename from meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
rename to meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.2.0.bb
index d37c547c9..c9e9c90d7 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.2.0.bb
@@ -8,9 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-PV = "1.0.0+git"
-
-SRCREV = "114098d30e783fbb3def5c9b49427a86621cfcb1"
+SRCREV = "fde8946a3988790fd5d3f01fc0a1fd43609ab1d1"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


