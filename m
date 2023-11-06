Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9505EC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 01:53:56 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.45757.1699235628122334733
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 17:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="138101625"
X-IronPort-AV: E=Sophos;i="6.03,279,1694703600"; 
   d="scan'208";a="138101625"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 10:53:46 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6964D687F
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 10:53:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BB7FCFB6D
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 10:53:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B1832E462;
	Mon,  6 Nov 2023 10:53:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hdf5: Fix install conflict when enable multilib.
Date: Mon,  6 Nov 2023 09:53:10 +0800
Message-Id: <1699235590-22268-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27980.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27980.003
X-TMASE-Result: 10--1.769500-10.000000
X-TMASE-MatchedRID: sxNSNugZwuiMPz8Goa6fXdl0i+WyI+91WvaFnGMIvOqysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatbFC4KFlyR6Xuce7gFxhKa3zndiJkHFMhAKJcjtscVQFrC5
	+trvtRFJ9Ersr6kKi+jKHYLsR4q0LHxPMjOKY7A9qHXONfTwSQsRB0bsfrpPIcSqbxBgG0w7Iq/
	xYatGAlNGzwJBxP2QZ2nW4fomj0esnDa2+Tt1ew2B+HAfHgGnqWVsgyvKcah/DzV9T9e084t0CQ
	FqlAo8WtxmcyL8IlP2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 01:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106390

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/h5cc conflicts between attempted installs of lib32-hdf5-1.14.2-r0.armv7ahf_neon and hdf5-1.14.2-r0.cortexa57
  file /usr/bin/h5hlcc conflicts between attempted installs of lib32-hdf5-1.14.2-r0.armv7ahf_neon and hdf5-1.14.2-r0.cortexa57

The differences of h5cc are as follows:
@@ -44,7 +44,7 @@
       exit $status
       ;;
     *)
-      /usr/bin/arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5`
+      /usr/bin/aarch64-poky-linux/aarch64-poky-linux-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5`
       status=$?
       exit $status
       ;;

The differences of h5hlcc are as follows:
@@ -44,7 +44,7 @@
       exit $status
       ;;
     *)
-      /usr/bin/arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5_hl`
+      /usr/bin/aarch64-poky-linux/aarch64-poky-linux-clang $@ `pkg-config --define-variable=prefix=$dir --cflags --libs hdf5_hl`
       status=$?
       exit $status
       ;;


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
index 68b91c0b0c..e716430673 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ba0f3d878ab6c2403c86e9b0362d998"
 
-inherit cmake siteinfo qemu multilib_header
+inherit cmake siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -40,6 +40,10 @@ EOF
 
 do_unpack[postfuncs] += "gen_emu"
 
+MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc \
+                     ${PN}:${bindir}/h5hlcc \
+"
+
 do_install:append() {
     # Used for generating config files on target
     install -m 755 ${B}/bin/H5detect ${D}${bindir}
-- 
2.34.1


