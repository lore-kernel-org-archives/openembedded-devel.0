Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7E9CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:58:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4716.1763366323469110454
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K/0XND/D;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763366323; x=1794902323;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qy0vzw8NWl9YxmnR5OUiFbSbDdSlPsurD9gzMGddYA0=;
  b=K/0XND/DAdoQv/v6EoqjX8zXyYtbIq3QrX7DhjLMOm7Aktr7mSYP+qnv
   x17RRL77BNSYxexloIsr8pFJ0TFgSg1pzSA+Qe41PQk6kIjVVlwKUICkM
   ggGeRHCzWpZJsZGlmstublIIPBWMjSdd9N0Ob0q9yiGunNanw/hGi6/i6
   XleJR1eKRxhSFXmrJXyqPUHc7gHPsSJ8rrNbkNWQcGp+dNv+noa9K9FY7
   hRLZj929Ihyawthk4lJO4XSr/qiJenQ20n9VLYegnIyN0MkzIN2V51cbo
   d+tPctozIwfeZyyp8ujyYUsK8RxUnazteO6/4L17XgnIKKO4nAE0vtWqV
   g==;
X-CSE-ConnectionGUID: CgK11V4mTNakCCiivNsJsg==
X-CSE-MsgGUID: Z9VinxTUQnuDUX5KDvR8vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="206905919"
X-IronPort-AV: E=Sophos;i="6.19,311,1754924400"; 
   d="scan'208";a="206905919"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 16:58:42 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C227F1002B9E
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:58:41 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7B024180024A
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:58:41 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id BE337405EE8
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:58:39 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/2] rtorrent: upgrade 0.16.1 -> 0.16.2
Date: Mon, 17 Nov 2025 15:58:24 +0800
Message-Id: <20251117075824.3256-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121762

Changelog:
 https://github.com/rakshasa/rtorrent/releases/tag/v0.16.2

Remove 0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch as it was merged in upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...mmon.m4-Insert-spaces-in-shell-lists.patch | 45 -------------------
 ...{rtorrent_0.16.1.bb => rtorrent_0.16.2.bb} |  7 ++-
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.1.bb => rtorrent_0.16.2.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
deleted file mode 100644
index bd075c0b21..0000000000
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From da3687c276078e8ad1df3c972bd1d5deaffb3dc5 Mon Sep 17 00:00:00 2001
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
-Upstream-Status: Submitted [https://github.com/rakshasa/rtorrent/pull/1620]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- scripts/common.m4 | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index 7129204..d8ee019 100644
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
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.1.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.2.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.1.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.2.bb
index 0030b7593d..e077efa22a 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.1.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.2.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurses"
 
-SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV} \
-           file://0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch \
-		   "
-SRCREV = "b38f80e59795dc6728b2c31ac3eab564651ce46d"
+SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
+
+SRCREV = "8550facf43fd1e36b416bcdb3b025e7e09578364"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


