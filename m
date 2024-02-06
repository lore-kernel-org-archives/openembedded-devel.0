Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1E8C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:12:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.16633.1707203554884294005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z6UKoGww;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707203555; x=1738739555;
  h=from:to:cc:subject:date:message-id;
  bh=na7gy2e6S+HQlbvOvPSap7703td4GbEZs/wc/aOTaTs=;
  b=Z6UKoGwwZRv28dzSzMBT4PcjEYtgrPH9Jo8RpJLpp+1nuxiMG//DekRF
   4tnggP2DETlgc+0Tza5qJzYF6YgE9LphJNsx/Q87O9eSMwEBzSaS594kU
   LZGIYuB5B1C0Uf+BCvGt5QerercySvF5Omxte8p+5ehxsUrWqt4Qx/XJY
   mSgewsVkHnBDOZ7zI7Ebzuz5l/e4FSUaTV194NsHGY4P0PQYs5PGwA/+e
   8njSxqwo3iW6ucnIO1ahBTFHXjMRLcBzRbqiZGfjkvad5TqLMIspIO85U
   PZkSKXEdk5jO23GgVrfVpnwj2ZcwqR7lri0NAsyqbww7Wr6Awe4YA9lC7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148384879"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148384879"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:12:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33998E95C5
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:12:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7084ED5620
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:12:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB89E2007912F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:12:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A99891A009A;
	Tue,  6 Feb 2024 15:12:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] imlib2: upgrade 1.12.1 -> 1.12.2
Date: Tue,  6 Feb 2024 15:12:05 +0800
Message-Id: <1707203525-4347-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--2.203400-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt2HZGDrssVUshm
	fp+W2l0L/DW1GvHktOhMi3ow80XOzTbcsMCH+ZLFGqSG/c50XgODd2tqN5JYyTP5hFHsVkuJn9u
	6ZDHvy7c28CF2RGCBpACN4PBfHYxig6DXS0AI5zC/Ju3duA3GgmIw13TP8dlTviEPmni5YZ8hrs
	1SyyiXTtG8AV8g1bgK1a6gkRV8w2PzTNnbxjBnnPx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkH4qt
	YI9sRE/joyBU1A4aoqB7mylBOVp0UwwU9WaIzF/3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO36CZXLlV1mSb/nmhAGYGveo+1N/7pe3A/uuL2M/pQ7VAJAdJnNmRYgs7UQv8TfeD3Godc
	1reUVIkelRjxybZlmvHmw9qBHhHzUoi6BTksF5/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108590

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Y4M loader: fix support for unexpected framerates
-Y4M loader: fix C option analysis
-Y4M loader: add error messages on parsing errors
-test_save: Update crcs for jxl saver (libjxl 0.8.0)
-x11_grab: Remove some obsolete code
-Y4M loader: Guard some debug code properly
-Consistently use #if IMLIB2_DEBUG (not #ifdef)
-test_load_2: Check some more y4m files
-Y4M loader: Avoid use of sscanf() in frame rate parsing
-ANI loader: Avoid debug line when image does not have proper signature
-PNG loader: Properly suppress messages from libpng
-Y4M loader: Fix warning in non-debug build
-Change formatting style
-PNG saver: Avoid potential issues around setjmp/longjmp
-JPG saver: Fix error path
-TIFF loader: Properly suppress messages from libtiff
-savers: Fix error returns
-PNG saver: avoid double-free on write errors
-Y4M loader: don't fail on newline

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 113b8666a..87e7ed4a6 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.12.1"
-SRCREV = "9198db25369f04db069ce61a661c3c47b2622655"
+PV = "1.12.2"
+SRCREV = "a860e34b19af6b0a73d86ddc0e4829145e18fa6e"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.34.1


