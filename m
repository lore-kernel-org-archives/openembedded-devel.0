Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94070C83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 05:48:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.1580.1752126481660191754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 22:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O56we1Um;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752126482; x=1783662482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K4z8NH9KqMPRNAJCxQFQ0S7EeZ8kWlFh/iI+XRswiQg=;
  b=O56we1Umf7cY4/2AgDK8/t21e1Kep8j5p0Mkd8Q2Y9EC55qYP2vDZ2bT
   NjcvhWSYNfah7PN8/FTFi2Mx8QxD448CQlkgXNWAQ0QNOUzQJR0heD0qq
   35weRgUpc7tGuyGADYv9ZH7KXmi3NXpnGfygZhyC16NG4gTKpl7Btofrv
   qsiRj2J8BEzmFJXrK1O6Qqe4II3gJ4rKOaOb043CMQfWq96VhleMVUN1w
   3zbN+TLAfFU71bI1ZHQo+5FWqRhA0zjzM88kSRUrpahrz2xHYFIx7zEih
   j0mV1uDs7b3p1yw0aa4jLZDIpenwjlxXN4tcRcz8zwFE9Dk/szE4u9KOB
   Q==;
X-CSE-ConnectionGUID: M59nvi9RRA2HNWQWxGzfTA==
X-CSE-MsgGUID: n64C3DbWR4OoV6Y5VpQYxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="205814514"
X-IronPort-AV: E=Sophos;i="6.16,299,1744038000"; 
   d="scan'208";a="205814514"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 14:48:01 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D8E10C000B9
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:47:59 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 5D581C00213
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:47:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B93F7D0820
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 14:47:57 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6FD3E1A0073;
	Thu, 10 Jul 2025 13:47:56 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH] dialog: Fix install conflict when enable multilib
Date: Thu, 10 Jul 2025 13:47:42 +0800
Message-ID: <20250710054742.1507-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118394

fix issue that:
file /usr/bin/dialog conflicts between attempted installs of dialog-1.3+20250116-r0.cortexa57 and lib32-dialog-1.3+20250116-r0.armv7at2hf_neon

To be noticed that dialog itself is already symlink now
xxx/image/usr/bin$ ls -l -t
total 888
lrwxrwxrwx 1 userland userland     45 Jul 10 02:15 dialog -> /usr/bin/arm-pokymllib32-linux-gnueabi-dialog
-rwxr-xr-x 1 userland userland 907748 Jul 10 02:15 arm-pokymllib32-linux-gnueabi-dialog

xxx/image/usr/bin$ ls -l -t
total 988
lrwxrwxrwx 1 userland userland      34 Jul 10 02:15 dialog -> /usr/bin/aarch64-poky-linux-dialog
-rwxr-xr-x 1 userland userland 1037624 Jul 10 02:15 aarch64-poky-linux-dialog

after this commit:
xxx/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/rootfs/usr/bin$ ls -l -t dialog*
lrwxrwxrwx 1 userland userland 21 Mar  9  2018 dialog -> /usr/bin/dialog-lib64
lrwxrwxrwx 1 userland userland 45 Mar  9  2018 dialog-lib -> /usr/bin/arm-pokymllib32-linux-gnueabi-dialog
lrwxrwxrwx 1 userland userland 34 Mar  9  2018 dialog-lib64 -> /usr/bin/aarch64-poky-linux-dialog

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
index 7c596371e5..0d09ccea16 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "68406329827b783d0a8959cc20a94c6e1791ac861a27f854e06e902054
 # hardcoded here for use in dialog-static recipe
 S = "${UNPACKDIR}/dialog-${PV}"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig multilib_script
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
@@ -23,6 +23,8 @@ PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${ST
 EXTRA_OECONF = "--with-ncurses \
                 --disable-rpath-hack"
 
+MULTILIB_SCRIPTS = "${PN}:${bindir}/dialog"
+
 do_configure() {
     gnu-configize --force
     sed -i 's,${cf_ncuconfig_root}6-config,${cf_ncuconfig_root}-config,g' -i configure
-- 
2.43.0


