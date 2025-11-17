Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40150CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:57:51 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4704.1763366261412283967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FpUHxeXC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763366261; x=1794902261;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sqg8kOqCw+lTVJpxJQOEyHCmWYo8e8ltE6Srh6HRLRc=;
  b=FpUHxeXC/C1vk+QFaIER3/z0ETa2JHAxHMUsbP5sC3s8P7g9Hp+vQhwk
   yNInHWCvw4SAfPIei/URT8ZOat3p+WaJj6V6C0jJUWAb4ogZ4DPf4MNdA
   Yal8+EJle6JagctsKNxMmoHzg94J34uzq3boaoxr8UVJLnXoB1Ot602hh
   ZmTe67iHcGjCrWL4F7S4sTFIiMcd4YExNSENvdJULR9KMdAQ+NJDWxXV3
   rZqMTTt/ABUq2ItVN0NdU1tqn+wpDrTTeLeSwd09GTrhzJj+gMhnhb63f
   JvrqIuDfFGpOvmzhlJTyEffDI0q02KhpkFnEVTgidRd9fTMHpByrzcdCT
   w==;
X-CSE-ConnectionGUID: ADOQsXtVStWSjTvI1tt/Bw==
X-CSE-MsgGUID: XeIHGIHCRAW7MHqyqs5Dng==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="208035080"
X-IronPort-AV: E=Sophos;i="6.19,311,1754924400"; 
   d="scan'208";a="208035080"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 16:57:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B8A621C1C718
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:57:39 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7176B8D29DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:57:39 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8A2E1101BB7D
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:57:37 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] libtorrent: upgrade 0.16.1 -> 0.16.2
Date: Mon, 17 Nov 2025 15:57:26 +0800
Message-Id: <20251117075726.2900-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121761

Remove 0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch as it was merged in upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...mmon.m4-Insert-spaces-in-shell-lists.patch | 45 -------------------
 ...torrent_0.16.1.bb => libtorrent_0.16.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.1.bb => libtorrent_0.16.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
deleted file mode 100644
index 1740b0f478..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9df2559d55c454c7128b65103456c2f88b3bf2f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 24 Oct 2025 08:45:02 -0700
-Subject: [PATCH] scripts/common.m4: Insert spaces in shell lists
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-$1=$(echo "$result" | tr -d '\n')
-
-removes all newlines without inserting spaces
-That usually isn’t what we want for shell lists.
-It should typically be space-separated output.
-
-Fixes a bug seen with yocto where compiler is not a single word
-but a string e.g.
-
-ccache aarch64-yoe-linux-musl-clang++  -mcpu=cortex-a72+crc+nocrypto   --dyld-prefix=/usr -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/libtorrent/0.16.1/recipe-sysroot
-
-It changes it to
-
-ccacheaarch64-yoe-linux-musl-clang++-mcpu=cortex-a72+crc+nocrypto--dyld-prefix=/usr-fstack-protector-strong-O2-D_FORTIFY_SOURCE=2-Wformat-Wformat-security-Werror=format-security--sysroot=/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/libtorrent/0.16.1/recipe-sysroot
-
-When doing c++17 checks on compiler, resulting in failure
-
-Upstream-Status: Submitted [https://github.com/rakshasa/libtorrent/pull/583]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- scripts/common.m4 | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index 74b99e6a..44a5fe65 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -30,7 +30,8 @@ AC_DEFUN([TORRENT_REMOVE_UNWANTED],
-     $1="$2"
-   else
-     result=`echo "${values_to_check}" | $GREP -Fvx -- "${unwanted_values}" | $GREP -v '^$'`
--    $1=$(echo "$result" | tr -d '\n')
-+    # join with spaces, squeeze repeats, and trim trailing space
-+    $1=$(printf '%s\n' "$result" | tr '\n' ' ' | sed 's/  */ /g; s/ *$//')
-   fi
- ])
-
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.1.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.1.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.2.bb
index 4a8a68aa15..916a70a07b 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.1.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.2.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
-SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV} \
-		   file://0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch"
-SRCREV = "919d23923ad0a483fa24441093eda1c12cea4c0b"
+SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "bd9c66338d9d33b92db9939abb3e0c5d0dace511"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


