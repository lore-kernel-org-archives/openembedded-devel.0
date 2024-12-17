Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30589E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.77392.1734426114321450172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nbdpO+zm;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426114; x=1765962114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/99xi+qC7wM4Ed38Rc9OQnuzKGKaNX0TeZt2NZKCgsA=;
  b=nbdpO+zmdpO2itqaeilM4U7Dlsef8m7ws9mjoXVu65sY7iGl9YHjKrc9
   4Tu7QUPls/jw+eMObvT+YaRJb23FCecwaF9JS1x/c5UeEyIOO05uPwBEg
   BXRyDjKs3ivzrk2kByNn4YxsEQiZ4X33DEXc28w0vnR1HTWgIsT7eDo6d
   sz790Whmm4SwI9AHnrYmENMB3gaGWogFQ8epMH0/BvfYsOFMQIJwueaRv
   Lmh7ZlOIClMTO2ek01pt5gj/bszztYOR3bnIK/8S8gdd3xW3kRVhIi6Kf
   TzDvaiU2C9W5A7Ps/EDt9ibsAouLKbXKdQaxjYC9FZJMcwe5YDuEMymnK
   g==;
X-CSE-ConnectionGUID: XzXyRxNPQfeRURmXLuhBZw==
X-CSE-MsgGUID: Rtw7w0hJQMKFCSves6o9QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953820"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953820"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B204DBB80
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19C8DD6FED
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A949B347B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F31A1A000B;
	Tue, 17 Dec 2024 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/17] libusbmuxd: upgrade 2.0.2 -> 2.1.0
Date: Tue, 17 Dec 2024 17:01:26 +0800
Message-Id: <1734426096-18300-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--3.529000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrlDt5PQMgj01+t76NMQUPPVYM
	JR3dIrh2jDVMw6TJvuFQ8Xx8xomnlsEyKTkde9dSA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYjE41bFBKcdLcajiGTspurW5x7uAXGEprZiQDIJsDspXCzkaVcXrvbOjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3tpXPoAJ0WZsbznrIwUuVZ3h2LmdKr7aSHhibDbn9IQIx8B
	tK1obDrSlx4doUAdmNl9t8Oo2ZA3lVefROkVU8S3ApvmKdJXLkdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114357

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
==========
- Socket code has been moved to libimobiledevice-glue library
- Code cleanup (clang-tidy) and improvements
- autoconf: Fix clang-16 breakage
- Add libusbmuxd_version() function to interface
- iproxy: Use updated socket_create API to listen on IPv4 and IPv6 with a single socket

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libusbmuxd_2.0.2.bb => libusbmuxd_2.1.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libusbmuxd_2.0.2.bb => libusbmuxd_2.1.0.bb} (79%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.0.bb
similarity index 79%
rename from meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb
rename to meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.0.bb
index a586f49f96..747274de1b 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.0.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 
-DEPENDS = "udev libusb1 libplist"
+DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 
 inherit autotools pkgconfig gitpkgv
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "ce98c346b7c1dc2a21faea4fd3f32c88e27ca2af"
+SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


