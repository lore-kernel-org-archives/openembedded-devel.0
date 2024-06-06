Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07B9C27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9748.1717664819136228305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RQ8aVFx7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664823; x=1749200823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ja3HrrqJYqE2FdFItuPM1YIUeZp2md8EFX9ksJoWr4M=;
  b=RQ8aVFx7UpAJuVh6dMnYv19Nxt+/BD7TNKTWjnDDo9srFPMjcW9hiu/W
   TUfw+UYDYy9EW+MvqyqmHPoaUVhvb4kC5HSEDjkfj4ElG4gcxNHOl7F3r
   EBwOS1CZ70Vd4CkLaxoaodCxr+TtdMNvvKYe8uZD0OIz/PP60a7a7oRoV
   zwZhi4gfVWDFOzCLoybdOZvrxGUiwlmw1pNrcm0ASwXoQGfxN5RpdL0s1
   TFa36jLV3M9yjkStN+X9MtTzw02HiCjQ7hCJEzsrWrLWSeyq/fsVLx6bp
   BulRzAMsNQWkU1fFHnxYoJoY38Lk9EV00wggNMVJnYZdV1DXXfI3YTXBj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162200495"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162200495"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB0F0ADA60
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E61C24E1F
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0E2A20081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C2991A000A;
	Thu,  6 Jun 2024 17:06:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/36] libimobiledevice-glue: upgrade 1.0.0 -> 1.2.0
Date: Thu,  6 Jun 2024 17:06:19 +0800
Message-Id: <1717664795-13902-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.289800-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrJ4cwIYL6Kufj+yfWw+4UlBwz
	72zDzvkONscteyNb+fi61NiYskObR/XNEkgZOg/OfOaYwP8dcX4E9jhJ6ArePH0EjOOM/PN6gvO
	xzjFAiwHUIKC2z1kBET6P3kAlvbW7HMPTw7mbdNED2WXLXdz+AcE5XPQnBzGXsrDwfHQQaK0qlN
	0Q/nVQuK8FBzdsKASwY018kD9GAOFuOt28pPRUYp4CIKY/Hg3AaZGo0EeYG954UhBPLRlvht9pj
	zubZ2rHJ0RPnyOnrZKiPu/DQbEkTcf1TO0D44GIYI/LwGIAMlBQesQKGJMnmRgPTsXUHvPGGeOo
	7/AVKbrNSXxFvD2AVcc5lZKxME5mfP6gzKxaUGNLv5Eyr/YIrqsDhztRXZ9Cm+LY9A78UVCLPa6
	Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110727

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
 .../libimobiledevice-glue/libimobiledevice-glue_git.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
index d37c547c9..a8826755f 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-PV = "1.0.0+git"
+PV = "1.2.0"
 
-SRCREV = "114098d30e783fbb3def5c9b49427a86621cfcb1"
+SRCREV = "fde8946a3988790fd5d3f01fc0a1fd43609ab1d1"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


