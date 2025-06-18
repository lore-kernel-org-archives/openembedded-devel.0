Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A7FC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 10:02:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.3668.1750240935812940490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 03:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P4re2S6q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750240935; x=1781776935;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OIoeMzsn4oln2ZAtrZAHZpDoLoX0g7iw5V5FNdHuN3k=;
  b=P4re2S6qkRGyU6RpbWg23y43dAJr9V8RtDtTV1ntw/2OwLCiFjJssxKE
   uWd4hNteo0By4yCu+BY/+3LbnxXxigjkko7OE90mHahyCdLcBfQR/hRoA
   NULISi4MfXbGjhw/c33DIaFpgW6LJFDJxt8g1PVMQBYC5uL+oWTHLQBVT
   Be5nl1VxkrjFH//Q2knAq5VQFqgBrH4iXjxdLxyPN6ByocMYmw8pyBEcf
   QYhiHfYaF4zsHe4V+3rMWCnqxTyDHH1Jp3F/ryY2n2j+wXSSjigxLlTtU
   yVoJ8Pfv3EtjDjPMPuBabTT5my6iQ5bOM2cwzevhgRquXdzWHwDxIufAH
   Q==;
X-CSE-ConnectionGUID: 2qCHZpnxRdWZFwoQO+29PA==
X-CSE-MsgGUID: 8XcTTRCoRWmpp/m+SwxgIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="203626170"
X-IronPort-AV: E=Sophos;i="6.16,245,1744038000"; 
   d="scan'208";a="203626170"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 19:02:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 098CBF568
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 19:02:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE072D9715
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 19:02:10 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E28DF1A000B;
	Wed, 18 Jun 2025 18:02:09 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH] daemontools: fix incompatible-pointer-types issue
Date: Wed, 18 Jun 2025 18:01:59 +0800
Message-ID: <20250618100159.1573-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 10:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117935

According to info from "bitbake -e daemontools", "CC += "-Wno-error=incompatible-pointer-types""
can't solve this issue now since CC will be overide by gcc.bbclass

|$ bitbake -e daemontools
|------------------------------
| # $CC [3 operations]
| #   exported ast.py:67 [eval]
| #     [export] "1"
| #   append /mnt/test/meta-openembedded/meta-oe/recipes-support/daemontools/daemontools_0.76.bb:58
| #     "-Wno-error=incompatible-pointer-types"
| #   set /mnt/test/poky/meta/classes/toolchain/gcc.bbclass:1
| #     "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
| # pre-expansion value:
| #   "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
| export CC="aarch64-poky-linux-gcc  -mcpu=cortex-a57+crc -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mnt/test/build_auh/tmp/work/cortexa57-poky-linux/daemontools/0.76/recipe-sysroot

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-support/daemontools/daemontools_0.76.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 3738b080ff..1ef6a07d0d 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -33,7 +33,13 @@ UPSTREAM_CHECK_URI = "http://cr.yp.to/daemontools/install.html"
 
 S = "${WORKDIR}/admin/${BP}"
 
+# http://errors.yoctoproject.org/Errors/Details/766886/
+# pathexec_run.c:19:17: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
+# pathexec_run.c:19:22: error: passing argument 3 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
+# pathexec_run.c:36:18: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
+# pathexec_run.c:36:23: error: passing argument 3 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
 do_compile() {
+    export CC="$CC -Wno-error=incompatible-pointer-types"
     ./package/compile
 }
 
@@ -48,10 +54,3 @@ do_install:append:class-target() {
 inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = "svc svok"
-
-# http://errors.yoctoproject.org/Errors/Details/766886/
-# pathexec_run.c:19:17: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
-# pathexec_run.c:19:22: error: passing argument 3 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
-# pathexec_run.c:36:18: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
-# pathexec_run.c:36:23: error: passing argument 3 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types] 
-CC += "-Wno-error=incompatible-pointer-types"
-- 
2.43.0


