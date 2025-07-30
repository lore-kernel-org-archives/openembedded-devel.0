Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF88C87FD6
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.31494.1753869308871921801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rCXZ4jhD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869308; x=1785405308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zncCe4bsZSOguO6jn3gae+vXqooiC3PF/i96iccViEI=;
  b=rCXZ4jhDKGAdSOdv9NfJYEjjB01TE6CDkfpmqWSumbFgTU8r3PgmbUrI
   2aUyrZU6jmB1Gld25fO4MOMUMciBFeUiZ8Ozit2sFB3yP+jWGYHLEVqrd
   vfBtil7i3+IdYI+vl0+nkSvWwX3MpNe5U74lqKVO2ju036/Ki9sw3imb1
   ctHY4V3WC50cqMmHqZNcMx9ybKU1kr7x8nFhgatClMGWGmb7hThr3siU9
   PX1F1HWkSa8RSQXUVNkPpQqAQ9WTZMU2z+2gIwXjom2i3DhWN/+xRa7Nd
   RxcLpRPH3lQj7e7l5bd+aLKtHpCsrwFUbg5m5Re6tOoE7UNE/Yv4h1XXd
   g==;
X-CSE-ConnectionGUID: kRW7PR/1TO6Z5abCq8+l9A==
X-CSE-MsgGUID: XiXe7di/R3G57y1/3OtadA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="195873338"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="195873338"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:07 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 250061002B8F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 91E75823C4A
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B5FB1A000B;
	Wed, 30 Jul 2025 17:55:02 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/40] ktls-utils: upgrade 1.0.0 -> 1.2.1
Date: Wed, 30 Jul 2025 17:54:26 +0800
Message-ID: <20250730095456.695-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118778

From: Wang Mingyu <wangmy@fujitsu.com>

0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
removed since it's included in 1.2.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ac-Use-AC_CHECK_HEADER-instead-of-AC.patch | 36 -------------------
 ...tls-utils_1.0.0.bb => ktls-utils_1.2.1.bb} | 10 +++---
 2 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
 rename meta-oe/recipes-kernel/ktls-utils/{ktls-utils_1.0.0.bb => ktls-utils_1.2.1.bb} (70%)

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
deleted file mode 100644
index 6aabb77ee8..0000000000
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d170b04dcb8b2b28e370d8b18ffa1f593e8eec11 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 10 Apr 2025 13:15:16 +1000
-Subject: [PATCH] tlshd: configure.ac: Use AC_CHECK_HEADER instead of
- AC_CHECK_FILE
-
-AC_CHECK_FILE doesn't work when cross-compiling [1], which breaks a lot of
-use cases (like OpenEmbedded for one). Autoconf supports AC_CHECK_HEADER
-which can be used instead and is more robust [2] so let's use that
-instead.
-
-1: https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Files.html
-2: https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Generic-Headers.html
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Submitted [https://github.com/oracle/ktls-utils/pull/90]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2c77fb1..c790d71 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -63,7 +63,7 @@ PKG_CHECK_MODULES([LIBNL_GENL3], libnl-genl-3.0 >= 3.1)
- AC_SUBST([LIBNL_GENL3_CFLAGS])
- AC_SUBST([LIBNL_GENL3_LIBS])
- 
--AC_CHECK_FILE([/usr/include/linux/quic.h],
-+AC_CHECK_HEADER([linux/quic.h],
-               [AC_CHECK_LIB([gnutls], [gnutls_handshake_set_secret_function],
-                             [AC_DEFINE([HAVE_GNUTLS_QUIC], [1], [Define to 1 if QUIC is found.])])])
- 
--- 
-2.49.0
-
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.2.1.bb
similarity index 70%
rename from meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
rename to meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.2.1.bb
index 1a90dcf998..ce36bda7d1 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.2.1.bb
@@ -7,12 +7,10 @@ RDEPENDS:${PN} += " gnutls"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
 
-SRCREV = "c787cd26330af457e1ca9cf43232db2c71c03154"
-SRC_URI = " \
-	git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https \
-	file://0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch \
-	file://0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch \
-	"
+SRCREV = "03abde4ed7f539d77a412a1c98052e1c4d262963"
+SRC_URI = "git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https;branch=ktls-utils-1.2-fixes \
+           file://0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch \
+           "
 
 
 inherit autotools-brokensep pkgconfig systemd
-- 
2.43.0


