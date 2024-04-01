Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E5CD1299
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.39469.1711983091346785953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rkTwoHpw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983092; x=1743519092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ij0hOTgCfDveb5D7UQ/HneCQ2ieMw9NVNxhLghuIMYQ=;
  b=rkTwoHpwlA66nVhB/x9lnBHBoMHP2lrzscaQwXpYQ5Gdbzvzt1Qd/QWr
   CZd4Q3E8Fo5+ijzagQ0IEbKo08TPeExVhUakFWGq4ZpEk0q3toWuRkJia
   ocZ7BcRCb8sApVjahSBy/Ju0Up9ftzDzYXwItbjGz/0qV0EXyBnDGPRYE
   wemDgYkCCEsV1TotDfV2xY8szE3zF+OLYYSts0OtaUE9XwBD/1zfLJHjc
   AjFSXrPpvZ1HgK52M/Tw41QRY/Ne2y53Czvg3LTmsmn+EXaTIv4H3pJTk
   jumhaPxd3BhebaJw7dwyGuWwK9xHPXLgSDiz/5TUbvtw8wAJLhdvVCrxD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154246615"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154246615"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D426D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 53962D5006
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E49B140FF7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9B13D1A000A;
	Mon,  1 Apr 2024 22:51:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/47 v2] libblockdev: upgrade 3.1.0 -> 3.1.1
Date: Mon,  1 Apr 2024 22:50:36 +0800
Message-Id: <1711983079-16849-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--2.827000-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrIr/9+EuvVI14YeSlHZYFogC7
	AZSleJMNCoAIIxVkzthSe3BBwR1DvFSYAx1RhJuHPKN38CLPK0EXivwflisSrC99T+uJIleRQ31
	PMmlnGr0vumwb4GCEKqkL7/CyCvA7mDcRJzGLWpLfSQNpZkETVFQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaI2YNXUKC1G1rGWmeVAULKHWQ+QsDdwtAedAuliTV06YmsWZ
	V9YMDBb1fdm2d1zfYYEtpFZR0iFe/Q/jeowsLZFb056mCmF00Z9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0JC+VZi2gQEXqpqehG4sP7a5T39/UwQiwFrsF3U4iMXtPBNEKJrliYCbT6FEQiGk0oaQu
	tBvz7fB9nZYO61TAa+RH5d4MO0YhWtHB0/a/I8/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109721

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use glib2 G_GNUC_UNUSED in place of UNUSED locally defined
- Port to G_GNUC_INTERNAL for controlling symbols visibility
- Fix some more occurrences of missing port to G_GNUC_UNUSED
- dm_logging: Annotate redirect_dm_log() printf format
- tests: Add NVMe persistent discovery controller tests
- tests: Add NVMe controller type checks
- Makefile: Fix bumpver to work with micro versions
- tests: Manually remove removed PVs from LVM devices file
- tests: Ignore LVM devices file for non-LVM tests
- tests: Fix removing custom LVM devices file
- nvme: Add bd_nvme_is_tech_avail to the API file
- lvm-dbus: Fix passing size for pvresize over DBus

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libblockdev_3.1.0.bb => libblockdev_3.1.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.1.0.bb => libblockdev_3.1.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.0.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.1.0.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
index 60182d84e..dd1514628 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.0.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
@@ -12,10 +12,10 @@ inherit autotools gobject-introspection pkgconfig lib_package
 
 DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
-SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.1.x-devel;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
            "
-SRCREV = "65f50bf912374b85d673f2716ea0c8306980c95b"
+SRCREV = "68aaff5556afe26be749c29a2b7cbd714dce3050"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/python3.*/site-packages"
-- 
2.34.1


